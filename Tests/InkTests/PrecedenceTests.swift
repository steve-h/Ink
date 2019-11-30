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

final class PrecedenceTests: XCTestCase {
    
    
    // spec.txt lines 839-847
    func testExample42() {
        let html = MarkdownParser().html(from:
        #####"""
        - `one
        - two`
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>`one</li>
        <li>two`</li>
        </ul>
        """#####
        )
    }
}

extension PrecedenceTests {
    static var allTests: Linux.TestList<PrecedenceTests> {
        return [
        ("testExample42", testExample42)
        ]
    }
}