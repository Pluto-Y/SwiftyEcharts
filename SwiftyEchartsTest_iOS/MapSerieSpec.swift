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
        let labelDataValue = Label(
            .emphasis(CommonLabelStyle(.show(false)))
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
    }
}
