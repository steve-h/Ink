/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

import XCTest
import Ink

final class TextFormattingTests: XCTestCase {
    func testParagraph() {
        let html = MarkdownParser().html(from: "Hello, world!")
        XCTAssertEqual(html, "<p>Hello, world!</p>")
    }

    func testItalicText() {
        let html = MarkdownParser().html(from: "Hello, *world*!")
        XCTAssertEqual(html, "<p>Hello, <em>world</em>!</p>")
    }

    func testBoldText() {
        let html = MarkdownParser().html(from: "Hello, **world**!")
        XCTAssertEqual(html, "<p>Hello, <strong>world</strong>!</p>")
    }

    func testItalicBoldText() {
        let html = MarkdownParser().html(from: "Hello, ***world***!")
        XCTAssertEqual(html, "<p>Hello, <strong><em>world</em></strong>!</p>")
    }

    func testItalicBoldTextWithSeparateStartMarkers() {
        let html = MarkdownParser().html(from: "**Hello, *world***!")
        XCTAssertEqual(html, "<p><strong>Hello, <em>world</em></strong>!</p>")
    }

    func testItalicTextWithinBoldText() {
        let html = MarkdownParser().html(from: "**Hello, *world*!**")
        XCTAssertEqual(html, "<p><strong>Hello, <em>world</em>!</strong></p>")
    }

    func testBoldTextWithinItalicText() {
        let html = MarkdownParser().html(from: "*Hello, **world**!*")
        XCTAssertEqual(html, "<p><em>Hello, <strong>world</strong>!</em></p>")
    }

    func testItalicTextWithExtraLeadingMarkers() {
        let html = MarkdownParser().html(from: "**Hello*")
        XCTAssertEqual(html, "<p>*<em>Hello</em></p>")
    }

    func testBoldTextWithExtraLeadingMarkers() {
        let html = MarkdownParser().html(from: "***Hello**")
        XCTAssertEqual(html, "<p><strong>*Hello</strong></p>")
    }

    func testItalicTextWithExtraTrailingMarkers() {
        let html = MarkdownParser().html(from: "*Hello**")
        XCTAssertEqual(html, "<p><em>Hello</em>*</p>")
    }

    func testBoldTextWithExtraTrailingMarkers() {
        let html = MarkdownParser().html(from: "**Hello***")
        XCTAssertEqual(html, "<p><strong>Hello</strong>*</p>")
    }

    func testItalicBoldTextWithExtraTrailingMarkers() {
        let html = MarkdownParser().html(from: "**Hello, *world*****!")
        XCTAssertEqual(html, "<p><strong>Hello, <em>world</em></strong>**!</p>")
    }

    func testUnterminatedItalicMarker() {
        let html = MarkdownParser().html(from: "*Hello")
        XCTAssertEqual(html, "<p>*Hello</p>")
    }

    func testUnterminatedBoldMarker() {
        let html = MarkdownParser().html(from: "**Hello")
        XCTAssertEqual(html, "<p>**Hello</p>")
    }

    func testUnterminatedItalicBoldMarker() {
        let html = MarkdownParser().html(from: "***Hello")
        XCTAssertEqual(html, "<p>***Hello</p>")
    }

    func testUnterminatedItalicMarkerWithinBoldText() {
        let html = MarkdownParser().html(from: "**Hello, *world!**")
        XCTAssertEqual(html, "<p><strong>Hello, *world!</strong></p>")
    }

    func testUnterminatedBoldMarkerWithinItalicText() {
        let html = MarkdownParser().html(from: "*Hello, **world!*")
        XCTAssertEqual(html, "<p><em>Hello, **world!</em></p>")
    }

    func testStrikethroughText() {
        let html = MarkdownParser().html(from: "Hello, ~~world!~~")
        XCTAssertEqual(html, "<p>Hello, <s>world!</s></p>")
    }

    func testSingleTildeWithinStrikethroughText() {
        let html = MarkdownParser().html(from: "Hello, ~~wor~ld!~~")
        XCTAssertEqual(html, "<p>Hello, <s>wor~ld!</s></p>")
    }

