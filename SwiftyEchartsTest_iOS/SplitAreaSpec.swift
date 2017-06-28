//
//  SplitAreaSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 28/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class SplitAreaSpec: QuickSpec {
    override func spec() {
        describe("For SplitArea") {
            let showValue = true
            let intervalValue: UInt = 12
            let areaStyleValue = AreaStyle(
                .color(.array([.rgba(114, 172, 209, 0.2), .rgba(114, 172, 209, 0.4), .rgba(114, 172, 209, 0.6), .rgba(114, 172, 209, 0.8), .rgba(114, 172, 209, 1)])),
                .shadowColor(.rgba(0, 0, 0, 0.3)),
                .shadowBlur(10)
            )
            
            let splitArea = SplitArea()
            splitArea.show = showValue
            splitArea.interval = intervalValue
            splitArea.areaStyle = areaStyleValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showValue,
                    "interval": intervalValue,
                    "areaStyle": areaStyleValue
                ]
                
                expect(splitArea.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let splitAreaByEnums = SplitArea(
                    .show(showValue),
                    .interval(intervalValue),
                    .areaStyle(areaStyleValue)
                )
                
                expect(splitAreaByEnums.jsonString).to(equal(splitArea.jsonString))
            }
        }
    }
}
