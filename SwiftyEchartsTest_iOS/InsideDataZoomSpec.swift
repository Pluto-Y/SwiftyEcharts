//
//  InsideDataZoomSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 17/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class InsideDataZoomSpec: QuickSpec {
    override func spec() {
        describe("For InsideDataZoom") {
            let disabledValue = false
            let xAxisIndexOriginValue: UInt8 = 255
            let xAxisIndexValue: OneOrMore<UInt8> = OneOrMore(one: xAxisIndexOriginValue)
            let yAxisIndexOriginValue: UInt8 = 0
            let yAxisIndexValue: OneOrMore<UInt8> = OneOrMore(one: yAxisIndexOriginValue)
            let radiusAxisIndexOriginValue: UInt8 = 1
            let radiusAxisIndexValue: OneOrMore<UInt8> = OneOrMore(one: radiusAxisIndexOriginValue)
            let angleAxisIndexOriginValue: UInt8 = 254
            let angleAxisIndexValue: OneOrMore<UInt8> = OneOrMore(one: angleAxisIndexOriginValue)
            let filterModeValue = FilterMode.empty
            let startValue: Float = 99
            let endValue: Float = 100
            let startValueValue: Float = 0.0
            let endValueValue: Float = 0.001
            let orientValue = Orient.vertical
            let zoomLockValue = true
            let throttleValue: Float = 100
            
            let insideDataZoom = InsideDataZoom()
            insideDataZoom.disabled = disabledValue
            insideDataZoom.xAxisIndex = xAxisIndexValue
            insideDataZoom.yAxisIndex = yAxisIndexValue
            insideDataZoom.radiusAxisIndex = radiusAxisIndexValue
            insideDataZoom.angleAxisIndex = angleAxisIndexValue
            insideDataZoom.filterMode = filterModeValue
            insideDataZoom.start = startValue
            insideDataZoom.end = endValue
            insideDataZoom.startValue = startValueValue
            insideDataZoom.endValue = endValueValue
            insideDataZoom.orient = orientValue
            insideDataZoom.zoomLock = zoomLockValue
            insideDataZoom.throttle = throttleValue
            
            it("needs to check the type value") {
                expect(insideDataZoom.type.jsonString).to(equal("inside".jsonString))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": "inside",
                    "disabled": disabledValue,
                    "xAxisIndex": xAxisIndexValue,
                    "yAxisIndex": yAxisIndexValue,
                    "radiusAxisIndex": radiusAxisIndexValue,
                    "angleAxisIndex": angleAxisIndexValue,
                    "filterMode": filterModeValue,
                    "start": startValue,
                    "end": endValue,
                    "startValue": startValueValue,
                    "endValue": endValueValue,
                    "orient": orientValue,
                    "zoomLock": zoomLockValue,
                    "throttle": throttleValue
                ]
                
                expect(insideDataZoom.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let insideDataZoomByEnums = InsideDataZoom(
                    .disabled(disabledValue),
                    .xAxisIndex(xAxisIndexOriginValue),
                    .yAxisIndex(yAxisIndexOriginValue),
                    .radiusAxisIndex(radiusAxisIndexOriginValue),
                    .angleAxisIndex(angleAxisIndexOriginValue),
                    .filterMode(filterModeValue),
                    .start(startValue),
                    .end(endValue),
                    .startValue(startValueValue),
                    .endValue(endValueValue),
                    .orient(orientValue),
                    .zoomLock(zoomLockValue),
                    .throttle(throttleValue)
                )
                
                expect(insideDataZoomByEnums.jsonString).to(equal(insideDataZoom.jsonString))
            }
            
            it("needs to check the xAxisIndexes, yAxisIndexes, radiusAxisIndexes, angleAxisIndexes") {
                let xAxisIndexesOriginValue: [UInt8] = [0, 1]
                let yAxisIndexesOriginValue: [UInt8] = [254, 255]
                let radiusAxisIndexesOriginValue: [UInt8] = [0, 255]
                let angleAxisIndexesOriginValue: [UInt8] = [1, 254]
                let xAxisIndexesValue = OneOrMore(more: xAxisIndexesOriginValue)
                let yAxisIndexesValue = OneOrMore(more: yAxisIndexesOriginValue)
                let radiusAxisIndexesValue = OneOrMore(more: radiusAxisIndexesOriginValue)
                let angleAxisIndexesValue = OneOrMore(more: angleAxisIndexesOriginValue)
                
                insideDataZoom.xAxisIndex = xAxisIndexesValue
                insideDataZoom.yAxisIndex = yAxisIndexesValue
                insideDataZoom.radiusAxisIndex = radiusAxisIndexesValue
                insideDataZoom.angleAxisIndex = angleAxisIndexesValue
                
                let insideDataZoomByEnums = InsideDataZoom(
                    .disabled(disabledValue),
                    .xAxisIndexes(xAxisIndexesOriginValue),
                    .yAxisIndexes(yAxisIndexesOriginValue),
                    .radiusAxisIndexes(radiusAxisIndexesOriginValue),
                    .angleAxisIndexes(angleAxisIndexesOriginValue),
                    .filterMode(filterModeValue),
                    .start(startValue),
                    .end(endValue),
                    .startValue(startValueValue),
                    .endValue(endValueValue),
                    .orient(orientValue),
                    .zoomLock(zoomLockValue),
                    .throttle(throttleValue)
                )
                
                expect(insideDataZoomByEnums.jsonString).to(equal(insideDataZoom.jsonString))
            }
        }
    }
}