    func testUnterminatedStrikethroughMarker() {
        let html = MarkdownParser().html(from: "~~Hello")
        XCTAssertEqual(html, "<p>~~Hello</p>")
    }

    func testEncodingSpecialCharacters() {
        let html = MarkdownParser().html(from: "Hello < World & >")
        XCTAssertEqual(html, "<p>Hello &lt; World &amp; &gt;</p>")
    }

    func testSingleLineBlockquote() {
        let html = MarkdownParser().html(from: "> Hello, world!")
        XCTAssertEqual(html, "<blockquote><p>Hello, world!</p></blockquote>")
    }

    func testMultiLineBlockquote() {
        let html = MarkdownParser().html(from: """
        > One
        > Two
        > Three
        """)

        XCTAssertEqual(html, "<blockquote><p>One Two Three</p></blockquote>")
    }

    func testEscapingSymbolsWithBackslash() {
        let html = MarkdownParser().html(from: """
        \\# Not a title
        \\*Not italic\\*
        """)

        XCTAssertEqual(html, "<p># Not a title *Not italic*</p>")
    }

    func testDoubleSpacedHardLinebreak() {
        let html = MarkdownParser().html(from: "Line 1  \nLine 2")

        XCTAssertEqual(html, "<p>Line 1<br>Line 2</p>")
    }

    func testEscapedHardLinebreak() {
        let html = MarkdownParser().html(from: "Line 1\\\nLine 2")

        XCTAssertEqual(html, "<p>Line 1<br>Line 2</p>")
    }
    
