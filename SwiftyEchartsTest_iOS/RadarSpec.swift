//
//  RadarSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 02/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class RadarSpec: QuickSpec {
    override func spec() {
        let showNameValue = false
        let formatterNameValue: Formatter = .string("nameFormatterValue")
        let textStyleNameValue = TextStyle(
            .color(Color.transparent),
            .fontWeight(.lighter),
            .fontSize(20)
        )
        
        let name = Radar.Name()
        name.show = showNameValue
        name.formatter = formatterNameValue
        name.textStyle = textStyleNameValue
        
        describe("For Radar.Name") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showNameValue,
                    "formatter": formatterNameValue,
                    "textStyle": textStyleNameValue
                ]
                
                expect(name.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let nameByEnums = Radar.Name(
                    .show(showNameValue),
                    .formatter(formatterNameValue),
                    .textStyle(textStyleNameValue)
                )
                
                expect(nameByEnums.jsonString).to(equal(name.jsonString))
            }
        }
        
        describe("For Radar.Shape") {
            let polygonString = "polygon"
            let circleString = "circle"
            
            let polygonShape = Radar.Shape.polygon
            let circleShape = Radar.Shape.circle
            
            it("needs to check the enum case jsonString") {
                expect(polygonShape.jsonString).to(equal(polygonString.jsonString))
                expect(circleShape.jsonString).to(equal(circleString.jsonString))
            }
        }
        
        let nameIndicatorValue = "销售（sales）"
        let maxIndicatorValue: Float = 6500
        let minIndicatorValue: Float = 1005
        
        let indicator = Radar.Indicator()
        indicator.name = nameIndicatorValue
        indicator.max = maxIndicatorValue
        indicator.min = minIndicatorValue
        
        describe("For Radar.Indicator") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameIndicatorValue,
                    "max": maxIndicatorValue,
                    "min": minIndicatorValue
                ]
                
                expect(indicator.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let indicatorByEnums = Radar.Indicator(
                    .name(nameIndicatorValue),
                    .max(maxIndicatorValue),
                    .min(minIndicatorValue)
                )
                
                expect(indicatorByEnums.jsonString).to(equal(indicator.jsonString))
            }
        }
    }
}
