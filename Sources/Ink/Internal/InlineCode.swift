/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

struct InlineCode: Fragment {
    var modifierTarget: Modifier.Target { .inlineCode }
    // This should probably evolve to a Substring too
    private var code: String

    static func read(using reader: inout Reader) throws -> InlineCode {
        let startingMarkerCount = reader.readCount(of: "`")
        try require(startingMarkerCount > 0)
        var code = ""
        var nonSpaceEncountered = false
        while !reader.didReachEnd {
            switch reader.currentCharacter {
            case \.isWhitespace:
                code.append(" ") // specified replacement in CommonMark spec
                reader.advanceIndex()
            case "`":
                let markerCount = reader.readCount(of: "`")

                if markerCount == startingMarkerCount {
                    if nonSpaceEncountered && code.count >= 3 {
                        if code.first == " " && code.last == " " {
                            let trimmedCode = code.dropLast().dropFirst()
                            return InlineCode(code: String(trimmedCode))
                        }
                    }
                    return InlineCode(code: code)
                } else {
                    code.append(String(repeating: "`", count: markerCount))
                    nonSpaceEncountered = true
                    // that last backtick could have been the last; let the loop continue but be careful
                }
                
            default:
                nonSpaceEncountered = true
                code.append(reader.currentCharacter)
                reader.advanceIndex()
            }
        }

        throw Reader.Error()
    }

    func html(usingURLs urls: NamedURLCollection,
              modifiers: ModifierCollection) -> String {
        return "<code>\(htmlEscapeAString(code))</code>"
    }

    func plainText() -> String {
        code
    }
}
