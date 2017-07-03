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
    }
}
