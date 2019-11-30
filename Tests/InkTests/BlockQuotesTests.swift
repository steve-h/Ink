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

final class BlockQuotesTests: XCTestCase {
    
    
    // spec.txt lines 3687-3697
    func testExample228() {
        let html = MarkdownParser().html(from:
        #####"""
        > # Foo
        > bar
        > baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <h1>Foo</h1>
        <p>bar
        baz</p>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 3702-3712
    func testExample229() {
        let html = MarkdownParser().html(from:
        #####"""
        ># Foo
        >bar
        > baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <h1>Foo</h1>
        <p>bar
        baz</p>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 3717-3727
    func testExample230() {
        let html = MarkdownParser().html(from:
        #####"""
           > # Foo
           > bar
         > baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <h1>Foo</h1>
        <p>bar
        baz</p>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 3732-3741
    func testExample231() {
        let html = MarkdownParser().html(from:
        #####"""
            > # Foo
            > bar
            > baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>&gt; # Foo
        &gt; bar
        &gt; baz
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 3747-3757
    func testExample232() {
        let html = MarkdownParser().html(from:
        #####"""
        > # Foo
        > bar
        baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <h1>Foo</h1>
        <p>bar
        baz</p>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 3763-3773
    func testExample233() {
        let html = MarkdownParser().html(from:
        #####"""
        > bar
        baz
        > foo
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <p>bar
        baz
        foo</p>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 3787-3795
    func testExample234() {
        let html = MarkdownParser().html(from:
        #####"""
        > foo
        ---
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
    
    // spec.txt lines 3807-3819
    func testExample235() {
        let html = MarkdownParser().html(from:
        #####"""
        > - foo
        - bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <ul>
        <li>foo</li>
        </ul>
        </blockquote>
        <ul>
        <li>bar</li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 3825-3835
    func testExample236() {
        let html = MarkdownParser().html(from:
        #####"""
        >     foo
            bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <pre><code>foo
        </code></pre>
        </blockquote>
        <pre><code>bar
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 3838-3848
    func testExample237() {
        let html = MarkdownParser().html(from:
        #####"""
        > ```
        foo
        ```
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <pre><code></code></pre>
        </blockquote>
        <p>foo</p>
        <pre><code></code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 3854-3862
    func testExample238() {
        let html = MarkdownParser().html(from:
        #####"""
        > foo
            - bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <p>foo
        - bar</p>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 3878-3883
    func testExample239() {
        let html = MarkdownParser().html(from:
        #####"""
        >
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 3886-3893
    func testExample240() {
        let html = MarkdownParser().html(from:
        #####"""
        >
        >  
        > 
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 3898-3906
    func testExample241() {
        let html = MarkdownParser().html(from:
        #####"""
        >
        > foo
        >  
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <p>foo</p>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 3911-3922
    func testExample242() {
        let html = MarkdownParser().html(from:
        #####"""
        > foo
        
        > bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <p>foo</p>
        </blockquote>
        <blockquote>
        <p>bar</p>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 3933-3941
    func testExample243() {
        let html = MarkdownParser().html(from:
        #####"""
        > foo
        > bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <p>foo
        bar</p>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 3946-3955
    func testExample244() {
        let html = MarkdownParser().html(from:
        #####"""
        > foo
        >
        > bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <p>foo</p>
        <p>bar</p>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 3960-3968
    func testExample245() {
        let html = MarkdownParser().html(from:
        #####"""
        foo
        > bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo</p>
        <blockquote>
        <p>bar</p>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 3974-3986
    func testExample246() {
        let html = MarkdownParser().html(from:
        #####"""
        > aaa
        ***
        > bbb
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <p>aaa</p>
        </blockquote>
        <hr />
        <blockquote>
        <p>bbb</p>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 3992-4000
    func testExample247() {
        let html = MarkdownParser().html(from:
        #####"""
        > bar
        baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <p>bar
        baz</p>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 4003-4012
    func testExample248() {
        let html = MarkdownParser().html(from:
        #####"""
        > bar
        
        baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <p>bar</p>
        </blockquote>
        <p>baz</p>
        """#####
        )
    }    
    
    // spec.txt lines 4015-4024
    func testExample249() {
        let html = MarkdownParser().html(from:
        #####"""
        > bar
        >
        baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <p>bar</p>
        </blockquote>
        <p>baz</p>
        """#####
        )
    }    
    
    // spec.txt lines 4031-4043
    func testExample250() {
        let html = MarkdownParser().html(from:
        #####"""
        > > > foo
        bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <blockquote>
        <blockquote>
        <p>foo
        bar</p>
        </blockquote>
        </blockquote>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 4046-4060
    func testExample251() {
        let html = MarkdownParser().html(from:
        #####"""
        >>> foo
        > bar
        >>baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <blockquote>
        <blockquote>
        <p>foo
        bar
        baz</p>
        </blockquote>
        </blockquote>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 4068-4080
    func testExample252() {
        let html = MarkdownParser().html(from:
        #####"""
        >     code
        
        >    not code
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <pre><code>code
        </code></pre>
        </blockquote>
        <blockquote>
        <p>not code</p>
        </blockquote>
        """#####
        )
    }
}

extension BlockQuotesTests {
    static var allTests: Linux.TestList<BlockQuotesTests> {
        return [
        ("testExample228", testExample228),
        ("testExample229", testExample229),
        ("testExample230", testExample230),
        ("testExample231", testExample231),
        ("testExample232", testExample232),
        ("testExample233", testExample233),
        ("testExample234", testExample234),
        ("testExample235", testExample235),
        ("testExample236", testExample236),
        ("testExample237", testExample237),
        ("testExample238", testExample238),
        ("testExample239", testExample239),
        ("testExample240", testExample240),
        ("testExample241", testExample241),
        ("testExample242", testExample242),
        ("testExample243", testExample243),
        ("testExample244", testExample244),
        ("testExample245", testExample245),
        ("testExample246", testExample246),
        ("testExample247", testExample247),
        ("testExample248", testExample248),
        ("testExample249", testExample249),
        ("testExample250", testExample250),
        ("testExample251", testExample251),
        ("testExample252", testExample252)
        ]
    }
}