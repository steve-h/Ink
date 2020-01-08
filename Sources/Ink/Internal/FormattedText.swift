/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

internal struct FormattedText: Readable, HTMLConvertible, PlainTextConvertible {
    private var components = [Component]()

    static func read(using reader: inout Reader) -> Self {
        read(using: &reader, terminator: nil)
    }

    static func readLine(using reader: inout Reader) -> Self {
        let text = read(using: &reader, terminator: "\n")
        if !reader.didReachEnd { reader.advanceIndex() }
        return text
    }

    static func read(using reader: inout Reader,
                     terminator: Character?) -> Self {
        var parser = Parser(reader: reader, terminator: terminator)
        parser.parse()
        reader = parser.reader
        return parser.text
    }

    func html(usingURLs urls: NamedURLCollection,
              modifiers: ModifierCollection) -> String {
        components.reduce(into: "") { string, component in
            switch component {
            case .text(let text):
                string.append(htmlEscapeASubstring(text))
            case .styleMarker(let marker):
                       let html = marker.html(usingURLs: urls, modifiers: modifiers)
                       string.append(html)
            case .fragment(let fragment, let rawString):
                let html = fragment.html(
                    usingURLs: urls,
                    rawString: rawString,
                    applyingModifiers: modifiers
                )
                string.append(html)
            case .linebreak:
                string.append("<br>")
            }
        }
    }

    func plainText() -> String {
        components.reduce(into: "") { string, component in
            switch component {
            case .text(let text):
                string.append(String(text))
            case .fragment(let fragment, _):
                string.append(fragment.plainText())
            case .styleMarker:
                break
            case .linebreak:
                string.append("\n")
            }
        }
    }

    mutating func append(_ text: FormattedText, separator: Substring = "") {
        let separator = separator.isEmpty ? [] : [Component.text(separator)]
        components += separator + text.components
    }
}

private extension FormattedText {
    enum Component {
        case linebreak
        case text(Substring)
        case styleMarker(TextStyleMarker)
        case fragment(Fragment, rawString: Substring)
    }

    struct Parser {
        var reader: Reader
        let terminator: Character?
        var text = FormattedText()
        var pendingTextRange: Range<String.Index>
        var activeStyles = Set<TextStyle>()
        var activeStyleMarkers = [TextStyleMarker]()

        init(reader: Reader, terminator: Character?) {
            self.reader = reader
            self.terminator = terminator
            self.pendingTextRange = reader.currentIndex..<reader.endIndex
        }

        mutating func parse() {
            var sequentialSpaceCount = 0
            
            while !reader.didReachEnd {
                do {
                    if let terminator = terminator, reader.previousCharacter != "\\" {
                        guard reader.currentCharacter != terminator else {
                            break
                        }
                    }

                    if reader.currentCharacter.isNewline {
                        guard !(sequentialSpaceCount >= 2) else {
                            addPendingTextIfNeeded()
                            trimAnyPreviousText() // commonmark removes all whitespace before the break
                            text.components.append(.linebreak)
                            skipCharacter()
                            continue
                        }
                        guard let nextCharacter = reader.nextCharacter else {
                            break
                        }
                        guard !nextCharacter.isAny(of: ["\n", "#", "<", "`"]) else {
                            addPendingTextIfNeeded()
                            break
                        }
                        reader.advanceIndex()
                        continue
                    }

                    if reader.currentCharacter == " " {
                        reader.advanceIndex()
                        sequentialSpaceCount += 1
                        continue
                    } else {
                        sequentialSpaceCount = 0
                    }

                    guard !reader.currentCharacter.isAny(of: .allStyleMarkers) else {
                        addPendingTextIfNeeded()
                        try parseStyleMarker()
                        continue
                    }
                    // This code appears to be a custom case of html in a paragraph.
                    // Assume it will be enhanced in the future.
                    if reader.currentCharacter == "<" {
                        guard let nextCharacter = reader.nextCharacter else {
                            reader.advanceIndex()
                            break
                        }

                        if nextCharacter.lowercased() == "p" {
                            break
                        }
                    }

                    guard let type = nextFragmentType() else {
                        parseNonTriggeringCharacter()
                        continue
                    }

                    addPendingTextIfNeeded()

                    let startIndex = reader.currentIndex
                    let fragment = try type.readOrRewind(using: &reader)
                    let rawString = reader.characters(in: startIndex..<reader.currentIndex)
                    text.components.append(.fragment(fragment, rawString: rawString))
                    pendingTextRange = reader.currentIndex..<reader.endIndex
                } catch {
                    parseNonTriggeringCharacter()
                }
            }

            addPendingTextIfNeeded(trimmingWhitespaces: true)
            handleUnterminatedStyleMarkers()
            trimAnyPreviousText(atEnd: true) // this is the removal of all trailing whitespace catch all.
        }
        
        /// Need a routine to trim the whitespace at the end of a paragraph block
        private mutating func trimAnyPreviousText(atEnd: Bool = false) {
            while text.components.count > 0 {
                if let lastPiece = text.components.last {
                    switch lastPiece {
                    case .text (let txt):
                        if let item = txt.last {
                            if item.isWhitespace { //test first to save time, need to remove the trailing whitespace
                                let trimmedText = txt.trimmingTrailingWhitespaces()
                                _ = text.components.popLast()
                                if trimmedText.count == 0  { //it is all whitespace, go around again.
                                    continue
                                }
                                let trimmedItem: Component = .text(txt.trimmingTrailingWhitespaces())
                                text.components.append(trimmedItem)
                            }
                            return
                        } else { //a null string remove and recurse
                            _ = text.components.popLast()
                        }
                    case .linebreak:
                        if atEnd {
                            _ = text.components.popLast() //line breaks are not allowed at the end of a block
                            continue
                        }
                        return
                    default:
                        return
                    }
                }
            }
        }

