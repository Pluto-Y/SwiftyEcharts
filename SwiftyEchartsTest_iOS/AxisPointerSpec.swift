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
        describe("For AxisPointer.Type") {
            let lineString = "line"
            let crossString = "cross"
            let shadowString = "shadow"
            let noneString = "none"
            
            let lineType = SwiftyEcharts.AxisPointer.Type.line
            let crossType = SwiftyEcharts.AxisPointer.Type.cross
            let shadowType = SwiftyEcharts.AxisPointer.Type.shadow
            let noneType = SwiftyEcharts.AxisPointer.Type.none

            it("needs to check the enum case jsonString") {
                expect(lineType.jsonString).to(equal(lineString.jsonString))
                expect(crossType.jsonString).to(equal(crossString.jsonString))
                expect(shadowType.jsonString).to(equal(shadowString.jsonString))
                expect(noneType.jsonString).to(equal(noneString.jsonString))
            }
        }
        
        describe("For AxisPointer.Axis") {
            let xString = "x"
            let yString = "y"
            let radiusString = "radius"
            let angleString = "angle"
            let autoString = "auto"
            
            let xAxis = AxisPointer.Axis.x
            let yAxis = AxisPointer.Axis.y
            let radiusAxis = AxisPointer.Axis.radius
            let angleAxis = AxisPointer.Axis.angle
            let autoAxis = AxisPointer.Axis.auto
            
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
        
        let crossStyle = AxisPointer.CrossStyle()
        crossStyle.color = colorCrossStyleValue
        crossStyle.width = widthCrossStyleValue
        crossStyle.type = typeCrossStyleValue
        crossStyle.shadowBlur = shadowBlurCrossStyleValue
        crossStyle.shadowColor = shadowColorCrossStyleValue
        crossStyle.shadowOffsetX = shadowOffsetXCrossStyleValue
        crossStyle.shadowOffsetY = shadowOffsetYCrossStyleValue
        crossStyle.textStyle = textStyleCrossStyleValue
        
        describe("For AxisPointer.CrossStyle") {
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
                let crossStyleByEnums = AxisPointer.CrossStyle(
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
        
        let typeAxisPointerValue = SwiftyEcharts.AxisPointer.Type.cross
        let axisAxisPointerValue = AxisPointer.Axis.angle
        let animationAxisPointerValue = false
        let animationThresholdAxisPointerValue: Float = 0.000000
        let animationDurationAxisPointerValue = Time.number(764.7777)
        let animationEasingAxisPointerValue = EasingFunction.quarticInOut
        let animationDelayAxisPointerValue: Time = 88
        let animationDurationUpdateAxisPointerValue: Time = 75.37
        let animationEasingUpdateAxisPointerValue: EasingFunction = .cubicInOut
        let animationDelayUpdateAxisPointerValue = Time.init(integerLiteral: 84723)
        let lineStyleAxisPointerValue = LineStyle(
            .width(7.247),
            .color(rgb(88, 102, 200)),
            .curveness(888.8888),
            .type(LineType.solid)
        )
        let crossStyleAxisPointerValue = crossStyle
        let shadowStyleAxisPointerValue = ShadowStyle(
            .shadowBlur(10),
            .shadowColor(rgba(0, 0, 0, 0.5))
        )
        
        let axisPointer = AxisPointer()
        axisPointer.type = typeAxisPointerValue
        axisPointer.axis = axisAxisPointerValue
        axisPointer.animation = animationAxisPointerValue
        axisPointer.animationThreshold = animationThresholdAxisPointerValue
        axisPointer.animationDuration = animationDurationAxisPointerValue
        axisPointer.animationEasing = animationEasingAxisPointerValue
        axisPointer.animationDelay = animationDelayAxisPointerValue
        axisPointer.animationDurationUpdate = animationDurationUpdateAxisPointerValue
        axisPointer.animationEasingUpdate = animationEasingUpdateAxisPointerValue
        axisPointer.animationDelayUpdate = animationDelayUpdateAxisPointerValue
        axisPointer.lineStyle = lineStyleAxisPointerValue
        axisPointer.crossStyle = crossStyleAxisPointerValue
        axisPointer.shadowStyle = shadowStyleAxisPointerValue
        
        describe("For AxisPointer") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": typeAxisPointerValue,
                    "axis": axisAxisPointerValue,
                    "animation": animationAxisPointerValue,
                    "animationThreshold": animationThresholdAxisPointerValue,
                    "animationDuration": animationDurationAxisPointerValue,
                    "animationEasing": animationEasingAxisPointerValue,
                    "animationDelay": animationDelayAxisPointerValue,
                    "animationDurationUpdate": animationDurationUpdateAxisPointerValue,
                    "animationEasingUpdate": animationEasingUpdateAxisPointerValue,
                    "animationDelayUpdate": animationDelayUpdateAxisPointerValue,
                    "lineStyle": lineStyleAxisPointerValue,
                    "crossStyle": crossStyleAxisPointerValue,
                    "shadowStyle": shadowStyleAxisPointerValue
                ]
                
                expect(axisPointer.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let axisPointerByEnums = AxisPointer(
                    .type(typeAxisPointerValue),
                    .axis(axisAxisPointerValue),
                    .animation(animationAxisPointerValue),
                    .animationThreshold(animationThresholdAxisPointerValue),
                    .animationDuration(animationDurationAxisPointerValue),
                    .animationEasing(animationEasingAxisPointerValue),
                    .animationDelay(animationDelayAxisPointerValue),
                    .animationDurationUpdate(animationDurationUpdateAxisPointerValue),
                    .animationEasingUpdate(animationEasingUpdateAxisPointerValue),
                    .animationDelayUpdate(animationDelayUpdateAxisPointerValue),
                    .lineStyle(lineStyleAxisPointerValue),
                    .crossStyle(crossStyleAxisPointerValue),
                    .shadowStyle(shadowStyleAxisPointerValue)
                )
                
                expect(axisPointerByEnums.jsonString).to(equal(axisPointer.jsonString))
            }
        }
    }
}
