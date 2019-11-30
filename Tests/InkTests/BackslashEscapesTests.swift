/**
*  Ink
*  Copyright (c) Steve Hume 2019
*  MIT license, see LICENSE file for details
These tests are extracted from https://spec.commonmark.org/0.29/
title: CommonMark Spec
author: John MacFarlane
version: 0.29
date: '2019-04-06'
license: '[CC-BY-SA 4.0](http://creativecommons.org/licenses/by-sa/4.0
*/

import XCTest
import Ink

final class BackslashEscapesTests: XCTestCase {
    
    
    // spec.txt lines 488-492
    func testExample12() {
        let html = MarkdownParser().html(from:
        #####"""
        \!\"\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\\\]\^\_\`\{\|\}\~
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>!&quot;#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~</p>
        """#####
        )
    }    
    
    // spec.txt lines 498-502
    func testExample13() {
        let html = MarkdownParser().html(from:
        #####"""
        \	\A\a\ \3\φ\«
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>\	\A\a\ \3\φ\«</p>
        """#####
        )
    }    
    
    // spec.txt lines 508-528
    func testExample14() {
        let html = MarkdownParser().html(from:
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
        )
        XCTAssertEqual(html,
        #####"""
        <p>*not emphasized*
        &lt;br/&gt; not a tag
        [not a link](/foo)
        `not code`
        1. not a list
        * not a list
        # not a heading
        [foo]: /url &quot;not a reference&quot;
        &amp;ouml; not a character entity</p>
        """#####
        )
    }    
    
    // spec.txt lines 533-537
    func testExample15() {
        let html = MarkdownParser().html(from:
        #####"""
        \\*emphasis*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>\<em>emphasis</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 542-548
    func testExample16() {
        let html = MarkdownParser().html(from:
        #####"""
        foo\
        bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo<br />
        bar</p>
        """#####
        )
    }    
    
    // spec.txt lines 554-558
    func testExample17() {
        let html = MarkdownParser().html(from:
        #####"""
        `` \[\` ``
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><code>\[\`</code></p>
        """#####
        )
    }    
    
    // spec.txt lines 561-566
    func testExample18() {
        let html = MarkdownParser().html(from:
        #####"""
            \[\]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>\[\]
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 569-576
    func testExample19() {
        let html = MarkdownParser().html(from:
        #####"""
        ~~~
        \[\]
        ~~~
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>\[\]
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 579-583
    func testExample20() {
        let html = MarkdownParser().html(from:
        #####"""
        <http://example.com?find=\*>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="http://example.com?find=%5C*">http://example.com?find=\*</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 586-590
    func testExample21() {
        let html = MarkdownParser().html(from:
        #####"""
        <a href="/bar\/)">
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <a href="/bar\/)">
        """#####
        )
    }    
    
    // spec.txt lines 596-600
    func testExample22() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo](/bar\* "ti\*tle")
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/bar*" title="ti*tle">foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 603-609
    func testExample23() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]
        
        [foo]: /bar\* "ti\*tle"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/bar*" title="ti*tle">foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 612-619
    func testExample24() {
        let html = MarkdownParser().html(from:
        #####"""
        ``` foo\+bar
        foo
        ```
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code class="language-foo+bar">foo
        </code></pre>
        """#####
        )
    }
}

extension BackslashEscapesTests {
    static var allTests: Linux.TestList<BackslashEscapesTests> {
        return [
        ("testExample12", testExample12),
        ("testExample13", testExample13),
        ("testExample14", testExample14),
        ("testExample15", testExample15),
        ("testExample16", testExample16),
        ("testExample17", testExample17),
        ("testExample18", testExample18),
        ("testExample19", testExample19),
        ("testExample20", testExample20),
        ("testExample21", testExample21),
        ("testExample22", testExample22),
        ("testExample23", testExample23),
        ("testExample24", testExample24)
        ]
    }
}