        private mutating func addPendingTextIfNeeded(trimmingWhitespaces trimWhitespaces: Bool = false) {
            guard !pendingTextRange.isEmpty else { return }

            let textEndIndex = reader.currentIndex
            let endingTextRange = pendingTextRange.lowerBound..<textEndIndex
            var string = reader.characters(in: endingTextRange)

            if trimWhitespaces {
                string = string.trimmingTrailingWhitespaces()
            }

            text.components.append(.text(string))
            pendingTextRange = reader.currentIndex..<reader.endIndex
        }

        private mutating func parseNonTriggeringCharacter() {
            if reader.currentCharacter == "\\"  {
                
                if let nextChr = reader.nextCharacter {
                    // only ASCII punctuation and the html special chars are escapable in CommonMark
                    if escapedASCIIPunctuation(nextChr) {
                        addPendingTextIfNeeded()
                        // skip the backslash and the following char and use substitution instead
                        skipCharacter() // skip past the backslash
                        reader.advanceIndex() // include the escaped punctuation character as-is
                    } else if nextChr.isNewline {
                        // just skip the backslash and the newline
                        addPendingTextIfNeeded()
                        text.components.append(.linebreak)
                        skipCharacter()
                        skipCharacter()
                    } else {
                        // the backslash remains in all other cases and the next character can be processed
                        reader.advanceIndex()
                    }
                } else {
                    reader.advanceIndex() // just include the slash at the end of file
                }
            } else {
                reader.advanceIndex()
            }
        }

        private mutating func parseStyleMarker() throws {
            let marker = try TextStyleMarker.readOrRewind(using: &reader)

            if activeStyles.contains(marker.style) {
                closeStyle(with: marker)
            } else {
                activeStyles.insert(marker.style)
                activeStyleMarkers.append(marker)
            }

            text.components.append(.styleMarker(marker))
            pendingTextRange = reader.currentIndex..<reader.endIndex
        }

        private mutating func closeStyle(with marker: TextStyleMarker) {
            turnBoldMarkerIntoItalicIfNeeded(marker)

            marker.kind = .closing
            var stylesToRemove = Set<TextStyle>()

            for otherMarker in activeStyleMarkers.reversed() {
                stylesToRemove.insert(otherMarker.style)

                if otherMarker.style == marker.style {
                    break
                }

                otherMarker.isValid = false
            }

            activeStyleMarkers.removeLast(stylesToRemove.count)
            activeStyles.subtract(stylesToRemove)
        }

        private mutating func turnBoldMarkerIntoItalicIfNeeded(_ marker: TextStyleMarker) {
            guard marker.style == .bold, activeStyles.contains(.italic) else { return }
            guard !reader.didReachEnd else { return }
            guard reader.currentCharacter.isAny(of: .boldItalicStyleMarkers) else { return }

            marker.style = .italic
            marker.rawMarkers.removeLast()
            reader.rewindIndex()
        }

        private mutating func handleUnterminatedStyleMarkers() {
            var boldMarker: TextStyleMarker?
            var italicMarker: TextStyleMarker?

            if activeStyles.isSuperset(of: [.bold, .italic]) {
                markerIteration: for marker in activeStyleMarkers {
                    switch marker.style {
                    case .bold:
                        marker.style = .italic

                        if let otherMarker = italicMarker {
                            guard marker.characterRange.lowerBound !=
                                  otherMarker.characterRange.upperBound else {
                                italicMarker = nil
                                break markerIteration
                            }

                            marker.suffix = marker.rawMarkers.removeLast()
                            marker.kind = .closing
                        } else {
                            marker.prefix = marker.rawMarkers.removeFirst()
                        }

                        boldMarker = marker
                    case .italic:
                        if let otherMarker = boldMarker {
                            guard marker.characterRange.lowerBound !=
                                  otherMarker.characterRange.upperBound else {
                                if let prefix = otherMarker.prefix {
                                    otherMarker.rawMarkers = "\(prefix)\(otherMarker.rawMarkers)"
                                } else if let suffix = otherMarker.suffix {
                                    otherMarker.rawMarkers.append(suffix)
                                }

                                boldMarker = nil
                                break markerIteration
                            }

                            marker.kind = .closing
                        }

                        italicMarker = marker
                    case .strikethrough:
                        break
                    }
                }
            }

            for marker in activeStyleMarkers {
                guard marker !== boldMarker else { continue }
                guard marker !== italicMarker else { continue }
                marker.isValid = false
            }
        }

        private mutating func skipCharacter() {
            reader.advanceIndex()
            pendingTextRange = reader.currentIndex..<reader.endIndex
        }

        private func nextFragmentType() -> Fragment.Type? {
            switch reader.currentCharacter {
            case "`": return InlineCode.self
            case "[": return Link.self
            case "!": return Image.self
            case "<": return HTML.self
            default: return nil
            }
        }
    }
}
