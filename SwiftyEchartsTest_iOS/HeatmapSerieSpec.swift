//
//  HeatmapSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 16/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class HeatmapSerieSpec: QuickSpec {
    override func spec() {
        
        let nameDataValue = "dataNameValue"
        let valueDataValue: [Jsonable] = ["周一", "周二", "周三"]
        let labelDataValue = EmphasisLabel(
            .normal(LabelStyle(
                .align(Align.auto),
                .verticalAlign(VerticalAlign.top),
                .show(true),
                .position(.top)
                ))
        )
        let itemStyleDataValue = ItemStyle(
            .normal(CommonItemStyleContent(
                .opacity(0.7),
                .color(.hexColor("#332342")),
                .borderWidth(3),
                .borderColor(.hexColor("#235894"))
                ))
        )
        
        let data = HeatmapSerie.Data()
        data.name = nameDataValue
        data.value = valueDataValue
        data.label = labelDataValue
        data.itemStyle = itemStyleDataValue
        
        describe("For HeatmapSerie.Data") {
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameDataValue,
                    "value": valueDataValue,
                    "label": labelDataValue,
                    "itemStyle": itemStyleDataValue
                ]
                
                expect(data.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let dataByEnums = HeatmapSerie.Data(
                    .name(nameDataValue),
                    .value(valueDataValue),
                    .label(labelDataValue),
                    .itemStyle(itemStyleDataValue)
                )
                
                expect(dataByEnums.jsonString).to(equal(data.jsonString))
            }
        }
        
        describe("For HeatmapSerie") {
            let nameValue = "heatmapSerieNameValue"
            let coordinateSystemValue = CoordinateSystem.polar
            let xAxisIndexValue: UInt8 = 28
            let yAxisIndexValue: UInt8 = 255
            let geoIndexValue: UInt8 = 0
            let blurSizeValue: Float = 2.423
            let minOpacityValue: Float = 0.99
            let maxOpacityValue: Float = 0.01
            let dataValue: [Jsonable] = [
                data,
                12, 34, ["value": 56]
            ]
            let markPointValue = MarkPoint(
                .silent(true),
                .animation(false),
                .animationDuration(Time.number(2.835))
            )
            let markLineValue = MarkLine(
                .data([["name": "两个坐标之间的标线", "coord": [10, 20]], ["coord": [20, 30]]])
            )
            let markAreaValue = MarkArea(
                .label(EmphasisLabel(
                .normal(LabelStyle(
                        .position(.right)
                        ))
                    ))
            )
            let zlevelValue: Float = 28.423
            let zValue: Float = 8.2323
            let silentValue = true
            
            let heatmapSerie = HeatmapSerie()
            heatmapSerie.name = nameValue
            heatmapSerie.coordinateSystem = coordinateSystemValue
            heatmapSerie.xAxisIndex = xAxisIndexValue
            heatmapSerie.yAxisIndex = yAxisIndexValue
            heatmapSerie.geoIndex = geoIndexValue
            heatmapSerie.blurSize = blurSizeValue
            heatmapSerie.minOpacity = minOpacityValue
            heatmapSerie.maxOpacity = maxOpacityValue
            heatmapSerie.data = dataValue
            heatmapSerie.markPoint = markPointValue
            heatmapSerie.markLine = markLineValue
            heatmapSerie.markArea = markAreaValue
            heatmapSerie.zlevel = zlevelValue
            heatmapSerie.z = zValue
            heatmapSerie.silent = silentValue
            
            it("needs to check the type value") {
                expect(heatmapSerie.type.jsonString).to(equal(SerieType.heatmap.jsonString))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": SerieType.heatmap,
                    "name": nameValue,
                    "coordinateSystem": coordinateSystemValue,
                    "xAxisIndex": xAxisIndexValue,
                    "yAxisIndex": yAxisIndexValue,
                    "geoIndex": geoIndexValue,
                    "blurSize": blurSizeValue,
                    "minOpacity": minOpacityValue,
                    "maxOpacity": maxOpacityValue,
                    "data": dataValue,
                    "markPoint": markPointValue,
                    "markLine": markLineValue,
                    "markArea": markAreaValue,
                    "zlevel": zlevelValue,
                    "z": zValue,
                    "silent": silentValue
                ]
                
                expect(heatmapSerie.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let heatmapSerieByEnums = HeatmapSerie(
                    .name(nameValue),
                    .coordinateSystem(coordinateSystemValue),
                    .xAxisIndex(xAxisIndexValue),
                    .yAxisIndex(yAxisIndexValue),
                    .geoIndex(geoIndexValue),
                    .blurSize(blurSizeValue),
                    .minOpacity(minOpacityValue),
                    .maxOpacity(maxOpacityValue),
                    .data(dataValue),
                    .markPoint(markPointValue),
                    .markLine(markLineValue),
                    .markArea(markAreaValue),
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .silent(silentValue)
                )
                
                expect(heatmapSerieByEnums.jsonString).to(equal(heatmapSerie.jsonString))
            }
        }
    }
}
