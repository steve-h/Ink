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

final class FencedCodeBlocksTests: XCTestCase {
    
    
    // spec.txt lines 1982-1991
    func testExample119() {
        let html = MarkdownParser().html(from:
        #####"""
        ```
        <
         >
        ```
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>&lt;
         &gt;
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 1996-2005
    func testExample120() {
        let html = MarkdownParser().html(from:
        #####"""
        ~~~
        <
         >
        ~~~
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>&lt;
         &gt;
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 2009-2015
    func testExample121() {
        let html = MarkdownParser().html(from:
        #####"""
        ``
        foo
        ``
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><code>foo</code></p>
        """#####
        )
    }    
    
    // spec.txt lines 2020-2029
    func testExample122() {
        let html = MarkdownParser().html(from:
        #####"""
        ```
        aaa
        ~~~
        ```
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>aaa
        ~~~
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 2032-2041
    func testExample123() {
        let html = MarkdownParser().html(from:
        #####"""
        ~~~
        aaa
        ```
        ~~~
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>aaa
        ```
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 2046-2055
    func testExample124() {
        let html = MarkdownParser().html(from:
        #####"""
        ````
        aaa
        ```
        ``````
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>aaa
        ```
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 2058-2067
    func testExample125() {
        let html = MarkdownParser().html(from:
        #####"""
        ~~~~
        aaa
        ~~~
        ~~~~
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>aaa
        ~~~
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 2073-2077
    func testExample126() {
        let html = MarkdownParser().html(from:
        #####"""
        ```
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code></code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 2080-2090
    func testExample127() {
        let html = MarkdownParser().html(from:
        #####"""
        `````
        
        ```
        aaa
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>
        ```
        aaa
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 2093-2104
    func testExample128() {
        let html = MarkdownParser().html(from:
        #####"""
        > ```
        > aaa
        
        bbb
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <pre><code>aaa
        </code></pre>
        </blockquote>
        <p>bbb</p>
        """#####
        )
    }    
    
    // spec.txt lines 2109-2118
    func testExample129() {
        let html = MarkdownParser().html(from:
        #####"""
        ```
        
          
        ```
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>
          
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 2123-2128
    func testExample130() {
        let html = MarkdownParser().html(from:
        #####"""
        ```
        ```
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code></code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 2135-2144
    func testExample131() {
        let html = MarkdownParser().html(from:
        #####"""
         ```
         aaa
        aaa
        ```
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>aaa
        aaa
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 2147-2158
    func testExample132() {
        let html = MarkdownParser().html(from:
        #####"""
          ```
        aaa
          aaa
        aaa
          ```
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>aaa
        aaa
        aaa
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 2161-2172
    func testExample133() {
        let html = MarkdownParser().html(from:
        #####"""
           ```
           aaa
            aaa
          aaa
           ```
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>aaa
         aaa
        aaa
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 2177-2186
    func testExample134() {
        let html = MarkdownParser().html(from:
        #####"""
            ```
            aaa
            ```
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>```
        aaa
        ```
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 2192-2199
    func testExample135() {
        let html = MarkdownParser().html(from:
        #####"""
        ```
        aaa
          ```
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>aaa
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 2202-2209
    func testExample136() {
        let html = MarkdownParser().html(from:
        #####"""
           ```
        aaa
          ```
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>aaa
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 2214-2222
    func testExample137() {
        let html = MarkdownParser().html(from:
        #####"""
        ```
        aaa
            ```
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>aaa
            ```
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 2228-2234
    func testExample138() {
        let html = MarkdownParser().html(from:
        #####"""
        ``` ```
        aaa
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><code> </code>
        aaa</p>
        """#####
        )
    }    
    
    // spec.txt lines 2237-2245
    func testExample139() {
        let html = MarkdownParser().html(from:
        #####"""
        ~~~~~~
        aaa
        ~~~ ~~
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>aaa
        ~~~ ~~
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 2251-2262
    func testExample140() {
        let html = MarkdownParser().html(from:
        #####"""
        foo
        ```
        bar
        ```
        baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo</p>
        <pre><code>bar
        </code></pre>
        <p>baz</p>
        """#####
        )
    }    
    
    // spec.txt lines 2268-2280
    func testExample141() {
        let html = MarkdownParser().html(from:
        #####"""
        foo
        ---
        ~~~
        bar
        ~~~
        # baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h2>foo</h2>
        <pre><code>bar
        </code></pre>
        <h1>baz</h1>
        """#####
        )
    }    
    
    // spec.txt lines 2290-2301
    func testExample142() {
        let html = MarkdownParser().html(from:
        #####"""
        ```ruby
        def foo(x)
          return 3
        end
        ```
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code class="language-ruby">def foo(x)
          return 3
        end
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 2304-2315
    func testExample143() {
        let html = MarkdownParser().html(from:
        #####"""
        ~~~~    ruby startline=3 $%@#$
        def foo(x)
          return 3
        end
        ~~~~~~~
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code class="language-ruby">def foo(x)
          return 3
        end
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 2318-2323
    func testExample144() {
        let html = MarkdownParser().html(from:
        #####"""
        ````;
        ````
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code class="language-;"></code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 2328-2334
    func testExample145() {
        let html = MarkdownParser().html(from:
        #####"""
        ``` aa ```
        foo
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><code>aa</code>
        foo</p>
        """#####
        )
    }    
    
    // spec.txt lines 2339-2346
    func testExample146() {
        let html = MarkdownParser().html(from:
        #####"""
        ~~~ aa ``` ~~~
        foo
        ~~~
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code class="language-aa">foo
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 2351-2358
    func testExample147() {
        let html = MarkdownParser().html(from:
        #####"""
        ```
        ``` aaa
        ```
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>``` aaa
        </code></pre>
        """#####
        )
    }
}

extension FencedCodeBlocksTests {
    static var allTests: Linux.TestList<FencedCodeBlocksTests> {
        return [
        ("testExample119", testExample119),
        ("testExample120", testExample120),
        ("testExample121", testExample121),
        ("testExample122", testExample122),
        ("testExample123", testExample123),
        ("testExample124", testExample124),
        ("testExample125", testExample125),
        ("testExample126", testExample126),
        ("testExample127", testExample127),
        ("testExample128", testExample128),
        ("testExample129", testExample129),
        ("testExample130", testExample130),
        ("testExample131", testExample131),
        ("testExample132", testExample132),
        ("testExample133", testExample133),
        ("testExample134", testExample134),
        ("testExample135", testExample135),
        ("testExample136", testExample136),
        ("testExample137", testExample137),
        ("testExample138", testExample138),
        ("testExample139", testExample139),
        ("testExample140", testExample140),
        ("testExample141", testExample141),
        ("testExample142", testExample142),
        ("testExample143", testExample143),
        ("testExample144", testExample144),
        ("testExample145", testExample145),
        ("testExample146", testExample146),
        ("testExample147", testExample147)
        ]
    }
}