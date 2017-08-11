//
//  TimelineSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 11/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class TimelineSpec: QuickSpec {
    override func spec() {
        let symbolCheckpointStyleOriginValue = Symbol.arrow
        let symbolCheckpointStyleValue = OneOrMore(one: symbolCheckpointStyleOriginValue)
        let symbolSizeCheckpointStyleValue = FunctionOrFloatOrPair.point([20, 20%])
        let symbolRotateCheckpointStyleValue: Float = 56.7
        let symbolOffsetCheckpointStyleValue: Point = [0, 100%]
        let colorCheckpointStyleValue = rgb(67, 89 , 10)
        let borderWidthCheckpointStyleValue: Float = 0.5827
        let borderColorCheckpointStyleValue = rgba(75, 24, 27, 0.577)
        let animationCheckpointStyleValue = false
        let animationDurationCheckpointStyleValue: Float = 95.3874
        let animationEasingCheckpointStyleValue = EasingFunction.backIn
        
        let checkpointStyle = Timeline.CheckpointStyle()
        checkpointStyle.symbol = symbolCheckpointStyleValue
        checkpointStyle.symbolSize = symbolSizeCheckpointStyleValue
        checkpointStyle.symbolRotate = symbolRotateCheckpointStyleValue
        checkpointStyle.symbolOffset = symbolOffsetCheckpointStyleValue
        checkpointStyle.color = colorCheckpointStyleValue
        checkpointStyle.borderColor = borderColorCheckpointStyleValue
        checkpointStyle.borderWidth = borderWidthCheckpointStyleValue
        checkpointStyle.animation = animationCheckpointStyleValue
        checkpointStyle.animationDuration = animationDurationCheckpointStyleValue
        checkpointStyle.animationEasing = animationEasingCheckpointStyleValue
        
        describe("For Timeline.CheckpointStyle") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "symbol": symbolCheckpointStyleValue,
                    "symbolSize": symbolSizeCheckpointStyleValue,
                    "symbolRotate": symbolRotateCheckpointStyleValue,
                    "symbolOffset": symbolOffsetCheckpointStyleValue,
                    "color": colorCheckpointStyleValue,
                    "borderColor": borderColorCheckpointStyleValue,
                    "borderWidth": borderWidthCheckpointStyleValue,
                    "animation": animationCheckpointStyleValue,
                    "animationDuration": animationDurationCheckpointStyleValue,
                    "animationEasing": animationEasingCheckpointStyleValue
                ]
                
                expect(checkpointStyle.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let checkpointStyleByEnums = Timeline.CheckpointStyle(
                    .symbol(symbolCheckpointStyleOriginValue),
                    .symbolSize(symbolSizeCheckpointStyleValue),
                    .symbolRotate(symbolRotateCheckpointStyleValue),
                    .symbolOffset(symbolOffsetCheckpointStyleValue),
                    .color(colorCheckpointStyleValue),
                    .borderColor(borderColorCheckpointStyleValue),
                    .borderWidth(borderWidthCheckpointStyleValue),
                    .animation(animationCheckpointStyleValue),
                    .animationDuration(animationDurationCheckpointStyleValue),
                    .animationEasing(animationEasingCheckpointStyleValue)
                )
                
                expect(checkpointStyleByEnums.jsonString).to(equal(checkpointStyle.jsonString))
            }
        }
        
        let colorCStyleValue = Color.transparent
        let borderWidthCStyleValue: Float = 85.347
        let borderColorCSstyleValue = Color.hexColor("#11ffaa")
        
        let cStyle = Timeline.ControlStyle.CStyle()
        cStyle.color = colorCStyleValue
        cStyle.borderWidth = borderWidthCStyleValue
        cStyle.borderColor = borderColorCSstyleValue
        
        describe("For Timeline.ControlStyle.CStyle") { 
            it("needs to chek the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "color": colorCStyleValue,
                    "borderWidth": borderWidthCStyleValue,
                    "borderColor": borderColorCSstyleValue
                ]
                
                expect(cStyle.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let cStyleByEnums = Timeline.ControlStyle.CStyle(
                    .color(colorCStyleValue),
                    .borderWidth(borderWidthCStyleValue),
                    .borderColor(borderColorCSstyleValue)
                )
                
                expect(cStyleByEnums.jsonString).to(equal(cStyle.jsonString))
            }
        }
    }
}
