//
//  GeoSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 08/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class GeoSpec: QuickSpec {
    override func spec() {
        let minValue = Float(arc4random_uniform(100)) / 100.0
        let maxValue = Float(arc4random_uniform(100)) / 100.0 + 20.0
        let scaleLimitNormal = Geo.ScaleLimit()
        scaleLimitNormal.min = minValue
        scaleLimitNormal.max = maxValue
        
        describe("For Geo.ScaleLimit") {
            it("needs to chekc the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "min": minValue,
                    "max": maxValue
                ]
                
                expect(scaleLimitNormal.jsonString).to(equal(resultDic.jsonString))
            }
            
            
            it("needs to chekc the Enumable") {
                let scaleLimitByEnums = Geo.ScaleLimit(
                    .min(minValue),
                    .max(maxValue)
                )
                
                expect(scaleLimitByEnums.jsonString).to(equal(scaleLimitNormal.jsonString))
            }
        }
        
        let nameRegionValue = "广州"
        let selectedRegionValue = false
        let itemStyleRegionValue = ItemStyle(
            .emphasis(CommonItemStyleContent(
                .color(Color.hexColor("#926423")),
                .shadowColor(Color.blue),
                .shadowOffsetY(2873),
                .borderWidth(15)
                ))
        )
        let labelRegionValue = FormattedLabel(
            .normal(FormattedLabelStyle(
                .show(false)
                ))
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
