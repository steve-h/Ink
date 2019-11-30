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

final class HtmlBlocksTests: XCTestCase {
    
    
    // spec.txt lines 2430-2445
    func testExample148() {
        let html = MarkdownParser().html(from:
        #####"""
        <table><tr><td>
        <pre>
        **Hello**,
        
        _world_.
        </pre>
        </td></tr></table>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <table><tr><td>
        <pre>
        **Hello**,
        <p><em>world</em>.
        </pre></p>
        </td></tr></table>
        """#####
        )
    }    
    
    // spec.txt lines 2459-2478
    func testExample149() {
        let html = MarkdownParser().html(from:
        #####"""
        <table>
          <tr>
            <td>
                   hi
            </td>
          </tr>
        </table>
        
        okay.
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <table>
          <tr>
            <td>
                   hi
            </td>
          </tr>
        </table>
        <p>okay.</p>
        """#####
        )
    }    
    
    // spec.txt lines 2481-2489
    func testExample150() {
        let html = MarkdownParser().html(from:
        #####"""
         <div>
          *hello*
                 <foo><a>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
         <div>
          *hello*
                 <foo><a>
        """#####
        )
    }    
    
    // spec.txt lines 2494-2500
    func testExample151() {
        let html = MarkdownParser().html(from:
        #####"""
        </div>
        *foo*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        </div>
        *foo*
        """#####
        )
    }    
    
    // spec.txt lines 2505-2515
    func testExample152() {
        let html = MarkdownParser().html(from:
        #####"""
        <DIV CLASS="foo">
        
        *Markdown*
        
        </DIV>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <DIV CLASS="foo">
        <p><em>Markdown</em></p>
        </DIV>
        """#####
        )
    }    
    
    // spec.txt lines 2521-2529
    func testExample153() {
        let html = MarkdownParser().html(from:
        #####"""
        <div id="foo"
          class="bar">
        </div>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <div id="foo"
          class="bar">
        </div>
        """#####
        )
    }    
    
    // spec.txt lines 2532-2540
    func testExample154() {
        let html = MarkdownParser().html(from:
        #####"""
        <div id="foo" class="bar
          baz">
        </div>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <div id="foo" class="bar
          baz">
        </div>
        """#####
        )
    }    
    
    // spec.txt lines 2544-2553
    func testExample155() {
        let html = MarkdownParser().html(from:
        #####"""
        <div>
        *foo*
        
        *bar*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <div>
        *foo*
        <p><em>bar</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 2560-2566
    func testExample156() {
        let html = MarkdownParser().html(from:
        #####"""
        <div id="foo"
        *hi*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <div id="foo"
        *hi*
        """#####
        )
    }    
    
    // spec.txt lines 2569-2575
    func testExample157() {
        let html = MarkdownParser().html(from:
        #####"""
        <div class
        foo
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <div class
        foo
        """#####
        )
    }    
    
    // spec.txt lines 2581-2587
    func testExample158() {
        let html = MarkdownParser().html(from:
        #####"""
        <div *???-&&&-<---
        *foo*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <div *???-&&&-<---
        *foo*
        """#####
        )
    }    
    
    // spec.txt lines 2593-2597
    func testExample159() {
        let html = MarkdownParser().html(from:
        #####"""
        <div><a href="bar">*foo*</a></div>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <div><a href="bar">*foo*</a></div>
        """#####
        )
    }    
    
    // spec.txt lines 2600-2608
    func testExample160() {
        let html = MarkdownParser().html(from:
        #####"""
        <table><tr><td>
        foo
        </td></tr></table>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <table><tr><td>
        foo
        </td></tr></table>
        """#####
        )
    }    
    
    // spec.txt lines 2617-2627
    func testExample161() {
        let html = MarkdownParser().html(from:
        #####"""
        <div></div>
        ``` c
        int x = 33;
        ```
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <div></div>
        ``` c
        int x = 33;
        ```
        """#####
        )
    }    
    
    // spec.txt lines 2634-2642
    func testExample162() {
        let html = MarkdownParser().html(from:
        #####"""
        <a href="foo">
        *bar*
        </a>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <a href="foo">
        *bar*
        </a>
        """#####
        )
    }    
    
    // spec.txt lines 2647-2655
    func testExample163() {
        let html = MarkdownParser().html(from:
        #####"""
        <Warning>
        *bar*
        </Warning>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <Warning>
        *bar*
        </Warning>
        """#####
        )
    }    
    
    // spec.txt lines 2658-2666
    func testExample164() {
        let html = MarkdownParser().html(from:
        #####"""
        <i class="foo">
        *bar*
        </i>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <i class="foo">
        *bar*
        </i>
        """#####
        )
    }    
    
    // spec.txt lines 2669-2675
    func testExample165() {
        let html = MarkdownParser().html(from:
        #####"""
        </ins>
        *bar*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        </ins>
        *bar*
        """#####
        )
    }    
    
    // spec.txt lines 2684-2692
    func testExample166() {
        let html = MarkdownParser().html(from:
        #####"""
        <del>
        *foo*
        </del>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <del>
        *foo*
        </del>
        """#####
        )
    }    
    
    // spec.txt lines 2699-2709
    func testExample167() {
        let html = MarkdownParser().html(from:
        #####"""
        <del>
        
        *foo*
        
        </del>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <del>
        <p><em>foo</em></p>
        </del>
        """#####
        )
    }    
    
    // spec.txt lines 2717-2721
    func testExample168() {
        let html = MarkdownParser().html(from:
        #####"""
        <del>*foo*</del>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><del><em>foo</em></del></p>
        """#####
        )
    }    
    
    // spec.txt lines 2733-2749
    func testExample169() {
        let html = MarkdownParser().html(from:
        #####"""
        <pre language="haskell"><code>
        import Text.HTML.TagSoup
        
        main :: IO ()
        main = print $ parseTags tags
        </code></pre>
        okay
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <pre language="haskell"><code>
        import Text.HTML.TagSoup
        
        main :: IO ()
        main = print $ parseTags tags
        </code></pre>
        <p>okay</p>
        """#####
        )
    }    
    
    // spec.txt lines 2754-2768
    func testExample170() {
        let html = MarkdownParser().html(from:
        #####"""
        <script type="text/javascript">
        // JavaScript example
        
        document.getElementById("demo").innerHTML = "Hello JavaScript!";
        </script>
        okay
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <script type="text/javascript">
        // JavaScript example
        
        document.getElementById("demo").innerHTML = "Hello JavaScript!";
        </script>
        <p>okay</p>
        """#####
        )
    }    
    
    // spec.txt lines 2773-2789
    func testExample171() {
        let html = MarkdownParser().html(from:
        #####"""
        <style
          type="text/css">
        h1 {color:red;}
        
        p {color:blue;}
        </style>
        okay
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <style
          type="text/css">
        h1 {color:red;}
        
        p {color:blue;}
        </style>
        <p>okay</p>
        """#####
        )
    }    
    
    // spec.txt lines 2796-2806
    func testExample172() {
        let html = MarkdownParser().html(from:
        #####"""
        <style
          type="text/css">
        
        foo
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <style
          type="text/css">
        
        foo
        """#####
        )
    }    
    
    // spec.txt lines 2809-2820
    func testExample173() {
        let html = MarkdownParser().html(from:
        #####"""
        > <div>
        > foo
        
        bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <blockquote>
        <div>
        foo
        </blockquote>
        <p>bar</p>
        """#####
        )
    }    
    
    // spec.txt lines 2823-2833
    func testExample174() {
        let html = MarkdownParser().html(from:
        #####"""
        - <div>
        - foo
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <ul>
        <li>
        <div>
        </li>
        <li>foo</li>
        </ul>
        """#####
        )
    }    
    
    // spec.txt lines 2838-2844
    func testExample175() {
        let html = MarkdownParser().html(from:
        #####"""
        <style>p{color:red;}</style>
        *foo*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <style>p{color:red;}</style>
        <p><em>foo</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 2847-2853
    func testExample176() {
        let html = MarkdownParser().html(from:
        #####"""
        <!-- foo -->*bar*
        *baz*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <!-- foo -->*bar*
        <p><em>baz</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 2859-2867
    func testExample177() {
        let html = MarkdownParser().html(from:
        #####"""
        <script>
        foo
        </script>1. *bar*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <script>
        foo
        </script>1. *bar*
        """#####
        )
    }    
    
    // spec.txt lines 2872-2884
    func testExample178() {
        let html = MarkdownParser().html(from:
        #####"""
        <!-- Foo
        
        bar
           baz -->
        okay
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <!-- Foo
        
        bar
           baz -->
        <p>okay</p>
        """#####
        )
    }    
    
    // spec.txt lines 2890-2904
    func testExample179() {
        let html = MarkdownParser().html(from:
        #####"""
        <?php
        
          echo '>';
        
        ?>
        okay
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <?php
        
          echo '>';
        
        ?>
        <p>okay</p>
        """#####
        )
    }    
    
    // spec.txt lines 2909-2913
    func testExample180() {
        let html = MarkdownParser().html(from:
        #####"""
        <!DOCTYPE html>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <!DOCTYPE html>
        """#####
        )
    }    
    
    // spec.txt lines 2918-2946
    func testExample181() {
        let html = MarkdownParser().html(from:
        #####"""
        <![CDATA[
        function matchwo(a,b)
        {
          if (a < b && a < 0) then {
            return 1;
        
          } else {
        
            return 0;
          }
        }
        ]]>
        okay
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <![CDATA[
        function matchwo(a,b)
        {
          if (a < b && a < 0) then {
            return 1;
        
          } else {
        
            return 0;
          }
        }
        ]]>
        <p>okay</p>
        """#####
        )
    }    
    
    // spec.txt lines 2951-2959
    func testExample182() {
        let html = MarkdownParser().html(from:
        #####"""
          <!-- foo -->
        
            <!-- foo -->
        """#####
        )
        XCTAssertEqual(html,
        #####"""
          <!-- foo -->
        <pre><code>&lt;!-- foo --&gt;
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 2962-2970
    func testExample183() {
        let html = MarkdownParser().html(from:
        #####"""
          <div>
        
            <div>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
          <div>
        <pre><code>&lt;div&gt;
        </code></pre>
        """#####
        )
    }    
    
    // spec.txt lines 2976-2986
    func testExample184() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo
        <div>
        bar
        </div>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>Foo</p>
        <div>
        bar
        </div>
        """#####
        )
    }    
    
    // spec.txt lines 2993-3003
    func testExample185() {
        let html = MarkdownParser().html(from:
        #####"""
        <div>
        bar
        </div>
        *foo*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <div>
        bar
        </div>
        *foo*
        """#####
        )
    }    
    
    // spec.txt lines 3008-3016
    func testExample186() {
        let html = MarkdownParser().html(from:
        #####"""
        Foo
        <a href="bar">
        baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>Foo
        <a href="bar">
        baz</p>
        """#####
        )
    }    
    
    // spec.txt lines 3049-3059
    func testExample187() {
        let html = MarkdownParser().html(from:
        #####"""
        <div>
        
        *Emphasized* text.
        
        </div>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <div>
        <p><em>Emphasized</em> text.</p>
        </div>
        """#####
        )
    }    
    
    // spec.txt lines 3062-3070
    func testExample188() {
        let html = MarkdownParser().html(from:
        #####"""
        <div>
        *Emphasized* text.
        </div>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <div>
        *Emphasized* text.
        </div>
        """#####
        )
    }    
    
    // spec.txt lines 3084-3104
    func testExample189() {
        let html = MarkdownParser().html(from:
        #####"""
        <table>
        
        <tr>
        
        <td>
        Hi
        </td>
        
        </tr>
        
        </table>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <table>
        <tr>
        <td>
        Hi
        </td>
        </tr>
        </table>
        """#####
        )
    }    
    
    // spec.txt lines 3111-3132
    func testExample190() {
        let html = MarkdownParser().html(from:
        #####"""
        <table>
        
          <tr>
        
            <td>
              Hi
            </td>
        
          </tr>
        
        </table>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <table>
          <tr>
        <pre><code>&lt;td&gt;
          Hi
        &lt;/td&gt;
        </code></pre>
          </tr>
        </table>
        """#####
        )
    }
}

extension HtmlBlocksTests {
    static var allTests: Linux.TestList<HtmlBlocksTests> {
        return [
        ("testExample148", testExample148),
        ("testExample149", testExample149),
        ("testExample150", testExample150),
        ("testExample151", testExample151),
        ("testExample152", testExample152),
        ("testExample153", testExample153),
        ("testExample154", testExample154),
        ("testExample155", testExample155),
        ("testExample156", testExample156),
        ("testExample157", testExample157),
        ("testExample158", testExample158),
        ("testExample159", testExample159),
        ("testExample160", testExample160),
        ("testExample161", testExample161),
        ("testExample162", testExample162),
        ("testExample163", testExample163),
        ("testExample164", testExample164),
        ("testExample165", testExample165),
        ("testExample166", testExample166),
        ("testExample167", testExample167),
        ("testExample168", testExample168),
        ("testExample169", testExample169),
        ("testExample170", testExample170),
        ("testExample171", testExample171),
        ("testExample172", testExample172),
        ("testExample173", testExample173),
        ("testExample174", testExample174),
        ("testExample175", testExample175),
        ("testExample176", testExample176),
        ("testExample177", testExample177),
        ("testExample178", testExample178),
        ("testExample179", testExample179),
        ("testExample180", testExample180),
        ("testExample181", testExample181),
        ("testExample182", testExample182),
        ("testExample183", testExample183),
        ("testExample184", testExample184),
        ("testExample185", testExample185),
        ("testExample186", testExample186),
        ("testExample187", testExample187),
        ("testExample188", testExample188),
        ("testExample189", testExample189),
        ("testExample190", testExample190)
        ]
    }
}