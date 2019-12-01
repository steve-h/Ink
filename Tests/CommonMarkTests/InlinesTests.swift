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

final class InlinesTests: XCTestCase {

    // 
    // 
    // # Inlines
    // 
    // Inlines are parsed sequentially from the beginning of the character
    // stream to the end (left to right, in left-to-right languages).
    // Thus, for example, in
    //     
    // spec.txt lines 5842-5846
    func testExample327() {
        let html = MarkdownParser().html(from:
        #####"""
        `hi`lo`
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><code>hi</code>lo`</p>
        """#####
        )
    }
}

extension InlinesTests {
    static var allTests: Linux.TestList<InlinesTests> {
        return [
        ("testExample327", testExample327)
        ]
    }
}