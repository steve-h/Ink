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

final class ImagesTests: XCTestCase {
    
    
    // spec.txt lines 8494-8498
    func testExample569() {
        let html = MarkdownParser().html(from:
        #####"""
        ![foo](/url "title")
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><img src="/url" alt="foo" title="title" /></p>
        """#####
        )
    }    
    
    // spec.txt lines 8501-8507
    func testExample570() {
        let html = MarkdownParser().html(from:
        #####"""
        ![foo *bar*]
        
        [foo *bar*]: train.jpg "train & tracks"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><img src="train.jpg" alt="foo bar" title="train &amp; tracks" /></p>
        """#####
        )
    }    
    
    // spec.txt lines 8510-8514
    func testExample571() {
        let html = MarkdownParser().html(from:
        #####"""
        ![foo ![bar](/url)](/url2)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><img src="/url2" alt="foo bar" /></p>
        """#####
        )
    }    
    
    // spec.txt lines 8517-8521
    func testExample572() {
        let html = MarkdownParser().html(from:
        #####"""
        ![foo [bar](/url)](/url2)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><img src="/url2" alt="foo bar" /></p>
        """#####
        )
    }    
    
    // spec.txt lines 8531-8537
    func testExample573() {
        let html = MarkdownParser().html(from:
        #####"""
        ![foo *bar*][]
        
        [foo *bar*]: train.jpg "train & tracks"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><img src="train.jpg" alt="foo bar" title="train &amp; tracks" /></p>
        """#####
        )
    }    
    
    // spec.txt lines 8540-8546
    func testExample574() {
        let html = MarkdownParser().html(from:
        #####"""
        ![foo *bar*][foobar]
        
        [FOOBAR]: train.jpg "train & tracks"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><img src="train.jpg" alt="foo bar" title="train &amp; tracks" /></p>
        """#####
        )
    }    
    
    // spec.txt lines 8549-8553
    func testExample575() {
        let html = MarkdownParser().html(from:
        #####"""
        ![foo](train.jpg)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><img src="train.jpg" alt="foo" /></p>
        """#####
        )
    }    
    
    // spec.txt lines 8556-8560
    func testExample576() {
        let html = MarkdownParser().html(from:
        #####"""
        My ![foo bar](/path/to/train.jpg  "title"   )
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>My <img src="/path/to/train.jpg" alt="foo bar" title="title" /></p>
        """#####
        )
    }    
    
    // spec.txt lines 8563-8567
    func testExample577() {
        let html = MarkdownParser().html(from:
        #####"""
        ![foo](<url>)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><img src="url" alt="foo" /></p>
        """#####
        )
    }    
    
    // spec.txt lines 8570-8574
    func testExample578() {
        let html = MarkdownParser().html(from:
        #####"""
        ![](/url)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><img src="/url" alt="" /></p>
        """#####
        )
    }    
    
    // spec.txt lines 8579-8585
    func testExample579() {
        let html = MarkdownParser().html(from:
        #####"""
        ![foo][bar]
        
        [bar]: /url
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><img src="/url" alt="foo" /></p>
        """#####
        )
    }    
    
    // spec.txt lines 8588-8594
    func testExample580() {
        let html = MarkdownParser().html(from:
        #####"""
        ![foo][bar]
        
        [BAR]: /url
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><img src="/url" alt="foo" /></p>
        """#####
        )
    }    
    
    // spec.txt lines 8599-8605
    func testExample581() {
        let html = MarkdownParser().html(from:
        #####"""
        ![foo][]
        
        [foo]: /url "title"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><img src="/url" alt="foo" title="title" /></p>
        """#####
        )
    }    
    
    // spec.txt lines 8608-8614
    func testExample582() {
        let html = MarkdownParser().html(from:
        #####"""
        ![*foo* bar][]
        
        [*foo* bar]: /url "title"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><img src="/url" alt="foo bar" title="title" /></p>
        """#####
        )
    }    
    
    // spec.txt lines 8619-8625
    func testExample583() {
        let html = MarkdownParser().html(from:
        #####"""
        ![Foo][]
        
        [foo]: /url "title"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><img src="/url" alt="Foo" title="title" /></p>
        """#####
        )
    }    
    
    // spec.txt lines 8631-8639
    func testExample584() {
        let html = MarkdownParser().html(from:
        #####"""
        ![foo] 
        []
        
        [foo]: /url "title"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><img src="/url" alt="foo" title="title" />
        []</p>
        """#####
        )
    }    
    
    // spec.txt lines 8644-8650
    func testExample585() {
        let html = MarkdownParser().html(from:
        #####"""
        ![foo]
        
        [foo]: /url "title"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><img src="/url" alt="foo" title="title" /></p>
        """#####
        )
    }    
    
    // spec.txt lines 8653-8659
    func testExample586() {
        let html = MarkdownParser().html(from:
        #####"""
        ![*foo* bar]
        
        [*foo* bar]: /url "title"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><img src="/url" alt="foo bar" title="title" /></p>
        """#####
        )
    }    
    
    // spec.txt lines 8664-8671
    func testExample587() {
        let html = MarkdownParser().html(from:
        #####"""
        ![[foo]]
        
        [[foo]]: /url "title"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>![[foo]]</p>
        <p>[[foo]]: /url &quot;title&quot;</p>
        """#####
        )
    }    
    
    // spec.txt lines 8676-8682
    func testExample588() {
        let html = MarkdownParser().html(from:
        #####"""
        ![Foo]
        
        [foo]: /url "title"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><img src="/url" alt="Foo" title="title" /></p>
        """#####
        )
    }    
    
    // spec.txt lines 8688-8694
    func testExample589() {
        let html = MarkdownParser().html(from:
        #####"""
        !\[foo]
        
        [foo]: /url "title"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>![foo]</p>
        """#####
        )
    }    
    
    // spec.txt lines 8700-8706
    func testExample590() {
        let html = MarkdownParser().html(from:
        #####"""
        \![foo]
        
        [foo]: /url "title"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>!<a href="/url" title="title">foo</a></p>
        """#####
        )
    }
}

extension ImagesTests {
    static var allTests: Linux.TestList<ImagesTests> {
        return [
        ("testExample569", testExample569),
        ("testExample570", testExample570),
        ("testExample571", testExample571),
        ("testExample572", testExample572),
        ("testExample573", testExample573),
        ("testExample574", testExample574),
        ("testExample575", testExample575),
        ("testExample576", testExample576),
        ("testExample577", testExample577),
        ("testExample578", testExample578),
        ("testExample579", testExample579),
        ("testExample580", testExample580),
        ("testExample581", testExample581),
        ("testExample582", testExample582),
        ("testExample583", testExample583),
        ("testExample584", testExample584),
        ("testExample585", testExample585),
        ("testExample586", testExample586),
        ("testExample587", testExample587),
        ("testExample588", testExample588),
        ("testExample589", testExample589),
        ("testExample590", testExample590)
        ]
    }
}