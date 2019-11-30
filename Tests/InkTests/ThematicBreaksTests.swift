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

final class ThematicBreaksTests: XCTestCase {
    
    
    // spec.txt lines 878-886
    func testExample43() {
        let html = MarkdownParser().html(from:
        #####"""
        ***
        ---
        ___
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <hr />
        <hr />
        <hr />
        """#####
        )
    }    
    
    // spec.txt lines 891-895
    func testExample44() {
        let html = MarkdownParser().html(from:
        #####"""
        +++
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>+++</p>
        """#####
        )
    }    
    
    // spec.txt lines 898-902
    func testExample45() {
        let html = MarkdownParser().html(from:
        #####"""
        ===
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>===</p>
        """#####
        )
    }    
    
    // spec.txt lines 907-915
    func testExample46() {
        let html = MarkdownParser().html(from:
        #####"""
        --
        **
        __
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>--
        **
        __</p>
        """#####
        )
    }    
    
    // spec.txt lines 920-928
    func testExample47() {
        let html = MarkdownParser().html(from:
        #####"""
         ***
          ***
           ***
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <hr />
        <hr />
        <hr />
        """#####
        )
    }    
    
    // spec.txt lines 933-938
    func testExample48() {
        let html = MarkdownParser().html(from:
        #####"""
            ***
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>***
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 941-947
    func testExample49() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo
            ***
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>Foo
        ***</p>
        """#####
        )
    }    
    
    // spec.txt lines 952-956
    func testExample50() {
        let html = MarkdownParser().html(from:
        #####"""
        _____________________________________
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <hr />
        """#####
        )
    }    
    
    // spec.txt lines 961-965
    func testExample51() {
        let html = MarkdownParser().html(from:
        #####"""
         - - -
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <hr />
        """#####
        )
    }    
    
    // spec.txt lines 968-972
    func testExample52() {
        let html = MarkdownParser().html(from:
        #####"""
         **  * ** * ** * **
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <hr />
        """#####
        )
    }    
    
    // spec.txt lines 975-979
    func testExample53() {
        let html = MarkdownParser().html(from:
        #####"""
        -     -      -      -
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <hr />
        """#####
        )
    }    
    
    // spec.txt lines 984-988
    func testExample54() {
        let html = MarkdownParser().html(from:
        #####"""
        - - - -    
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <hr />
        """#####
        )
    }    
    
    // spec.txt lines 993-1003
    func testExample55() {
        let html = MarkdownParser().html(from:
        #####"""
        _ _ _ _ a
        
        a------
        
        ---a---
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>_ _ _ _ a</p>
        <p>a------</p>
        <p>---a---</p>
        """#####
        )
    }    
    
    // spec.txt lines 1009-1013
    func testExample56() {
        let html = MarkdownParser().html(from:
        #####"""
         *-*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>-</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 1018-1030
    func testExample57() {
        let html = MarkdownParser().html(from:
        #####"""
        - foo
        ***
        - bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>foo</li>
        </ul>
        <hr />
        <ul>
        <li>bar</li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 1035-1043
    func testExample58() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo
        ***
        bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>Foo</p>
        <hr />
        <p>bar</p>
        """#####
        )
    }    
    
    // spec.txt lines 1052-1059
    func testExample59() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo
        ---
        bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h2>Foo</h2>
        <p>bar</p>
        """#####
        )
    }    
    
    // spec.txt lines 1065-1077
    func testExample60() {
        let html = MarkdownParser().html(from:
        #####"""
        * Foo
        * * *
        * Bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>Foo</li>
        </ul>
        <hr />
        <ul>
        <li>Bar</li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 1082-1092
    func testExample61() {
        let html = MarkdownParser().html(from:
        #####"""
        - Foo
        - * * *
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>Foo</li>
        <li>
        <hr />
        </li>
        </ul>
        """#####
        )
    }
}

extension ThematicBreaksTests {
    static var allTests: Linux.TestList<ThematicBreaksTests> {
        return [
        ("testExample43", testExample43),
        ("testExample44", testExample44),
        ("testExample45", testExample45),
        ("testExample46", testExample46),
        ("testExample47", testExample47),
        ("testExample48", testExample48),
        ("testExample49", testExample49),
        ("testExample50", testExample50),
        ("testExample51", testExample51),
        ("testExample52", testExample52),
        ("testExample53", testExample53),
        ("testExample54", testExample54),
        ("testExample55", testExample55),
        ("testExample56", testExample56),
        ("testExample57", testExample57),
        ("testExample58", testExample58),
        ("testExample59", testExample59),
        ("testExample60", testExample60),
        ("testExample61", testExample61)
        ]
    }
}