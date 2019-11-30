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

final class SoftLineBreaksTests: XCTestCase {
    
    
    // spec.txt lines 9326-9332
    func testExample646() {
        let html = MarkdownParser().html(from:
        #####"""
        foo
        baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo
        baz</p>
        """#####
        )
    }    
    
    // spec.txt lines 9338-9344
    func testExample647() {
        let html = MarkdownParser().html(from:
        #####"""
        foo 
         baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo
        baz</p>
        """#####
        )
    }
}

extension SoftLineBreaksTests {
    static var allTests: Linux.TestList<SoftLineBreaksTests> {
        return [
        ("testExample646", testExample646),
        ("testExample647", testExample647)
        ]
    }
}