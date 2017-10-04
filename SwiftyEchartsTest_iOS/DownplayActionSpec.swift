//
//  DownplayActionSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 13/10/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class DownplayActionSpec: QuickSpec {
    override func spec() {
        describe("For DownplayAction") {
            let typeValue = EchartsActionType.downplay
            let seriesIndexOriginValue: Int = 20
            let seriesIndexValue = OneOrMore(one: seriesIndexOriginValue)
            let seriesNameOriginValue = "higlightActionSeriesName"
            let seriesNameValue = OneOrMore(one: seriesNameOriginValue)
            let dataIndexValue: Int = Int.max
            let nameValue = "downplayActionName"
            
            let downplayAction = DownplayAction()
            downplayAction.seriesName = seriesNameValue
            downplayAction.seriesIndex = seriesIndexValue
            downplayAction.dataIndex = dataIndexValue
            downplayAction.name = nameValue
            
            it("needs to check the type value") {
                expect(downplayAction.type.jsonString).to(equal(typeValue.jsonString))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": typeValue,
                    "seriesName": seriesNameValue,
                    "seriesIndex": seriesIndexValue,
                    "dataIndex": dataIndexValue,
                    "name": nameValue
                ]
                expect(downplayAction.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let downplayActionByEnums = DownplayAction(
                    .seriesName(seriesNameOriginValue),
                    .seriesIndex(seriesIndexOriginValue),
                    .dataIndex(dataIndexValue),
                    .name(nameValue)
                )

                expect(downplayActionByEnums.jsonString).to(equal(downplayAction.jsonString))
            }
            
            it("needs to check the seriesIndexes and seriesNames enum case") {
                let seriesIndexOriginValues: [Int] = [Int.min, Int.max]
                let seriesNameOriginValues: [String] = ["seriesName1", "seriesName2", "seriesName3"]
                
                downplayAction.seriesIndex = OneOrMore(more: seriesIndexOriginValues)
                downplayAction.seriesName = OneOrMore(more: seriesNameOriginValues)
                
                let downplayActionByEnums = DownplayAction(
                    .seriesNames(seriesNameOriginValues),
                    .seriesIndexes(seriesIndexOriginValues),
                    .dataIndex(dataIndexValue),
                    .name(nameValue)
                )
                
                expect(downplayActionByEnums.jsonString).to(equal(downplayAction.jsonString))
            }
        }
    }
}
