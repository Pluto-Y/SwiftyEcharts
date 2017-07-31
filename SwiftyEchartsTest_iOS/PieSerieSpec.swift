//
//  PieSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 29/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class PieSerieSpec: QuickSpec {
    override func spec() {
        let showLabelLineContentValue = false
        let lengthLabelLineContentValue: Float = 7.77777
        let length2LabelLineContentValue: Float = 65.374
        let smoothLabelLineContentValue = true
        let lineStyleLabelLineContentValue = LineStyle(
            .curveness(6.485),
            .type(LineType.dashed)
        )
        
        let labelLineContent = PieSerie.LabelLineContent()
        labelLineContent.show = showLabelLineContentValue
        labelLineContent.length = lengthLabelLineContentValue
        labelLineContent.length2 = length2LabelLineContentValue
        labelLineContent.smooth = smoothLabelLineContentValue
        labelLineContent.lineStyle = lineStyleLabelLineContentValue
        
        describe("For PieSerie.LabelLineContent") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showLabelLineContentValue,
                    "length": lengthLabelLineContentValue,
                    "length2": length2LabelLineContentValue,
                    "smooth": smoothLabelLineContentValue,
                    "lineStyle": lineStyleLabelLineContentValue
                ]
                
                expect(labelLineContent.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let labelLineContentByEnums = PieSerie.LabelLineContent(
                    .show(showLabelLineContentValue),
                    .length(lengthLabelLineContentValue),
                    .length2(length2LabelLineContentValue),
                    .smooth(smoothLabelLineContentValue),
                    .lineStyle(lineStyleLabelLineContentValue)
                )
                
                expect(labelLineContentByEnums.jsonString).to(equal(labelLineContent.jsonString))
            }
        }
        
        let normalLabelLineValue = labelLineContent
        let emphasisLabelLineValue = PieSerie.LabelLineContent(
            .show(true),
            .length(7.472),
            .length2(47.373),
            .smooth(false),
            .lineStyle(LineStyle())
        )
        
        let labelLine = PieSerie.LabelLine()
        labelLine.normal = normalLabelLineValue
        labelLine.emphasis = emphasisLabelLineValue
        
        describe("For PieSerie.LabelLien") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "normal": normalLabelLineValue,
                    "emphasis": emphasisLabelLineValue
                ]
                
                expect(labelLine.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let labelLineByEnums = PieSerie.LabelLine(
                    .normal(normalLabelLineValue),
                    .emphasis(emphasisLabelLineValue)
                )
                
                expect(labelLineByEnums.jsonString).to(equal(labelLine.jsonString))
            }
        }
        
        describe("For PieSerie.AnimationType") {
            let expansionString = "expansion"
            let scaleString = "scale"
            
            let expansionAnimationType = PieSerie.AnimationType.expansion
            let scaleAnimationType = PieSerie.AnimationType.scale
            
            it("needs to check the jsonString") {
                expect(expansionAnimationType.jsonString).to(equal(expansionString.jsonString))
                expect(scaleAnimationType.jsonString).to(equal(scaleString.jsonString))
            }
        }
        
        let nameDataValue = "pieSerieDataNameValue"
        let valueDataValue: Float = 285.75
        let selectedDataValue = false
        let labelDataValue = Label(
            .emphasis(CommonLabelStyle(
                .show(true),
                .position(Position.center),
                .textStyle(TextStyle())
            )),
            .normal(CommonLabelStyle(
                .show(false)
            ))
        )
        let labelLineDataValue = labelLine
        let itemStyleDataValue = ItemStyle(
            .emphasis(CommonItemStyleContent(
                .areaColor(.hexColor("#ffffff"))
                )),
            .normal(CommonItemStyleContent(
                .color(.hexColor("#000000"))
                ))
        )
        
        let data = PieSerie.Data()
        data.name = nameDataValue
        data.value = valueDataValue
        data.selected = selectedDataValue
        data.label = labelDataValue
        data.labelLine = labelLineDataValue
        data.itemStyle = itemStyleDataValue
        
        describe("For PieSerie.Data") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameDataValue,
                    "value": valueDataValue,
                    "selected": selectedDataValue,
                    "label": labelDataValue,
                    "labelLine": labelLineDataValue,
                    "itemStyle": itemStyleDataValue
                ]

                expect(data.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let dataByEnums = PieSerie.Data(
                    .name(nameDataValue),
                    .value(valueDataValue),
                    .selected(selectedDataValue),
                    .label(labelDataValue),
                    .labelLine(labelLineDataValue),
                    .itemStyle(itemStyleDataValue)
                )
                
                expect(dataByEnums.jsonString).to(equal(data.jsonString))
            }
        }
        
        describe("For PieSerie.RoseType") {
            let enableString = "true"
            let disableString = "false"
            let radiusString = "radius"
            let areaString = "area"
            
            let enableRoseType = PieSerie.RoseType.enable
            let disableRoseType = PieSerie.RoseType.disable
            let radiusRoseType = PieSerie.RoseType.radius
            let areaRoseType = PieSerie.RoseType.area
            
            it("needs to check the enum case jsonString") {
                expect(enableRoseType.jsonString).to(equal(enableString))
                expect(disableRoseType.jsonString).to(equal(disableString))
                expect(radiusRoseType.jsonString).to(equal(radiusString.jsonString))
                expect(areaRoseType.jsonString).to(equal(areaString.jsonString))
            }
            
            it("needs to check the BooleanLiteralConvertible") {
                let trueRoseType: PieSerie.RoseType = true
                let falseRoseType: PieSerie.RoseType = false
                
                expect(trueRoseType.jsonString).to(equal(enableRoseType.jsonString))
                expect(falseRoseType.jsonString).to(equal(disableRoseType.jsonString))
            }
        }
        
        describe("For PieSerie.AnimationType") { 
            let expansionString = "expansion"
            let scaleString = "scale"
            
            let expansionAnimationType = PieSerie.AnimationType.expansion
            let scaleAnimationType = PieSerie.AnimationType.scale
            
            it("needs to check the enum case jsonString") {
                expect(expansionAnimationType.jsonString).to(equal(expansionString.jsonString))
                expect(scaleAnimationType.jsonString).to(equal(scaleString.jsonString))
            }
        }
    }
}
