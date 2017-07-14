//
//  GaugeSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 13/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class GaugeSerieSpec: QuickSpec {
    override func spec() {
        let showAxisTickValue = false
        let splitNumberAxisTickValue: UInt8 = 20
        let lengthAxisTickValue: LengthValue = 20%
        let lineStyleAxisTickValue = LineStyle(
            .width(8)
        )
        
        let axisTick = GaugeSerie.AxisTick()
        axisTick.show = showAxisTickValue
        axisTick.splitNumber = splitNumberAxisTickValue
        axisTick.length = lengthAxisTickValue
        axisTick.lineStyle = lineStyleAxisTickValue
        
        describe("For GaugeSerie.AxisTick") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showAxisTickValue,
                    "splitNumber": splitNumberAxisTickValue,
                    "length": lengthAxisTickValue,
                    "lineStyle": lineStyleAxisTickValue
                ]

                expect(axisTick.jsonString).to(equal(resultDic.jsonString))
            }

            it("needs to check the Enumable") {
                let axisTickByEnums = GaugeSerie.AxisTick(
                    .show(showAxisTickValue),
                    .splitNumber(splitNumberAxisTickValue),
                    .length(lengthAxisTickValue),
                    .lineStyle(lineStyleAxisTickValue)
                )
                
                expect(axisTickByEnums.jsonString).to(equal(axisTick.jsonString))
            }
        }
        
        let showAxisLabelValue = true
        let distanceAxisLabelValue: Float = 0.5
        let formatterAxisLabelValue = Formatter.string("{value} ml")
        let textStyleAxisLabelValue = TextStyle(
            .color("#fff"),
            .fontSize(16)
        )
        let colorAxisLabelValue = Color.hexColor("#5a5a5a")
        
        let axisLabel = GaugeSerie.AxisLabel()
        axisLabel.show = showAxisLabelValue
        axisLabel.distance = distanceAxisLabelValue
        axisLabel.formatter = formatterAxisLabelValue
        axisLabel.textStyle = textStyleAxisLabelValue
        axisLabel.color = colorAxisLabelValue
        
        describe("For GaugeSerie.AxisLabel") {
            it("needs to check the jsonString") {
                let resutlDic: [String: Jsonable] = [
                    "show": showAxisLabelValue,
                    "distance": distanceAxisLabelValue,
                    "formatter": formatterAxisLabelValue,
                    "textStyle": textStyleAxisLabelValue,
                    "color": colorAxisLabelValue
                ]
                
                expect(axisLabel.jsonString).to(equal(resutlDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let axisLabelByEnums = GaugeSerie.AxisLabel(
                    .show(showAxisLabelValue),
                    .distance(distanceAxisLabelValue),
                    .formatter(formatterAxisLabelValue),
                    .textStyle(textStyleAxisLabelValue),
                    .color(colorAxisLabelValue)
                )
                
                expect(axisLabelByEnums.jsonString).to(equal(axisLabel.jsonString))
            }
        }
        
        let showPointerValue = false
        let lengthPointerValue: LengthValue = 2.52
        let widthPointerValue: Float = 2.55
        
        let pointer = GaugeSerie.Pointer()
        pointer.show = showPointerValue
        pointer.length = lengthPointerValue
        pointer.width = widthPointerValue
        
        describe("For GaugeSerie.Pointer") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showPointerValue,
                    "length": lengthPointerValue,
                    "width": widthPointerValue
                ]
                
                expect(pointer.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let pointerByEnums = GaugeSerie.Pointer(
                    .show(showPointerValue),
                    .length(lengthPointerValue),
                    .width(widthPointerValue)
                )
                
                expect(pointerByEnums.jsonString).to(equal(pointer.jsonString))
            }
        }
        
        let showTitleValue = false
        let offsetCenterTitleValue: Point = [20, 30%]
        let textStyleTitleValue = TextStyle(
            .color(Color.hexColor("#f4f4f4")),
            .fontStyle(FontStyle.normal),
            .fontWeight(.lighter),
            .fontFamily("fontFamilyValue"),
            .fontSize(23),
            .align(Position.center)
        )
        
        let title = GaugeSerie.Title()
        title.show = showTitleValue
        title.offsetCenter = offsetCenterTitleValue
        title.textStyle = textStyleTitleValue
        
        describe("For GaugeSerie.Title") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showTitleValue,
                    "offsetCenter": offsetCenterTitleValue,
                    "textStyle": textStyleTitleValue
                ]
                
                expect(title.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let titleByEnums = GaugeSerie.Title(
                    .show(showTitleValue),
                    .offsetCenter(offsetCenterTitleValue),
                    .textStyle(textStyleTitleValue)
                )
                
                expect(titleByEnums.jsonString).to(equal(title.jsonString))
            }
        }
        
        let showDetailValue = true
        let widthDetailValue: Float = 28.482
        let heightDetailValue: Float = 274.23
        let backgroundColorDetailValue = Color.auto
        let borderWidthDetailValue: Float = 0.5
        let borderColorDetailValue = Color.yellow
        let offsetCenterDetailValue = Point([0, 0%])
        let formatterDetailValue = Formatter.string("formatterValue")
        let textStyleDetailValue = TextStyle(
            .align(Position.auto)
        )
        
        let detail = GaugeSerie.Detail()
        detail.show = showDetailValue
        detail.width = widthDetailValue
        detail.height = heightDetailValue
        detail.backgroundColor = backgroundColorDetailValue
        detail.borderWidth = borderWidthDetailValue
        detail.borderColor = borderColorDetailValue
        detail.offsetCenter = offsetCenterDetailValue
        detail.formatter = formatterDetailValue
        detail.textStyle = textStyleDetailValue
        
        describe("For GaugeSerie.Detail") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showDetailValue,
                    "width": widthDetailValue,
                    "height": heightDetailValue,
                    "backgroundColor": backgroundColorDetailValue,
                    "borderWidth": borderWidthDetailValue,
                    "borderColor": borderColorDetailValue,
                    "offsetCenter": offsetCenterDetailValue,
                    "formatter": formatterDetailValue,
                    "textStyle": textStyleDetailValue
                ]
                
                expect(detail.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let detailByEnums = GaugeSerie.Detail(
                    .show(showDetailValue),
                    .width(widthDetailValue),
                    .height(heightDetailValue),
                    .backgroundColor(backgroundColorDetailValue),
                    .borderWidth(borderWidthDetailValue),
                    .borderColor(borderColorDetailValue),
                    .offsetCenter(offsetCenterDetailValue),
                    .formatter(formatterDetailValue),
                    .textStyle(textStyleDetailValue)
                )
                
                expect(detailByEnums.jsonString).to(equal(detail.jsonString))
            }
        }
    }
}
