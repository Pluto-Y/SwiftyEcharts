//
//  MapSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 22/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class MapSerieSpec: QuickSpec {
    override func spec() {
        describe("For MapSerie.MapValueCalculation") {
            let averageString = "average"
            let maxString = "max"
            let minString = "min"
            let sumString = "sum"
            
            let averageMapValueCalulation = MapSerie.MapValueCalculation.average
            let maxMapValueCalulation = MapSerie.MapValueCalculation.max
            let minMapValueCalulation = MapSerie.MapValueCalculation.min
            let sumMapValueCalulation = MapSerie.MapValueCalculation.sum
            
            it("needs to check the enum case") {
                expect(averageMapValueCalulation.jsonString).to(equal(averageString.jsonString))
                expect(maxMapValueCalulation.jsonString).to(equal(maxString.jsonString))
                expect(minMapValueCalulation.jsonString).to(equal(minString.jsonString))
                expect(sumMapValueCalulation.jsonString).to(equal(sumString.jsonString))
            }
        }
        
        let minScaleLimitValue: Float = 8.48242
        let maxScaleLimitValue: Float = 0.28374
        
        let scaleLimit = MapSerie.ScaleLimit()
        scaleLimit.min = minScaleLimitValue
        scaleLimit.max = maxScaleLimitValue
        
        describe("For MapSerie.ScaleLimit") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "min": minScaleLimitValue,
                    "max": maxScaleLimitValue
                ]
                
                expect(scaleLimit.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let scaleLimitByEnums = MapSerie.ScaleLimit(
                    .min(minScaleLimitValue),
                    .max(maxScaleLimitValue)
                )
                
                expect(scaleLimitByEnums.jsonString).to(equal(scaleLimit.jsonString))
            }
        }
        
        let nameDataValue = "dataNameValue"
        let valueDataValue: Float = 29284.02383
        let selectedDataValue = false
        let itemStyleDataValue = ItemStyle(
            .normal(CommonItemStyleContent(
                .barBorderRadius(284.2),
                .opacity(182.09)
                )),
            .emphasis(CommonItemStyleContent(
                .color(rgba(20, 238, 82, 0.284)),
                .shadowBlur(204.28)
                ))
        )
        let labelDataValue = FormattedLabel(
            .emphasis(FormattedLabelStyle(.show(false)))
        )
        
        let data = MapSerie.Data()
        data.name = nameDataValue
        data.value = valueDataValue
        data.selected = selectedDataValue
        data.itemStyle = itemStyleDataValue
        data.label = labelDataValue
        
        describe("For MapSerie.Data") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameDataValue,
                    "value": valueDataValue,
                    "selected": selectedDataValue,
                    "itemStyle": itemStyleDataValue,
                    "label": labelDataValue
                ]
                
                expect(data.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let dataByEnums = MapSerie.Data(
                    .name(nameDataValue),
                    .value(valueDataValue),
                    .selected(selectedDataValue),
                    .itemStyle(itemStyleDataValue),
                    .label(labelDataValue)
                )
                
                expect(dataByEnums.jsonString).to(equal(data.jsonString))
            }
        }
        
        describe("For MapSerie") {
            let nameValue = "mapSerieNameValue"
            let mapValue = "chian"
            let roamValue = Roam.move
            let centerValue: Point = [115.97, 29.71]
            let aspectScaleValue: Float = 823.8323
            let zoomValue: Float = 82.3832
            let scaleLimitValue = scaleLimit
            let nameMapValue: [String: Jsonable] = ["China": "中国"]
            let selectedModeValue: SelectedMode = SelectedMode.single
            let labelValue = EmphasisLabel(
                .emphasis(LabelStyle(
                    .position(.inside)
                    ))
            )
            let itemStyleValue = ItemStyle(
                .normal(CommonItemStyleContent(
                    .shadowOffsetY(284.2),
                    .borderType(LineType.solid)
                    ))
            )
            let zlevelValue: Float = 20
            let zValue: Float = 833
            let leftValue: Position = .auto
            let rightValue = Position.inside
            let bottomValue = Position.insideTop
            let topValue = Position.middle
            let layoutCenterValue: Position = Position.point([30%, 30%])
            let layoutSizeValue = 20%
            let geoIndexValue: UInt8 = 92
            let mapValueCalculationValue = MapSerie.MapValueCalculation.max
            let showLegendSymbolValue = false
            let dataValue: [Jsonable] = [
                [12, 14],
                "周二",
                data
            ]
            let markPointValue = MarkPoint(
                .silent(true),
                .symbolRotate(0.3823)
            )
            let markLineValue = MarkLine(
                .symbol(Symbol.arrow)
            )
            let markAreaValue = MarkArea(
                .data(["283", 283, false])
            )
            let silentValue = true
            let animationValue = false
            let animationThresholdValue: Float = 83.238
            let animationDurationValue = Time.number(57529)
            let animationEasingValue = EasingFunction.exponentialInOut
            let animationDelayValue: Time = 382
            let animationDurationUpdateValue: Time = 0
            let animationEasingUpdateValue = EasingFunction.cubicInOut
            let animationDelayUpdateValue: Time = 8888.888
            
            let mapSerie = MapSerie()
            mapSerie.name = nameValue
            mapSerie.map = mapValue
            mapSerie.roam = roamValue
            mapSerie.center = centerValue
            mapSerie.aspectScale = aspectScaleValue
            mapSerie.zoom = zoomValue
            mapSerie.scaleLimit = scaleLimitValue
            mapSerie.nameMap = nameMapValue
            mapSerie.selectedMode = selectedModeValue
            mapSerie.label = labelValue
            mapSerie.itemStyle = itemStyleValue
            mapSerie.zlevel = zlevelValue
            mapSerie.z = zValue
            mapSerie.left = leftValue
            mapSerie.top = topValue
            mapSerie.right = rightValue
            mapSerie.bottom = bottomValue
            mapSerie.layoutCenter = layoutCenterValue
            mapSerie.layoutSize = layoutSizeValue
            mapSerie.geoIndex = geoIndexValue
            mapSerie.mapValueCalculation = mapValueCalculationValue
            mapSerie.showLegendSymbol = showLegendSymbolValue
            mapSerie.data = dataValue
            mapSerie.markPoint = markPointValue
            mapSerie.markLine = markLineValue
            mapSerie.markArea = markAreaValue
            mapSerie.silent = silentValue
            mapSerie.animation = animationValue
            mapSerie.animationThreshold = animationThresholdValue
            mapSerie.animationDuration = animationDurationValue
            mapSerie.animationEasing = animationEasingValue
            mapSerie.animationDelay = animationDelayValue
            mapSerie.animationDurationUpdate = animationDurationUpdateValue
            mapSerie.animationEasingUpdate = animationEasingUpdateValue
            mapSerie.animationDelayUpdate = animationDelayUpdateValue
            
            it("needs to check the type value") {
                expect(mapSerie.type.jsonString).to(equal(SerieType.map.jsonString))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": SerieType.map,
                    "name": nameValue,
                    "map": mapValue,
                    "roam": roamValue,
                    "center": centerValue,
                    "aspectScale": aspectScaleValue,
                    "zoom": zoomValue,
                    "scaleLimit": scaleLimitValue,
                    "nameMap": nameMapValue,
                    "selectedMode": selectedModeValue,
                    "label": labelValue,
                    "itemStyle": itemStyleValue,
                    "zlevel": zlevelValue,
                    "z": zValue,
                    "left": leftValue,
                    "top": topValue,
                    "right": rightValue,
                    "bottom": bottomValue,
                    "layoutCenter": layoutCenterValue,
                    "layoutSize": layoutSizeValue,
                    "geoIndex": geoIndexValue,
                    "mapValueCalculation": mapValueCalculationValue,
                    "showLegendSymbol": showLegendSymbolValue,
                    "data": dataValue,
                    "markPoint": markPointValue,
                    "markLine": markLineValue,
                    "markArea": markAreaValue,
                    "silent": silentValue,
                    "animation": animationValue,
                    "animationThreshold": animationThresholdValue,
                    "animationDuration": animationDurationValue,
                    "animationEasing": animationEasingValue,
                    "animationDelay": animationDelayValue,
                    "animationDurationUpdate": animationDurationUpdateValue,
                    "animationEasingUpdate": animationEasingUpdateValue,
                    "animationDelayUpdate": animationDelayUpdateValue
                ]
                
                expect(mapSerie.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let mapSerieByEnums = MapSerie(
                    .name(nameValue),
                    .map(mapValue),
                    .roam(roamValue),
                    .center(centerValue),
                    .aspectScale(aspectScaleValue),
                    .zoom(zoomValue),
                    .scaleLimit(scaleLimitValue),
                    .nameMap(nameMapValue),
                    .selectedMode(selectedModeValue),
                    .label(labelValue),
                    .itemStyle(itemStyleValue),
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .left(leftValue),
                    .top(topValue),
                    .right(rightValue),
                    .bottom(bottomValue),
                    .layoutCenter(layoutCenterValue),
                    .layoutSize(layoutSizeValue),
                    .geoIndex(geoIndexValue),
                    .mapValueCalculation(mapValueCalculationValue),
                    .showLegendSymbol(showLegendSymbolValue),
                    .data(dataValue),
                    .markPoint(markPointValue),
                    .markLine(markLineValue),
                    .markArea(markAreaValue),
                    .silent(silentValue),
                    .animation(animationValue),
                    .animationThreshold(animationThresholdValue),
                    .animationDuration(animationDurationValue),
                    .animationEasing(animationEasingValue),
                    .animationDelay(animationDelayValue),
                    .animationDurationUpdate(animationDurationUpdateValue),
                    .animationEasingUpdate(animationEasingUpdateValue),
                    .animationDelayUpdate(animationDelayUpdateValue)
                )
                
                expect(mapSerieByEnums.jsonString).to(equal(mapSerie.jsonString))
            }
        }
        
        context("For the actions of MapSerie") {
            describe("For MapSelectAction") {
                let typeValue = EchartsActionType.mapSelect
                let seriesIndexOriginValue: Int = 20
                let seriesIndexValue = OneOrMore(one: seriesIndexOriginValue)
                let seriesNameOriginValue = "mapSelectActionSeriesName"
                let seriesNameValue = OneOrMore(one: seriesNameOriginValue)
                let dataIndexValue: Int = Int.max
                let nameValue = "mapSelectActionName"
                
                let mapSelectAction = MapSelectAction()
                mapSelectAction.seriesName = seriesNameValue
                mapSelectAction.seriesIndex = seriesIndexValue
                mapSelectAction.dataIndex = dataIndexValue
                mapSelectAction.name = nameValue
                
                it("needs to check the type value") {
                    expect(mapSelectAction.type.jsonString).to(equal(typeValue.jsonString))
                }
                
                it("needs to check the jsonString") {
                    let resultDic: [String: Jsonable] = [
                        "type": typeValue,
                        "seriesName": seriesNameValue,
                        "seriesIndex": seriesIndexValue,
                        "dataIndex": dataIndexValue,
                        "name": nameValue
                    ]
                    expect(mapSelectAction.jsonString).to(equal(resultDic.jsonString))
                }
                
                it("needs to check the Enumable") {
                    let mapSelectActionByEnums = MapSelectAction(
                        .seriesName(seriesNameOriginValue),
                        .seriesIndex(seriesIndexOriginValue),
                        .dataIndex(dataIndexValue),
                        .name(nameValue)
                    )
                    
                    expect(mapSelectActionByEnums.jsonString).to(equal(mapSelectAction.jsonString))
                }
                
                it("needs to check the seriesIndexes and seriesNames enum case") {
                    let seriesIndexOriginValues: [Int] = [Int.min, Int.max]
                    let seriesNameOriginValues: [String] = ["seriesName1", "seriesName2", "seriesName3"]
                    
                    mapSelectAction.seriesIndex = OneOrMore(more: seriesIndexOriginValues)
                    mapSelectAction.seriesName = OneOrMore(more: seriesNameOriginValues)
                    
                    let mapSelectActionByEnums = MapSelectAction(
                        .seriesNames(seriesNameOriginValues),
                        .seriesIndexes(seriesIndexOriginValues),
                        .dataIndex(dataIndexValue),
                        .name(nameValue)
                    )
                    
                    expect(mapSelectActionByEnums.jsonString).to(equal(mapSelectAction.jsonString))
                }
            }
            
            describe("For MapUnSelectAction") {
                let typeValue = EchartsActionType.mapUnSelect
                let seriesIndexOriginValue: Int = 874
                let seriesIndexValue = OneOrMore(one: seriesIndexOriginValue)
                let seriesNameOriginValue = "mapUnSelectActionSeriesName"
                let seriesNameValue = OneOrMore(one: seriesNameOriginValue)
                let dataIndexValue: Int = Int.min
                let nameValue = "mapUnSelectActionName"
                
                let mapUnSelectAction = MapUnSelectAction()
                mapUnSelectAction.seriesName = seriesNameValue
                mapUnSelectAction.seriesIndex = seriesIndexValue
                mapUnSelectAction.dataIndex = dataIndexValue
                mapUnSelectAction.name = nameValue
                
                it("needs to check the type value") {
                    expect(mapUnSelectAction.type.jsonString).to(equal(typeValue.jsonString))
                }
                
                it("needs to check the jsonString") {
                    let resultDic: [String: Jsonable] = [
                        "type": typeValue,
                        "seriesName": seriesNameValue,
                        "seriesIndex": seriesIndexValue,
                        "dataIndex": dataIndexValue,
                        "name": nameValue
                    ]
                    expect(mapUnSelectAction.jsonString).to(equal(resultDic.jsonString))
                }
                
                it("needs to check the Enumable") {
                    let mapUnSelectActionByEnums = MapUnSelectAction(
                        .seriesName(seriesNameOriginValue),
                        .seriesIndex(seriesIndexOriginValue),
                        .dataIndex(dataIndexValue),
                        .name(nameValue)
                    )
                    
                    expect(mapUnSelectActionByEnums.jsonString).to(equal(mapUnSelectAction.jsonString))
                }
                
                it("needs to check the seriesIndexes and seriesNames enum case") {
                    let seriesIndexOriginValues: [Int] = [Int.min, Int.max]
                    let seriesNameOriginValues: [String] = ["seriesName1", "seriesName2", "seriesName3"]
                    
                    mapUnSelectAction.seriesIndex = OneOrMore(more: seriesIndexOriginValues)
                    mapUnSelectAction.seriesName = OneOrMore(more: seriesNameOriginValues)
                    
                    let mapUnSelectActionByEnums = MapUnSelectAction(
                        .seriesNames(seriesNameOriginValues),
                        .seriesIndexes(seriesIndexOriginValues),
                        .dataIndex(dataIndexValue),
                        .name(nameValue)
                    )
                    
                    expect(mapUnSelectActionByEnums.jsonString).to(equal(mapUnSelectAction.jsonString))
                }
            }
            
            describe("For MapToggleSelectAction") {
                let typeValue = EchartsActionType.mapToggleSelect
                let seriesIndexOriginValue: Int = 2827
                let seriesIndexValue = OneOrMore(one: seriesIndexOriginValue)
                let seriesNameOriginValue = "mapToggleSelectActionSeriesName"
                let seriesNameValue = OneOrMore(one: seriesNameOriginValue)
                let dataIndexValue: Int = 23489
                let nameValue = "mapToggleSelectActionName"
                
                let mapToggleSelectAction = MapToggleSelectAction()
                mapToggleSelectAction.seriesName = seriesNameValue
                mapToggleSelectAction.seriesIndex = seriesIndexValue
                mapToggleSelectAction.dataIndex = dataIndexValue
                mapToggleSelectAction.name = nameValue
                
                it("needs to check the type value") {
                    expect(mapToggleSelectAction.type.jsonString).to(equal(typeValue.jsonString))
                }
                
                it("needs to check the jsonString") {
                    let resultDic: [String: Jsonable] = [
                        "type": typeValue,
                        "seriesName": seriesNameValue,
                        "seriesIndex": seriesIndexValue,
                        "dataIndex": dataIndexValue,
                        "name": nameValue
                    ]
                    expect(mapToggleSelectAction.jsonString).to(equal(resultDic.jsonString))
                }
                
                it("needs to check the Enumable") {
                    let mapToggleSelectActionByEnums = MapToggleSelectAction(
                        .seriesName(seriesNameOriginValue),
                        .seriesIndex(seriesIndexOriginValue),
                        .dataIndex(dataIndexValue),
                        .name(nameValue)
                    )
                    
                    expect(mapToggleSelectActionByEnums.jsonString).to(equal(mapToggleSelectAction.jsonString))
                }
                
                it("needs to check the seriesIndexes and seriesNames enum case") {
                    let seriesIndexOriginValues: [Int] = [Int.min, Int.max]
                    let seriesNameOriginValues: [String] = ["seriesName1", "seriesName2", "seriesName3"]
                    
                    mapToggleSelectAction.seriesIndex = OneOrMore(more: seriesIndexOriginValues)
                    mapToggleSelectAction.seriesName = OneOrMore(more: seriesNameOriginValues)
                    
                    let mapToggleSelectActionByEnums = MapToggleSelectAction(
                        .seriesNames(seriesNameOriginValues),
                        .seriesIndexes(seriesIndexOriginValues),
                        .dataIndex(dataIndexValue),
                        .name(nameValue)
                    )
                    
                    expect(mapToggleSelectActionByEnums.jsonString).to(equal(mapToggleSelectAction.jsonString))
                }
            }
        }
    }
}
