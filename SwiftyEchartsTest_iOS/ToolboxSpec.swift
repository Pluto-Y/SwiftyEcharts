//
//  ToolboxSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 13/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class ToolboxSpec: QuickSpec {
    override func spec() {
        describe("For Toolbox.Feature.SaveAsImage.Type") {
            let pngString = "png"
            let jpegString = "jpeg"
            
            let pngType = Toolbox.Feature.SaveAsImage.Type.png
            let jpegType = Toolbox.Feature.SaveAsImage.Type.jpeg
            
            it("needs to check the enum case jsonString") {
                expect(pngType.jsonString).to(equal(pngString.jsonString))
                expect(jpegType.jsonString).to(equal(jpegString.jsonString))
            }
        }
        
        let colorIconStyleContentValue = Color.rgba(128, 128, 128, 0.3)
        let borderColorIconStyleContentValue = Color.hexColor("#abcdef")
        let borderWidthIconStyleContentValue: Float = 8.427
        let borderTypeIconStyleContentValue = LineType.solid
        let shadowBlurIconStyleContentValue: Float = 87234.23872
        let shadowColorIconStyleContentValue = Color.array([Color.red, Color.hexColor("#2746ff"), Color.rgba(0, 0, 128, 0.77)])
        let shadowOffsetXIconStyleContentValue: Float = 85.34874
        let shadowOffsetYIconStyleContentValue: Float = 0.88873
        let opacityIconStyleContentValue: Float = 0.74623
        let textPositionIconStyleContentValue = Position.top
        let textAlignIconStyleContentValue = Align.right
        
        let iconStyleContent = Toolbox.IconStyleContent()
        iconStyleContent.color = colorIconStyleContentValue
        iconStyleContent.borderColor = borderColorIconStyleContentValue
        iconStyleContent.borderWidth = borderWidthIconStyleContentValue
        iconStyleContent.borderType = borderTypeIconStyleContentValue
        iconStyleContent.shadowBlur = shadowBlurIconStyleContentValue
        iconStyleContent.shadowColor = shadowColorIconStyleContentValue
        iconStyleContent.shadowOffsetX = shadowOffsetXIconStyleContentValue
        iconStyleContent.shadowOffsetY = shadowOffsetYIconStyleContentValue
        iconStyleContent.opacity = opacityIconStyleContentValue
        iconStyleContent.textPosition = textPositionIconStyleContentValue
        iconStyleContent.textAlign = textAlignIconStyleContentValue
        
        describe("For Toolbox.IconStyleContent") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "color": colorIconStyleContentValue,
                    "borderColor": borderColorIconStyleContentValue,
                    "borderWidth": borderWidthIconStyleContentValue,
                    "borderType": borderTypeIconStyleContentValue,
                    "shadowBlur": shadowBlurIconStyleContentValue,
                    "shadowColor": shadowColorIconStyleContentValue,
                    "shadowOffsetX": shadowOffsetXIconStyleContentValue,
                    "shadowOffsetY": shadowOffsetYIconStyleContentValue,
                    "opacity": opacityIconStyleContentValue,
                    "textPosition": textPositionIconStyleContentValue,
                    "textAlign": textAlignIconStyleContentValue
                ]
                
                expect(iconStyleContent.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let iconStyleContentByEnums = Toolbox.IconStyleContent(
                    .color(colorIconStyleContentValue),
                    .borderColor(borderColorIconStyleContentValue),
                    .borderWidth(borderWidthIconStyleContentValue),
                    .borderType(borderTypeIconStyleContentValue),
                    .shadowBlur(shadowBlurIconStyleContentValue),
                    .shadowColor(shadowColorIconStyleContentValue),
                    .shadowOffsetX(shadowOffsetXIconStyleContentValue),
                    .shadowOffsetY(shadowOffsetYIconStyleContentValue),
                    .opacity(opacityIconStyleContentValue),
                    .textPosition(textPositionIconStyleContentValue),
                    .textAlign(textAlignIconStyleContentValue)
                )
                
                expect(iconStyleContentByEnums.jsonString).to(equal(iconStyleContentByEnums.jsonString))
            }
        }
        
        let normalIconStyleValue = iconStyleContent
        let emphasisIconStyleValue = Toolbox.IconStyleContent(
            .opacity(0.47623),
            .color(Color.yellow),
            .borderWidth(8745.28374),
            .textAlign(Align.left),
            .textPosition(Position.left)
        )
        
        let iconStyle = Toolbox.IconStyle()
        iconStyle.normal = normalIconStyleValue
        iconStyle.emphasis = emphasisIconStyleValue
        
        describe("For IconStyle") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "normal": normalIconStyleValue,
                    "emphasis": emphasisIconStyleValue
                ]
                
                expect(iconStyle.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let iconStyleByEnums = Toolbox.IconStyle(
                    .normal(normalIconStyleValue),
                    .emphasis(emphasisIconStyleValue)
                )
                
                expect(iconStyleByEnums.jsonString).to(equal(iconStyle.jsonString))
            }
        }
    }
}
