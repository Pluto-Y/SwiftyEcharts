//
//  VisualMapSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 26/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class VisualMapSpec: QuickSpec {
    override func spec() {
        describe("For VisualMapController") {
            let inRange: [String: Jsonable] = ["color": Color.hexColor("#2f4554")]
            let outRange: [String: Jsonable] = [
                "symbolSize": [10, 70],
                "color": ["rgba(255, 255, 255, 0.2"]
            ]
            let visualMapController = VisualMapController()
            visualMapController.inRange = inRange
            visualMapController.outRange = outRange
            it("needs to check the jsonString") {
                let resultDic = [
                    "inRange": inRange,
                    "outRange": outRange
                ]
                
                expect(visualMapController.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let visualMapControllerByEnums = VisualMapController(
                    .inRange(inRange),
                    .outRange(outRange)
                )
                expect(visualMapControllerByEnums.jsonString).to(equal(visualMapController.jsonString))
            }
        }
        
        context("For the actions of VisualMap") {
            describe("For VisualMapSelectDataRangeAction") {
                let typeValue = EchartsActionType.selectDataRange
                let visualMapIndexValue = 20
                let selectedValue: Jsonable = [20, 40]
                
                let visualMapSelectDataRangeAction = VisualMapSelectDataRangeAction()
                visualMapSelectDataRangeAction.visualMapIndex = visualMapIndexValue
                visualMapSelectDataRangeAction.selected = selectedValue
                
                it("needs to check the type value") {
                    expect(visualMapSelectDataRangeAction.type.jsonString).to(equal(typeValue.jsonString))
                }
                
                it("needs to check the jsonString") {
                    let resultDic: [String: Jsonable] = [
                        "type": typeValue,
                        "visualMapIndex": visualMapIndexValue,
                        "selected": selectedValue
                    ]
                    
                    expect(visualMapSelectDataRangeAction.jsonString).to(equal(resultDic.jsonString))
                }
                
                it("needs to check the Enumable") {
                    let visualMapSelectDataRangeActionByEnums = VisualMapSelectDataRangeAction(
                        .visualMapIndex(visualMapIndexValue),
                        .selected(selectedValue)
                    )
                    
                    expect(visualMapSelectDataRangeActionByEnums.jsonString).to(equal(visualMapSelectDataRangeAction.jsonString))
                }
            }
        }
    }
}
