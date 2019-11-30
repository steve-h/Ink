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

final class ListsTests: XCTestCase {
    
    
    // spec.txt lines 5237-5249
    func testExample301() {
        let html = MarkdownParser().html(from:
        #####"""
        - foo
        - bar
        + baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>foo</li>
        <li>bar</li>
        </ul>
        <ul>
        <li>baz</li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 5252-5264
    func testExample302() {
        let html = MarkdownParser().html(from:
        #####"""
        1. foo
        2. bar
        3) baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ol>
        <li>foo</li>
        <li>bar</li>
        </ol>
        <ol start="3">
        <li>baz</li>
        </ol>
        """#####
        )
    }    
    
    // spec.txt lines 5271-5281
    func testExample303() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo
        - bar
        - baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>Foo</p>
        <ul>
        <li>bar</li>
        <li>baz</li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 5348-5354
    func testExample304() {
        let html = MarkdownParser().html(from:
        #####"""
        The number of windows in my house is
        14.  The number of doors is 6.
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>The number of windows in my house is
        14.  The number of doors is 6.</p>
        """#####
        )
    }    
    
    // spec.txt lines 5358-5366
    func testExample305() {
        let html = MarkdownParser().html(from:
        #####"""
        The number of windows in my house is
        1.  The number of doors is 6.
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>The number of windows in my house is</p>
        <ol>
        <li>The number of doors is 6.</li>
        </ol>
        """#####
        )
    }    
    
    // spec.txt lines 5372-5391
    func testExample306() {
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
        <li>
        <p>foo</p>
        </li>
        <li>
        <p>bar</p>
        </li>
        <li>
        <p>baz</p>
        </li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 5393-5415
    func testExample307() {
        let html = MarkdownParser().html(from:
        #####"""
        - foo
          - bar
            - baz
        
        
              bim
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>foo
        <ul>
        <li>bar
        <ul>
        <li>
        <p>baz</p>
        <p>bim</p>
        </li>
        </ul>
        </li>
        </ul>
        </li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 5423-5441
    func testExample308() {
        let html = MarkdownParser().html(from:
        #####"""
        - foo
        - bar
        
        <!-- -->
        
        - baz
        - bim
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>foo</li>
        <li>bar</li>
        </ul>
        <!-- -->
        <ul>
        <li>baz</li>
        <li>bim</li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 5444-5467
    func testExample309() {
        let html = MarkdownParser().html(from:
        #####"""
        -   foo
        
            notcode
        
        -   foo
        
        <!-- -->
        
            code
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>
        <p>foo</p>
        <p>notcode</p>
        </li>
        <li>
        <p>foo</p>
        </li>
        </ul>
        <!-- -->
        <pre><code>code
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 5475-5493
    func testExample310() {
        let html = MarkdownParser().html(from:
        #####"""
        - a
         - b
          - c
           - d
          - e
         - f
        - g
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>a</li>
        <li>b</li>
        <li>c</li>
        <li>d</li>
        <li>e</li>
        <li>f</li>
        <li>g</li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 5496-5514
    func testExample311() {
        let html = MarkdownParser().html(from:
        #####"""
        1. a
        
          2. b
        
           3. c
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ol>
        <li>
        <p>a</p>
        </li>
        <li>
        <p>b</p>
        </li>
        <li>
        <p>c</p>
        </li>
        </ol>
        """#####
        )
    }    
    
    // spec.txt lines 5520-5534
    func testExample312() {
        let html = MarkdownParser().html(from:
        #####"""
        - a
         - b
          - c
           - d
            - e
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>a</li>
        <li>b</li>
        <li>c</li>
        <li>d
        - e</li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 5540-5557
    func testExample313() {
        let html = MarkdownParser().html(from:
        #####"""
        1. a
        
          2. b
        
            3. c
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ol>
        <li>
        <p>a</p>
        </li>
        <li>
        <p>b</p>
        </li>
        </ol>
        <pre><code>3. c
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 5563-5580
    func testExample314() {
        let html = MarkdownParser().html(from:
        #####"""
        - a
        - b
        
        - c
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>
        <p>a</p>
        </li>
        <li>
        <p>b</p>
        </li>
        <li>
        <p>c</p>
        </li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 5585-5600
    func testExample315() {
        let html = MarkdownParser().html(from:
        #####"""
        * a
        *
        
        * c
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>
        <p>a</p>
        </li>
        <li></li>
        <li>
        <p>c</p>
        </li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 5607-5626
    func testExample316() {
        let html = MarkdownParser().html(from:
        #####"""
        - a
        - b
        
          c
        - d
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>
        <p>a</p>
        </li>
        <li>
        <p>b</p>
        <p>c</p>
        </li>
        <li>
        <p>d</p>
        </li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 5629-5647
    func testExample317() {
        let html = MarkdownParser().html(from:
        #####"""
        - a
        - b
        
          [ref]: /url
        - d
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>
        <p>a</p>
        </li>
        <li>
        <p>b</p>
        </li>
        <li>
        <p>d</p>
        </li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 5652-5671
    func testExample318() {
        let html = MarkdownParser().html(from:
        #####"""
        - a
        - ```
          b
        
        
          ```
        - c
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>a</li>
        <li>
        <pre><code>b
        
        
        </code></pre>
        </li>
        <li>c</li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 5678-5696
    func testExample319() {
        let html = MarkdownParser().html(from:
        #####"""
        - a
          - b
        
            c
        - d
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>a
        <ul>
        <li>
        <p>b</p>
        <p>c</p>
        </li>
        </ul>
        </li>
        <li>d</li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 5702-5716
    func testExample320() {
        let html = MarkdownParser().html(from:
        #####"""
        * a
          > b
          >
        * c
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>a
        <blockquote>
        <p>b</p>
        </blockquote>
        </li>
        <li>c</li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 5722-5740
    func testExample321() {
        let html = MarkdownParser().html(from:
        #####"""
        - a
          > b
          ```
          c
          ```
        - d
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>a
        <blockquote>
        <p>b</p>
        </blockquote>
        <pre><code>c
        </code></pre>
        </li>
        <li>d</li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 5745-5751
    func testExample322() {
        let html = MarkdownParser().html(from:
        #####"""
        - a
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>a</li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 5754-5765
    func testExample323() {
        let html = MarkdownParser().html(from:
        #####"""
        - a
          - b
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>a
        <ul>
        <li>b</li>
        </ul>
        </li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 5771-5785
    func testExample324() {
        let html = MarkdownParser().html(from:
        #####"""
        1. ```
           foo
           ```
        
           bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ol>
        <li>
        <pre><code>foo
        </code></pre>
        <p>bar</p>
        </li>
        </ol>
        """#####
        )
    }    
    
    // spec.txt lines 5790-5805
    func testExample325() {
        let html = MarkdownParser().html(from:
        #####"""
        * foo
          * bar
        
          baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>
        <p>foo</p>
        <ul>
        <li>bar</li>
        </ul>
        <p>baz</p>
        </li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 5808-5833
    func testExample326() {
        let html = MarkdownParser().html(from:
        #####"""
        - a
          - b
          - c
        
        - d
          - e
          - f
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>
        <p>a</p>
        <ul>
        <li>b</li>
        <li>c</li>
        </ul>
        </li>
        <li>
        <p>d</p>
        <ul>
        <li>e</li>
        <li>f</li>
        </ul>
        </li>
        </ul>
        """#####
        )
    }
}

extension ListsTests {
    static var allTests: Linux.TestList<ListsTests> {
        return [
        ("testExample301", testExample301),
        ("testExample302", testExample302),
        ("testExample303", testExample303),
        ("testExample304", testExample304),
        ("testExample305", testExample305),
        ("testExample306", testExample306),
        ("testExample307", testExample307),
        ("testExample308", testExample308),
        ("testExample309", testExample309),
        ("testExample310", testExample310),
        ("testExample311", testExample311),
        ("testExample312", testExample312),
        ("testExample313", testExample313),
        ("testExample314", testExample314),
        ("testExample315", testExample315),
        ("testExample316", testExample316),
        ("testExample317", testExample317),
        ("testExample318", testExample318),
        ("testExample319", testExample319),
        ("testExample320", testExample320),
        ("testExample321", testExample321),
        ("testExample322", testExample322),
        ("testExample323", testExample323),
        ("testExample324", testExample324),
        ("testExample325", testExample325),
        ("testExample326", testExample326)
        ]
    }
}