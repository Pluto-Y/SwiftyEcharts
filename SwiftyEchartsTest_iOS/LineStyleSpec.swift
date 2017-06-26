//
//  LineStyleSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 22/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class LineStyleSpec: QuickSpec {
    override func spec() {
        
        let colorValue = Color.array(["red", Color.blue, Color.hexColor("#f8f")])
        let widthValue: Float = 29.5
        let typeValue = LineType.dashed
        let opacityValue: Float = 0.75
        let shadowBlurValue: Float = 0.33
        let shadowColorValue = rgb(220, 138, 123)
        let shadowOffsetXValue: Float = 69
        let shadowOffsetYValue: Float = 172
        let curvenessValue: Float = 33
        
        let lineStyleNormal = LineStyle()
        lineStyleNormal.color = colorValue
        lineStyleNormal.width = widthValue
        lineStyleNormal.type = typeValue
        lineStyleNormal.opacity = opacityValue
        lineStyleNormal.shadowBlur = shadowBlurValue
        lineStyleNormal.shadowColor = shadowColorValue
        lineStyleNormal.shadowOffsetX = shadowOffsetXValue
        lineStyleNormal.shadowOffsetY = shadowOffsetYValue
        lineStyleNormal.curveness = curvenessValue
        
        let lineStyleEmphasis = LineStyle(
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
        
        describe("For LineStyle") {
            
            let resultDic: [String: Jsonable] = [
                "color": colorValue,
                "width": widthValue,
                "type": typeValue,
                "opacity": opacityValue,
                "shadowBlur": shadowBlurValue,
                "shadowColor": shadowColorValue,
                "shadowOffsetX": shadowOffsetXValue,
                "shadowOffsetY": shadowOffsetYValue,
                "curveness": curvenessValue
            ]
            
            it("needs to check the jsonString") {
                expect(lineStyleNormal.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check Enumable") {
                let lineStyleByEnums = LineStyle(
                    .color(colorValue),
                    .width(widthValue),
                    .type(typeValue),
                    .opacity(opacityValue),
                    .shadowBlur(shadowBlurValue),
                    .shadowColor(shadowColorValue),
                    .shadowOffsetX(shadowOffsetXValue),
                    .shadowOffsetY(shadowOffsetYValue),
                    .curveness(curvenessValue)
                )
                
                expect(lineStyleByEnums.jsonString).to(equal(lineStyleNormal.jsonString))
            }
        }
        
        describe("For EmphasisLineStyle") {
            let emphasisLineStyle = EmphasisLineStyle()
            emphasisLineStyle.normal = lineStyleNormal
            emphasisLineStyle.emphasis = lineStyleEmphasis
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "normal": lineStyleNormal,
                    "emphasis": lineStyleEmphasis
                ]
                
                expect(emphasisLineStyle.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let emphasisLineStyleByEnums = EmphasisLineStyle(
                    .normal(lineStyleNormal),
                    .emphasis(lineStyleEmphasis)
                )
                
                expect(emphasisLineStyleByEnums.jsonString).to(equal(emphasisLineStyle.jsonString))
            }
        }
    }
}
