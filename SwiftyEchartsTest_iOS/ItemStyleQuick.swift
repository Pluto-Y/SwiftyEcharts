//
//  ItemStyleQuick.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class ItemStyleQuick: QuickSpec {
    override func spec() {
        describe("For CommonItemStyleContent") {
            let color = Color.rgb(172, 87, 29)
            let borderColor = Color.hexColor("#fff")
            let borderWidth: Float = 78.0
            let borderType = LineType.dashed
            let shadowBlur = Float(0.8)
            let shadowColor = Color.red
            let shadowOffsetX: Float = 8.7
            let shadowOffsetY: Float = 100.0
            let opacity: Float = 0.97
            let barBorderRadius: Float = 28.8
            
            let commonItemStyleContentNormal = CommonItemStyleContent()
            commonItemStyleContentNormal.color = color
            commonItemStyleContentNormal.borderColor = borderColor
            commonItemStyleContentNormal.borderWidth = borderWidth
            commonItemStyleContentNormal.borderType = borderType
            commonItemStyleContentNormal.shadowBlur = shadowBlur
            commonItemStyleContentNormal.shadowColor = shadowColor
            commonItemStyleContentNormal.shadowOffsetX = shadowOffsetX
            commonItemStyleContentNormal.shadowOffsetY = shadowOffsetY
            commonItemStyleContentNormal.opacity = opacity
            commonItemStyleContentNormal.barBorderRadius = barBorderRadius
            
            it(" needs to check Mappable ") {
                let dic: [String: Jsonable] = [
                    "color": color,
                    "borderColor": borderColor,
                    "borderWidth": borderWidth,
                    "borderType": borderType,
                    "shadowBlur": shadowBlur,
                    "shadowColor": shadowColor,
                    "shadowOffsetX": shadowOffsetX,
                    "shadowOffsetY": shadowOffsetY,
                    "opacity": opacity,
                    "barBorderRadius": barBorderRadius
                ]
                expect(commonItemStyleContentNormal.jsonString).to(equal(dic.jsonString))
            }
            
            it(" needs to check Enumable ") {
                let commonItemStyleContentByEnums = CommonItemStyleContent(
                    .color(color),
                    .borderColor(borderColor),
                    .borderWidth(borderWidth),
                    .borderType(borderType),
                    .shadowBlur(shadowBlur),
                    .shadowColor(shadowColor),
                    .shadowOffsetX(shadowOffsetX),
                    .shadowOffsetY(shadowOffsetY),
                    .opacity(opacity),
                    .barBorderRadius(barBorderRadius)
                )
                
                expect(commonItemStyleContentByEnums.jsonString).to(equal(commonItemStyleContentNormal.jsonString))
            }
        }
    }
}
