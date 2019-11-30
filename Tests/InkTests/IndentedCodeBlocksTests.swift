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

final class IndentedCodeBlocksTests: XCTestCase {
    
    
    // spec.txt lines 1751-1758
    func testExample107() {
        let html = MarkdownParser().html(from:
        #####"""
            a simple
              indented code block
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>a simple
          indented code block
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 1765-1776
    func testExample108() {
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
    
    // spec.txt lines 1779-1792
    func testExample109() {
        let html = MarkdownParser().html(from:
        #####"""
        1.  foo
        
            - bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ol>
        <li>
        <p>foo</p>
        <ul>
        <li>bar</li>
        </ul>
        </li>
        </ol>
        """#####
        )
    }    
    
    // spec.txt lines 1799-1810
    func testExample110() {
        let html = MarkdownParser().html(from:
        #####"""
            <a/>
            *hi*
        
            - one
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>&lt;a/&gt;
        *hi*
        
        - one
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 1815-1832
    func testExample111() {
        let html = MarkdownParser().html(from:
        #####"""
            chunk1
        
            chunk2
          
         
         
            chunk3
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>chunk1
        
        chunk2
        
        
        
        chunk3
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 1838-1847
    func testExample112() {
        let html = MarkdownParser().html(from:
        #####"""
            chunk1
              
              chunk2
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>chunk1
          
          chunk2
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 1853-1860
    func testExample113() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo
            bar
        
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>Foo
        bar</p>
        """#####
        )
    }    
    
    // spec.txt lines 1867-1874
    func testExample114() {
        let html = MarkdownParser().html(from:
        #####"""
            foo
        bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>foo
        </code></pre>
        <p>bar</p>
        """#####
        )
    }    
    
    // spec.txt lines 1880-1895
    func testExample115() {
        let html = MarkdownParser().html(from:
        #####"""
        # Heading
            foo
        Heading
        ------
            foo
        ----
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <h1>Heading</h1>
        <pre><code>foo
        </code></pre>
        <h2>Heading</h2>
        <pre><code>foo
        </code></pre>
        <hr />
        """#####
        )
    }    
    
    // spec.txt lines 1900-1907
    func testExample116() {
        let html = MarkdownParser().html(from:
        #####"""
                foo
            bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>    foo
        bar
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 1913-1922
    func testExample117() {
        let html = MarkdownParser().html(from:
        #####"""
        
            
            foo
            
        
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>foo
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 1927-1932
    func testExample118() {
        let html = MarkdownParser().html(from:
        #####"""
            foo  
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre><code>foo  
        </code></pre>
        """#####
        )
    }
}

extension IndentedCodeBlocksTests {
    static var allTests: Linux.TestList<IndentedCodeBlocksTests> {
        return [
        ("testExample107", testExample107),
        ("testExample108", testExample108),
        ("testExample109", testExample109),
        ("testExample110", testExample110),
        ("testExample111", testExample111),
        ("testExample112", testExample112),
        ("testExample113", testExample113),
        ("testExample114", testExample114),
        ("testExample115", testExample115),
        ("testExample116", testExample116),
        ("testExample117", testExample117),
        ("testExample118", testExample118)
        ]
    }
}