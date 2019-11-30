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

final class EntityAndNumericCharacterReferencesTests: XCTestCase {
    
    
    // spec.txt lines 648-656
    func testExample25() {
        let html = MarkdownParser().html(from:
        #####"""
        &nbsp; &amp; &copy; &AElig; &Dcaron;
        &frac34; &HilbertSpace; &DifferentialD;
        &ClockwiseContourIntegral; &ngE;
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>  &amp; © Æ Ď
        ¾ ℋ ⅆ
        ∲ ≧̸</p>
        """#####
        )
    }    
    
    // spec.txt lines 667-671
    func testExample26() {
        let html = MarkdownParser().html(from:
        #####"""
        &#35; &#1234; &#992; &#0;
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p># Ӓ Ϡ �</p>
        """#####
        )
    }    
    
    // spec.txt lines 680-684
    func testExample27() {
        let html = MarkdownParser().html(from:
        #####"""
        &#X22; &#XD06; &#xcab;
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>&quot; ആ ಫ</p>
        """#####
        )
    }    
    
    // spec.txt lines 689-699
    func testExample28() {
        let html = MarkdownParser().html(from:
        #####"""
        &nbsp &x; &#; &#x;
        &#87654321;
        &#abcdef0;
        &ThisIsNotDefined; &hi?;
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>&amp;nbsp &amp;x; &amp;#; &amp;#x;
        &amp;#87654321;
        &amp;#abcdef0;
        &amp;ThisIsNotDefined; &amp;hi?;</p>
        """#####
        )
    }    
    
    // spec.txt lines 706-710
    func testExample29() {
        let html = MarkdownParser().html(from:
        #####"""
        &copy
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>&amp;copy</p>
        """#####
        )
    }    
    
    // spec.txt lines 716-720
    func testExample30() {
        let html = MarkdownParser().html(from:
        #####"""
        &MadeUpEntity;
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>&amp;MadeUpEntity;</p>
        """#####
        )
    }    
    
    // spec.txt lines 727-731
    func testExample31() {
        let html = MarkdownParser().html(from:
        #####"""
        <a href="&ouml;&ouml;.html">
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <a href="&ouml;&ouml;.html">
        """#####
        )
    }    
    
    // spec.txt lines 734-738
    func testExample32() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo](/f&ouml;&ouml; "f&ouml;&ouml;")
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/f%C3%B6%C3%B6" title="föö">foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 741-747
    func testExample33() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]
        
        [foo]: /f&ouml;&ouml; "f&ouml;&ouml;"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/f%C3%B6%C3%B6" title="föö">foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 750-757
    func testExample34() {
        let html = MarkdownParser().html(from:
        #####"""
        ``` f&ouml;&ouml;
        foo
        ```
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code class="language-föö">foo
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 763-767
    func testExample35() {
        let html = MarkdownParser().html(from:
        #####"""
        `f&ouml;&ouml;`
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><code>f&amp;ouml;&amp;ouml;</code></p>
        """#####
        )
    }    
    
    // spec.txt lines 770-775
    func testExample36() {
        let html = MarkdownParser().html(from:
        #####"""
            f&ouml;f&ouml;
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>f&amp;ouml;f&amp;ouml;
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 782-788
    func testExample37() {
        let html = MarkdownParser().html(from:
        #####"""
        &#42;foo&#42;
        *foo*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>*foo*
        <em>foo</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 790-799
    func testExample38() {
        let html = MarkdownParser().html(from:
        #####"""
        &#42; foo
        
        * foo
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>* foo</p>
        <ul>
        <li>foo</li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 801-807
    func testExample39() {
        let html = MarkdownParser().html(from:
        #####"""
        foo&#10;&#10;bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo
        
        bar</p>
        """#####
        )
    }    
    
    // spec.txt lines 809-813
    func testExample40() {
        let html = MarkdownParser().html(from:
        #####"""
        &#9;foo
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>	foo</p>
        """#####
        )
    }    
    
    // spec.txt lines 816-820
    func testExample41() {
        let html = MarkdownParser().html(from:
        #####"""
        [a](url &quot;tit&quot;)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[a](url &quot;tit&quot;)</p>
        """#####
        )
    }
}

extension EntityAndNumericCharacterReferencesTests {
    static var allTests: Linux.TestList<EntityAndNumericCharacterReferencesTests> {
        return [
        ("testExample25", testExample25),
        ("testExample26", testExample26),
        ("testExample27", testExample27),
        ("testExample28", testExample28),
        ("testExample29", testExample29),
        ("testExample30", testExample30),
        ("testExample31", testExample31),
        ("testExample32", testExample32),
        ("testExample33", testExample33),
        ("testExample34", testExample34),
        ("testExample35", testExample35),
        ("testExample36", testExample36),
        ("testExample37", testExample37),
        ("testExample38", testExample38),
        ("testExample39", testExample39),
        ("testExample40", testExample40),
        ("testExample41", testExample41)
        ]
    }
}