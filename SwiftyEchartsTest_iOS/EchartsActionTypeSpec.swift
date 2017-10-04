//
//  EchartsActionTypeSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 30/09/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class EchartsActionTypeSpec: QuickSpec {
    internal override func spec() {
        describe("For EchartsActionType") {
            let highlightType = EchartsActionType.highlight
            let downplayType = EchartsActionType.downplay
            let legendSelectType = EchartsActionType.legendSelect
            let legendUnSelectType = EchartsActionType.legendUnSelect
            let legendToggleSelectType = EchartsActionType.legendToggleSelect
            let legendScrollType = EchartsActionType.legendScroll
            let showTipType = EchartsActionType.showTip
            let hideTipType = EchartsActionType.hideTip
            let dataZoomType = EchartsActionType.dataZoom
            let selectDataRangeType = EchartsActionType.selectDataRange
            let timelineChangeType = EchartsActionType.timelineChange
            let timelinePlayChangeType = EchartsActionType.timelinePlayChange
            let restoreType = EchartsActionType.restore
            let pieSelectType = EchartsActionType.pieSelect
            let pieUnSelectType = EchartsActionType.pieUnSelect
            let pieToggleSelectType = EchartsActionType.pieToggleSelect
            let geoSelectType = EchartsActionType.geoSelect
            let geoUnSelectType = EchartsActionType.geoUnSelect
            let geoToggleSelectType = EchartsActionType.geoToggleSelect
            let mapSelectType = EchartsActionType.mapSelect
            let mapUnSelectType = EchartsActionType.mapUnSelect
            let focusNodeAdjacencyType = EchartsActionType.focusNodeAdjacency
            let unfocusNodeAdjacencyType = EchartsActionType.unfocusNodeAdjacency
            let brushType = EchartsActionType.brush
            
            it("needs to check the enum case jsonString") {
                let highlightString = "highlight"
                let downplayString = "downplay"
                let legendSelectString = "legendSelect"
                let legendUnSelectString = "legendUnSelect"
                let legendToggleSelectString = "legendToggleSelect"
                let legendScrollString = "legendScroll"
                let showTipString = "showTip"
                let hideTipString = "hideTip"
                let dataZoomString = "dataZoom"
                let selectDataRangeString = "selectDataRange"
                let timelineChangeString = "timelineChange"
                let timelinePlayChangeString = "timelinePlayChange"
                let restoreString = "restore"
                let pieSelectString = "pieSelect"
                let pieUnSelectString = "pieUnSelect"
                let pieToggleSelectString = "pieToggleSelect"
                let geoSelectString = "geoSelect"
                let geoUnSelectString = "geoUnSelect"
                let geoToggleSelectString = "geoToggleSelect"
                let mapSelectString = "mapSelect"
                let mapUnSelectString = "mapUnSelect"
                let focusNodeAdjacencyString = "focusNodeAdjacency"
                let unfocusNodeAdjacencyString = "unfocusNodeAdjacency"
                let brushString = "brush"
                
                expect(highlightType.jsonString).to(equal(highlightString.jsonString))
                expect(downplayType.jsonString).to(equal(downplayString.jsonString))
                expect(legendSelectType.jsonString).to(equal(legendSelectString.jsonString))
                expect(legendUnSelectType.jsonString).to(equal(legendUnSelectString.jsonString))
                expect(legendToggleSelectType.jsonString).to(equal(legendToggleSelectString.jsonString))
                expect(legendScrollType.jsonString).to(equal(legendScrollString.jsonString))
                expect(showTipType.jsonString).to(equal(showTipString.jsonString))
                expect(hideTipType.jsonString).to(equal(hideTipString.jsonString))
                expect(dataZoomType.jsonString).to(equal(dataZoomString.jsonString))
                expect(selectDataRangeType.jsonString).to(equal(selectDataRangeString.jsonString))
                expect(timelineChangeType.jsonString).to(equal(timelineChangeString.jsonString))
                expect(timelinePlayChangeType.jsonString).to(equal(timelinePlayChangeString.jsonString))
                expect(restoreType.jsonString).to(equal(restoreString.jsonString))
                expect(pieSelectType.jsonString).to(equal(pieSelectString.jsonString))
                expect(pieUnSelectType.jsonString).to(equal(pieUnSelectString.jsonString))
                expect(pieToggleSelectType.jsonString).to(equal(pieToggleSelectString.jsonString))
                expect(geoSelectType.jsonString).to(equal(geoSelectString.jsonString))
                expect(geoUnSelectType.jsonString).to(equal(geoUnSelectString.jsonString))
                expect(geoToggleSelectType.jsonString).to(equal(geoToggleSelectString.jsonString))
                expect(mapSelectType.jsonString).to(equal(mapSelectString.jsonString))
                expect(mapUnSelectType.jsonString).to(equal(mapUnSelectString.jsonString))
                expect(focusNodeAdjacencyType.jsonString).to(equal(focusNodeAdjacencyString.jsonString))
                expect(unfocusNodeAdjacencyType.jsonString).to(equal(unfocusNodeAdjacencyString.jsonString))
                expect(brushType.jsonString).to(equal(brushString.jsonString))
            }
        }
    }
}
