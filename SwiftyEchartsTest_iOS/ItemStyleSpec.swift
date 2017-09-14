//
//  ItemStyleSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class ItemStyleSpec: QuickSpec {
    override func spec() {
        let color = Color.rgb(172, 87, 29)
        let color0 = Color.hexColor("0CF49B")
        let borderColor = Color.hexColor("#fff")
        let borderColor0 = color0
        let borderWidth: Float = 78.0
        let borderType = LineType.dashed
        let shadowBlur = Float(0.8)
        let shadowColor = Color.red
        let shadowOffsetX: Float = 8.7
        let shadowOffsetY: Float = 100.0
        let opacity: Float = 0.97
        let barBorderRadius: Float = 28.8
        let areaColor = Color.auto
        
        let commonItemStyleContentNormal = CommonItemStyleContent()
        commonItemStyleContentNormal.color = color
        commonItemStyleContentNormal.color0 = color0
        commonItemStyleContentNormal.borderColor = borderColor
        commonItemStyleContentNormal.borderColor0 = borderColor0
        commonItemStyleContentNormal.borderWidth = borderWidth
        commonItemStyleContentNormal.borderType = borderType
        commonItemStyleContentNormal.shadowBlur = shadowBlur
        commonItemStyleContentNormal.shadowColor = shadowColor
        commonItemStyleContentNormal.shadowOffsetX = shadowOffsetX
        commonItemStyleContentNormal.shadowOffsetY = shadowOffsetY
        commonItemStyleContentNormal.opacity = opacity
        commonItemStyleContentNormal.barBorderRadius = barBorderRadius
        commonItemStyleContentNormal.areaColor = areaColor
        
        describe("For CommonItemStyleContent") {
            it("needs to check Mappable") {
                let dic: [String: Jsonable] = [
                    "color": color,
                    "color0": color0,
                    "borderColor": borderColor,
                    "borderColor0": borderColor0,
                    "borderWidth": borderWidth,
                    "borderType": borderType,
                    "shadowBlur": shadowBlur,
                    "shadowColor": shadowColor,
                    "shadowOffsetX": shadowOffsetX,
                    "shadowOffsetY": shadowOffsetY,
                    "opacity": opacity,
                    "barBorderRadius": barBorderRadius,
                    "areaColor": areaColor
                ]
                expect(commonItemStyleContentNormal.jsonString).to(equal(dic.jsonString))
            }
            
            it("needs to check Enumable") {
                let commonItemStyleContentByEnums = CommonItemStyleContent(
                    .color(color),
                    .color0(color0),
                    .borderColor(borderColor),
                    .borderColor0(borderColor0),
                    .borderWidth(borderWidth),
                    .borderType(borderType),
                    .shadowBlur(shadowBlur),
                    .shadowColor(shadowColor),
                    .shadowOffsetX(shadowOffsetX),
                    .shadowOffsetY(shadowOffsetY),
                    .opacity(opacity),
                    .barBorderRadius(barBorderRadius),
                    .areaColor(areaColor)
                )
                
                expect(commonItemStyleContentByEnums.jsonString).to(equal(commonItemStyleContentNormal.jsonString))
            }
        }
        
        describe("For ItemStyle") {
            let commonItemStyleContentEmphasis = CommonItemStyleContent(
                .color(Color.auto),
                .borderColor(Color.array(["#fff", "#f00", "#0f0", "#00f"])),
                .borderWidth(12),
                .borderType(.solid),
                .shadowBlur(8.88),
                .shadowColor(Color.green),
                .shadowOffsetX(99),
                .shadowOffsetY(0),
                .opacity(0.12),
                .barBorderRadius(3),
                .areaColor(Color.hexColor("#999"))
            )
            
            let emphasisItemStyle = ItemStyle(
                .normal(commonItemStyleContentNormal),
                .emphasis(commonItemStyleContentEmphasis)
            )
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "normal": commonItemStyleContentNormal,
                    "emphasis": commonItemStyleContentEmphasis
                ]
                
                expect(emphasisItemStyle.jsonString).to(equal(resultDic.jsonString))
            }
        }
    }
}
