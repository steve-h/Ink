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

final class EmphasisAndStrongEmphasisTests: XCTestCase {
    
    
    // spec.txt lines 6296-6300
    func testExample350() {
        let html = MarkdownParser().html(from:
        #####"""
        *foo bar*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>foo bar</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 6306-6310
    func testExample351() {
        let html = MarkdownParser().html(from:
        #####"""
        a * foo bar*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>a * foo bar*</p>
        """#####
        )
    }    
    
    // spec.txt lines 6317-6321
    func testExample352() {
        let html = MarkdownParser().html(from:
        #####"""
        a*"foo"*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>a*&quot;foo&quot;*</p>
        """#####
        )
    }    
    
    // spec.txt lines 6326-6330
    func testExample353() {
        let html = MarkdownParser().html(from:
        #####"""
        * a *
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>* a *</p>
        """#####
        )
    }    
    
    // spec.txt lines 6335-6339
    func testExample354() {
        let html = MarkdownParser().html(from:
        #####"""
        foo*bar*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo<em>bar</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 6342-6346
    func testExample355() {
        let html = MarkdownParser().html(from:
        #####"""
        5*6*78
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>5<em>6</em>78</p>
        """#####
        )
    }    
    
    // spec.txt lines 6351-6355
    func testExample356() {
        let html = MarkdownParser().html(from:
        #####"""
        _foo bar_
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>foo bar</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 6361-6365
    func testExample357() {
        let html = MarkdownParser().html(from:
        #####"""
        _ foo bar_
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>_ foo bar_</p>
        """#####
        )
    }    
    
    // spec.txt lines 6371-6375
    func testExample358() {
        let html = MarkdownParser().html(from:
        #####"""
        a_"foo"_
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>a_&quot;foo&quot;_</p>
        """#####
        )
    }    
    
    // spec.txt lines 6380-6384
    func testExample359() {
        let html = MarkdownParser().html(from:
        #####"""
        foo_bar_
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo_bar_</p>
        """#####
        )
    }    
    
    // spec.txt lines 6387-6391
    func testExample360() {
        let html = MarkdownParser().html(from:
        #####"""
        5_6_78
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>5_6_78</p>
        """#####
        )
    }    
    
    // spec.txt lines 6394-6398
    func testExample361() {
        let html = MarkdownParser().html(from:
        #####"""
        пристаням_стремятся_
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>пристаням_стремятся_</p>
        """#####
        )
    }    
    
    // spec.txt lines 6404-6408
    func testExample362() {
        let html = MarkdownParser().html(from:
        #####"""
        aa_"bb"_cc
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>aa_&quot;bb&quot;_cc</p>
        """#####
        )
    }    
    
    // spec.txt lines 6415-6419
    func testExample363() {
        let html = MarkdownParser().html(from:
        #####"""
        foo-_(bar)_
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo-<em>(bar)</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 6427-6431
    func testExample364() {
        let html = MarkdownParser().html(from:
        #####"""
        _foo*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>_foo*</p>
        """#####
        )
    }    
    
    // spec.txt lines 6437-6441
    func testExample365() {
        let html = MarkdownParser().html(from:
        #####"""
        *foo bar *
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>*foo bar *</p>
        """#####
        )
    }    
    
    // spec.txt lines 6446-6452
    func testExample366() {
        let html = MarkdownParser().html(from:
        #####"""
        *foo bar
        *
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>*foo bar
        *</p>
        """#####
        )
    }    
    
    // spec.txt lines 6459-6463
    func testExample367() {
        let html = MarkdownParser().html(from:
        #####"""
        *(*foo)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>*(*foo)</p>
        """#####
        )
    }    
    
    // spec.txt lines 6469-6473
    func testExample368() {
        let html = MarkdownParser().html(from:
        #####"""
        *(*foo*)*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>(<em>foo</em>)</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 6478-6482
    func testExample369() {
        let html = MarkdownParser().html(from:
        #####"""
        *foo*bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>foo</em>bar</p>
        """#####
        )
    }    
    
    // spec.txt lines 6491-6495
    func testExample370() {
        let html = MarkdownParser().html(from:
        #####"""
        _foo bar _
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>_foo bar _</p>
        """#####
        )
    }    
    
    // spec.txt lines 6501-6505
    func testExample371() {
        let html = MarkdownParser().html(from:
        #####"""
        _(_foo)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>_(_foo)</p>
        """#####
        )
    }    
    
    // spec.txt lines 6510-6514
    func testExample372() {
        let html = MarkdownParser().html(from:
        #####"""
        _(_foo_)_
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>(<em>foo</em>)</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 6519-6523
    func testExample373() {
        let html = MarkdownParser().html(from:
        #####"""
        _foo_bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>_foo_bar</p>
        """#####
        )
    }    
    
    // spec.txt lines 6526-6530
    func testExample374() {
        let html = MarkdownParser().html(from:
        #####"""
        _пристаням_стремятся
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>_пристаням_стремятся</p>
        """#####
        )
    }    
    
    // spec.txt lines 6533-6537
    func testExample375() {
        let html = MarkdownParser().html(from:
        #####"""
        _foo_bar_baz_
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>foo_bar_baz</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 6544-6548
    func testExample376() {
        let html = MarkdownParser().html(from:
        #####"""
        _(bar)_.
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>(bar)</em>.</p>
        """#####
        )
    }    
    
    // spec.txt lines 6553-6557
    func testExample377() {
        let html = MarkdownParser().html(from:
        #####"""
        **foo bar**
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong>foo bar</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 6563-6567
    func testExample378() {
        let html = MarkdownParser().html(from:
        #####"""
        ** foo bar**
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>** foo bar**</p>
        """#####
        )
    }    
    
    // spec.txt lines 6574-6578
    func testExample379() {
        let html = MarkdownParser().html(from:
        #####"""
        a**"foo"**
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>a**&quot;foo&quot;**</p>
        """#####
        )
    }    
    
    // spec.txt lines 6583-6587
    func testExample380() {
        let html = MarkdownParser().html(from:
        #####"""
        foo**bar**
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo<strong>bar</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 6592-6596
    func testExample381() {
        let html = MarkdownParser().html(from:
        #####"""
        __foo bar__
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong>foo bar</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 6602-6606
    func testExample382() {
        let html = MarkdownParser().html(from:
        #####"""
        __ foo bar__
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>__ foo bar__</p>
        """#####
        )
    }    
    
    // spec.txt lines 6610-6616
    func testExample383() {
        let html = MarkdownParser().html(from:
        #####"""
        __
        foo bar__
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>__
        foo bar__</p>
        """#####
        )
    }    
    
    // spec.txt lines 6622-6626
    func testExample384() {
        let html = MarkdownParser().html(from:
        #####"""
        a__"foo"__
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>a__&quot;foo&quot;__</p>
        """#####
        )
    }    
    
    // spec.txt lines 6631-6635
    func testExample385() {
        let html = MarkdownParser().html(from:
        #####"""
        foo__bar__
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo__bar__</p>
        """#####
        )
    }    
    
    // spec.txt lines 6638-6642
    func testExample386() {
        let html = MarkdownParser().html(from:
        #####"""
        5__6__78
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>5__6__78</p>
        """#####
        )
    }    
    
    // spec.txt lines 6645-6649
    func testExample387() {
        let html = MarkdownParser().html(from:
        #####"""
        пристаням__стремятся__
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>пристаням__стремятся__</p>
        """#####
        )
    }    
    
    // spec.txt lines 6652-6656
    func testExample388() {
        let html = MarkdownParser().html(from:
        #####"""
        __foo, __bar__, baz__
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong>foo, <strong>bar</strong>, baz</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 6663-6667
    func testExample389() {
        let html = MarkdownParser().html(from:
        #####"""
        foo-__(bar)__
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo-<strong>(bar)</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 6676-6680
    func testExample390() {
        let html = MarkdownParser().html(from:
        #####"""
        **foo bar **
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>**foo bar **</p>
        """#####
        )
    }    
    
    // spec.txt lines 6689-6693
    func testExample391() {
        let html = MarkdownParser().html(from:
        #####"""
        **(**foo)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>**(**foo)</p>
        """#####
        )
    }    
    
    // spec.txt lines 6699-6703
    func testExample392() {
        let html = MarkdownParser().html(from:
        #####"""
        *(**foo**)*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>(<strong>foo</strong>)</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 6706-6712
    func testExample393() {
        let html = MarkdownParser().html(from:
        #####"""
        **Gomphocarpus (*Gomphocarpus physocarpus*, syn.
        *Asclepias physocarpa*)**
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong>Gomphocarpus (<em>Gomphocarpus physocarpus</em>, syn.
        <em>Asclepias physocarpa</em>)</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 6715-6719
    func testExample394() {
        let html = MarkdownParser().html(from:
        #####"""
        **foo "*bar*" foo**
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong>foo &quot;<em>bar</em>&quot; foo</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 6724-6728
    func testExample395() {
        let html = MarkdownParser().html(from:
        #####"""
        **foo**bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong>foo</strong>bar</p>
        """#####
        )
    }    
    
    // spec.txt lines 6736-6740
    func testExample396() {
        let html = MarkdownParser().html(from:
        #####"""
        __foo bar __
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>__foo bar __</p>
        """#####
        )
    }    
    
    // spec.txt lines 6746-6750
    func testExample397() {
        let html = MarkdownParser().html(from:
        #####"""
        __(__foo)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>__(__foo)</p>
        """#####
        )
    }    
    
    // spec.txt lines 6756-6760
    func testExample398() {
        let html = MarkdownParser().html(from:
        #####"""
        _(__foo__)_
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>(<strong>foo</strong>)</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 6765-6769
    func testExample399() {
        let html = MarkdownParser().html(from:
        #####"""
        __foo__bar
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>__foo__bar</p>
        """#####
        )
    }    
    
    // spec.txt lines 6772-6776
    func testExample400() {
        let html = MarkdownParser().html(from:
        #####"""
        __пристаням__стремятся
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>__пристаням__стремятся</p>
        """#####
        )
    }    
    
    // spec.txt lines 6779-6783
    func testExample401() {
        let html = MarkdownParser().html(from:
        #####"""
        __foo__bar__baz__
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong>foo__bar__baz</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 6790-6794
    func testExample402() {
        let html = MarkdownParser().html(from:
        #####"""
        __(bar)__.
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong>(bar)</strong>.</p>
        """#####
        )
    }    
    
    // spec.txt lines 6802-6806
    func testExample403() {
        let html = MarkdownParser().html(from:
        #####"""
        *foo [bar](/url)*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>foo <a href="/url">bar</a></em></p>
        """#####
        )
    }    
    
    // spec.txt lines 6809-6815
    func testExample404() {
        let html = MarkdownParser().html(from:
        #####"""
        *foo
        bar*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>foo
        bar</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 6821-6825
    func testExample405() {
        let html = MarkdownParser().html(from:
        #####"""
        _foo __bar__ baz_
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>foo <strong>bar</strong> baz</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 6828-6832
    func testExample406() {
        let html = MarkdownParser().html(from:
        #####"""
        _foo _bar_ baz_
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>foo <em>bar</em> baz</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 6835-6839
    func testExample407() {
        let html = MarkdownParser().html(from:
        #####"""
        __foo_ bar_
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em><em>foo</em> bar</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 6842-6846
    func testExample408() {
        let html = MarkdownParser().html(from:
        #####"""
        *foo *bar**
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>foo <em>bar</em></em></p>
        """#####
        )
    }    
    
    // spec.txt lines 6849-6853
    func testExample409() {
        let html = MarkdownParser().html(from:
        #####"""
        *foo **bar** baz*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>foo <strong>bar</strong> baz</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 6855-6859
    func testExample410() {
        let html = MarkdownParser().html(from:
        #####"""
        *foo**bar**baz*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>foo<strong>bar</strong>baz</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 6879-6883
    func testExample411() {
        let html = MarkdownParser().html(from:
        #####"""
        *foo**bar*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>foo**bar</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 6892-6896
    func testExample412() {
        let html = MarkdownParser().html(from:
        #####"""
        ***foo** bar*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em><strong>foo</strong> bar</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 6899-6903
    func testExample413() {
        let html = MarkdownParser().html(from:
        #####"""
        *foo **bar***
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>foo <strong>bar</strong></em></p>
        """#####
        )
    }    
    
    // spec.txt lines 6906-6910
    func testExample414() {
        let html = MarkdownParser().html(from:
        #####"""
        *foo**bar***
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>foo<strong>bar</strong></em></p>
        """#####
        )
    }    
    
    // spec.txt lines 6917-6921
    func testExample415() {
        let html = MarkdownParser().html(from:
        #####"""
        foo***bar***baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo<em><strong>bar</strong></em>baz</p>
        """#####
        )
    }    
    
    // spec.txt lines 6923-6927
    func testExample416() {
        let html = MarkdownParser().html(from:
        #####"""
        foo******bar*********baz
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo<strong><strong><strong>bar</strong></strong></strong>***baz</p>
        """#####
        )
    }    
    
    // spec.txt lines 6932-6936
    func testExample417() {
        let html = MarkdownParser().html(from:
        #####"""
        *foo **bar *baz* bim** bop*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>foo <strong>bar <em>baz</em> bim</strong> bop</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 6939-6943
    func testExample418() {
        let html = MarkdownParser().html(from:
        #####"""
        *foo [*bar*](/url)*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>foo <a href="/url"><em>bar</em></a></em></p>
        """#####
        )
    }    
    
    // spec.txt lines 6948-6952
    func testExample419() {
        let html = MarkdownParser().html(from:
        #####"""
        ** is not an empty emphasis
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>** is not an empty emphasis</p>
        """#####
        )
    }    
    
    // spec.txt lines 6955-6959
    func testExample420() {
        let html = MarkdownParser().html(from:
        #####"""
        **** is not an empty strong emphasis
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>**** is not an empty strong emphasis</p>
        """#####
        )
    }    
    
    // spec.txt lines 6968-6972
    func testExample421() {
        let html = MarkdownParser().html(from:
        #####"""
        **foo [bar](/url)**
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong>foo <a href="/url">bar</a></strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 6975-6981
    func testExample422() {
        let html = MarkdownParser().html(from:
        #####"""
        **foo
        bar**
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong>foo
        bar</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 6987-6991
    func testExample423() {
        let html = MarkdownParser().html(from:
        #####"""
        __foo _bar_ baz__
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong>foo <em>bar</em> baz</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 6994-6998
    func testExample424() {
        let html = MarkdownParser().html(from:
        #####"""
        __foo __bar__ baz__
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong>foo <strong>bar</strong> baz</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 7001-7005
    func testExample425() {
        let html = MarkdownParser().html(from:
        #####"""
        ____foo__ bar__
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong><strong>foo</strong> bar</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 7008-7012
    func testExample426() {
        let html = MarkdownParser().html(from:
        #####"""
        **foo **bar****
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong>foo <strong>bar</strong></strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 7015-7019
    func testExample427() {
        let html = MarkdownParser().html(from:
        #####"""
        **foo *bar* baz**
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong>foo <em>bar</em> baz</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 7022-7026
    func testExample428() {
        let html = MarkdownParser().html(from:
        #####"""
        **foo*bar*baz**
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong>foo<em>bar</em>baz</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 7029-7033
    func testExample429() {
        let html = MarkdownParser().html(from:
        #####"""
        ***foo* bar**
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong><em>foo</em> bar</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 7036-7040
    func testExample430() {
        let html = MarkdownParser().html(from:
        #####"""
        **foo *bar***
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong>foo <em>bar</em></strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 7045-7051
    func testExample431() {
        let html = MarkdownParser().html(from:
        #####"""
        **foo *bar **baz**
        bim* bop**
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong>foo <em>bar <strong>baz</strong>
        bim</em> bop</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 7054-7058
    func testExample432() {
        let html = MarkdownParser().html(from:
        #####"""
        **foo [*bar*](/url)**
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong>foo <a href="/url"><em>bar</em></a></strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 7063-7067
    func testExample433() {
        let html = MarkdownParser().html(from:
        #####"""
        __ is not an empty emphasis
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>__ is not an empty emphasis</p>
        """#####
        )
    }    
    
    // spec.txt lines 7070-7074
    func testExample434() {
        let html = MarkdownParser().html(from:
        #####"""
        ____ is not an empty strong emphasis
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>____ is not an empty strong emphasis</p>
        """#####
        )
    }    
    
    // spec.txt lines 7080-7084
    func testExample435() {
        let html = MarkdownParser().html(from:
        #####"""
        foo ***
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo ***</p>
        """#####
        )
    }    
    
    // spec.txt lines 7087-7091
    func testExample436() {
        let html = MarkdownParser().html(from:
        #####"""
        foo *\**
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo <em>*</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 7094-7098
    func testExample437() {
        let html = MarkdownParser().html(from:
        #####"""
        foo *_*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo <em>_</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 7101-7105
    func testExample438() {
        let html = MarkdownParser().html(from:
        #####"""
        foo *****
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo *****</p>
        """#####
        )
    }    
    
    // spec.txt lines 7108-7112
    func testExample439() {
        let html = MarkdownParser().html(from:
        #####"""
        foo **\***
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo <strong>*</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 7115-7119
    func testExample440() {
        let html = MarkdownParser().html(from:
        #####"""
        foo **_**
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo <strong>_</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 7126-7130
    func testExample441() {
        let html = MarkdownParser().html(from:
        #####"""
        **foo*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>*<em>foo</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 7133-7137
    func testExample442() {
        let html = MarkdownParser().html(from:
        #####"""
        *foo**
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>foo</em>*</p>
        """#####
        )
    }    
    
    // spec.txt lines 7140-7144
    func testExample443() {
        let html = MarkdownParser().html(from:
        #####"""
        ***foo**
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>*<strong>foo</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 7147-7151
    func testExample444() {
        let html = MarkdownParser().html(from:
        #####"""
        ****foo*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>***<em>foo</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 7154-7158
    func testExample445() {
        let html = MarkdownParser().html(from:
        #####"""
        **foo***
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong>foo</strong>*</p>
        """#####
        )
    }    
    
    // spec.txt lines 7161-7165
    func testExample446() {
        let html = MarkdownParser().html(from:
        #####"""
        *foo****
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>foo</em>***</p>
        """#####
        )
    }    
    
    // spec.txt lines 7171-7175
    func testExample447() {
        let html = MarkdownParser().html(from:
        #####"""
        foo ___
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo ___</p>
        """#####
        )
    }    
    
    // spec.txt lines 7178-7182
    func testExample448() {
        let html = MarkdownParser().html(from:
        #####"""
        foo _\__
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo <em>_</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 7185-7189
    func testExample449() {
        let html = MarkdownParser().html(from:
        #####"""
        foo _*_
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo <em>*</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 7192-7196
    func testExample450() {
        let html = MarkdownParser().html(from:
        #####"""
        foo _____
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo _____</p>
        """#####
        )
    }    
    
    // spec.txt lines 7199-7203
    func testExample451() {
        let html = MarkdownParser().html(from:
        #####"""
        foo __\___
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo <strong>_</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 7206-7210
    func testExample452() {
        let html = MarkdownParser().html(from:
        #####"""
        foo __*__
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>foo <strong>*</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 7213-7217
    func testExample453() {
        let html = MarkdownParser().html(from:
        #####"""
        __foo_
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>_<em>foo</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 7224-7228
    func testExample454() {
        let html = MarkdownParser().html(from:
        #####"""
        _foo__
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>foo</em>_</p>
        """#####
        )
    }    
    
    // spec.txt lines 7231-7235
    func testExample455() {
        let html = MarkdownParser().html(from:
        #####"""
        ___foo__
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>_<strong>foo</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 7238-7242
    func testExample456() {
        let html = MarkdownParser().html(from:
        #####"""
        ____foo_
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>___<em>foo</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 7245-7249
    func testExample457() {
        let html = MarkdownParser().html(from:
        #####"""
        __foo___
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong>foo</strong>_</p>
        """#####
        )
    }    
    
    // spec.txt lines 7252-7256
    func testExample458() {
        let html = MarkdownParser().html(from:
        #####"""
        _foo____
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>foo</em>___</p>
        """#####
        )
    }    
    
    // spec.txt lines 7262-7266
    func testExample459() {
        let html = MarkdownParser().html(from:
        #####"""
        **foo**
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong>foo</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 7269-7273
    func testExample460() {
        let html = MarkdownParser().html(from:
        #####"""
        *_foo_*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em><em>foo</em></em></p>
        """#####
        )
    }    
    
    // spec.txt lines 7276-7280
    func testExample461() {
        let html = MarkdownParser().html(from:
        #####"""
        __foo__
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong>foo</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 7283-7287
    func testExample462() {
        let html = MarkdownParser().html(from:
        #####"""
        _*foo*_
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em><em>foo</em></em></p>
        """#####
        )
    }    
    
    // spec.txt lines 7293-7297
    func testExample463() {
        let html = MarkdownParser().html(from:
        #####"""
        ****foo****
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong><strong>foo</strong></strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 7300-7304
    func testExample464() {
        let html = MarkdownParser().html(from:
        #####"""
        ____foo____
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong><strong>foo</strong></strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 7311-7315
    func testExample465() {
        let html = MarkdownParser().html(from:
        #####"""
        ******foo******
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><strong><strong><strong>foo</strong></strong></strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 7320-7324
    func testExample466() {
        let html = MarkdownParser().html(from:
        #####"""
        ***foo***
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em><strong>foo</strong></em></p>
        """#####
        )
    }    
    
    // spec.txt lines 7327-7331
    func testExample467() {
        let html = MarkdownParser().html(from:
        #####"""
        _____foo_____
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em><strong><strong>foo</strong></strong></em></p>
        """#####
        )
    }    
    
    // spec.txt lines 7336-7340
    func testExample468() {
        let html = MarkdownParser().html(from:
        #####"""
        *foo _bar* baz_
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>foo _bar</em> baz_</p>
        """#####
        )
    }    
    
    // spec.txt lines 7343-7347
    func testExample469() {
        let html = MarkdownParser().html(from:
        #####"""
        *foo __bar *baz bim__ bam*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>foo <strong>bar *baz bim</strong> bam</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 7352-7356
    func testExample470() {
        let html = MarkdownParser().html(from:
        #####"""
        **foo **bar baz**
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>**foo <strong>bar baz</strong></p>
        """#####
        )
    }    
    
    // spec.txt lines 7359-7363
    func testExample471() {
        let html = MarkdownParser().html(from:
        #####"""
        *foo *bar baz*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>*foo <em>bar baz</em></p>
        """#####
        )
    }    
    
    // spec.txt lines 7368-7372
    func testExample472() {
        let html = MarkdownParser().html(from:
        #####"""
        *[bar*](/url)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>*<a href="/url">bar*</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7375-7379
    func testExample473() {
        let html = MarkdownParser().html(from:
        #####"""
        _foo [bar_](/url)
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>_foo <a href="/url">bar_</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7382-7386
    func testExample474() {
        let html = MarkdownParser().html(from:
        #####"""
        *<img src="foo" title="*"/>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>*<img src="foo" title="*"/></p>
        """#####
        )
    }    
    
    // spec.txt lines 7389-7393
    func testExample475() {
        let html = MarkdownParser().html(from:
        #####"""
        **<a href="**">
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>**<a href="**"></p>
        """#####
        )
    }    
    
    // spec.txt lines 7396-7400
    func testExample476() {
        let html = MarkdownParser().html(from:
        #####"""
        __<a href="__">
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>__<a href="__"></p>
        """#####
        )
    }    
    
    // spec.txt lines 7403-7407
    func testExample477() {
        let html = MarkdownParser().html(from:
        #####"""
        *a `*`*
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>a <code>*</code></em></p>
        """#####
        )
    }    
    
    // spec.txt lines 7410-7414
    func testExample478() {
        let html = MarkdownParser().html(from:
        #####"""
        _a `_`_
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p><em>a <code>_</code></em></p>
        """#####
        )
    }    
    
    // spec.txt lines 7417-7421
    func testExample479() {
        let html = MarkdownParser().html(from:
        #####"""
        **a<http://foo.bar/?q=**>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>**a<a href="http://foo.bar/?q=**">http://foo.bar/?q=**</a></p>
        """#####
        )
    }    
    
    // spec.txt lines 7424-7428
    func testExample480() {
        let html = MarkdownParser().html(from:
        #####"""
        __a<http://foo.bar/?q=__>
        """#####
        )
        XCTAssertEqual(html,
        #####"""
        <p>__a<a href="http://foo.bar/?q=__">http://foo.bar/?q=__</a></p>
        """#####
        )
    }
}

extension EmphasisAndStrongEmphasisTests {
    static var allTests: Linux.TestList<EmphasisAndStrongEmphasisTests> {
        return [
        ("testExample350", testExample350),
        ("testExample351", testExample351),
        ("testExample352", testExample352),
        ("testExample353", testExample353),
        ("testExample354", testExample354),
        ("testExample355", testExample355),
        ("testExample356", testExample356),
        ("testExample357", testExample357),
        ("testExample358", testExample358),
        ("testExample359", testExample359),
        ("testExample360", testExample360),
        ("testExample361", testExample361),
        ("testExample362", testExample362),
        ("testExample363", testExample363),
        ("testExample364", testExample364),
        ("testExample365", testExample365),
        ("testExample366", testExample366),
        ("testExample367", testExample367),
        ("testExample368", testExample368),
        ("testExample369", testExample369),
        ("testExample370", testExample370),
        ("testExample371", testExample371),
        ("testExample372", testExample372),
        ("testExample373", testExample373),
        ("testExample374", testExample374),
        ("testExample375", testExample375),
        ("testExample376", testExample376),
        ("testExample377", testExample377),
        ("testExample378", testExample378),
        ("testExample379", testExample379),
        ("testExample380", testExample380),
        ("testExample381", testExample381),
        ("testExample382", testExample382),
        ("testExample383", testExample383),
        ("testExample384", testExample384),
        ("testExample385", testExample385),
        ("testExample386", testExample386),
        ("testExample387", testExample387),
        ("testExample388", testExample388),
        ("testExample389", testExample389),
        ("testExample390", testExample390),
        ("testExample391", testExample391),
        ("testExample392", testExample392),
        ("testExample393", testExample393),
        ("testExample394", testExample394),
        ("testExample395", testExample395),
        ("testExample396", testExample396),
        ("testExample397", testExample397),
        ("testExample398", testExample398),
        ("testExample399", testExample399),
        ("testExample400", testExample400),
        ("testExample401", testExample401),
        ("testExample402", testExample402),
        ("testExample403", testExample403),
        ("testExample404", testExample404),
        ("testExample405", testExample405),
        ("testExample406", testExample406),
        ("testExample407", testExample407),
        ("testExample408", testExample408),
        ("testExample409", testExample409),
        ("testExample410", testExample410),
        ("testExample411", testExample411),
        ("testExample412", testExample412),
        ("testExample413", testExample413),
        ("testExample414", testExample414),
        ("testExample415", testExample415),
        ("testExample416", testExample416),
        ("testExample417", testExample417),
        ("testExample418", testExample418),
        ("testExample419", testExample419),
        ("testExample420", testExample420),
        ("testExample421", testExample421),
        ("testExample422", testExample422),
        ("testExample423", testExample423),
        ("testExample424", testExample424),
        ("testExample425", testExample425),
        ("testExample426", testExample426),
        ("testExample427", testExample427),
        ("testExample428", testExample428),
        ("testExample429", testExample429),
        ("testExample430", testExample430),
        ("testExample431", testExample431),
        ("testExample432", testExample432),
        ("testExample433", testExample433),
        ("testExample434", testExample434),
        ("testExample435", testExample435),
        ("testExample436", testExample436),
        ("testExample437", testExample437),
        ("testExample438", testExample438),
        ("testExample439", testExample439),
        ("testExample440", testExample440),
        ("testExample441", testExample441),
        ("testExample442", testExample442),
        ("testExample443", testExample443),
        ("testExample444", testExample444),
        ("testExample445", testExample445),
        ("testExample446", testExample446),
        ("testExample447", testExample447),
        ("testExample448", testExample448),
        ("testExample449", testExample449),
        ("testExample450", testExample450),
        ("testExample451", testExample451),
        ("testExample452", testExample452),
        ("testExample453", testExample453),
        ("testExample454", testExample454),
        ("testExample455", testExample455),
        ("testExample456", testExample456),
        ("testExample457", testExample457),
        ("testExample458", testExample458),
        ("testExample459", testExample459),
        ("testExample460", testExample460),
        ("testExample461", testExample461),
        ("testExample462", testExample462),
        ("testExample463", testExample463),
        ("testExample464", testExample464),
        ("testExample465", testExample465),
        ("testExample466", testExample466),
        ("testExample467", testExample467),
        ("testExample468", testExample468),
        ("testExample469", testExample469),
        ("testExample470", testExample470),
        ("testExample471", testExample471),
        ("testExample472", testExample472),
        ("testExample473", testExample473),
        ("testExample474", testExample474),
        ("testExample475", testExample475),
        ("testExample476", testExample476),
        ("testExample477", testExample477),
        ("testExample478", testExample478),
        ("testExample479", testExample479),
        ("testExample480", testExample480)
        ]
    }
}