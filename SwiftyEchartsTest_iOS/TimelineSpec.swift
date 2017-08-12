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
        
        let showControlStyleValue = false
        let showPlayBtnControlStyleValue = false
        let showPrevBtnControlStyleValue = false
        let showNextBtnControlStyleValue = false
        let itemSizeControlStyleValue: Float = 0.857
        let itemGapControlStyleValue: Float = 5734
        let positionControlStyleValue = Position.left
        let playIconControlStyleValue = "timelineControlStylePlayIcon"
        let stopIconControlStyleValue = "timelineControlStyleStopIcon"
        let prevIconControlStyleValue = "timelineControlStylePrevIcon"
        let nextIconControlStyleValue = "timelineControlStyleNextIcon"
        let normalControlStyleValue = cStyle
        let emphasisControlStyleValue = cStyle
        
        let controlStyle = Timeline.ControlStyle()
        controlStyle.show = showControlStyleValue
        controlStyle.showPlayBtn = showPlayBtnControlStyleValue
        controlStyle.showPrevBtn = showPrevBtnControlStyleValue
        controlStyle.showNextBtn = showNextBtnControlStyleValue
        controlStyle.itemSize = itemSizeControlStyleValue
        controlStyle.itemGap = itemGapControlStyleValue
        controlStyle.position = positionControlStyleValue
        controlStyle.playIcon = playIconControlStyleValue
        controlStyle.stopIcon = stopIconControlStyleValue
        controlStyle.prevIcon = prevIconControlStyleValue
        controlStyle.nextIcon = nextIconControlStyleValue
        controlStyle.normal = normalControlStyleValue
        controlStyle.emphasis = emphasisControlStyleValue
        
        describe("For Timeline.ControlStyle") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showControlStyleValue,
                    "showPlayBtn": showPlayBtnControlStyleValue,
                    "showPrevBtn": showPrevBtnControlStyleValue,
                    "showNextBtn": showNextBtnControlStyleValue,
                    "itemSize": itemSizeControlStyleValue,
                    "itemGap": itemGapControlStyleValue,
                    "position": positionControlStyleValue,
                    "playIcon": playIconControlStyleValue,
                    "stopIcon": stopIconControlStyleValue,
                    "prevIcon": prevIconControlStyleValue,
                    "nextIcon": nextIconControlStyleValue,
                    "normal": normalControlStyleValue,
                    "emphasis": emphasisControlStyleValue
                ]
                
                expect(controlStyle.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let controlStyleByEnums = Timeline.ControlStyle(
                    .show(showControlStyleValue),
                    .showPlayBtn(showPlayBtnControlStyleValue),
                    .showPrevBtn(showPrevBtnControlStyleValue),
                    .showNextBtn(showNextBtnControlStyleValue),
                    .itemSize(itemSizeControlStyleValue),
                    .itemGap(itemGapControlStyleValue),
                    .position(positionControlStyleValue),
                    .playIcon(playIconControlStyleValue),
                    .stopIcon(stopIconControlStyleValue),
                    .prevIcon(prevIconControlStyleValue),
                    .nextIcon(nextIconControlStyleValue),
                    .normal(normalControlStyleValue),
                    .emphasis(emphasisControlStyleValue)
                )
                
                expect(controlStyleByEnums.jsonString).to(equal(controlStyle.jsonString))
            }
        }
        
        let valueDataValue: Jsonable = 5.7346
        let tooltipDataValue = Tooltip(
            .trigger(.axis),
            .axisPointer(Tooltip.AxisPointer(
                .type(.shadow)
                ))
        )
        let symbolDataValue = Symbol.roundRect
        let symbolSizeDataValue = FunctionOrFloatOrPair.value(58.347)
        
        let data = Timeline.Data()
        data.value = valueDataValue
        data.tooltip = tooltipDataValue
        data.symbol = symbolDataValue
        data.symbolSize = symbolSizeDataValue
        
        describe("For Timeline.Data") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "value": valueDataValue,
                    "tooltip": tooltipDataValue,
                    "symbol": symbolDataValue,
                    "symbolSize": symbolSizeDataValue
                ]
                
                expect(data.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let dataByEnums = Timeline.Data(
                    .value(valueDataValue),
                    .tooltip(tooltipDataValue),
                    .symbol(symbolDataValue),
                    .symbolSize(symbolSizeDataValue)
                )
                
                expect(dataByEnums.jsonString).to(equal(data.jsonString))
            }
        }
    }
}
