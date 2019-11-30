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

final class TextualContentTests: XCTestCase {
    
    
    // spec.txt lines 9358-9362
    func testExample648() {
        let html = MarkdownParser().html(from:
        #####"""
        hello $.;'there
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>hello $.;'there</p>
        """#####
        )
    }    
    
    // spec.txt lines 9365-9369
    func testExample649() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo χρῆν
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>Foo χρῆν</p>
        """#####
        )
    }    
    
    // spec.txt lines 9374-9378
    func testExample650() {
        let html = MarkdownParser().html(from:
        #####"""
        Multiple     spaces
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>Multiple     spaces</p>
        """#####
        )
    }
}

extension TextualContentTests {
    static var allTests: Linux.TestList<TextualContentTests> {
        return [
        ("testExample648", testExample648),
        ("testExample649", testExample649),
        ("testExample650", testExample650)
        ]
    }
}