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

final class CodeSpansTests: XCTestCase {
    
    
    // spec.txt lines 5874-5878
    func testExample328() {
        let html = MarkdownParser().html(from:
        #####"""
        `foo`
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><code>foo</code></p>
        """#####
        )
    }    
    
    // spec.txt lines 5885-5889
    func testExample329() {
        let html = MarkdownParser().html(from:
        #####"""
        `` foo ` bar ``
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><code>foo ` bar</code></p>
        """#####
        )
    }    
    
    // spec.txt lines 5895-5899
    func testExample330() {
        let html = MarkdownParser().html(from:
        #####"""
        ` `` `
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><code>``</code></p>
        """#####
        )
    }    
    
    // spec.txt lines 5903-5907
    func testExample331() {
        let html = MarkdownParser().html(from:
        #####"""
        `  ``  `
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><code> `` </code></p>
        """#####
        )
    }    
    
    // spec.txt lines 5912-5916
    func testExample332() {
        let html = MarkdownParser().html(from:
        #####"""
        ` a`
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><code> a</code></p>
        """#####
        )
    }    
    
    // spec.txt lines 5921-5925
    func testExample333() {
        let html = MarkdownParser().html(from:
        #####"""
        ` b `
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><code> b </code></p>
        """#####
        )
    }    
    
    // spec.txt lines 5929-5935
    func testExample334() {
        let html = MarkdownParser().html(from:
        #####"""
        ` `
        `  `
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><code> </code>
        <code>  </code></p>
        """#####
        )
    }    
    
    // spec.txt lines 5940-5948
    func testExample335() {
        let html = MarkdownParser().html(from:
        #####"""
        ``
        foo
        bar  
        baz
        ``
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><code>foo bar   baz</code></p>
        """#####
        )
    }    
    
    // spec.txt lines 5950-5956
    func testExample336() {
        let html = MarkdownParser().html(from:
        #####"""
        ``
        foo 
        ``
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><code>foo </code></p>
        """#####
        )
    }    
    
    // spec.txt lines 5961-5966
    func testExample337() {
        let html = MarkdownParser().html(from:
        #####"""
        `foo   bar 
        baz`
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><code>foo   bar  baz</code></p>
        """#####
        )
    }    
    
    // spec.txt lines 5978-5982
    func testExample338() {
        let html = MarkdownParser().html(from:
        #####"""
        `foo\`bar`
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><code>foo\</code>bar`</p>
        """#####
        )
    }    
    
    // spec.txt lines 5989-5993
    func testExample339() {
        let html = MarkdownParser().html(from:
        #####"""
        ``foo`bar``
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><code>foo`bar</code></p>
        """#####
        )
    }    
    
    // spec.txt lines 5995-5999
    func testExample340() {
        let html = MarkdownParser().html(from:
        #####"""
        ` foo `` bar `
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><code>foo `` bar</code></p>
        """#####
        )
    }    
    
    // spec.txt lines 6007-6011
    func testExample341() {
        let html = MarkdownParser().html(from:
        #####"""
        *foo`*`
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>*foo<code>*</code></p>
        """#####
        )
    }    
    
    // spec.txt lines 6016-6020
    func testExample342() {
        let html = MarkdownParser().html(from:
        #####"""
        [not a `link](/foo`)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[not a <code>link](/foo</code>)</p>
        """#####
        )
    }    
    
    // spec.txt lines 6026-6030
    func testExample343() {
        let html = MarkdownParser().html(from:
        #####"""
        `<a href="`">`
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><code>&lt;a href=&quot;</code>&quot;&gt;`</p>
        """#####
        )
    }    
    
    // spec.txt lines 6035-6039
    func testExample344() {
        let html = MarkdownParser().html(from:
        #####"""
        <a href="`">`
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="`">`</p>
        """#####
        )
    }    
    
    // spec.txt lines 6044-6048
    func testExample345() {
        let html = MarkdownParser().html(from:
        #####"""
        `<http://foo.bar.`baz>`
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><code>&lt;http://foo.bar.</code>baz&gt;`</p>
        """#####
        )
    }    
    
    // spec.txt lines 6053-6057
    func testExample346() {
        let html = MarkdownParser().html(from:
        #####"""
        <http://foo.bar.`baz>`
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="http://foo.bar.%60baz">http://foo.bar.`baz</a>`</p>
        """#####
        )
    }    
    
    // spec.txt lines 6063-6067
    func testExample347() {
        let html = MarkdownParser().html(from:
        #####"""
        ```foo``
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>```foo``</p>
        """#####
        )
    }    
    
    // spec.txt lines 6070-6074
    func testExample348() {
        let html = MarkdownParser().html(from:
        #####"""
        `foo
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>`foo</p>
        """#####
        )
    }    
    
    // spec.txt lines 6079-6083
    func testExample349() {
        let html = MarkdownParser().html(from:
        #####"""
        `foo``bar``
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>`foo<code>bar</code></p>
        """#####
        )
    }
}

extension CodeSpansTests {
    static var allTests: Linux.TestList<CodeSpansTests> {
        return [
        ("testExample328", testExample328),
        ("testExample329", testExample329),
        ("testExample330", testExample330),
        ("testExample331", testExample331),
        ("testExample332", testExample332),
        ("testExample333", testExample333),
        ("testExample334", testExample334),
        ("testExample335", testExample335),
        ("testExample336", testExample336),
        ("testExample337", testExample337),
        ("testExample338", testExample338),
        ("testExample339", testExample339),
        ("testExample340", testExample340),
        ("testExample341", testExample341),
        ("testExample342", testExample342),
        ("testExample343", testExample343),
        ("testExample344", testExample344),
        ("testExample345", testExample345),
        ("testExample346", testExample346),
        ("testExample347", testExample347),
        ("testExample348", testExample348),
        ("testExample349", testExample349)
        ]
    }
}