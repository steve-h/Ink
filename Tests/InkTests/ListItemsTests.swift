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

final class ListItemsTests: XCTestCase {
    
    
    // spec.txt lines 4122-4137
    func testExample253() {
        let html = MarkdownParser().html(from:
        #####"""
        A paragraph
        with two lines.
        
            indented code
        
        > A block quote.
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>A paragraph
        with two lines.</p>
        <pre><code>indented code
        </code></pre>
        <blockquote>
        <p>A block quote.</p>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 4144-4163
    func testExample254() {
        let html = MarkdownParser().html(from:
        #####"""
        1.  A paragraph
            with two lines.
        
                indented code
        
            > A block quote.
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ol>
        <li>
        <p>A paragraph
        with two lines.</p>
        <pre><code>indented code
        </code></pre>
        <blockquote>
        <p>A block quote.</p>
        </blockquote>
        </li>
        </ol>
        """#####
        )
    }    
    
    // spec.txt lines 4177-4186
    func testExample255() {
        let html = MarkdownParser().html(from:
        #####"""
        - one
        
         two
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>one</li>
        </ul>
        <p>two</p>
        """#####
        )
    }    
    
    // spec.txt lines 4189-4200
    func testExample256() {
        let html = MarkdownParser().html(from:
        #####"""
        - one
        
          two
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>
        <p>one</p>
        <p>two</p>
        </li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 4203-4213
    func testExample257() {
        let html = MarkdownParser().html(from:
        #####"""
         -    one
        
             two
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>one</li>
        </ul>
        <pre><code> two
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 4216-4227
    func testExample258() {
        let html = MarkdownParser().html(from:
        #####"""
         -    one
        
              two
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>
        <p>one</p>
        <p>two</p>
        </li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 4238-4253
    func testExample259() {
        let html = MarkdownParser().html(from:
        #####"""
           > > 1.  one
        >>
        >>     two
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <blockquote>
        <ol>
        <li>
        <p>one</p>
        <p>two</p>
        </li>
        </ol>
        </blockquote>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 4265-4278
    func testExample260() {
        let html = MarkdownParser().html(from:
        #####"""
        >>- one
        >>
          >  > two
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <blockquote>
        <ul>
        <li>one</li>
        </ul>
        <p>two</p>
        </blockquote>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 4284-4291
    func testExample261() {
        let html = MarkdownParser().html(from:
        #####"""
        -one
        
        2.two
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>-one</p>
        <p>2.two</p>
        """#####
        )
    }    
    
    // spec.txt lines 4297-4309
    func testExample262() {
        let html = MarkdownParser().html(from:
        #####"""
        - foo
        
        
          bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>
        <p>foo</p>
        <p>bar</p>
        </li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 4314-4336
    func testExample263() {
        let html = MarkdownParser().html(from:
        #####"""
        1.  foo
        
            ```
            bar
            ```
        
            baz
        
            > bam
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ol>
        <li>
        <p>foo</p>
        <pre><code>bar
        </code></pre>
        <p>baz</p>
        <blockquote>
        <p>bam</p>
        </blockquote>
        </li>
        </ol>
        """#####
        )
    }    
    
    // spec.txt lines 4342-4360
    func testExample264() {
        let html = MarkdownParser().html(from:
        #####"""
        - Foo
        
              bar
        
        
              baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>
        <p>Foo</p>
        <pre><code>bar
        
        
        baz
        </code></pre>
        </li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 4364-4370
    func testExample265() {
        let html = MarkdownParser().html(from:
        #####"""
        123456789. ok
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ol start="123456789">
        <li>ok</li>
        </ol>
        """#####
        )
    }    
    
    // spec.txt lines 4373-4377
    func testExample266() {
        let html = MarkdownParser().html(from:
        #####"""
        1234567890. not ok
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>1234567890. not ok</p>
        """#####
        )
    }    
    
    // spec.txt lines 4382-4388
    func testExample267() {
        let html = MarkdownParser().html(from:
        #####"""
        0. ok
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ol start="0">
        <li>ok</li>
        </ol>
        """#####
        )
    }    
    
    // spec.txt lines 4391-4397
    func testExample268() {
        let html = MarkdownParser().html(from:
        #####"""
        003. ok
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ol start="3">
        <li>ok</li>
        </ol>
        """#####
        )
    }    
    
    // spec.txt lines 4402-4406
    func testExample269() {
        let html = MarkdownParser().html(from:
        #####"""
        -1. not ok
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>-1. not ok</p>
        """#####
        )
    }    
    
    // spec.txt lines 4425-4437
    func testExample270() {
        let html = MarkdownParser().html(from:
        #####"""
        - foo
        
              bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>
        <p>foo</p>
        <pre><code>bar
        </code></pre>
        </li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 4442-4454
    func testExample271() {
        let html = MarkdownParser().html(from:
        #####"""
          10.  foo
        
                   bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ol start="10">
        <li>
        <p>foo</p>
        <pre><code>bar
        </code></pre>
        </li>
        </ol>
        """#####
        )
    }    
    
    // spec.txt lines 4461-4473
    func testExample272() {
        let html = MarkdownParser().html(from:
        #####"""
            indented code
        
        paragraph
        
            more code
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>indented code
        </code></pre>
        <p>paragraph</p>
        <pre><code>more code
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 4476-4492
    func testExample273() {
        let html = MarkdownParser().html(from:
        #####"""
        1.     indented code
        
           paragraph
        
               more code
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ol>
        <li>
        <pre><code>indented code
        </code></pre>
        <p>paragraph</p>
        <pre><code>more code
        </code></pre>
        </li>
        </ol>
        """#####
        )
    }    
    
    // spec.txt lines 4498-4514
    func testExample274() {
        let html = MarkdownParser().html(from:
        #####"""
        1.      indented code
        
           paragraph
        
               more code
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ol>
        <li>
        <pre><code> indented code
        </code></pre>
        <p>paragraph</p>
        <pre><code>more code
        </code></pre>
        </li>
        </ol>
        """#####
        )
    }    
    
    // spec.txt lines 4525-4532
    func testExample275() {
        let html = MarkdownParser().html(from:
        #####"""
           foo
        
        bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo</p>
        <p>bar</p>
        """#####
        )
    }    
    
    // spec.txt lines 4535-4544
    func testExample276() {
        let html = MarkdownParser().html(from:
        #####"""
        -    foo
        
          bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>foo</li>
        </ul>
        <p>bar</p>
        """#####
        )
    }    
    
    // spec.txt lines 4552-4563
    func testExample277() {
        let html = MarkdownParser().html(from:
        #####"""
        -  foo
        
           bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>
        <p>foo</p>
        <p>bar</p>
        </li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 4580-4601
    func testExample278() {
        let html = MarkdownParser().html(from:
        #####"""
        -
          foo
        -
          ```
          bar
          ```
        -
              baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>foo</li>
        <li>
        <pre><code>bar
        </code></pre>
        </li>
        <li>
        <pre><code>baz
        </code></pre>
        </li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 4606-4613
    func testExample279() {
        let html = MarkdownParser().html(from:
        #####"""
        -   
          foo
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>foo</li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 4620-4629
    func testExample280() {
        let html = MarkdownParser().html(from:
        #####"""
        -
        
          foo
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li></li>
        </ul>
        <p>foo</p>
        """#####
        )
    }    
    
    // spec.txt lines 4634-4644
    func testExample281() {
        let html = MarkdownParser().html(from:
        #####"""
        - foo
        -
        - bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>foo</li>
        <li></li>
        <li>bar</li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 4649-4659
    func testExample282() {
        let html = MarkdownParser().html(from:
        #####"""
        - foo
        -   
        - bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>foo</li>
        <li></li>
        <li>bar</li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 4664-4674
    func testExample283() {
        let html = MarkdownParser().html(from:
        #####"""
        1. foo
        2.
        3. bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ol>
        <li>foo</li>
        <li></li>
        <li>bar</li>
        </ol>
        """#####
        )
    }    
    
    // spec.txt lines 4679-4685
    func testExample284() {
        let html = MarkdownParser().html(from:
        #####"""
        *
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li></li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 4689-4700
    func testExample285() {
        let html = MarkdownParser().html(from:
        #####"""
        foo
        *
        
        foo
        1.
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo
        *</p>
        <p>foo
        1.</p>
        """#####
        )
    }    
    
    // spec.txt lines 4711-4730
    func testExample286() {
        let html = MarkdownParser().html(from:
        #####"""
         1.  A paragraph
             with two lines.
        
                 indented code
        
             > A block quote.
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ol>
        <li>
        <p>A paragraph
        with two lines.</p>
        <pre><code>indented code
        </code></pre>
        <blockquote>
        <p>A block quote.</p>
        </blockquote>
        </li>
        </ol>
        """#####
        )
    }    
    
    // spec.txt lines 4735-4754
    func testExample287() {
        let html = MarkdownParser().html(from:
        #####"""
          1.  A paragraph
              with two lines.
        
                  indented code
        
              > A block quote.
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ol>
        <li>
        <p>A paragraph
        with two lines.</p>
        <pre><code>indented code
        </code></pre>
        <blockquote>
        <p>A block quote.</p>
        </blockquote>
        </li>
        </ol>
        """#####
        )
    }    
    
    // spec.txt lines 4759-4778
    func testExample288() {
        let html = MarkdownParser().html(from:
        #####"""
           1.  A paragraph
               with two lines.
        
                   indented code
        
               > A block quote.
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ol>
        <li>
        <p>A paragraph
        with two lines.</p>
        <pre><code>indented code
        </code></pre>
        <blockquote>
        <p>A block quote.</p>
        </blockquote>
        </li>
        </ol>
        """#####
        )
    }    
    
    // spec.txt lines 4783-4798
    func testExample289() {
        let html = MarkdownParser().html(from:
        #####"""
            1.  A paragraph
                with two lines.
        
                    indented code
        
                > A block quote.
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>1.  A paragraph
            with two lines.
        
                indented code
        
            &gt; A block quote.
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 4813-4832
    func testExample290() {
        let html = MarkdownParser().html(from:
        #####"""
          1.  A paragraph
        with two lines.
        
                  indented code
        
              > A block quote.
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ol>
        <li>
        <p>A paragraph
        with two lines.</p>
        <pre><code>indented code
        </code></pre>
        <blockquote>
        <p>A block quote.</p>
        </blockquote>
        </li>
        </ol>
        """#####
        )
    }    
    
    // spec.txt lines 4837-4845
    func testExample291() {
        let html = MarkdownParser().html(from:
        #####"""
          1.  A paragraph
            with two lines.
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ol>
        <li>A paragraph
        with two lines.</li>
        </ol>
        """#####
        )
    }    
    
    // spec.txt lines 4850-4864
    func testExample292() {
        let html = MarkdownParser().html(from:
        #####"""
        > 1. > Blockquote
        continued here.
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <ol>
        <li>
        <blockquote>
        <p>Blockquote
        continued here.</p>
        </blockquote>
        </li>
        </ol>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 4867-4881
    func testExample293() {
        let html = MarkdownParser().html(from:
        #####"""
        > 1. > Blockquote
        > continued here.
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <ol>
        <li>
        <blockquote>
        <p>Blockquote
        continued here.</p>
        </blockquote>
        </li>
        </ol>
        </blockquote>
        """#####
        )
    }    
    
    // spec.txt lines 4895-4916
    func testExample294() {
        let html = MarkdownParser().html(from:
        #####"""
        - foo
          - bar
            - baz
              - boo
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>foo
        <ul>
        <li>bar
        <ul>
        <li>baz
        <ul>
        <li>boo</li>
        </ul>
        </li>
        </ul>
        </li>
        </ul>
        </li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 4921-4933
    func testExample295() {
        let html = MarkdownParser().html(from:
        #####"""
        - foo
         - bar
          - baz
           - boo
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>foo</li>
        <li>bar</li>
        <li>baz</li>
        <li>boo</li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 4938-4949
    func testExample296() {
        let html = MarkdownParser().html(from:
        #####"""
        10) foo
            - bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ol start="10">
        <li>foo
        <ul>
        <li>bar</li>
        </ul>
        </li>
        </ol>
        """#####
        )
    }    
    
    // spec.txt lines 4954-4964
    func testExample297() {
        let html = MarkdownParser().html(from:
        #####"""
        10) foo
           - bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ol start="10">
        <li>foo</li>
        </ol>
        <ul>
        <li>bar</li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 4969-4979
    func testExample298() {
        let html = MarkdownParser().html(from:
        #####"""
        - - foo
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>
        <ul>
        <li>foo</li>
        </ul>
        </li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 4982-4996
    func testExample299() {
        let html = MarkdownParser().html(from:
        #####"""
        1. - 2. foo
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ol>
        <li>
        <ul>
        <li>
        <ol start="2">
        <li>foo</li>
        </ol>
        </li>
        </ul>
        </li>
        </ol>
        """#####
        )
    }    
    
    // spec.txt lines 5001-5015
    func testExample300() {
        let html = MarkdownParser().html(from:
        #####"""
        - # Foo
        - Bar
          ---
          baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>
        <h1>Foo</h1>
        </li>
        <li>
        <h2>Bar</h2>
        baz</li>
        </ul>
        """#####
        )
    }
}

extension ListItemsTests {
    static var allTests: Linux.TestList<ListItemsTests> {
        return [
        ("testExample253", testExample253),
        ("testExample254", testExample254),
        ("testExample255", testExample255),
        ("testExample256", testExample256),
        ("testExample257", testExample257),
        ("testExample258", testExample258),
        ("testExample259", testExample259),
        ("testExample260", testExample260),
        ("testExample261", testExample261),
        ("testExample262", testExample262),
        ("testExample263", testExample263),
        ("testExample264", testExample264),
        ("testExample265", testExample265),
        ("testExample266", testExample266),
        ("testExample267", testExample267),
        ("testExample268", testExample268),
        ("testExample269", testExample269),
        ("testExample270", testExample270),
        ("testExample271", testExample271),
        ("testExample272", testExample272),
        ("testExample273", testExample273),
        ("testExample274", testExample274),
        ("testExample275", testExample275),
        ("testExample276", testExample276),
        ("testExample277", testExample277),
        ("testExample278", testExample278),
        ("testExample279", testExample279),
        ("testExample280", testExample280),
        ("testExample281", testExample281),
        ("testExample282", testExample282),
        ("testExample283", testExample283),
        ("testExample284", testExample284),
        ("testExample285", testExample285),
        ("testExample286", testExample286),
        ("testExample287", testExample287),
        ("testExample288", testExample288),
        ("testExample289", testExample289),
        ("testExample290", testExample290),
        ("testExample291", testExample291),
        ("testExample292", testExample292),
        ("testExample293", testExample293),
        ("testExample294", testExample294),
        ("testExample295", testExample295),
        ("testExample296", testExample296),
        ("testExample297", testExample297),
        ("testExample298", testExample298),
        ("testExample299", testExample299),
        ("testExample300", testExample300)
        ]
    }
}