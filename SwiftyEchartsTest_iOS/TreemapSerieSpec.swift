//
//  TreemapSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 20/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class TreemapSerieSpec: QuickSpec {
    override func spec() {
        describe("For TreemapSerie.NodeClick") {
            let disableString = "false"
            let zoomToNodeString = "zoomToNode"
            let linkString = "link"
            
            let disableNodeClick = TreemapSerie.NodeClick.disable
            let zoomToNodeNodeClick = TreemapSerie.NodeClick.zoomToNode
            let linkNodeClick = TreemapSerie.NodeClick.link
            
            it("needs to check the enum case jsonString") {
                expect(disableNodeClick.jsonString).to(equal(disableString.jsonString))
                expect(zoomToNodeNodeClick.jsonString).to(equal(zoomToNodeString.jsonString))
                expect(linkNodeClick.jsonString).to(equal(linkString.jsonString))
            }
        }
    }
}
