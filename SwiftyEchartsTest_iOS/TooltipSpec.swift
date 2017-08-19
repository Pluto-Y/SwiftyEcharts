//
//  TooltipSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 26/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class TooltipSpec: QuickSpec {
    override func spec() {
        describe("For Tooltip.Trigger.TriggerOn") {
            let mousemoveString = "mousemove"
            let clickString = "click"
            let noneString = "none"
            
            let mousemoveTriggerOn = Tooltip.Trigger.TriggerOn.mousemove
            let clickTriggerOn = Tooltip.Trigger.TriggerOn.click
            let noneTriggerOn = Tooltip.Trigger.TriggerOn.none
            
            it("needs to check the enum case jsonString") {
                expect(mousemoveTriggerOn.jsonString).to(equal(mousemoveString.jsonString))
                expect(clickTriggerOn.jsonString).to(equal(clickString.jsonString))
                expect(noneTriggerOn.jsonString).to(equal(noneString.jsonString))
            }
        }
        
        describe("For Tooltip.Trigger") {
            let itemString = "item"
            let axisString = "axis"
            
            let itemTrigger = Tooltip.Trigger.item
            let axisTrigger = Tooltip.Trigger.axis
            
            it("needs to check the enum case jsonString") {
                expect(itemTrigger.jsonString).to(equal(itemString.jsonString))
                expect(axisTrigger.jsonString).to(equal(axisString.jsonString))
            }
        }
        
        describe("For Tooltip.AxisPointer.Type") {
            let lineString = "line"
            let crossString = "cross"
            let shadowString = "shadow"
            let noneString = "none"
            
            let lineType = Tooltip.AxisPointer.Type.line
            let crossType = Tooltip.AxisPointer.Type.cross
            let shadowType = Tooltip.AxisPointer.Type.shadow
            let noneType = Tooltip.AxisPointer.Type.none
            
            it("needs to check the enum case jsonString") {
                expect(lineType.jsonString).to(equal(lineString.jsonString))
                expect(crossType.jsonString).to(equal(crossString.jsonString))
                expect(shadowType.jsonString).to(equal(shadowString.jsonString))
                expect(noneType.jsonString).to(equal(noneString.jsonString))
            }
        }
        
        describe("For Tooltip.AxisPointer.Axis") {
            let xString = "x"
            let yString = "y"
            let radiusString = "radius"
            let angleString = "angle"
            let autoString = "auto"
            
            let xAxis = Tooltip.AxisPointer.Axis.x
            let yAxis = Tooltip.AxisPointer.Axis.y
            let radiusAxis = Tooltip.AxisPointer.Axis.radius
            let angleAxis = Tooltip.AxisPointer.Axis.angle
            let autoAxis = Tooltip.AxisPointer.Axis.auto
            
            it("needs to check the enum case jsonString") {
                expect(xAxis.jsonString).to(equal(xString.jsonString))
                expect(yAxis.jsonString).to(equal(yString.jsonString))
                expect(radiusAxis.jsonString).to(equal(radiusString.jsonString))
                expect(angleAxis.jsonString).to(equal(angleString.jsonString))
                expect(autoAxis.jsonString).to(equal(autoString.jsonString))
            }
        }
        
        let colorCrossStyleValue = Color.hexColor("#87fabe")
        let widthCrossStyleValue: Float = 85.347
        let typeCrossStyleValue = LineType.dashed
        let shadowBlurCrossStyleValue: Float = 985479
        let shadowColorCrossStyleValue = Color.auto
        let shadowOffsetXCrossStyleValue: Float = 0
        let shadowOffsetYCrossStyleValue: Float = 0.0000038747238
        let textStyleCrossStyleValue = TextStyle(
            .color(Color.blue),
            .fontStyle(FontStyle.italic),
            .fontSize(75)
        )
        
        let crossStyle = Tooltip.AxisPointer.CrossStyle()
        crossStyle.color = colorCrossStyleValue
        crossStyle.width = widthCrossStyleValue
        crossStyle.type = typeCrossStyleValue
        crossStyle.shadowBlur = shadowBlurCrossStyleValue
        crossStyle.shadowColor = shadowColorCrossStyleValue
        crossStyle.shadowOffsetX = shadowOffsetXCrossStyleValue
        crossStyle.shadowOffsetY = shadowOffsetYCrossStyleValue
        crossStyle.textStyle = textStyleCrossStyleValue
        
        describe("For Tooltip.AxisPointer.CrossStyle") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "color": colorCrossStyleValue,
                    "width": widthCrossStyleValue,
                    "type": typeCrossStyleValue,
                    "shadowBlur": shadowBlurCrossStyleValue,
                    "shadowColor": shadowColorCrossStyleValue,
                    "shadowOffsetX": shadowOffsetXCrossStyleValue,
                    "shadowOffsetY": shadowOffsetYCrossStyleValue,
                    "textStyle": textStyleCrossStyleValue
                ]
                
                expect(crossStyle.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let crossStyleByEnums = Tooltip.AxisPointer.CrossStyle(
                    .color(colorCrossStyleValue),
                    .width(widthCrossStyleValue),
                    .type(typeCrossStyleValue),
                    .shadowBlur(shadowBlurCrossStyleValue),
                    .shadowColor(shadowColorCrossStyleValue),
                    .shadowOffsetX(shadowOffsetXCrossStyleValue),
                    .shadowOffsetY(shadowOffsetYCrossStyleValue),
                    .textStyle(textStyleCrossStyleValue)
                )
                
                expect(crossStyleByEnums.jsonString).to(equal(crossStyle.jsonString))
            }
        }
    }
}
