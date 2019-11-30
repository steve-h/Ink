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

final class LinksTests: XCTestCase {
    
    
    // spec.txt lines 7508-7512
    func testExample481() {
        let html = MarkdownParser().html(from:
        #####"""
        [link](/uri "title")
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/uri" title="title">link</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7517-7521
    func testExample482() {
        let html = MarkdownParser().html(from:
        #####"""
        [link](/uri)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/uri">link</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7526-7530
    func testExample483() {
        let html = MarkdownParser().html(from:
        #####"""
        [link]()
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="">link</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7533-7537
    func testExample484() {
        let html = MarkdownParser().html(from:
        #####"""
        [link](<>)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="">link</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7542-7546
    func testExample485() {
        let html = MarkdownParser().html(from:
        #####"""
        [link](/my uri)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[link](/my uri)</p>
        """#####
        )
    }    
    
    // spec.txt lines 7548-7552
    func testExample486() {
        let html = MarkdownParser().html(from:
        #####"""
        [link](</my uri>)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/my%20uri">link</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7557-7563
    func testExample487() {
        let html = MarkdownParser().html(from:
        #####"""
        [link](foo
        bar)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[link](foo
        bar)</p>
        """#####
        )
    }    
    
    // spec.txt lines 7565-7571
    func testExample488() {
        let html = MarkdownParser().html(from:
        #####"""
        [link](<foo
        bar>)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[link](<foo
        bar>)</p>
        """#####
        )
    }    
    
    // spec.txt lines 7576-7580
    func testExample489() {
        let html = MarkdownParser().html(from:
        #####"""
        [a](<b)c>)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="b)c">a</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7584-7588
    func testExample490() {
        let html = MarkdownParser().html(from:
        #####"""
        [link](<foo\>)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[link](&lt;foo&gt;)</p>
        """#####
        )
    }    
    
    // spec.txt lines 7593-7601
    func testExample491() {
        let html = MarkdownParser().html(from:
        #####"""
        [a](<b)c
        [a](<b)c>
        [a](<b>c)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[a](&lt;b)c
        [a](&lt;b)c&gt;
        [a](<b>c)</p>
        """#####
        )
    }    
    
    // spec.txt lines 7605-7609
    func testExample492() {
        let html = MarkdownParser().html(from:
        #####"""
        [link](\(foo\))
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="(foo)">link</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7614-7618
    func testExample493() {
        let html = MarkdownParser().html(from:
        #####"""
        [link](foo(and(bar)))
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="foo(and(bar))">link</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7623-7627
    func testExample494() {
        let html = MarkdownParser().html(from:
        #####"""
        [link](foo(and(bar))
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[link](foo(and(bar))</p>
        """#####
        )
    }    
    
    // spec.txt lines 7630-7634
    func testExample495() {
        let html = MarkdownParser().html(from:
        #####"""
        [link](foo\(and\(bar\))
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="foo(and(bar)">link</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7637-7641
    func testExample496() {
        let html = MarkdownParser().html(from:
        #####"""
        [link](<foo(and(bar)>)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="foo(and(bar)">link</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7647-7651
    func testExample497() {
        let html = MarkdownParser().html(from:
        #####"""
        [link](foo\)\:)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="foo):">link</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7656-7666
    func testExample498() {
        let html = MarkdownParser().html(from:
        #####"""
        [link](#fragment)
        
        [link](http://example.com#fragment)
        
        [link](http://example.com?foo=3#frag)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="#fragment">link</a></p>
        <p><a href="http://example.com#fragment">link</a></p>
        <p><a href="http://example.com?foo=3#frag">link</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7672-7676
    func testExample499() {
        let html = MarkdownParser().html(from:
        #####"""
        [link](foo\bar)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="foo%5Cbar">link</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7688-7692
    func testExample500() {
        let html = MarkdownParser().html(from:
        #####"""
        [link](foo%20b&auml;)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="foo%20b%C3%A4">link</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7699-7703
    func testExample501() {
        let html = MarkdownParser().html(from:
        #####"""
        [link]("title")
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="%22title%22">link</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7708-7716
    func testExample502() {
        let html = MarkdownParser().html(from:
        #####"""
        [link](/url "title")
        [link](/url 'title')
        [link](/url (title))
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url" title="title">link</a>
        <a href="/url" title="title">link</a>
        <a href="/url" title="title">link</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7722-7726
    func testExample503() {
        let html = MarkdownParser().html(from:
        #####"""
        [link](/url "title \"&quot;")
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url" title="title &quot;&quot;">link</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7732-7736
    func testExample504() {
        let html = MarkdownParser().html(from:
        #####"""
        [link](/url "title")
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url%C2%A0%22title%22">link</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7741-7745
    func testExample505() {
        let html = MarkdownParser().html(from:
        #####"""
        [link](/url "title "and" title")
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[link](/url &quot;title &quot;and&quot; title&quot;)</p>
        """#####
        )
    }    
    
    // spec.txt lines 7750-7754
    func testExample506() {
        let html = MarkdownParser().html(from:
        #####"""
        [link](/url 'title "and" title')
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url" title="title &quot;and&quot; title">link</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7774-7779
    func testExample507() {
        let html = MarkdownParser().html(from:
        #####"""
        [link](   /uri
          "title"  )
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/uri" title="title">link</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7785-7789
    func testExample508() {
        let html = MarkdownParser().html(from:
        #####"""
        [link] (/uri)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[link] (/uri)</p>
        """#####
        )
    }    
    
    // spec.txt lines 7795-7799
    func testExample509() {
        let html = MarkdownParser().html(from:
        #####"""
        [link [foo [bar]]](/uri)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/uri">link [foo [bar]]</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7802-7806
    func testExample510() {
        let html = MarkdownParser().html(from:
        #####"""
        [link] bar](/uri)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[link] bar](/uri)</p>
        """#####
        )
    }    
    
    // spec.txt lines 7809-7813
    func testExample511() {
        let html = MarkdownParser().html(from:
        #####"""
        [link [bar](/uri)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[link <a href="/uri">bar</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7816-7820
    func testExample512() {
        let html = MarkdownParser().html(from:
        #####"""
        [link \[bar](/uri)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/uri">link [bar</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7825-7829
    func testExample513() {
        let html = MarkdownParser().html(from:
        #####"""
        [link *foo **bar** `#`*](/uri)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/uri">link <em>foo <strong>bar</strong> <code>#</code></em></a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7832-7836
    func testExample514() {
        let html = MarkdownParser().html(from:
        #####"""
        [![moon](moon.jpg)](/uri)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/uri"><img src="moon.jpg" alt="moon" /></a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7841-7845
    func testExample515() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo [bar](/uri)](/uri)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[foo <a href="/uri">bar</a>](/uri)</p>
        """#####
        )
    }    
    
    // spec.txt lines 7848-7852
    func testExample516() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo *[bar [baz](/uri)](/uri)*](/uri)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[foo <em>[bar <a href="/uri">baz</a>](/uri)</em>](/uri)</p>
        """#####
        )
    }    
    
    // spec.txt lines 7855-7859
    func testExample517() {
        let html = MarkdownParser().html(from:
        #####"""
        ![[[foo](uri1)](uri2)](uri3)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><img src="uri3" alt="[foo](uri2)" /></p>
        """#####
        )
    }    
    
    // spec.txt lines 7865-7869
    func testExample518() {
        let html = MarkdownParser().html(from:
        #####"""
        *[foo*](/uri)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>*<a href="/uri">foo*</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7872-7876
    func testExample519() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo *bar](baz*)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="baz*">foo *bar</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7882-7886
    func testExample520() {
        let html = MarkdownParser().html(from:
        #####"""
        *foo [bar* baz]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>foo [bar</em> baz]</p>
        """#####
        )
    }    
    
    // spec.txt lines 7892-7896
    func testExample521() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo <bar attr="](baz)">
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[foo <bar attr="](baz)"></p>
        """#####
        )
    }    
    
    // spec.txt lines 7899-7903
    func testExample522() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo`](/uri)`
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[foo<code>](/uri)</code></p>
        """#####
        )
    }    
    
    // spec.txt lines 7906-7910
    func testExample523() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo<http://example.com/?search=](uri)>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[foo<a href="http://example.com/?search=%5D(uri)">http://example.com/?search=](uri)</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7943-7949
    func testExample524() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo][bar]
        
        [bar]: /url "title"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url" title="title">foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7958-7964
    func testExample525() {
        let html = MarkdownParser().html(from:
        #####"""
        [link [foo [bar]]][ref]
        
        [ref]: /uri
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/uri">link [foo [bar]]</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7967-7973
    func testExample526() {
        let html = MarkdownParser().html(from:
        #####"""
        [link \[bar][ref]
        
        [ref]: /uri
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/uri">link [bar</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7978-7984
    func testExample527() {
        let html = MarkdownParser().html(from:
        #####"""
        [link *foo **bar** `#`*][ref]
        
        [ref]: /uri
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/uri">link <em>foo <strong>bar</strong> <code>#</code></em></a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7987-7993
    func testExample528() {
        let html = MarkdownParser().html(from:
        #####"""
        [![moon](moon.jpg)][ref]
        
        [ref]: /uri
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/uri"><img src="moon.jpg" alt="moon" /></a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7998-8004
    func testExample529() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo [bar](/uri)][ref]
        
        [ref]: /uri
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[foo <a href="/uri">bar</a>]<a href="/uri">ref</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8007-8013
    func testExample530() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo *bar [baz][ref]*][ref]
        
        [ref]: /uri
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[foo <em>bar <a href="/uri">baz</a></em>]<a href="/uri">ref</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8022-8028
    func testExample531() {
        let html = MarkdownParser().html(from:
        #####"""
        *[foo*][ref]
        
        [ref]: /uri
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>*<a href="/uri">foo*</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8031-8037
    func testExample532() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo *bar][ref]*
        
        [ref]: /uri
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/uri">foo *bar</a>*</p>
        """#####
        )
    }    
    
    // spec.txt lines 8043-8049
    func testExample533() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo <bar attr="][ref]">
        
        [ref]: /uri
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[foo <bar attr="][ref]"></p>
        """#####
        )
    }    
    
    // spec.txt lines 8052-8058
    func testExample534() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo`][ref]`
        
        [ref]: /uri
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[foo<code>][ref]</code></p>
        """#####
        )
    }    
    
    // spec.txt lines 8061-8067
    func testExample535() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo<http://example.com/?search=][ref]>
        
        [ref]: /uri
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[foo<a href="http://example.com/?search=%5D%5Bref%5D">http://example.com/?search=][ref]</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8072-8078
    func testExample536() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo][BaR]
        
        [bar]: /url "title"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url" title="title">foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8083-8089
    func testExample537() {
        let html = MarkdownParser().html(from:
        #####"""
        [ẞ]
        
        [SS]: /url
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url">ẞ</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8095-8102
    func testExample538() {
        let html = MarkdownParser().html(from:
        #####"""
        [Foo
          bar]: /url
        
        [Baz][Foo bar]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url">Baz</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8108-8114
    func testExample539() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo] [bar]
        
        [bar]: /url "title"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[foo] <a href="/url" title="title">bar</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8117-8125
    func testExample540() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]
        [bar]
        
        [bar]: /url "title"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[foo]
        <a href="/url" title="title">bar</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8158-8166
    func testExample541() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]: /url1
        
        [foo]: /url2
        
        [bar][foo]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url1">bar</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8173-8179
    func testExample542() {
        let html = MarkdownParser().html(from:
        #####"""
        [bar][foo\!]
        
        [foo!]: /url
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[bar][foo!]</p>
        """#####
        )
    }    
    
    // spec.txt lines 8185-8192
    func testExample543() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo][ref[]
        
        [ref[]: /uri
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[foo][ref[]</p>
        <p>[ref[]: /uri</p>
        """#####
        )
    }    
    
    // spec.txt lines 8195-8202
    func testExample544() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo][ref[bar]]
        
        [ref[bar]]: /uri
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[foo][ref[bar]]</p>
        <p>[ref[bar]]: /uri</p>
        """#####
        )
    }    
    
    // spec.txt lines 8205-8212
    func testExample545() {
        let html = MarkdownParser().html(from:
        #####"""
        [[[foo]]]
        
        [[[foo]]]: /url
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[[[foo]]]</p>
        <p>[[[foo]]]: /url</p>
        """#####
        )
    }    
    
    // spec.txt lines 8215-8221
    func testExample546() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo][ref\[]
        
        [ref\[]: /uri
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/uri">foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8226-8232
    func testExample547() {
        let html = MarkdownParser().html(from:
        #####"""
        [bar\\]: /uri
        
        [bar\\]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/uri">bar\</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8237-8244
    func testExample548() {
        let html = MarkdownParser().html(from:
        #####"""
        []
        
        []: /uri
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[]</p>
        <p>[]: /uri</p>
        """#####
        )
    }    
    
    // spec.txt lines 8247-8258
    func testExample549() {
        let html = MarkdownParser().html(from:
        #####"""
        [
         ]
        
        [
         ]: /uri
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[
        ]</p>
        <p>[
        ]: /uri</p>
        """#####
        )
    }    
    
    // spec.txt lines 8270-8276
    func testExample550() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo][]
        
        [foo]: /url "title"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url" title="title">foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8279-8285
    func testExample551() {
        let html = MarkdownParser().html(from:
        #####"""
        [*foo* bar][]
        
        [*foo* bar]: /url "title"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url" title="title"><em>foo</em> bar</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8290-8296
    func testExample552() {
        let html = MarkdownParser().html(from:
        #####"""
        [Foo][]
        
        [foo]: /url "title"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url" title="title">Foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8303-8311
    func testExample553() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo] 
        []
        
        [foo]: /url "title"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url" title="title">foo</a>
        []</p>
        """#####
        )
    }    
    
    // spec.txt lines 8323-8329
    func testExample554() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]
        
        [foo]: /url "title"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url" title="title">foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8332-8338
    func testExample555() {
        let html = MarkdownParser().html(from:
        #####"""
        [*foo* bar]
        
        [*foo* bar]: /url "title"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url" title="title"><em>foo</em> bar</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8341-8347
    func testExample556() {
        let html = MarkdownParser().html(from:
        #####"""
        [[*foo* bar]]
        
        [*foo* bar]: /url "title"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[<a href="/url" title="title"><em>foo</em> bar</a>]</p>
        """#####
        )
    }    
    
    // spec.txt lines 8350-8356
    func testExample557() {
        let html = MarkdownParser().html(from:
        #####"""
        [[bar [foo]
        
        [foo]: /url
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[[bar <a href="/url">foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8361-8367
    func testExample558() {
        let html = MarkdownParser().html(from:
        #####"""
        [Foo]
        
        [foo]: /url "title"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url" title="title">Foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8372-8378
    func testExample559() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo] bar
        
        [foo]: /url
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url">foo</a> bar</p>
        """#####
        )
    }    
    
    // spec.txt lines 8384-8390
    func testExample560() {
        let html = MarkdownParser().html(from:
        #####"""
        \[foo]
        
        [foo]: /url "title"
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[foo]</p>
        """#####
        )
    }    
    
    // spec.txt lines 8396-8402
    func testExample561() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo*]: /url
        
        *[foo*]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>*<a href="/url">foo*</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8408-8415
    func testExample562() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo][bar]
        
        [foo]: /url1
        [bar]: /url2
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url2">foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8417-8423
    func testExample563() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo][]
        
        [foo]: /url1
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url1">foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8427-8433
    func testExample564() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]()
        
        [foo]: /url1
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="">foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8435-8441
    func testExample565() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo](not a link)
        
        [foo]: /url1
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url1">foo</a>(not a link)</p>
        """#####
        )
    }    
    
    // spec.txt lines 8446-8452
    func testExample566() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo][bar][baz]
        
        [baz]: /url
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[foo]<a href="/url">bar</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8458-8465
    func testExample567() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo][bar][baz]
        
        [baz]: /url1
        [bar]: /url2
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url2">foo</a><a href="/url1">baz</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 8471-8478
    func testExample568() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo][bar][baz]
        
        [baz]: /url1
        [foo]: /url2
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[foo]<a href="/url1">bar</a></p>
        """#####
        )
    }
}

extension LinksTests {
    static var allTests: Linux.TestList<LinksTests> {
        return [
        ("testExample481", testExample481),
        ("testExample482", testExample482),
        ("testExample483", testExample483),
        ("testExample484", testExample484),
        ("testExample485", testExample485),
        ("testExample486", testExample486),
        ("testExample487", testExample487),
        ("testExample488", testExample488),
        ("testExample489", testExample489),
        ("testExample490", testExample490),
        ("testExample491", testExample491),
        ("testExample492", testExample492),
        ("testExample493", testExample493),
        ("testExample494", testExample494),
        ("testExample495", testExample495),
        ("testExample496", testExample496),
        ("testExample497", testExample497),
        ("testExample498", testExample498),
        ("testExample499", testExample499),
        ("testExample500", testExample500),
        ("testExample501", testExample501),
        ("testExample502", testExample502),
        ("testExample503", testExample503),
        ("testExample504", testExample504),
        ("testExample505", testExample505),
        ("testExample506", testExample506),
        ("testExample507", testExample507),
        ("testExample508", testExample508),
        ("testExample509", testExample509),
        ("testExample510", testExample510),
        ("testExample511", testExample511),
        ("testExample512", testExample512),
        ("testExample513", testExample513),
        ("testExample514", testExample514),
        ("testExample515", testExample515),
        ("testExample516", testExample516),
        ("testExample517", testExample517),
        ("testExample518", testExample518),
        ("testExample519", testExample519),
        ("testExample520", testExample520),
        ("testExample521", testExample521),
        ("testExample522", testExample522),
        ("testExample523", testExample523),
        ("testExample524", testExample524),
        ("testExample525", testExample525),
        ("testExample526", testExample526),
        ("testExample527", testExample527),
        ("testExample528", testExample528),
        ("testExample529", testExample529),
        ("testExample530", testExample530),
        ("testExample531", testExample531),
        ("testExample532", testExample532),
        ("testExample533", testExample533),
        ("testExample534", testExample534),
        ("testExample535", testExample535),
        ("testExample536", testExample536),
        ("testExample537", testExample537),
        ("testExample538", testExample538),
        ("testExample539", testExample539),
        ("testExample540", testExample540),
        ("testExample541", testExample541),
        ("testExample542", testExample542),
        ("testExample543", testExample543),
        ("testExample544", testExample544),
        ("testExample545", testExample545),
        ("testExample546", testExample546),
        ("testExample547", testExample547),
        ("testExample548", testExample548),
        ("testExample549", testExample549),
        ("testExample550", testExample550),
        ("testExample551", testExample551),
        ("testExample552", testExample552),
        ("testExample553", testExample553),
        ("testExample554", testExample554),
        ("testExample555", testExample555),
        ("testExample556", testExample556),
        ("testExample557", testExample557),
        ("testExample558", testExample558),
        ("testExample559", testExample559),
        ("testExample560", testExample560),
        ("testExample561", testExample561),
        ("testExample562", testExample562),
        ("testExample563", testExample563),
        ("testExample564", testExample564),
        ("testExample565", testExample565),
        ("testExample566", testExample566),
        ("testExample567", testExample567),
        ("testExample568", testExample568)
        ]
    }
}