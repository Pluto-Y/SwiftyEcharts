//
//  AxisTickSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 26/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class AxisTickSpec: QuickSpec {
    override func spec() {
        describe("For AxisTick") {
            let showValue = false
            let alignWithLabelValue = true
            let intervalValue = 12
            let insideValue = false
            let lengthValue: Float = 3.45
            let lineStyleValue = LineStyle(
                .color(Color.red),
                .width(12.0),
                .type(.dashed),
                .opacity(0.5),
                .curveness(12.55)
            )
            let splitNumberValue: UInt8 = 20
            
            let axisTick = AxisTick()
            axisTick.show = showValue
            axisTick.alignWithLabel = alignWithLabelValue
            axisTick.interval = intervalValue
            axisTick.inside = insideValue
            axisTick.length = lengthValue
            axisTick.lineStyle = lineStyleValue
            axisTick.splitNumber = splitNumberValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showValue,
                    "alignWithLabel": alignWithLabelValue,
                    "interval": intervalValue,
                    "inside": insideValue,
                    "length": lengthValue,
                    "lineStyle": lineStyleValue,
                    "splitNumber": splitNumberValue
                ]
                
                expect(axisTick.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let axisTickByEnums = AxisTick(
                    .show(showValue),
                    .alignWithLabel(alignWithLabelValue),
                    .interval(intervalValue),
                    .inside(insideValue),
                    .length(lengthValue),
                    .lineStyle(lineStyleValue),
                    .splitNumber(splitNumberValue)
                )
                
                expect(axisTickByEnums.jsonString).to(equal(axisTick.jsonString))
            }
        }
    }
}
