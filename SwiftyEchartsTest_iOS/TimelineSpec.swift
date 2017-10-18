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
        
        beforeEach {
            Mapper.ignoreNil = true
        }
        
        let positionLabelStyleValue = Position.center
        let showLabelStyleValue = false
        let intervalLabelStyleValue: UInt8 = 44
        let rotateLabelStyleValue: Float = 3874.92
        let formatterLabelStyleValue = Formatter.string("labelStyleFormatterValue")
        let colorLabelStyleValue = Color.hexColor("876543")
        let fontStyleLabelStyleValue = FontStyle.oblique
        let fontWeightLabelStyleValue = FontWeight.lighter
        let fontFamilyLabelStyleValue = "Arial"
        let fontSizeLabelStyleValue: UInt = 18
        let alignLabelStyleValue = Align.none
        let verticalAlignLabelStyleValue = VerticalAlign.bottom
        let lineHeightLabelStyleValue: Float = 85723.1
        let backgroundColorLabelStyleValue = Color.rgb(76, 12, 45)
        let borderColorLabelStyleValue = Color.yellow
        let borderWidthLabelStyleValue: Float = 0
        let borderRadiusLabelStyleValue: Float = 2.0
        let paddingLabelStyleValue = Padding.trbl(0, 0, 20, 10)
        let shadowColorLabelStyleValue = Color.transparent
        let shadowBlurLabelStyleValue: Float = 2.0
        let shadowOffsetXLabelStyleValue: Float = 10.0
        let shadowOffsetYLabelStyleValue: Float = 857234.4
        let widthLabelStyleValue = 20%
        let heightLabelStyleValue = 80%
        let textBorderColorLabelStyleValue = Color.auto
        let textBorderWidthLabelStyleValue: Float = 5.0
        let textShadowColorLabelStyleValue = Color.blue
        let textShadowBlurLabelStyleValue: Float = 8572
        let textShadowOffsetXLabelStyleValue: Float = 4444444
        let textShadowOffsetYLabelStyleValue: Float = 0.11111111111
        let richLabelStyleValue: [String: Jsonable] = ["key": "value1", "intkey": 28, "doubleKey": 84.28, "boolKey": false]
        
        let labelStyle = LabelStyle()
        labelStyle.position = positionLabelStyleValue
        labelStyle.show = showLabelStyleValue
        labelStyle.interval = intervalLabelStyleValue
        labelStyle.rotate = rotateLabelStyleValue
        labelStyle.formatter = formatterLabelStyleValue
        labelStyle.color = colorLabelStyleValue
        labelStyle.fontStyle = fontStyleLabelStyleValue
        labelStyle.fontWeight = fontWeightLabelStyleValue
        labelStyle.fontFamily = fontFamilyLabelStyleValue
        labelStyle.fontSize = fontSizeLabelStyleValue
        labelStyle.align = alignLabelStyleValue
        labelStyle.verticalAlign = verticalAlignLabelStyleValue
        labelStyle.lineHeight = lineHeightLabelStyleValue
        labelStyle.backgroundColor = backgroundColorLabelStyleValue
        labelStyle.borderColor = borderColorLabelStyleValue
        labelStyle.borderWidth = borderWidthLabelStyleValue
        labelStyle.borderRadius = borderRadiusLabelStyleValue
        labelStyle.padding = paddingLabelStyleValue
        labelStyle.shadowColor = shadowColorLabelStyleValue
        labelStyle.shadowBlur = shadowBlurLabelStyleValue
        labelStyle.shadowOffsetX = shadowOffsetXLabelStyleValue
        labelStyle.shadowOffsetY = shadowOffsetYLabelStyleValue
        labelStyle.width = widthLabelStyleValue
        labelStyle.height = heightLabelStyleValue
        labelStyle.textBorderColor = textBorderColorLabelStyleValue
        labelStyle.textBorderWidth = textBorderWidthLabelStyleValue
        labelStyle.textShadowColor = textShadowColorLabelStyleValue
        labelStyle.textShadowBlur = textShadowBlurLabelStyleValue
        labelStyle.textShadowOffsetX = textShadowOffsetXLabelStyleValue
        labelStyle.textShadowOffsetY = textShadowOffsetYLabelStyleValue
        labelStyle.rich = richLabelStyleValue
        
        let normalLabelValue = labelStyle
        let emphasisLabelValue = LabelStyle(
            .show(false),
            .position(Position.auto),
            .fontStyle(FontStyle.oblique),
            .fontWeight(FontWeight.bold),
            .borderColor(Color.hexColor("#fedcba")),
            .backgroundColor(Color.transparent)
        )
        
        let label = EmphasisLabel()
        label.normal = normalLabelValue
        label.emphasis = emphasisLabelValue
        
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
            .axisPointer(AxisPointerForTooltip(
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
        
        describe("For Timeline") {
            let showValue = false
            let typeValue = "slider"
            let axisTypeValue = AxisType.category
            let currentValue: UInt = UInt.max
            let autoPlayValue = true
            let rewindValue = false
            let loopValue = false
            let playIntervalValue: Float = 85.348
            let realtimeValue = true
            let controlPositionValue = "right"
            let zlevelValue: Float = 85.347
            let zValue: Float = 586845
            let leftValue = Position.bottom
            let rightValue = Position.center
            let topValue = Position.end
            let bottomValue = Position.inner
            let paddingValue = Padding.all(58)
            let orientValue = Orient.horizontal
            let inverseValue = false
            let symbolOriginValue = Symbol.arrow
            let symbolValue = OneOrMore(one: symbolOriginValue)
            let symbolSizeValue: FunctionOrFloatOrPair = [20, 10]
            let symbolRotateValue: Float = 573.74
            let symbolOffsetValue: Point = [0, 50%]
            let lineStyleValue = LineStyle(
                .show(true),
                .type(LineType.dotted),
                .shadowBlur(75.37)
            )
            let labelValue = label
            let itemStyleValue = ItemStyle(
                .emphasis(CommonItemStyleContent(
                    .color(Color.yellow),
                    .opacity(0.3476),
                    .shadowBlur(7437843.823784)
                    ))
            )
            let checkpointStyleValue = checkpointStyle
            let controlStyleValue = controlStyle
            let dataValue: [Jsonable] = [
                "周二", 85.73, 74, false, "Friday"
            ]
            
            let timeline = Timeline()
            timeline.show = showValue
            timeline.axisType = axisTypeValue
            timeline.current = currentValue
            timeline.autoPlay = autoPlayValue
            timeline.rewind = rewindValue
            timeline.loop = loopValue
            timeline.playInterval = playIntervalValue
            timeline.realtime = realtimeValue
            timeline.controlPosition = controlPositionValue
            timeline.zlevel = zlevelValue
            timeline.z = zValue
            timeline.left = leftValue
            timeline.top = topValue
            timeline.right = rightValue
            timeline.bottom = bottomValue
            timeline.padding = paddingValue
            timeline.orient = orientValue
            timeline.inverse = inverseValue
            timeline.symbol = symbolValue
            timeline.symbolSize = symbolSizeValue
            timeline.symbolRotate = symbolRotateValue
            timeline.symbolOffset = symbolOffsetValue
            timeline.lineStyle = lineStyleValue
            timeline.label = labelValue
            timeline.itemStyle = itemStyleValue
            timeline.checkpointStyle = checkpointStyleValue
            timeline.controlStyle = controlStyleValue
            timeline.data = dataValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showValue,
                    "type": typeValue,
                    "axisType": axisTypeValue,
                    "current": currentValue,
                    "autoPlay": autoPlayValue,
                    "rewind": rewindValue,
                    "loop": loopValue,
                    "playInterval": playIntervalValue,
                    "realtime": realtimeValue,
                    "controlPosition": controlPositionValue,
                    "zlevel": zlevelValue,
                    "z": zValue,
                    "left": leftValue,
                    "top": topValue,
                    "right": rightValue,
                    "bottom": bottomValue,
                    "padding": paddingValue,
                    "orient": orientValue,
                    "inverse": inverseValue,
                    "symbol": symbolValue,
                    "symbolSize": symbolSizeValue,
                    "symbolRotate": symbolRotateValue,
                    "symbolOffset": symbolOffsetValue,
                    "lineStyle": lineStyleValue,
                    "label": labelValue,
                    "itemStyle": itemStyleValue,
                    "checkpointStyle": checkpointStyleValue,
                    "controlStyle": controlStyleValue,
                    "data": dataValue
                ]
                
                expect(timeline.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let timelineByEnums = Timeline(
                    .show(showValue),
                    .axisType(axisTypeValue),
                    .current(currentValue),
                    .autoPlay(autoPlayValue),
                    .rewind(rewindValue),
                    .loop(loopValue),
                    .playInterval(playIntervalValue),
                    .realtime(realtimeValue),
                    .controlPosition(controlPositionValue),
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .left(leftValue),
                    .top(topValue),
                    .right(rightValue),
                    .bottom(bottomValue),
                    .padding(paddingValue),
                    .orient(orientValue),
                    .inverse(inverseValue),
                    .symbol(symbolOriginValue),
                    .symbolSize(symbolSizeValue),
                    .symbolRotate(symbolRotateValue),
                    .symbolOffset(symbolOffsetValue),
                    .lineStyle(lineStyleValue),
                    .label(labelValue),
                    .itemStyle(itemStyleValue),
                    .checkpointStyle(checkpointStyleValue),
                    .controlStyle(controlStyleValue),
                    .data(dataValue)
                )
                
                expect(timelineByEnums.jsonString).to(equal(timeline.jsonString))
            }
        }
        
        context("For the action of Timeline") {
            describe("For TimelineChangeAction") {
                let typeValue = EchartsActionType.timelineChange
                let currentIndexValue = 256
                
                let timelineChangeAction = TimelineChangeAction()
                timelineChangeAction.currentIndex = currentIndexValue
                
                it("needs to check the type value") {
                    expect(timelineChangeAction.type.jsonString).to(equal(typeValue.jsonString))
                }
                
                it("needs to check the jsonString") {
                    let resultDic: [String: Jsonable] = [
                        "type": typeValue,
                        "currentIndex": currentIndexValue
                    ]
                    
                    expect(timelineChangeAction.jsonString).to(equal(resultDic.jsonString))
                }
                
                it("needs to check the Enumable") {
                    let timelineChangeActionByEnums = TimelineChangeAction(
                        .currentIndex(currentIndexValue)
                    )
                    
                    expect(timelineChangeActionByEnums.jsonString).to(equal(timelineChangeAction.jsonString))
                }
            }
            
            describe("For TimelinePlayChangeAction") {
                let typeValue = EchartsActionType.timelinePlayChange
                let playStateValue = false
                
                let timelinePlayChangeAction = TimelinePlayChangeAction()
                timelinePlayChangeAction.playState = playStateValue
                
                it("needs to check the type value") {
                    expect(timelinePlayChangeAction.type.jsonString).to(equal(typeValue.jsonString))
                }
                
                it("needs to check the jsonString") {
                    let resultDic: [String: Jsonable] = [
                        "type": typeValue,
                        "playState": playStateValue
                    ]
                    
                    expect(timelinePlayChangeAction.jsonString).to(equal(resultDic.jsonString))
                }
                
                it("needs to check the Enumable") {
                    let timelinePlayChangeActionByEnums = TimelinePlayChangeAction(
                        .playState(playStateValue)
                    )
                    
                    expect(timelinePlayChangeActionByEnums.jsonString).to(equal(timelinePlayChangeAction.jsonString))
                }
            }
        }
    }
}
