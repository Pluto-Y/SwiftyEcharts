//
//  HighlightActionSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 13/10/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class HighlightActionSpec: QuickSpec {
    override func spec() {
        describe("For HighlightAction") {
            let typeValue = EchartsActionType.highlight
            let seriesIndexOriginValue: UInt8 = 20
            let seriesIndexValue = OneOrMore(one: seriesIndexOriginValue)
            let seriesNameOriginValue = "higlightActionSeriesName"
            let seriesNameValue = OneOrMore(one: seriesNameOriginValue)
            let dataIndexValue: UInt8 = UInt8.max
            let nameValue = "highlightActionName"
            
            var highlightAction = HighlightAction()
            highlightAction.seriesName = seriesNameValue
            highlightAction.seriesIndex = seriesIndexValue
            highlightAction.dataIndex = dataIndexValue
            highlightAction.name = nameValue
            
            it("needs to check the type value") {
                expect(highlightAction.type.jsonString).to(equal(typeValue.jsonString))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": typeValue,
                    "seriesName": seriesNameValue,
                    "seriesIndex": seriesIndexValue,
                    "dataIndex": dataIndexValue,
                    "name": nameValue
                ]
                expect(highlightAction.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let highlightActionByEnums = HighlightAction(
                    .seriesName(seriesNameOriginValue),
                    .seriesIndex(seriesIndexOriginValue),
                    .dataIndex(dataIndexValue),
                    .name(nameValue)
                )

                expect(highlightActionByEnums.jsonString).to(equal(highlightAction.jsonString))
            }
            
            it("needs to check the seriesIndexes and seriesNames enum case") {
                let seriesIndexOriginValues: [UInt8] = [UInt8.min, UInt8.max]
                let seriesNameOriginValues: [String] = ["seriesName1", "seriesName2", "seriesName3"]
                
                highlightAction.seriesIndex = OneOrMore(more: seriesIndexOriginValues)
                highlightAction.seriesName = OneOrMore(more: seriesNameOriginValues)
                
                let highlightActionByEnums = HighlightAction(
                    .seriesNames(seriesNameOriginValues),
                    .seriesIndexes(seriesIndexOriginValues),
                    .dataIndex(dataIndexValue),
                    .name(nameValue)
                )
                
                expect(highlightActionByEnums.jsonString).to(equal(highlightAction.jsonString))
            }
        }
    }
}
