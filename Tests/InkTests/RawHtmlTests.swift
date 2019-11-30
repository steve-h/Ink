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

final class RawHtmlTests: XCTestCase {
    
    
    // spec.txt lines 8969-8973
    func testExample610() {
        let html = MarkdownParser().html(from:
        #####"""
        <a><bab><c2c>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a><bab><c2c></p>
        """#####
        )
    }    
    
    // spec.txt lines 8978-8982
    func testExample611() {
        let html = MarkdownParser().html(from:
        #####"""
        <a/><b2/>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a/><b2/></p>
        """#####
        )
    }    
    
    // spec.txt lines 8987-8993
    func testExample612() {
        let html = MarkdownParser().html(from:
        #####"""
        <a  /><b2
        data="foo" >
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a  /><b2
        data="foo" ></p>
        """#####
        )
    }    
    
    // spec.txt lines 8998-9004
    func testExample613() {
        let html = MarkdownParser().html(from:
        #####"""
        <a foo="bar" bam = 'baz <em>"</em>'
        _boolean zoop:33=zoop:33 />
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a foo="bar" bam = 'baz <em>"</em>'
        _boolean zoop:33=zoop:33 /></p>
        """#####
        )
    }    
    
    // spec.txt lines 9009-9013
    func testExample614() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo <responsive-image src="foo.jpg" />
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>Foo <responsive-image src="foo.jpg" /></p>
        """#####
        )
    }    
    
    // spec.txt lines 9018-9022
    func testExample615() {
        let html = MarkdownParser().html(from:
        #####"""
        <33> <__>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>&lt;33&gt; &lt;__&gt;</p>
        """#####
        )
    }    
    
    // spec.txt lines 9027-9031
    func testExample616() {
        let html = MarkdownParser().html(from:
        #####"""
        <a h*#ref="hi">
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>&lt;a h*#ref=&quot;hi&quot;&gt;</p>
        """#####
        )
    }    
    
    // spec.txt lines 9036-9040
    func testExample617() {
        let html = MarkdownParser().html(from:
        #####"""
        <a href="hi'> <a href=hi'>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>&lt;a href=&quot;hi'&gt; &lt;a href=hi'&gt;</p>
        """#####
        )
    }    
    
    // spec.txt lines 9045-9055
    func testExample618() {
        let html = MarkdownParser().html(from:
        #####"""
        < a><
        foo><bar/ >
        <foo bar=baz
        bim!bop />
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>&lt; a&gt;&lt;
        foo&gt;&lt;bar/ &gt;
        &lt;foo bar=baz
        bim!bop /&gt;</p>
        """#####
        )
    }    
    
    // spec.txt lines 9060-9064
    func testExample619() {
        let html = MarkdownParser().html(from:
        #####"""
        <a href='bar'title=title>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>&lt;a href='bar'title=title&gt;</p>
        """#####
        )
    }    
    
    // spec.txt lines 9069-9073
    func testExample620() {
        let html = MarkdownParser().html(from:
        #####"""
        </a></foo >
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p></a></foo ></p>
        """#####
        )
    }    
    
    // spec.txt lines 9078-9082
    func testExample621() {
        let html = MarkdownParser().html(from:
        #####"""
        </a href="foo">
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>&lt;/a href=&quot;foo&quot;&gt;</p>
        """#####
        )
    }    
    
    // spec.txt lines 9087-9093
    func testExample622() {
        let html = MarkdownParser().html(from:
        #####"""
        foo <!-- this is a
        comment - with hyphen -->
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo <!-- this is a
        comment - with hyphen --></p>
        """#####
        )
    }    
    
    // spec.txt lines 9096-9100
    func testExample623() {
        let html = MarkdownParser().html(from:
        #####"""
        foo <!-- not a comment -- two hyphens -->
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo &lt;!-- not a comment -- two hyphens --&gt;</p>
        """#####
        )
    }    
    
    // spec.txt lines 9105-9112
    func testExample624() {
        let html = MarkdownParser().html(from:
        #####"""
        foo <!--> foo -->
        
        foo <!-- foo--->
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo &lt;!--&gt; foo --&gt;</p>
        <p>foo &lt;!-- foo---&gt;</p>
        """#####
        )
    }    
    
    // spec.txt lines 9117-9121
    func testExample625() {
        let html = MarkdownParser().html(from:
        #####"""
        foo <?php echo $a; ?>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo <?php echo $a; ?></p>
        """#####
        )
    }    
    
    // spec.txt lines 9126-9130
    func testExample626() {
        let html = MarkdownParser().html(from:
        #####"""
        foo <!ELEMENT br EMPTY>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo <!ELEMENT br EMPTY></p>
        """#####
        )
    }    
    
    // spec.txt lines 9135-9139
    func testExample627() {
        let html = MarkdownParser().html(from:
        #####"""
        foo <![CDATA[>&<]]>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo <![CDATA[>&<]]></p>
        """#####
        )
    }    
    
    // spec.txt lines 9145-9149
    func testExample628() {
        let html = MarkdownParser().html(from:
        #####"""
        foo <a href="&ouml;">
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo <a href="&ouml;"></p>
        """#####
        )
    }    
    
    // spec.txt lines 9154-9158
    func testExample629() {
        let html = MarkdownParser().html(from:
        #####"""
        foo <a href="\*">
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo <a href="\*"></p>
        """#####
        )
    }    
    
    // spec.txt lines 9161-9165
    func testExample630() {
        let html = MarkdownParser().html(from:
        #####"""
        <a href="\"">
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>&lt;a href=&quot;&quot;&quot;&gt;</p>
        """#####
        )
    }
}

extension RawHtmlTests {
    static var allTests: Linux.TestList<RawHtmlTests> {
        return [
        ("testExample610", testExample610),
        ("testExample611", testExample611),
        ("testExample612", testExample612),
        ("testExample613", testExample613),
        ("testExample614", testExample614),
        ("testExample615", testExample615),
        ("testExample616", testExample616),
        ("testExample617", testExample617),
        ("testExample618", testExample618),
        ("testExample619", testExample619),
        ("testExample620", testExample620),
        ("testExample621", testExample621),
        ("testExample622", testExample622),
        ("testExample623", testExample623),
        ("testExample624", testExample624),
        ("testExample625", testExample625),
        ("testExample626", testExample626),
        ("testExample627", testExample627),
        ("testExample628", testExample628),
        ("testExample629", testExample629),
        ("testExample630", testExample630)
        ]
    }
}