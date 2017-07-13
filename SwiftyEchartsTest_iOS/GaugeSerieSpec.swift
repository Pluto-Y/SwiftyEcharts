//
//  GaugeSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 13/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class GaugeSerieSpec: QuickSpec {
    override func spec() {
        let showAxisTickValue = false
        let splitNumberAxisTickValue: UInt8 = 20
        let lengthAxisTickValue: LengthValue = 20%
        let lineStyleAxisTickValue = LineStyle(
            .width(8)
        )
        
        let axisTick = GaugeSerie.AxisTick()
        axisTick.show = showAxisTickValue
        axisTick.splitNumber = splitNumberAxisTickValue
        axisTick.length = lengthAxisTickValue
        axisTick.lineStyle = lineStyleAxisTickValue
        
        describe("For GaugeSerie.AxisTick") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showAxisTickValue,
                    "splitNumber": splitNumberAxisTickValue,
                    "length": lengthAxisTickValue,
                    "lineStyle": lineStyleAxisTickValue
                ]

                expect(axisTick.jsonString).to(equal(resultDic.jsonString))
            }

            it("needs to check the Enumable") {
                let axisTickByEnums = GaugeSerie.AxisTick(
                    .show(showAxisTickValue),
                    .splitNumber(splitNumberAxisTickValue),
                    .length(lengthAxisTickValue),
                    .lineStyle(lineStyleAxisTickValue)
                )
                
                expect(axisTickByEnums.jsonString).to(equal(axisTick.jsonString))
            }
        }
    }
}
