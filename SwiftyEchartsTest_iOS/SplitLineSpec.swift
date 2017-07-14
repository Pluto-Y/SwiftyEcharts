//
//  SplitLineSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 22/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class SplitLineSpec: QuickSpec {
    override func spec() {
        describe("For SplitLine") {
            
            let showValue = false
            let intervalValue: LengthValue = 2
            let lineStyleValue = LineStyle(
                .color(Color.red),
                .width(30),
                .type(.dotted),
                .opacity(0.88),
                .shadowBlur(0.65),
                .shadowColor("#fff"),
                .shadowOffsetX(16.5),
                .shadowOffsetY(8.9992),
                .curveness(0.72)
            )
            
            let dic: [String: Jsonable] = [
                "show": showValue,
                "interval": intervalValue,
                "lineStyle": lineStyleValue
            ]
            
            let splitLine = SplitLine()
            splitLine.show = showValue
            splitLine.interval = intervalValue
            splitLine.lineStyle = lineStyleValue
            
            it(" needs to check the jsonString ") {
                expect(splitLine.jsonString).to(equal(dic.jsonString))
            }
            
            it(" needs to check the Enumable ") {
                let splitLineByEnums = SplitLine(
                    .show(showValue),
                    .interval(intervalValue),
                    .lineStyle(lineStyleValue)
                )
                
                expect(splitLineByEnums.jsonString).to(equal(splitLine.jsonString))
            }
        }
    }
}
