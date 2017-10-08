//
//  DataZoomSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class DataZoomSpec: QuickSpec {
    override func spec() {
        describe("For FilterMode") {
            
            let filterString = "filter"
            let emptyString = "empty"
            
            let filterFilterMode = FilterMode.filter
            let emptyFilterMode = FilterMode.empty
            
            it("needs to check the jsonString") {
                expect(filterFilterMode.jsonString).to(equal(filterString.jsonString))
                expect(emptyFilterMode.jsonString).to(equal(emptyString.jsonString))
            }
        }
        
        describe("For DataZoomAction") {
            let typeValue = EchartsActionType.dataZoom
            let dataZoomIndexValue = 23487348972398
            let startValue: Float = 0.000000
            let endValue: Float = 99.999999
            let startValueValue: Float = 92372.23894723894
            let endValueValue: Float = 2343.02394823
            
            let dataZoomAction = DataZoomAction()
            dataZoomAction.dataZoomIndex = dataZoomIndexValue
            dataZoomAction.start = startValue
            dataZoomAction.end = endValue
            dataZoomAction.startValue = startValueValue
            dataZoomAction.endValue = endValueValue
            
            it("needs to check the type value") {
                expect(dataZoomAction.type.jsonString).to(equal(typeValue.jsonString))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": typeValue,
                    "dataZoomIndex": dataZoomIndexValue,
                    "start": startValue,
                    "end": endValue,
                    "startValue": startValueValue,
                    "endValue": endValueValue
                ]
                
                expect(dataZoomAction.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let dataZoomActionByEnums = DataZoomAction(
                    .dataZoomIndex(dataZoomIndexValue),
                    .start(startValue),
                    .end(endValue),
                    .startValue(startValueValue),
                    .endValue(endValueValue)
                )
                
                expect(dataZoomActionByEnums.jsonString).to(equal(dataZoomAction.jsonString))
            }
        }
    }
}
