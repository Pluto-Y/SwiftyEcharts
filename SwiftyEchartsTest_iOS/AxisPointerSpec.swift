//
//  AxisPointerSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 26/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class AxisPointerSpec: QuickSpec {
    override func spec() {
        describe("For AxisPointerForTooltip.Type") {
            let lineString = "line"
            let crossString = "cross"
            let shadowString = "shadow"
            let noneString = "none"
            
            let lineType = SwiftyEcharts.AxisPointerForTooltip.Type.line
            let crossType = SwiftyEcharts.AxisPointerForTooltip.Type.cross
            let shadowType = SwiftyEcharts.AxisPointerForTooltip.Type.shadow
            let noneType = SwiftyEcharts.AxisPointerForTooltip.Type.none

            it("needs to check the enum case jsonString") {
                expect(lineType.jsonString).to(equal(lineString.jsonString))
                expect(crossType.jsonString).to(equal(crossString.jsonString))
                expect(shadowType.jsonString).to(equal(shadowString.jsonString))
                expect(noneType.jsonString).to(equal(noneString.jsonString))
            }
        }
        
        describe("For AxisPointerForTooltip.Axis") {
            let xString = "x"
            let yString = "y"
            let radiusString = "radius"
            let angleString = "angle"
            let autoString = "auto"
            
            let xAxis = AxisPointerForTooltip.Axis.x
            let yAxis = AxisPointerForTooltip.Axis.y
            let radiusAxis = AxisPointerForTooltip.Axis.radius
            let angleAxis = AxisPointerForTooltip.Axis.angle
            let autoAxis = AxisPointerForTooltip.Axis.auto
            
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
        
        let crossStyle = AxisPointerForTooltip.CrossStyle()
        crossStyle.color = colorCrossStyleValue
        crossStyle.width = widthCrossStyleValue
        crossStyle.type = typeCrossStyleValue
        crossStyle.shadowBlur = shadowBlurCrossStyleValue
        crossStyle.shadowColor = shadowColorCrossStyleValue
        crossStyle.shadowOffsetX = shadowOffsetXCrossStyleValue
        crossStyle.shadowOffsetY = shadowOffsetYCrossStyleValue
        crossStyle.textStyle = textStyleCrossStyleValue
        
        describe("For AxisPointerForTooltip.CrossStyle") {
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
                let crossStyleByEnums = AxisPointerForTooltip.CrossStyle(
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
        
        let typeAxisPointerForTooltipValue = SwiftyEcharts.AxisPointerForTooltip.Type.cross
        let axisAxisPointerForTooltipValue = AxisPointerForTooltip.Axis.angle
        let animationAxisPointerForTooltipValue = false
        let animationThresholdAxisPointerForTooltipValue: Float = 0.000000
        let animationDurationAxisPointerForTooltipValue = Time.number(764.7777)
        let animationEasingAxisPointerForTooltipValue = EasingFunction.quarticInOut
        let animationDelayAxisPointerForTooltipValue: Time = 88
        let animationDurationUpdateAxisPointerForTooltipValue: Time = 75.37
        let animationEasingUpdateAxisPointerForTooltipValue: EasingFunction = .cubicInOut
        let animationDelayUpdateAxisPointerForTooltipValue = Time.init(integerLiteral: 84723)
        let lineStyleAxisPointerForTooltipValue = LineStyle(
            .width(7.247),
            .color(rgb(88, 102, 200)),
            .curveness(888.8888),
            .type(LineType.solid)
        )
        let crossStyleAxisPointerForTooltipValue = crossStyle
        let shadowStyleAxisPointerForTooltipValue = ShadowStyle(
            .shadowBlur(10),
            .shadowColor(rgba(0, 0, 0, 0.5))
        )
        
        let axisPointer = AxisPointerForTooltip()
        axisPointer.type = typeAxisPointerForTooltipValue
        axisPointer.axis = axisAxisPointerForTooltipValue
        axisPointer.animation = animationAxisPointerForTooltipValue
        axisPointer.animationThreshold = animationThresholdAxisPointerForTooltipValue
        axisPointer.animationDuration = animationDurationAxisPointerForTooltipValue
        axisPointer.animationEasing = animationEasingAxisPointerForTooltipValue
        axisPointer.animationDelay = animationDelayAxisPointerForTooltipValue
        axisPointer.animationDurationUpdate = animationDurationUpdateAxisPointerForTooltipValue
        axisPointer.animationEasingUpdate = animationEasingUpdateAxisPointerForTooltipValue
        axisPointer.animationDelayUpdate = animationDelayUpdateAxisPointerForTooltipValue
        axisPointer.lineStyle = lineStyleAxisPointerForTooltipValue
        axisPointer.crossStyle = crossStyleAxisPointerForTooltipValue
        axisPointer.shadowStyle = shadowStyleAxisPointerForTooltipValue
        
        describe("For AxisPointerForTooltip") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": typeAxisPointerForTooltipValue,
                    "axis": axisAxisPointerForTooltipValue,
                    "animation": animationAxisPointerForTooltipValue,
                    "animationThreshold": animationThresholdAxisPointerForTooltipValue,
                    "animationDuration": animationDurationAxisPointerForTooltipValue,
                    "animationEasing": animationEasingAxisPointerForTooltipValue,
                    "animationDelay": animationDelayAxisPointerForTooltipValue,
                    "animationDurationUpdate": animationDurationUpdateAxisPointerForTooltipValue,
                    "animationEasingUpdate": animationEasingUpdateAxisPointerForTooltipValue,
                    "animationDelayUpdate": animationDelayUpdateAxisPointerForTooltipValue,
                    "lineStyle": lineStyleAxisPointerForTooltipValue,
                    "crossStyle": crossStyleAxisPointerForTooltipValue,
                    "shadowStyle": shadowStyleAxisPointerForTooltipValue
                ]
                
                expect(axisPointer.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let axisPointerByEnums = AxisPointerForTooltip(
                    .type(typeAxisPointerForTooltipValue),
                    .axis(axisAxisPointerForTooltipValue),
                    .animation(animationAxisPointerForTooltipValue),
                    .animationThreshold(animationThresholdAxisPointerForTooltipValue),
                    .animationDuration(animationDurationAxisPointerForTooltipValue),
                    .animationEasing(animationEasingAxisPointerForTooltipValue),
                    .animationDelay(animationDelayAxisPointerForTooltipValue),
                    .animationDurationUpdate(animationDurationUpdateAxisPointerForTooltipValue),
                    .animationEasingUpdate(animationEasingUpdateAxisPointerForTooltipValue),
                    .animationDelayUpdate(animationDelayUpdateAxisPointerForTooltipValue),
                    .lineStyle(lineStyleAxisPointerForTooltipValue),
                    .crossStyle(crossStyleAxisPointerForTooltipValue),
                    .shadowStyle(shadowStyleAxisPointerForTooltipValue)
                )
                
                expect(axisPointerByEnums.jsonString).to(equal(axisPointer.jsonString))
            }
        }
    }
}
