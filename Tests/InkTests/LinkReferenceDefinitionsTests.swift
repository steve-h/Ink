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

final class LinkReferenceDefinitionsTests: XCTestCase {
    
    
    // spec.txt lines 3159-3165
    func testExample191() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]: /url "title"
        
        [foo]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url" title="title">foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 3168-3176
    func testExample192() {
        let html = MarkdownParser().html(from:
        #####"""
           [foo]: 
              /url  
                   'the title'  
        
        [foo]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url" title="the title">foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 3179-3185
    func testExample193() {
        let html = MarkdownParser().html(from:
        #####"""
        [Foo*bar\]]:my_(url) 'title (with parens)'
        
        [Foo*bar\]]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="my_(url)" title="title (with parens)">Foo*bar]</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 3188-3196
    func testExample194() {
        let html = MarkdownParser().html(from:
        #####"""
        [Foo bar]:
        <my url>
        'title'
        
        [Foo bar]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="my%20url" title="title">Foo bar</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 3201-3215
    func testExample195() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]: /url '
        title
        line1
        line2
        '
        
        [foo]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url" title="
        title
        line1
        line2
        ">foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 3220-3230
    func testExample196() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]: /url 'title
        
        with blank line'
        
        [foo]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[foo]: /url 'title</p>
        <p>with blank line'</p>
        <p>[foo]</p>
        """#####
        )
    }    
    
    // spec.txt lines 3235-3242
    func testExample197() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]:
        /url
        
        [foo]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url">foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 3247-3254
    func testExample198() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]:
        
        [foo]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[foo]:</p>
        <p>[foo]</p>
        """#####
        )
    }    
    
    // spec.txt lines 3259-3265
    func testExample199() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]: <>
        
        [foo]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="">foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 3270-3277
    func testExample200() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]: <bar>(baz)
        
        [foo]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[foo]: <bar>(baz)</p>
        <p>[foo]</p>
        """#####
        )
    }    
    
    // spec.txt lines 3283-3289
    func testExample201() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]: /url\bar\*baz "foo\"bar\baz"
        
        [foo]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url%5Cbar*baz" title="foo&quot;bar\baz">foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 3294-3300
    func testExample202() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]
        
        [foo]: url
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="url">foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 3306-3313
    func testExample203() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]
        
        [foo]: first
        [foo]: second
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="first">foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 3319-3325
    func testExample204() {
        let html = MarkdownParser().html(from:
        #####"""
        [FOO]: /url
        
        [Foo]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url">Foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 3328-3334
    func testExample205() {
        let html = MarkdownParser().html(from:
        #####"""
        [ΑΓΩ]: /φου
        
        [αγω]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/%CF%86%CE%BF%CF%85">αγω</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 3340-3343
    func testExample206() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]: /url
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        
        """#####
        )
    }    
    
    // spec.txt lines 3348-3355
    func testExample207() {
        let html = MarkdownParser().html(from:
        #####"""
        [
        foo
        ]: /url
        bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>bar</p>
        """#####
        )
    }    
    
    // spec.txt lines 3361-3365
    func testExample208() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]: /url "title" ok
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>[foo]: /url &quot;title&quot; ok</p>
        """#####
        )
    }    
    
    // spec.txt lines 3370-3375
    func testExample209() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]: /url
        "title" ok
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>&quot;title&quot; ok</p>
        """#####
        )
    }    
    
    // spec.txt lines 3381-3389
    func testExample210() {
        let html = MarkdownParser().html(from:
        #####"""
            [foo]: /url "title"
        
        [foo]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>[foo]: /url &quot;title&quot;
        </code></pre>
        <p>[foo]</p>
        """#####
        )
    }    
    
    // spec.txt lines 3395-3405
    func testExample211() {
        let html = MarkdownParser().html(from:
        #####"""
        ```
        [foo]: /url
        ```
        
        [foo]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>[foo]: /url
        </code></pre>
        <p>[foo]</p>
        """#####
        )
    }    
    
    // spec.txt lines 3410-3419
    func testExample212() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo
        [bar]: /baz
        
        [bar]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>Foo
        [bar]: /baz</p>
        <p>[bar]</p>
        """#####
        )
    }    
    
    // spec.txt lines 3425-3434
    func testExample213() {
        let html = MarkdownParser().html(from:
        #####"""
        # [Foo]
        [foo]: /url
        > bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h1><a href="/url">Foo</a></h1>
        <blockquote>
        <p>bar</p>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 3436-3444
    func testExample214() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]: /url
        bar
        ===
        [foo]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h1>bar</h1>
        <p><a href="/url">foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 3446-3453
    func testExample215() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]: /url
        ===
        [foo]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>===
        <a href="/url">foo</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 3459-3472
    func testExample216() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]: /foo-url "foo"
        [bar]: /bar-url
          "bar"
        [baz]: /baz-url
        
        [foo],
        [bar],
        [baz]
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/foo-url" title="foo">foo</a>,
        <a href="/bar-url" title="bar">bar</a>,
        <a href="/baz-url">baz</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 3480-3488
    func testExample217() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]
        
        > [foo]: /url
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><a href="/url">foo</a></p>
        <blockquote>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 3497-3500
    func testExample218() {
        let html = MarkdownParser().html(from:
        #####"""
        [foo]: /url
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        
        """#####
        )
    }
}

extension LinkReferenceDefinitionsTests {
    static var allTests: Linux.TestList<LinkReferenceDefinitionsTests> {
        return [
        ("testExample191", testExample191),
        ("testExample192", testExample192),
        ("testExample193", testExample193),
        ("testExample194", testExample194),
        ("testExample195", testExample195),
        ("testExample196", testExample196),
        ("testExample197", testExample197),
        ("testExample198", testExample198),
        ("testExample199", testExample199),
        ("testExample200", testExample200),
        ("testExample201", testExample201),
        ("testExample202", testExample202),
        ("testExample203", testExample203),
        ("testExample204", testExample204),
        ("testExample205", testExample205),
        ("testExample206", testExample206),
        ("testExample207", testExample207),
        ("testExample208", testExample208),
        ("testExample209", testExample209),
        ("testExample210", testExample210),
        ("testExample211", testExample211),
        ("testExample212", testExample212),
        ("testExample213", testExample213),
        ("testExample214", testExample214),
        ("testExample215", testExample215),
        ("testExample216", testExample216),
        ("testExample217", testExample217),
        ("testExample218", testExample218)
        ]
    }
}