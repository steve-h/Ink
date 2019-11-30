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

final class TabsTests: XCTestCase {
    
    
    // spec.txt lines 354-359
    func testExample1() {
        let html = MarkdownParser().html(from:
        #####"""
        	foo	baz		bim
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>foo	baz		bim
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 361-366
    func testExample2() {
        let html = MarkdownParser().html(from:
        #####"""
          	foo	baz		bim
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>foo	baz		bim
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 368-375
    func testExample3() {
        let html = MarkdownParser().html(from:
        #####"""
            a	a
            ὐ	a
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>a	a
        ὐ	a
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 381-392
    func testExample4() {
        let html = MarkdownParser().html(from:
        #####"""
          - foo
        
        	bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>
        <p>foo</p>
        <p>bar</p>
        </li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 394-406
    func testExample5() {
        let html = MarkdownParser().html(from:
        #####"""
        - foo
        
        		bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>
        <p>foo</p>
        <pre><code>  bar
        </code></pre>
        </li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 417-424
    func testExample6() {
        let html = MarkdownParser().html(from:
        #####"""
        >		foo
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <pre><code>  foo
        </code></pre>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 426-435
    func testExample7() {
        let html = MarkdownParser().html(from:
        #####"""
        -		foo
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>
        <pre><code>  foo
        </code></pre>
        </li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 438-445
    func testExample8() {
        let html = MarkdownParser().html(from:
        #####"""
            foo
        	bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>foo
        bar
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 447-463
    func testExample9() {
        let html = MarkdownParser().html(from:
        #####"""
         - foo
           - bar
        	 - baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>foo
        <ul>
        <li>bar
        <ul>
        <li>baz</li>
        </ul>
        </li>
        </ul>
        </li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 465-469
    func testExample10() {
        let html = MarkdownParser().html(from:
        #####"""
        #	Foo
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h1>Foo</h1>
        """#####
        )
    }    
    
    // spec.txt lines 471-475
    func testExample11() {
        let html = MarkdownParser().html(from:
        #####"""
        *	*	*	
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <hr />
        """#####
        )
    }
}

extension TabsTests {
    static var allTests: Linux.TestList<TabsTests> {
        return [
        ("testExample1", testExample1),
        ("testExample2", testExample2),
        ("testExample3", testExample3),
        ("testExample4", testExample4),
        ("testExample5", testExample5),
        ("testExample6", testExample6),
        ("testExample7", testExample7),
        ("testExample8", testExample8),
        ("testExample9", testExample9),
        ("testExample10", testExample10),
        ("testExample11", testExample11)
        ]
    }
}