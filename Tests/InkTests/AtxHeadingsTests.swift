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

final class AtxHeadingsTests: XCTestCase {
    
    
    // spec.txt lines 1111-1125
    func testExample62() {
        let html = MarkdownParser().html(from:
        #####"""
        # foo
        ## foo
        ### foo
        #### foo
        ##### foo
        ###### foo
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h1>foo</h1>
        <h2>foo</h2>
        <h3>foo</h3>
        <h4>foo</h4>
        <h5>foo</h5>
        <h6>foo</h6>
        """#####
        )
    }    
    
    // spec.txt lines 1130-1134
    func testExample63() {
        let html = MarkdownParser().html(from:
        #####"""
        ####### foo
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>####### foo</p>
        """#####
        )
    }    
    
    // spec.txt lines 1145-1152
    func testExample64() {
        let html = MarkdownParser().html(from:
        #####"""
        #5 bolt
        
        #hashtag
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>#5 bolt</p>
        <p>#hashtag</p>
        """#####
        )
    }    
    
    // spec.txt lines 1157-1161
    func testExample65() {
        let html = MarkdownParser().html(from:
        #####"""
        \## foo
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>## foo</p>
        """#####
        )
    }    
    
    // spec.txt lines 1166-1170
    func testExample66() {
        let html = MarkdownParser().html(from:
        #####"""
        # foo *bar* \*baz\*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h1>foo <em>bar</em> *baz*</h1>
        """#####
        )
    }    
    
    // spec.txt lines 1175-1179
    func testExample67() {
        let html = MarkdownParser().html(from:
        #####"""
        #                  foo                     
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h1>foo</h1>
        """#####
        )
    }    
    
    // spec.txt lines 1184-1192
    func testExample68() {
        let html = MarkdownParser().html(from:
        #####"""
         ### foo
          ## foo
           # foo
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h3>foo</h3>
        <h2>foo</h2>
        <h1>foo</h1>
        """#####
        )
    }    
    
    // spec.txt lines 1197-1202
    func testExample69() {
        let html = MarkdownParser().html(from:
        #####"""
            # foo
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code># foo
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 1205-1211
    func testExample70() {
        let html = MarkdownParser().html(from:
        #####"""
        foo
            # bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo
        # bar</p>
        """#####
        )
    }    
    
    // spec.txt lines 1216-1222
    func testExample71() {
        let html = MarkdownParser().html(from:
        #####"""
        ## foo ##
          ###   bar    ###
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h2>foo</h2>
        <h3>bar</h3>
        """#####
        )
    }    
    
    // spec.txt lines 1227-1233
    func testExample72() {
        let html = MarkdownParser().html(from:
        #####"""
        # foo ##################################
        ##### foo ##
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h1>foo</h1>
        <h5>foo</h5>
        """#####
        )
    }    
    
    // spec.txt lines 1238-1242
    func testExample73() {
        let html = MarkdownParser().html(from:
        #####"""
        ### foo ###     
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h3>foo</h3>
        """#####
        )
    }    
    
    // spec.txt lines 1249-1253
    func testExample74() {
        let html = MarkdownParser().html(from:
        #####"""
        ### foo ### b
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h3>foo ### b</h3>
        """#####
        )
    }    
    
    // spec.txt lines 1258-1262
    func testExample75() {
        let html = MarkdownParser().html(from:
        #####"""
        # foo#
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h1>foo#</h1>
        """#####
        )
    }    
    
    // spec.txt lines 1268-1276
    func testExample76() {
        let html = MarkdownParser().html(from:
        #####"""
        ### foo \###
        ## foo #\##
        # foo \#
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h3>foo ###</h3>
        <h2>foo ###</h2>
        <h1>foo #</h1>
        """#####
        )
    }    
    
    // spec.txt lines 1282-1290
    func testExample77() {
        let html = MarkdownParser().html(from:
        #####"""
        ****
        ## foo
        ****
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <hr />
        <h2>foo</h2>
        <hr />
        """#####
        )
    }    
    
    // spec.txt lines 1293-1301
    func testExample78() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo bar
        # baz
        Bar foo
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>Foo bar</p>
        <h1>baz</h1>
        <p>Bar foo</p>
        """#####
        )
    }    
    
    // spec.txt lines 1306-1314
    func testExample79() {
        let html = MarkdownParser().html(from:
        #####"""
        ## 
        #
        ### ###
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h2></h2>
        <h1></h1>
        <h3></h3>
        """#####
        )
    }
}

extension AtxHeadingsTests {
    static var allTests: Linux.TestList<AtxHeadingsTests> {
        return [
        ("testExample62", testExample62),
        ("testExample63", testExample63),
        ("testExample64", testExample64),
        ("testExample65", testExample65),
        ("testExample66", testExample66),
        ("testExample67", testExample67),
        ("testExample68", testExample68),
        ("testExample69", testExample69),
        ("testExample70", testExample70),
        ("testExample71", testExample71),
        ("testExample72", testExample72),
        ("testExample73", testExample73),
        ("testExample74", testExample74),
        ("testExample75", testExample75),
        ("testExample76", testExample76),
        ("testExample77", testExample77),
        ("testExample78", testExample78),
        ("testExample79", testExample79)
        ]
    }
}