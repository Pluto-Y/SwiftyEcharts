//
//  AreaStyleSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 24/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class AreaStyleSpec: QuickSpec {
    override func spec() {
        let colorValue = Color.green
        let shadowBlurValue: Float = 2.7
        let shadowColorValue = Color.hexColor("#ff170c")
        let shadowOffsetXValue: Float = 18.2
        let shadowOffsetYValue: Float = 1.1
        let opacityValue: Float = 0.5
        
        let areaStyleNormal = AreaStyle()
        areaStyleNormal.color = colorValue
        areaStyleNormal.shadowBlur = shadowBlurValue
        areaStyleNormal.shadowColor = shadowColorValue
        areaStyleNormal.shadowOffsetX = shadowOffsetXValue
        areaStyleNormal.shadowOffsetY = shadowOffsetYValue
        areaStyleNormal.opacity = opacityValue
        
        describe("For AreaStyle") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "color": colorValue,
                    "shadowBlur": shadowBlurValue,
                    "shadowColor": shadowColorValue,
                    "shadowOffsetX": shadowOffsetXValue,
                    "shadowOffsetY": shadowOffsetYValue,
                    "opacity": opacityValue
                ]
                
                expect(areaStyleNormal.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let areaStyleByEnums = AreaStyle(
                    .color(colorValue),
                    .shadowBlur(shadowBlurValue),
                    .shadowColor(shadowColorValue),
                    .shadowOffsetX(shadowOffsetXValue),
                    .shadowOffsetY(shadowOffsetYValue),
                    .opacity(opacityValue)
                )
                
                expect(areaStyleByEnums.jsonString).to(equal(areaStyleNormal.jsonString))
            }
        }
        
        describe("EmphasisAreaStyle") {
            let areaStyleEmphasis = AreaStyle(
                .color(Color.auto),
                .shadowBlur(8.88),
                .shadowColor(Color.red),
                .shadowOffsetX(3.99999),
                .shadowOffsetY(0),
                .opacity(0.3)
            )
            
            let emphasisAreaStyle = EmphasisAreaStyle()
            emphasisAreaStyle.normal = areaStyleNormal
            emphasisAreaStyle.emphasis = areaStyleEmphasis
            it("needs to check jsonString") {
                let resutlDic: [String: Jsonable] = [
                    "normal": areaStyleNormal,
                    "emphasis": areaStyleEmphasis
                ]
                
                expect(emphasisAreaStyle.jsonString).to(equal(resutlDic.jsonString))
            }
            
            it("needs to check Enumable") {
                let emphasisAreaStyleByEnums = EmphasisAreaStyle(
                    .normal(areaStyleNormal),
                    .emphasis(areaStyleEmphasis)
                )
                
                expect(emphasisAreaStyleByEnums.jsonString).to(equal(emphasisAreaStyle.jsonString))
            }
        }
    }
}
