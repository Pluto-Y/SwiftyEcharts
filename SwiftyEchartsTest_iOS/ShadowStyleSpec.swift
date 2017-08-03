//
//  ShadowStyleSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class ShadowStyleSpec: QuickSpec {
    override func spec() {
        describe("For ShadowStyle") { 
            let colorValue = rgb(128, 128, 128)
            let shadowBlurValue: Float = 10
            let shadowColorValue = Color.hexColor("#ff00ff")
            let shadowOffsetXValue: Float = 85.273
            let shadowOffsetYValue: Float = 0.9472
            let opacityValue: Float = 0.572
            
            let shadowStyle = ShadowStyle()
            shadowStyle.color = colorValue
            shadowStyle.shadowBlur = shadowBlurValue
            shadowStyle.shadowColor = shadowColorValue
            shadowStyle.shadowOffsetX = shadowOffsetXValue
            shadowStyle.shadowOffsetY = shadowOffsetYValue
            shadowStyle.opacity = opacityValue
            
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "color": colorValue,
                    "shadowBlur": shadowBlurValue,
                    "shadowColor": shadowColorValue,
                    "shadowOffsetX": shadowOffsetXValue,
                    "shadowOffsetY": shadowOffsetYValue,
                    "opacity": opacityValue
                ]
                
                expect(shadowStyle.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let shadowStyleByEnums = ShadowStyle(
                    .color(colorValue),
                    .shadowBlur(shadowBlurValue),
                    .shadowColor(shadowColorValue),
                    .shadowOffsetX(shadowOffsetXValue),
                    .shadowOffsetY(shadowOffsetYValue),
                    .opacity(opacityValue)
                )
                
                expect(shadowStyleByEnums.jsonString).to(equal(shadowStyle.jsonString))
            }
        }
    }
}
