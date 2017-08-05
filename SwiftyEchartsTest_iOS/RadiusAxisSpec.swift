//
//  RadiusAxisSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class RadiusAxisSpec: QuickSpec {
    override func spec() {
        describe("For RadiusAxis.AxisPointer.Type") { 
            let lineString = "line"
            let shadowString = "shadow"
            
            let lineType = RadiusAxis.AxisPointer.Type.line
            let shadowType = RadiusAxis.AxisPointer.Type.shadow
            
            it("needs to check the jsonString") {
                expect(lineType.jsonString).to(equal(lineString.jsonString))
                expect(shadowType.jsonString).to(equal(shadowString.jsonString))
            }
        }
        
        let showLabelValue = false
        let precisionLabelValue: Float = 4.8723
        let formatterLabelValue = Formatter.string("labelFormatterValue")
        let marginLabelValue: [Float] = [0.0, 0.284, 237, 573.237]
        let textStyleLabelValue = TextStyle()
        let paddingLabelValue = Padding.verticalAndHorizontal(5, 10)
        let backgroundColorLabelValue = Color.hexColor("#029573")
        let borderColorLabelValue = Color.red
        let borderWidthLabelValue: Float = 0.8572
        let shadowBlurLabelValue: Float = 10
        let shadowColorLabelValue = rgb(100, 0, 38)
        let shadowOffsetXLabelValue: Float = 0.8572
        let shadowOffsetYLabelValue: Float = 8937462.7623467
        
        let label = RadiusAxis.AxisPointer.Label()
        label.show = showLabelValue
        label.precision = precisionLabelValue
        label.formatter = formatterLabelValue
        label.margin = marginLabelValue
        label.textStyle = textStyleLabelValue
        label.padding = paddingLabelValue
        label.backgroundColor = backgroundColorLabelValue
        label.borderColor = borderColorLabelValue
        label.borderWidth = borderWidthLabelValue
        label.shadowBlur = shadowBlurLabelValue
        label.shadowColor = shadowColorLabelValue
        label.shadowOffsetX = shadowOffsetXLabelValue
        label.shadowOffsetY = shadowOffsetYLabelValue
        
        describe("For RadiusAxis.AxisPointer.Label") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showLabelValue,
                    "precision": precisionLabelValue,
                    "formatter": formatterLabelValue,
                    "margin": marginLabelValue,
                    "textStyle": textStyleLabelValue,
                    "padding": paddingLabelValue,
                    "backgroundColor": backgroundColorLabelValue,
                    "borderColor": borderColorLabelValue,
                    "borderWidth": borderWidthLabelValue,
                    "shadowBlur": shadowBlurLabelValue,
                    "shadowColor": shadowColorLabelValue,
                    "shadowOffsetX": shadowOffsetXLabelValue,
                    "shadowOffsetY": shadowOffsetYLabelValue
                ]
                
                expect(label.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let labelByEnums = RadiusAxis.AxisPointer.Label(
                    .show(showLabelValue),
                    .precision(precisionLabelValue),
                    .formatter(formatterLabelValue),
                    .margin(marginLabelValue),
                    .textStyle(textStyleLabelValue),
                    .padding(paddingLabelValue),
                    .backgroundColor(backgroundColorLabelValue),
                    .borderColor(borderColorLabelValue),
                    .borderWidth(borderWidthLabelValue),
                    .shadowBlur(shadowBlurLabelValue),
                    .shadowColor(shadowColorLabelValue),
                    .shadowOffsetX(shadowOffsetXLabelValue),
                    .shadowOffsetY(shadowOffsetYLabelValue)
                )
                
                expect(labelByEnums.jsonString).to(equal(label.jsonString))
            }
        }
    }
}
