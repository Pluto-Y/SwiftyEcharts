//
//  GeoSepc.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 15/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class GeoSepc: QuickSpec {
    override func spec() {
        
        let minScaleLimitValue: Float = 2.552
        let maxScaleLimitValue: Float = 100.100
        
        let scaleLimit = Geo.ScaleLimit()
        scaleLimit.min = minScaleLimitValue
        scaleLimit.max = maxScaleLimitValue
        
        describe("For Geo.ScaleLimit") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "min": minScaleLimitValue,
                    "max": maxScaleLimitValue
                ]
                
                expect(scaleLimit.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let scaleLimitByEnums = Geo.ScaleLimit(
                    .min(minScaleLimitValue),
                    .max(maxScaleLimitValue)
                )
                
                expect(scaleLimitByEnums.jsonString).to(equal(scaleLimit.jsonString))
            }
        }
        
        let nameRegionValue = "regionNameValue"
        let selectedRegionValue = false
        let itemStyleRegionValue = ItemStyle(
            .normal(CommonItemStyleContent()),
            .emphasis(CommonItemStyleContent(
                .shadowBlur(10),
                .shadowOffsetX(0),
                .shadowOffsetY(0),
                .shadowColor(.rgba(0, 0, 0, 0.5))
                ))
        )
        let labelRegionValue = Label(
            .normal(CommonLabelStyle(.show(true))),
            .emphasis(CommonLabelStyle(.show(true)))
        )
        
        let region = Geo.Region()
        region.name = nameRegionValue
        region.selected = selectedRegionValue
        region.itemStyle = itemStyleRegionValue
        region.label = labelRegionValue
        
        describe("For Geo.Region") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameRegionValue,
                    "selected": selectedRegionValue,
                    "itemStyle": itemStyleRegionValue,
                    "label": labelRegionValue
                ]
                
                expect(region.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let regionByEnums = Geo.Region(
                    .name(nameRegionValue),
                    .selected(selectedRegionValue),
                    .itemStyle(itemStyleRegionValue),
                    .label(labelRegionValue)
                )
                
                expect(regionByEnums.jsonString).to(equal(region.jsonString))
            }
        }
    }
}
