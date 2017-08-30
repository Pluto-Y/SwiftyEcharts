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
            let mapValueCalculationValue = "max"
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
    }
}
