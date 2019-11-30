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

final class AutolinksTests: XCTestCase {
    
    
    // spec.txt lines 8733-8737
    func testExample591() {
        let html = MarkdownParser().html(from:
        #####"""
        <http://foo.bar.baz>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="http://foo.bar.baz">http://foo.bar.baz</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8740-8744
    func testExample592() {
        let html = MarkdownParser().html(from:
        #####"""
        <http://foo.bar.baz/test?q=hello&id=22&boolean>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="http://foo.bar.baz/test?q=hello&amp;id=22&amp;boolean">http://foo.bar.baz/test?q=hello&amp;id=22&amp;boolean</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8747-8751
    func testExample593() {
        let html = MarkdownParser().html(from:
        #####"""
        <irc://foo.bar:2233/baz>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="irc://foo.bar:2233/baz">irc://foo.bar:2233/baz</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8756-8760
    func testExample594() {
        let html = MarkdownParser().html(from:
        #####"""
        <MAILTO:FOO@BAR.BAZ>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="MAILTO:FOO@BAR.BAZ">MAILTO:FOO@BAR.BAZ</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8768-8772
    func testExample595() {
        let html = MarkdownParser().html(from:
        #####"""
        <a+b+c:d>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="a+b+c:d">a+b+c:d</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8775-8779
    func testExample596() {
        let html = MarkdownParser().html(from:
        #####"""
        <made-up-scheme://foo,bar>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="made-up-scheme://foo,bar">made-up-scheme://foo,bar</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8782-8786
    func testExample597() {
        let html = MarkdownParser().html(from:
        #####"""
        <http://../>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="http://../">http://../</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8789-8793
    func testExample598() {
        let html = MarkdownParser().html(from:
        #####"""
        <localhost:5001/foo>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="localhost:5001/foo">localhost:5001/foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8798-8802
    func testExample599() {
        let html = MarkdownParser().html(from:
        #####"""
        <http://foo.bar/baz bim>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>&lt;http://foo.bar/baz bim&gt;</p>
        """#####
        )
    }    
    
    // spec.txt lines 8807-8811
    func testExample600() {
        let html = MarkdownParser().html(from:
        #####"""
        <http://example.com/\[\>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="http://example.com/%5C%5B%5C">http://example.com/\[\</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8829-8833
    func testExample601() {
        let html = MarkdownParser().html(from:
        #####"""
        <foo@bar.example.com>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="mailto:foo@bar.example.com">foo@bar.example.com</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8836-8840
    func testExample602() {
        let html = MarkdownParser().html(from:
        #####"""
        <foo+special@Bar.baz-bar0.com>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="mailto:foo+special@Bar.baz-bar0.com">foo+special@Bar.baz-bar0.com</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8845-8849
    func testExample603() {
        let html = MarkdownParser().html(from:
        #####"""
        <foo\+@bar.example.com>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>&lt;foo+@bar.example.com&gt;</p>
        """#####
        )
    }    
    
    // spec.txt lines 8854-8858
    func testExample604() {
        let html = MarkdownParser().html(from:
        #####"""
        <>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>&lt;&gt;</p>
        """#####
        )
    }    
    
    // spec.txt lines 8861-8865
    func testExample605() {
        let html = MarkdownParser().html(from:
        #####"""
        < http://foo.bar >
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>&lt; http://foo.bar &gt;</p>
        """#####
        )
    }    
    
    // spec.txt lines 8868-8872
    func testExample606() {
        let html = MarkdownParser().html(from:
        #####"""
        <m:abc>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>&lt;m:abc&gt;</p>
        """#####
        )
    }    
    
    // spec.txt lines 8875-8879
    func testExample607() {
        let html = MarkdownParser().html(from:
        #####"""
        <foo.bar.baz>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>&lt;foo.bar.baz&gt;</p>
        """#####
        )
    }    
    
    // spec.txt lines 8882-8886
    func testExample608() {
        let html = MarkdownParser().html(from:
        #####"""
        http://example.com
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>http://example.com</p>
        """#####
        )
    }    
    
    // spec.txt lines 8889-8893
    func testExample609() {
        let html = MarkdownParser().html(from:
        #####"""
        foo@bar.example.com
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo@bar.example.com</p>
        """#####
        )
    }
}

extension AutolinksTests {
    static var allTests: Linux.TestList<AutolinksTests> {
        return [
        ("testExample591", testExample591),
        ("testExample592", testExample592),
        ("testExample593", testExample593),
        ("testExample594", testExample594),
        ("testExample595", testExample595),
        ("testExample596", testExample596),
        ("testExample597", testExample597),
        ("testExample598", testExample598),
        ("testExample599", testExample599),
        ("testExample600", testExample600),
        ("testExample601", testExample601),
        ("testExample602", testExample602),
        ("testExample603", testExample603),
        ("testExample604", testExample604),
        ("testExample605", testExample605),
        ("testExample606", testExample606),
        ("testExample607", testExample607),
        ("testExample608", testExample608),
        ("testExample609", testExample609)
        ]
    }
}