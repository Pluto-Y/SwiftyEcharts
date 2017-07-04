//
//  LabelSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class LabelSpec: QuickSpec {
    override func spec() {
        let showValue = false
        let positionValue = Position.value(8%)
        let textStyleValue = TextStyle(
            .align(Position.center),
            .fontSize(8),
            .fontStyle(.normal),
            .color(Color.red)
        )
        
        let normalCommonLabelStyle = CommonLabelStyle()
        normalCommonLabelStyle.show = showValue
        normalCommonLabelStyle.position = positionValue
        normalCommonLabelStyle.textStyle = textStyleValue
        
        describe("For CommonLabelStyle") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showValue,
                    "position": positionValue,
                    "textStyle": textStyleValue
                ]
                expect(normalCommonLabelStyle.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let commonLabelStyleByEnums = CommonLabelStyle(
                    .show(showValue),
                    .position(positionValue),
                    .textStyle(textStyleValue)
                )
                
                expect(commonLabelStyleByEnums.jsonString).to(equal(normalCommonLabelStyle.jsonString))
            }
        }
        
        describe("For Label") { 
            let normalValue = normalCommonLabelStyle
            let emphasisValue = CommonLabelStyle(
                .show(true),
                .position(Position.end)
            )
            
            let label = Label()
            label.normal = normalValue
            label.emphasis = emphasisValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "normal": normalValue,
                    "emphasis": emphasisValue
                ]
                
                expect(label.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let labelByEnums = Label(
                    .normal(normalValue),
                    .emphasis(emphasisValue)
                )
                
                expect(labelByEnums.jsonString).to(equal(labelByEnums.jsonString))
            }
        }
        
        let showValue1 = true
        let positionValue1 = Position.point([5%, 122])
        let formatterValue = Formatter.string("{b}")
        let offsetValue: Point = [5, 100%]
        let textStyleValue1 = TextStyle(
            .color("#eee")
        )
        
        let normalFormattedLabelStyle = FormattedLabelStyle()
        normalFormattedLabelStyle.show = showValue1
        normalFormattedLabelStyle.position = positionValue1
        normalFormattedLabelStyle.formatter = formatterValue
        normalFormattedLabelStyle.offset = offsetValue
        normalFormattedLabelStyle.textStyle = textStyleValue1
        
        describe("For FormattedLabelStyle") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showValue1,
                    "position": positionValue1,
                    "formatter": formatterValue,
                    "offset": offsetValue,
                    "textStyle": textStyleValue1
                ]
                
                expect(normalFormattedLabelStyle.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let formattedLabelStyle = FormattedLabelStyle(
                    .show(showValue1),
                    .position(positionValue1),
                    .formatter(formatterValue),
                    .offset(offsetValue),
                    .textStyle(textStyleValue1)
                )
                
                expect(formattedLabelStyle.jsonString).to(equal(normalFormattedLabelStyle.jsonString))
            }
        }
        
        describe("") { 
            let normalValue = normalFormattedLabelStyle
            let emphasisValue = FormattedLabelStyle(
                .show(false),
                .position(Position.bottom),
                .formatter(.string("{b} $")),
                .offset([2, 100]),
                .textStyle(TextStyle(.fontWeight(.bolder)))
            )
            
            let formattedLabel = FormattedLabel()
            formattedLabel.normal = normalValue
            formattedLabel.emphasis = emphasisValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "normal": normalValue,
                    "emphasis": emphasisValue
                ]
                
                expect(formattedLabel.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let formattedLabelByEnums = FormattedLabel(
                    .normal(normalValue),
                    .emphasis(emphasisValue)
                )
                
                expect(formattedLabelByEnums.jsonString).to(equal(formattedLabel.jsonString))
            }
        }
    }
}
