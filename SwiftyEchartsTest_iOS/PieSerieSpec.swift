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
        Mapper.ignoreNil = true
        
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
        let labelDataValue = EmphasisLabel(
            .emphasis(LabelStyle(
                .show(true),
                .position(Position.center),
                .textShadowColor(Color.transparent),
                .shadowBlur(200.002)
                
            )),
            .normal(LabelStyle(
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
        
        describe("For PieSerie") {
            let nameValue = "pieSerieNameValue"
            let legendHoverLinkValue = false
            let hoverAnimationValue = true
            let selectedModeValue  = SelectedMode.multiple
            let selectedOffsetValue: Float = 5.27572
            let clockwiseValue = false
            let startAngleValue: Float = 527.46237
            let minAngleValue: Float = 576463.274
            let roseTypeValue: PieSerie.RoseType = false
            let avoidLabelOverlapValue = true
            let stillShowZeroSumValue = false
            let labelValue = EmphasisLabel(
                .emphasis(LabelStyle(
                    .position(.center),
                    .show(true),
                    .fontWeight(200)
                    ))
            )
            let labelLineValue = labelLine
            let itemStyleValue = ItemStyle(
                .emphasis(CommonItemStyleContent(
                    .opacity(0.3857),
                    .areaColor(Color.hexColor("#75fa72")),
                    .shadowColor(rgb(200, 188, 232))
                    ))
            )
            let zlevelValue: Float = 7.2472
            let zValue: Float = 8888.274
            let centerValue: Point = [20%, 20%]
            let radiusValue: SwiftyEcharts.Range = [10, 20%]
            let dataValue: [Jsonable] = [
            ]
            let markPointValue = MarkPoint(
                .animation(false),
                .animationEasing(EasingFunction.backOut)
            )
            let markLineValue = MarkLine(
                .animation(false),
                .animationEasing(EasingFunction.backOut)
            )
            let markAreaValue = MarkArea(
                .animation(false),
                .animationEasing(EasingFunction.backOut)
            )
            let silentValue = false
            let animationTypeValue: PieSerie.AnimationType = .scale
            let animationValue = true
            let animationThresholdValue: Float = 285.7
            let animationDurationValue: Time = 8000
            let animationEasingValue: EasingFunction = .elasticInOut
            let animationDelayValue: Time = 0.0
            let animationDurationUpdateValue: Time = Time.init(integerLiteral: Int.max)
            let animationEasingUpdateValue: EasingFunction = .elasticInOut
            let animationDelayUpdateValue = Time.number(17562.7582)
            
            let pieSerie = PieSerie()
            pieSerie.name = nameValue
            pieSerie.legendHoverLink = legendHoverLinkValue
            pieSerie.hoverAnimation = hoverAnimationValue
            pieSerie.selectedMode = selectedModeValue
            pieSerie.selectedOffset = selectedOffsetValue
            pieSerie.clockwise = clockwiseValue
            pieSerie.startAngle = startAngleValue
            pieSerie.minAngle = minAngleValue
            pieSerie.roseType = roseTypeValue
            pieSerie.avoidLabelOverlap = avoidLabelOverlapValue
            pieSerie.stillShowZeroSum = stillShowZeroSumValue
            pieSerie.label = labelValue
            pieSerie.labelLine = labelLineValue
            pieSerie.itemStyle = itemStyleValue
            pieSerie.zlevel = zlevelValue
            pieSerie.z = zValue
            pieSerie.center = centerValue
            pieSerie.radius = radiusValue
            pieSerie.data = dataValue
            pieSerie.markPoint = markPointValue
            pieSerie.markLine = markLineValue
            pieSerie.markArea = markAreaValue
            pieSerie.silent = silentValue
            pieSerie.animationType = animationTypeValue
            pieSerie.animation = animationValue
            pieSerie.animationThreshold = animationThresholdValue
            pieSerie.animationDuration = animationDurationValue
            pieSerie.animationEasing = animationEasingValue
            pieSerie.animationDelay = animationDelayValue
            pieSerie.animationDurationUpdate = animationDurationUpdateValue
            pieSerie.animationEasingUpdate = animationEasingUpdateValue
            pieSerie.animationDelayUpdate = animationDelayUpdateValue
            
            it("needs to check the type value") {
                expect(pieSerie.type.jsonString).to(equal(SerieType.pie.jsonString))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": pieSerie.type,
                    "name": nameValue,
                    "legendHoverLink": legendHoverLinkValue,
                    "hoverAnimation": hoverAnimationValue,
                    "selectedMode": selectedModeValue,
                    "selectedOffset": selectedOffsetValue,
                    "clockwise": clockwiseValue,
                    "startAngle": startAngleValue,
                    "minAngle": minAngleValue,
                    "roseType": roseTypeValue,
                    "avoidLabelOverlap": avoidLabelOverlapValue,
                    "stillShowZeroSum": stillShowZeroSumValue,
                    "label": labelValue,
                    "labelLine": labelLineValue,
                    "itemStyle": itemStyleValue,
                    "zlevel": zlevelValue,
                    "z": zValue,
                    "center": centerValue,
                    "radius": radiusValue,
                    "data": dataValue,
                    "markPoint": markPointValue,
                    "markLine": markLineValue,
                    "markArea": markAreaValue,
                    "silent": silentValue,
                    "animationType": animationTypeValue,
                    "animation": animationValue,
                    "animationThreshold": animationThresholdValue,
                    "animationDuration": animationDurationValue,
                    "animationEasing": animationEasingValue,
                    "animationDelay": animationDelayValue,
                    "animationDurationUpdate": animationDurationUpdateValue,
                    "animationEasingUpdate": animationEasingUpdateValue,
                    "animationDelayUpdate": animationDelayUpdateValue
                ]
                
                expect(pieSerie.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let pieSerieByEnums = PieSerie(
                    .name(nameValue),
                    .legendHoverLink(legendHoverLinkValue),
                    .hoverAnimation(hoverAnimationValue),
                    .selectedMode(selectedModeValue),
                    .selectedOffset(selectedOffsetValue),
                    .clockwise(clockwiseValue),
                    .startAngle(startAngleValue),
                    .minAngle(minAngleValue),
                    .roseType(roseTypeValue),
                    .avoidLabelOverlap(avoidLabelOverlapValue),
                    .stillShowZeroSum(stillShowZeroSumValue),
                    .label(labelValue),
                    .labelLine(labelLineValue),
                    .itemStyle(itemStyleValue),
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .center(centerValue),
                    .radiusRange(radiusValue),
                    .data(dataValue),
                    .markPoint(markPointValue),
                    .markLine(markLineValue),
                    .markArea(markAreaValue),
                    .silent(silentValue),
                    .animationType(animationTypeValue),
                    .animation(animationValue),
                    .animationThreshold(animationThresholdValue),
                    .animationDuration(animationDurationValue),
                    .animationEasing(animationEasingValue),
                    .animationDelay(animationDelayValue),
                    .animationDurationUpdate(animationDurationUpdateValue),
                    .animationEasingUpdate(animationEasingUpdateValue),
                    .animationDelayUpdate(animationDelayUpdateValue)
                )
                
                expect(pieSerieByEnums.jsonString).to(equal(pieSerie.jsonString))
            }
            
            it("needs to check the radius enum case") {
                let radius = 20%
                pieSerie.radius = [0, radius]
                
                let pieSerieByEnums = PieSerie(
                    .name(nameValue),
                    .legendHoverLink(legendHoverLinkValue),
                    .hoverAnimation(hoverAnimationValue),
                    .selectedMode(selectedModeValue),
                    .selectedOffset(selectedOffsetValue),
                    .clockwise(clockwiseValue),
                    .startAngle(startAngleValue),
                    .minAngle(minAngleValue),
                    .roseType(roseTypeValue),
                    .avoidLabelOverlap(avoidLabelOverlapValue),
                    .stillShowZeroSum(stillShowZeroSumValue),
                    .label(labelValue),
                    .labelLine(labelLineValue),
                    .itemStyle(itemStyleValue),
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .center(centerValue),
                    .radius(radius),
                    .data(dataValue),
                    .markPoint(markPointValue),
                    .markLine(markLineValue),
                    .markArea(markAreaValue),
                    .silent(silentValue),
                    .animationType(animationTypeValue),
                    .animation(animationValue),
                    .animationThreshold(animationThresholdValue),
                    .animationDuration(animationDurationValue),
                    .animationEasing(animationEasingValue),
                    .animationDelay(animationDelayValue),
                    .animationDurationUpdate(animationDurationUpdateValue),
                    .animationEasingUpdate(animationEasingUpdateValue),
                    .animationDelayUpdate(animationDelayUpdateValue)
                )
                
                expect(pieSerieByEnums.jsonString).to(equal(pieSerie.jsonString))
            }
        }
        
        context("For the actions of PieSerie") {
            describe("For PieSelectAction") {
                let typeValue = EchartsActionType.pieSelect
                let seriesIndexOriginValue: Int = 20
                let seriesIndexValue = OneOrMore(one: seriesIndexOriginValue)
                let seriesNameOriginValue = "pieSelectActionSeriesName"
                let seriesNameValue = OneOrMore(one: seriesNameOriginValue)
                let dataIndexValue: Int = Int.max
                let nameValue = "pieSelectActionName"
                
                let pieSelectAction = PieSelectAction()
                pieSelectAction.seriesName = seriesNameValue
                pieSelectAction.seriesIndex = seriesIndexValue
                pieSelectAction.dataIndex = dataIndexValue
                pieSelectAction.name = nameValue
                
                it("needs to check the type value") {
                    expect(pieSelectAction.type.jsonString).to(equal(typeValue.jsonString))
                }
                
                it("needs to check the jsonString") {
                    let resultDic: [String: Jsonable] = [
                        "type": typeValue,
                        "seriesName": seriesNameValue,
                        "seriesIndex": seriesIndexValue,
                        "dataIndex": dataIndexValue,
                        "name": nameValue
                    ]
                    expect(pieSelectAction.jsonString).to(equal(resultDic.jsonString))
                }
                
                it("needs to check the Enumable") {
                    let pieSelectActionByEnums = PieSelectAction(
                        .seriesName(seriesNameOriginValue),
                        .seriesIndex(seriesIndexOriginValue),
                        .dataIndex(dataIndexValue),
                        .name(nameValue)
                    )
                    
                    expect(pieSelectActionByEnums.jsonString).to(equal(pieSelectAction.jsonString))
                }
                
                it("needs to check the seriesIndexes and seriesNames enum case") {
                    let seriesIndexOriginValues: [Int] = [Int.min, Int.max]
                    let seriesNameOriginValues: [String] = ["seriesName1", "seriesName2", "seriesName3"]
                    
                    pieSelectAction.seriesIndex = OneOrMore(more: seriesIndexOriginValues)
                    pieSelectAction.seriesName = OneOrMore(more: seriesNameOriginValues)
                    
                    let pieSelectActionByEnums = PieSelectAction(
                        .seriesNames(seriesNameOriginValues),
                        .seriesIndexes(seriesIndexOriginValues),
                        .dataIndex(dataIndexValue),
                        .name(nameValue)
                    )
                    
                    expect(pieSelectActionByEnums.jsonString).to(equal(pieSelectAction.jsonString))
                }
            }
            
            describe("For PieUnSelectAction") {
                let typeValue = EchartsActionType.pieUnSelect
                let seriesIndexOriginValue: Int = 874
                let seriesIndexValue = OneOrMore(one: seriesIndexOriginValue)
                let seriesNameOriginValue = "pieUnSelectActionSeriesName"
                let seriesNameValue = OneOrMore(one: seriesNameOriginValue)
                let dataIndexValue: Int = Int.min
                let nameValue = "pieUnSelectActionName"
                
                let pieUnSelectAction = PieUnSelectAction()
                pieUnSelectAction.seriesName = seriesNameValue
                pieUnSelectAction.seriesIndex = seriesIndexValue
                pieUnSelectAction.dataIndex = dataIndexValue
                pieUnSelectAction.name = nameValue
                
                it("needs to check the type value") {
                    expect(pieUnSelectAction.type.jsonString).to(equal(typeValue.jsonString))
                }
                
                it("needs to check the jsonString") {
                    let resultDic: [String: Jsonable] = [
                        "type": typeValue,
                        "seriesName": seriesNameValue,
                        "seriesIndex": seriesIndexValue,
                        "dataIndex": dataIndexValue,
                        "name": nameValue
                    ]
                    expect(pieUnSelectAction.jsonString).to(equal(resultDic.jsonString))
                }
                
                it("needs to check the Enumable") {
                    let pieUnSelectActionByEnums = PieUnSelectAction(
                        .seriesName(seriesNameOriginValue),
                        .seriesIndex(seriesIndexOriginValue),
                        .dataIndex(dataIndexValue),
                        .name(nameValue)
                    )
                    
                    expect(pieUnSelectActionByEnums.jsonString).to(equal(pieUnSelectAction.jsonString))
                }
                
                it("needs to check the seriesIndexes and seriesNames enum case") {
                    let seriesIndexOriginValues: [Int] = [Int.min, Int.max]
                    let seriesNameOriginValues: [String] = ["seriesName1", "seriesName2", "seriesName3"]
                    
                    pieUnSelectAction.seriesIndex = OneOrMore(more: seriesIndexOriginValues)
                    pieUnSelectAction.seriesName = OneOrMore(more: seriesNameOriginValues)
                    
                    let pieUnSelectActionByEnums = PieUnSelectAction(
                        .seriesNames(seriesNameOriginValues),
                        .seriesIndexes(seriesIndexOriginValues),
                        .dataIndex(dataIndexValue),
                        .name(nameValue)
                    )
                    
                    expect(pieUnSelectActionByEnums.jsonString).to(equal(pieUnSelectAction.jsonString))
                }
            }
            
            describe("For PieToggleSelectAction") {
                let typeValue = EchartsActionType.pieToggleSelect
                let seriesIndexOriginValue: Int = 2827
                let seriesIndexValue = OneOrMore(one: seriesIndexOriginValue)
                let seriesNameOriginValue = "pieToggleSelectActionSeriesName"
                let seriesNameValue = OneOrMore(one: seriesNameOriginValue)
                let dataIndexValue: Int = 23489
                let nameValue = "pieToggleSelectActionName"
                
                let pieToggleSelectAction = PieToggleSelectAction()
                pieToggleSelectAction.seriesName = seriesNameValue
                pieToggleSelectAction.seriesIndex = seriesIndexValue
                pieToggleSelectAction.dataIndex = dataIndexValue
                pieToggleSelectAction.name = nameValue
                
                it("needs to check the type value") {
                    expect(pieToggleSelectAction.type.jsonString).to(equal(typeValue.jsonString))
                }
                
                it("needs to check the jsonString") {
                    let resultDic: [String: Jsonable] = [
                        "type": typeValue,
                        "seriesName": seriesNameValue,
                        "seriesIndex": seriesIndexValue,
                        "dataIndex": dataIndexValue,
                        "name": nameValue
                    ]
                    expect(pieToggleSelectAction.jsonString).to(equal(resultDic.jsonString))
                }
                
                it("needs to check the Enumable") {
                    let pieToggleSelectActionByEnums = PieToggleSelectAction(
                        .seriesName(seriesNameOriginValue),
                        .seriesIndex(seriesIndexOriginValue),
                        .dataIndex(dataIndexValue),
                        .name(nameValue)
                    )
                    
                    expect(pieToggleSelectActionByEnums.jsonString).to(equal(pieToggleSelectAction.jsonString))
                }
                
                it("needs to check the seriesIndexes and seriesNames enum case") {
                    let seriesIndexOriginValues: [Int] = [Int.min, Int.max]
                    let seriesNameOriginValues: [String] = ["seriesName1", "seriesName2", "seriesName3"]
                    
                    pieToggleSelectAction.seriesIndex = OneOrMore(more: seriesIndexOriginValues)
                    pieToggleSelectAction.seriesName = OneOrMore(more: seriesNameOriginValues)
                    
                    let pieToggleSelectActionByEnums = PieToggleSelectAction(
                        .seriesNames(seriesNameOriginValues),
                        .seriesIndexes(seriesIndexOriginValues),
                        .dataIndex(dataIndexValue),
                        .name(nameValue)
                    )
                    
                    expect(pieToggleSelectActionByEnums.jsonString).to(equal(pieToggleSelectAction.jsonString))
                }
            }
        }
    }
}
