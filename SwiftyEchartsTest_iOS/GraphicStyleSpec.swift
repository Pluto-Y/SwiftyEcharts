//
//  GraphicStyleSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 27/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class GraphicStyleSpec: QuickSpec {
    override func spec() {
        describe("For CommonGraphicStyle") {
            let fillValue = rgb(125, 33, 225)
            let strokeValue = rgba(250, 65, 221, 0.5)
            let lineWidthValue: Float = 12.5
            let shadowBlurValue: Float = 22.5
            let shadowOffsetXValue: Float = 78.5
            let shadowOffsetYValue: Float = 0.11
            let shadowColorValue = Color.linearGradient(0, 0, 0, 1,
                [
                    ["offset": 0, "color": Color.hexColor("#83bff6")],
                    ["offset": 0.5, "color": Color.hexColor("#188df0")],
                    ["offset": 1, "color": Color.hexColor("#188df0")]
                ], false)
            
            let commonGraphicStyle = CommonGraphicStyle()
            commonGraphicStyle.fill = fillValue
            commonGraphicStyle.stroke = strokeValue
            commonGraphicStyle.lineWidth = lineWidthValue
            commonGraphicStyle.shadowBlur = shadowBlurValue
            commonGraphicStyle.shadowOffsetX = shadowOffsetXValue
            commonGraphicStyle.shadowOffsetY = shadowOffsetYValue
            commonGraphicStyle.shadowColor = shadowColorValue
            let commonGraphicStyleJsonString = commonGraphicStyle.jsonString
            
            beforeEach {
                // 避免 shadowColor 重复添加到 JsCache
                JsCache.removeAll()
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "fill": fillValue,
                    "stroke": strokeValue,
                    "lineWidth": lineWidthValue,
                    "shadowBlur": shadowBlurValue,
                    "shadowOffsetX": shadowOffsetXValue,
                    "shadowOffsetY": shadowOffsetYValue,
                    "shadowColor": shadowColorValue
                ]
                
                expect(commonGraphicStyleJsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let commonGraphicStyleByEnums = CommonGraphicStyle(
                    .fill(fillValue),
                    .stroke(strokeValue),
                    .lineWidth(lineWidthValue),
                    .shadowBlur(shadowBlurValue),
                    .shadowOffsetX(shadowOffsetXValue),
                    .shadowOffsetY(shadowOffsetYValue),
                    .shadowColor(shadowColorValue)
                )
                
                expect(commonGraphicStyleByEnums.jsonString).to(equal(commonGraphicStyleJsonString))
            }
        }
    }
}
