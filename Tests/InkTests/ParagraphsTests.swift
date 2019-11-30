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

final class ParagraphsTests: XCTestCase {
    
    
    // spec.txt lines 3514-3521
    func testExample219() {
        let html = MarkdownParser().html(from:
        #####"""
        aaa
        
        bbb
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>aaa</p>
        <p>bbb</p>
        """#####
        )
    }    
    
    // spec.txt lines 3526-3537
    func testExample220() {
        let html = MarkdownParser().html(from:
        #####"""
        aaa
        bbb
        
        ccc
        ddd
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>aaa
        bbb</p>
        <p>ccc
        ddd</p>
        """#####
        )
    }    
    
    // spec.txt lines 3542-3550
    func testExample221() {
        let html = MarkdownParser().html(from:
        #####"""
        aaa
        
        
        bbb
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>aaa</p>
        <p>bbb</p>
        """#####
        )
    }    
    
    // spec.txt lines 3555-3561
    func testExample222() {
        let html = MarkdownParser().html(from:
        #####"""
          aaa
         bbb
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>aaa
        bbb</p>
        """#####
        )
    }    
    
    // spec.txt lines 3567-3575
    func testExample223() {
        let html = MarkdownParser().html(from:
        #####"""
        aaa
                     bbb
                                               ccc
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>aaa
        bbb
        ccc</p>
        """#####
        )
    }    
    
    // spec.txt lines 3581-3587
    func testExample224() {
        let html = MarkdownParser().html(from:
        #####"""
           aaa
        bbb
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>aaa
        bbb</p>
        """#####
        )
    }    
    
    // spec.txt lines 3590-3597
    func testExample225() {
        let html = MarkdownParser().html(from:
        #####"""
            aaa
        bbb
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>aaa
        </code></pre>
        <p>bbb</p>
        """#####
        )
    }    
    
    // spec.txt lines 3604-3610
    func testExample226() {
        let html = MarkdownParser().html(from:
        #####"""
        aaa     
        bbb     
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>aaa<br />
        bbb</p>
        """#####
        )
    }
}

extension ParagraphsTests {
    static var allTests: Linux.TestList<ParagraphsTests> {
        return [
        ("testExample219", testExample219),
        ("testExample220", testExample220),
        ("testExample221", testExample221),
        ("testExample222", testExample222),
        ("testExample223", testExample223),
        ("testExample224", testExample224),
        ("testExample225", testExample225),
        ("testExample226", testExample226)
        ]
    }
}