    func testEscapedPunctuation() {
        // Derived from CommonMark spec lines 488-492
        let allTheSpecialASCIIChars =
        #####"""
        \!\"\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\\\]\^\_\`\{\|\}\~
        """#####
        let html = MarkdownParser().html(from: allTheSpecialASCIIChars)
        
        let properAnswer = #####"""
        <p>!&quot;#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~</p>
        """#####
        XCTAssertEqual(html, properAnswer)
    }
    
    func testOtherCharactersNotEscaped() {
        // Derived from CommonMark spec lines 498-502
        // watch out as there are tab characters in this test \#####t
        let inputString =
        #####"""
        \\#####t\A\a\ \3\φ\«
        """#####
        let html = MarkdownParser().html(from: inputString)
        
        let properAnswer = #####"""
        <p>\\#####t\A\a\ \3\φ\«</p>
        """#####
        XCTAssertEqual(html, properAnswer)
    }
    
    func testEscapesThatOverrideMarkdown() {
        // Derived from CommonMark spec lines 508-528
        // Escaped characters are treated as regular characters and do
        // not have their usual Markdown meanings:
        let inputString =
        #####"""
        \*not emphasized*
        \<br/> not a tag
        \[not a link](/foo)
        \`not code`
        1\. not a list
        \* not a list
        \# not a heading
        \[foo]: /url "not a reference"
        \&ouml; not a character entity
        """#####
        let html = MarkdownParser().html(from: inputString)
        
        let properAnswer = #####"""
        <p>*not emphasized* &lt;br/&gt; not a tag [not a link](/foo) `not code` 1. not a list * not a list # not a heading [foo]: /url &quot;not a reference&quot; &amp;ouml; not a character entity</p>
        """#####
        XCTAssertEqual(html, properAnswer)
    }
    
    func testEscapeOfBackslash() {
        // Derived from CommonMark spec lines 533-537
        // If a backslash is itself escaped, the following character is not:
        let inputString =
        #####"""
        \\*emphasis*
        """#####
        let html = MarkdownParser().html(from: inputString)
        
        let properAnswer = #####"""
        <p>\<em>emphasis</em></p>
        """#####
        XCTAssertEqual(html, properAnswer)
    }
    
    func testCodeAreasPreserveBackslash() {
        // Derived from CommonMark spec lines 569-576
        // Backslash escapes do not work in code blocks
        let inputString =
        #####"""
        ```
        \[\]
        ```
        """#####
        let html = MarkdownParser().html(from: inputString)
        
        let properAnswer = #####"""
        <pre><code>\[\]</code></pre>
        """#####
        XCTAssertEqual(html, properAnswer)
    }
    
    func testRawHTMLPreserveBackslash() {
           // Derived from CommonMark spec lines 586-590
           // Backslash escapes do not work in raw HTML
           let inputString =
           #####"""
           <a href="/bar\/)">
           """#####
           let html = MarkdownParser().html(from: inputString)
           
           let properAnswer = #####"""
           <a href="/bar\/)">
           """#####
           XCTAssertEqual(html, properAnswer)
       }
    
    func testBackslashInURL() {
        // Derived from CommonMark spec lines 596-600
        // Backslash work in all other contexts, including URLs
        let inputString =
        #####"""
        [foo](/bar\* "ti\*tle")
        """#####
        let html = MarkdownParser().html(from: inputString)
        
        let properAnswer = #####"""
        <p><a href="/bar*" title="ti*tle">foo</a></p>
        """#####
        XCTAssertEqual(html, properAnswer)
    }
}

extension TextFormattingTests {
    static var allTests: Linux.TestList<TextFormattingTests> {
        return [
            ("testParagraph", testParagraph),
            ("testItalicText", testItalicText),
            ("testBoldText", testBoldText),
            ("testItalicBoldText", testItalicBoldText),
            ("testItalicBoldTextWithSeparateStartMarkers", testItalicBoldTextWithSeparateStartMarkers),
            ("testItalicTextWithinBoldText", testItalicTextWithinBoldText),
            ("testBoldTextWithinItalicText", testBoldTextWithinItalicText),
            ("testItalicTextWithExtraLeadingMarkers", testItalicTextWithExtraLeadingMarkers),
            ("testBoldTextWithExtraLeadingMarkers", testBoldTextWithExtraLeadingMarkers),
            ("testItalicTextWithExtraTrailingMarkers", testItalicTextWithExtraTrailingMarkers),
            ("testBoldTextWithExtraTrailingMarkers", testBoldTextWithExtraTrailingMarkers),
            ("testItalicBoldTextWithExtraTrailingMarkers", testItalicBoldTextWithExtraTrailingMarkers),
            ("testUnterminatedItalicMarker", testUnterminatedItalicMarker),
            ("testUnterminatedBoldMarker", testUnterminatedBoldMarker),
            ("testUnterminatedItalicBoldMarker", testUnterminatedItalicBoldMarker),
            ("testUnterminatedItalicMarkerWithinBoldText", testUnterminatedItalicMarkerWithinBoldText),
            ("testUnterminatedBoldMarkerWithinItalicText", testUnterminatedBoldMarkerWithinItalicText),
            ("testStrikethroughText", testStrikethroughText),
            ("testSingleTildeWithinStrikethroughText", testSingleTildeWithinStrikethroughText),
            ("testUnterminatedStrikethroughMarker", testUnterminatedStrikethroughMarker),
            ("testEncodingSpecialCharacters", testEncodingSpecialCharacters),
            ("testSingleLineBlockquote", testSingleLineBlockquote),
            ("testMultiLineBlockquote", testMultiLineBlockquote),
            ("testEscapingSymbolsWithBackslash", testEscapingSymbolsWithBackslash),
            ("testDoubleSpacedHardLinebreak", testDoubleSpacedHardLinebreak),
            ("testEscapedHardLinebreak", testEscapedHardLinebreak),
            ("testEscapedPunctuation", testEscapedPunctuation),
            ("testOtherCharactersNotEscaped", testOtherCharactersNotEscaped),
            ("testEscapesThatOverrideMarkdown", testEscapesThatOverrideMarkdown),
            ("testEscapeOfBackslash", testEscapeOfBackslash),
            ("testCodeAreasPreserveBackslash", testCodeAreasPreserveBackslash),
            ("testRawHTMLPreserveBackslash", testRawHTMLPreserveBackslash),
            ("testBackslashInURL", testBackslashInURL)
        ]
    }
}
