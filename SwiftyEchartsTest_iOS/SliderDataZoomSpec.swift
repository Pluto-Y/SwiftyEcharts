//
//  SliderDataZoomSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class SliderDataZoomSpec: QuickSpec {
    override func spec() {
        let lineStyleDataBackgroundValue = EmphasisLineStyle(
            .emphasis(LineStyle(
                .color(Color.hexColor("#9988ff")),
                .width(125),
                .type(LineType.solid),
                .shadowOffsetY(8758)
                )),
            .normal(LineStyle(
                .shadowBlur(0.0278),
                .shadowColor(rgba(128, 128, 128, 0.5))
                ))
        )
        let areaStyleDataBackgroundValue = AreaStyle(
            .color(Color.hexColor("#123456")),
            .opacity(0.5826),
            .shadowOffsetX(7461)
        )
        
        let dataBackground = SliderDataZoom.DataBackground()
        dataBackground.lineStyle = lineStyleDataBackgroundValue
        dataBackground.areaStyle = areaStyleDataBackgroundValue
        
        describe("For SliderDataZoom.DataBackground") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "lineStyle": lineStyleDataBackgroundValue,
                    "areaStyle": areaStyleDataBackgroundValue
                ]
                
                expect(dataBackground.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let dataBackgroundByEnums = SliderDataZoom.DataBackground(
                    .lineStyle(lineStyleDataBackgroundValue),
                    .areaStyle(areaStyleDataBackgroundValue)
                )
                
                expect(dataBackgroundByEnums.jsonString).to(equal(dataBackground.jsonString))
            }
        }
        
        let colorHandleStyleValue = rgba(128, 0, 255, 0.000001)
        let borderColorHandleStyleValue = Color.hexColor("#678901")
        let borderWidthHandleStyleValue: Float = 0.582376
        let borderTypeHandleStyleValue = LineType.dashed
        let shadowBlurHandleStyleValue: Float = 10
        let shadowColorHandleStyleValue = rgba(0, 0, 0, 0.5)
        let shadowOffsetXHandleStyleValue: Float = 0.59347
        let shadowOffsetYHandleStyleValue: Float = 73623.47
        let opacityHandleStyleValue: Float = 0.59237
        
        let handleStyle = SliderDataZoom.HandleStyle()
        handleStyle.color = colorHandleStyleValue
        handleStyle.borderColor = borderColorHandleStyleValue
        handleStyle.borderWidth = borderWidthHandleStyleValue
        handleStyle.borderType = borderTypeHandleStyleValue
        handleStyle.shadowBlur = shadowBlurHandleStyleValue
        handleStyle.shadowColor = shadowColorHandleStyleValue
        handleStyle.shadowOffsetX = shadowOffsetXHandleStyleValue
        handleStyle.shadowOffsetY = shadowOffsetYHandleStyleValue
        handleStyle.opacity = opacityHandleStyleValue
        
        describe("For SliderDataZoom.HandleStyle") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "color": colorHandleStyleValue,
                    "borderColor": borderColorHandleStyleValue,
                    "borderWidth": borderWidthHandleStyleValue,
                    "borderType": borderTypeHandleStyleValue,
                    "shadowBlur": shadowBlurHandleStyleValue,
                    "shadowColor": shadowColorHandleStyleValue,
                    "shadowOffsetX": shadowOffsetXHandleStyleValue,
                    "shadowOffsetY": shadowOffsetYHandleStyleValue,
                    "opacity": opacityHandleStyleValue
                ]
                
                expect(handleStyle.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let handleStyleByEnums = SliderDataZoom.HandleStyle(
                    .color(colorHandleStyleValue),
                    .borderColor(borderColorHandleStyleValue),
                    .borderWidth(borderWidthHandleStyleValue),
                    .borderType(borderTypeHandleStyleValue),
                    .shadowBlur(shadowBlurHandleStyleValue),
                    .shadowColor(shadowColorHandleStyleValue),
                    .shadowOffsetX(shadowOffsetXHandleStyleValue),
                    .shadowOffsetY(shadowOffsetYHandleStyleValue),
                    .opacity(opacityHandleStyleValue)
                )
                
                expect(handleStyleByEnums.jsonString).to(equal(handleStyle.jsonString))
            }
        }
    }
}
