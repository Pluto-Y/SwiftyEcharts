//
//  ParallelAxisSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 26/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class ParallelAxisSpec: QuickSpec {
    override func spec() {
        let widthAreaSelectStyleValue: Float = 28573.2
        let borderWidthAreaSelectStyleValue: Float = 2.0
        let borderColorAreaSelectStyleValue = Color.rgb(200, 5, 202)
        let colorAreaSelectStyleValue = Color.array([rgb(102, 47, 274), Color.hexColor("#285244")])
        let opacityAreaSelectStyleValue: Float = 0.9375
        
        let areaSelectStyle = ParallelAxis.AreaSelectStyle()
        areaSelectStyle.width = widthAreaSelectStyleValue
        areaSelectStyle.borderWidth = borderWidthAreaSelectStyleValue
        areaSelectStyle.borderColor = borderColorAreaSelectStyleValue
        areaSelectStyle.color = colorAreaSelectStyleValue
        areaSelectStyle.opacity = opacityAreaSelectStyleValue
        
        describe("For ParallelAxis") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "width": widthAreaSelectStyleValue,
                    "borderWidth": borderWidthAreaSelectStyleValue,
                    "borderColor": borderColorAreaSelectStyleValue,
                    "color": colorAreaSelectStyleValue,
                    "opacity": opacityAreaSelectStyleValue
                ]
                
                expect(areaSelectStyle.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let areaSelectStyleByEnums = ParallelAxis.AreaSelectStyle(
                    .width(widthAreaSelectStyleValue),
                    .borderWidth(borderWidthAreaSelectStyleValue),
                    .borderColor(borderColorAreaSelectStyleValue),
                    .color(colorAreaSelectStyleValue),
                    .opacity(opacityAreaSelectStyleValue)
                )
                
                expect(areaSelectStyleByEnums.jsonString).to(equal(areaSelectStyle.jsonString))
            }
        }
    }
}
