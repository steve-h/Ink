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

final class SetextHeadingsTests: XCTestCase {
    
    
    // spec.txt lines 1349-1358
    func testExample80() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo *bar*
        =========
        
        Foo *bar*
        ---------
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h1>Foo <em>bar</em></h1>
        <h2>Foo <em>bar</em></h2>
        """#####
        )
    }    
    
    // spec.txt lines 1363-1370
    func testExample81() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo *bar
        baz*
        ====
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h1>Foo <em>bar
        baz</em></h1>
        """#####
        )
    }    
    
    // spec.txt lines 1377-1384
    func testExample82() {
        let html = MarkdownParser().html(from:
        #####"""
          Foo *bar
        baz*	
        ====
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h1>Foo <em>bar
        baz</em></h1>
        """#####
        )
    }    
    
    // spec.txt lines 1389-1398
    func testExample83() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo
        -------------------------
        
        Foo
        =
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h2>Foo</h2>
        <h1>Foo</h1>
        """#####
        )
    }    
    
    // spec.txt lines 1404-1417
    func testExample84() {
        let html = MarkdownParser().html(from:
        #####"""
           Foo
        ---
        
          Foo
        -----
        
          Foo
          ===
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h2>Foo</h2>
        <h2>Foo</h2>
        <h1>Foo</h1>
        """#####
        )
    }    
    
    // spec.txt lines 1422-1435
    func testExample85() {
        let html = MarkdownParser().html(from:
        #####"""
            Foo
            ---
        
            Foo
        ---
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>Foo
        ---
        
        Foo
        </code></pre>
        <hr />
        """#####
        )
    }    
    
    // spec.txt lines 1441-1446
    func testExample86() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo
           ----      
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h2>Foo</h2>
        """#####
        )
    }    
    
    // spec.txt lines 1451-1457
    func testExample87() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo
            ---
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>Foo
        ---</p>
        """#####
        )
    }    
    
    // spec.txt lines 1462-1473
    func testExample88() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo
        = =
        
        Foo
        --- -
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>Foo
        = =</p>
        <p>Foo</p>
        <hr />
        """#####
        )
    }    
    
    // spec.txt lines 1478-1483
    func testExample89() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo  
        -----
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h2>Foo</h2>
        """#####
        )
    }    
    
    // spec.txt lines 1488-1493
    func testExample90() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo\
        ----
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h2>Foo\</h2>
        """#####
        )
    }    
    
    // spec.txt lines 1499-1512
    func testExample91() {
        let html = MarkdownParser().html(from:
        #####"""
        `Foo
        ----
        `
        
        <a title="a lot
        ---
        of dashes"/>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h2>`Foo</h2>
        <p>`</p>
        <h2>&lt;a title=&quot;a lot</h2>
        <p>of dashes&quot;/&gt;</p>
        """#####
        )
    }    
    
    // spec.txt lines 1518-1526
    func testExample92() {
        let html = MarkdownParser().html(from:
        #####"""
        > Foo
        ---
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <p>Foo</p>
        </blockquote>
        <hr />
        """#####
        )
    }    
    
    // spec.txt lines 1529-1539
    func testExample93() {
        let html = MarkdownParser().html(from:
        #####"""
        > foo
        bar
        ===
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <p>foo
        bar
        ===</p>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 1542-1550
    func testExample94() {
        let html = MarkdownParser().html(from:
        #####"""
        - Foo
        ---
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>Foo</li>
        </ul>
        <hr />
        """#####
        )
    }    
    
    // spec.txt lines 1557-1564
    func testExample95() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo
        Bar
        ---
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h2>Foo
        Bar</h2>
        """#####
        )
    }    
    
    // spec.txt lines 1570-1582
    func testExample96() {
        let html = MarkdownParser().html(from:
        #####"""
        ---
        Foo
        ---
        Bar
        ---
        Baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <hr />
        <h2>Foo</h2>
        <h2>Bar</h2>
        <p>Baz</p>
        """#####
        )
    }    
    
    // spec.txt lines 1587-1592
    func testExample97() {
        let html = MarkdownParser().html(from:
        #####"""
        
        ====
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>====</p>
        """#####
        )
    }    
    
    // spec.txt lines 1599-1605
    func testExample98() {
        let html = MarkdownParser().html(from:
        #####"""
        ---
        ---
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <hr />
        <hr />
        """#####
        )
    }    
    
    // spec.txt lines 1608-1616
    func testExample99() {
        let html = MarkdownParser().html(from:
        #####"""
        - foo
        -----
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>foo</li>
        </ul>
        <hr />
        """#####
        )
    }    
    
    // spec.txt lines 1619-1626
    func testExample100() {
        let html = MarkdownParser().html(from:
        #####"""
            foo
        ---
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>foo
        </code></pre>
        <hr />
        """#####
        )
    }    
    
    // spec.txt lines 1629-1637
    func testExample101() {
        let html = MarkdownParser().html(from:
        #####"""
        > foo
        -----
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <p>foo</p>
        </blockquote>
        <hr />
        """#####
        )
    }    
    
    // spec.txt lines 1643-1648
    func testExample102() {
        let html = MarkdownParser().html(from:
        #####"""
        \> foo
        ------
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h2>&gt; foo</h2>
        """#####
        )
    }    
    
    // spec.txt lines 1674-1684
    func testExample103() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo
        
        bar
        ---
        baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>Foo</p>
        <h2>bar</h2>
        <p>baz</p>
        """#####
        )
    }    
    
    // spec.txt lines 1690-1702
    func testExample104() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo
        bar
        
        ---
        
        baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>Foo
        bar</p>
        <hr />
        <p>baz</p>
        """#####
        )
    }    
    
    // spec.txt lines 1708-1718
    func testExample105() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo
        bar
        * * *
        baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>Foo
        bar</p>
        <hr />
        <p>baz</p>
        """#####
        )
    }    
    
    // spec.txt lines 1723-1733
    func testExample106() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo
        bar
        \---
        baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>Foo
        bar
        ---
        baz</p>
        """#####
        )
    }
}

extension SetextHeadingsTests {
    static var allTests: Linux.TestList<SetextHeadingsTests> {
        return [
        ("testExample80", testExample80),
        ("testExample81", testExample81),
        ("testExample82", testExample82),
        ("testExample83", testExample83),
        ("testExample84", testExample84),
        ("testExample85", testExample85),
        ("testExample86", testExample86),
        ("testExample87", testExample87),
        ("testExample88", testExample88),
        ("testExample89", testExample89),
        ("testExample90", testExample90),
        ("testExample91", testExample91),
        ("testExample92", testExample92),
        ("testExample93", testExample93),
        ("testExample94", testExample94),
        ("testExample95", testExample95),
        ("testExample96", testExample96),
        ("testExample97", testExample97),
        ("testExample98", testExample98),
        ("testExample99", testExample99),
        ("testExample100", testExample100),
        ("testExample101", testExample101),
        ("testExample102", testExample102),
        ("testExample103", testExample103),
        ("testExample104", testExample104),
        ("testExample105", testExample105),
        ("testExample106", testExample106)
        ]
    }
}