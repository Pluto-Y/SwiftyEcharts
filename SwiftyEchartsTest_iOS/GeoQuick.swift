//
//  GeoQuick.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 08/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class GeoQuick: QuickSpec {
    override func spec() {
        describe("For Geo.ScaleLimit") {
            it(" needs to check the Enumable and Jsonable") {
                let minValue = Float(arc4random_uniform(100)) / 100.0
                let maxValue = Float(arc4random_uniform(100)) / 100.0 + 20.0
                let min = Geo.ScaleLimit.Enums.min(minValue)
                let max = Geo.ScaleLimit.Enums.max(maxValue)
                
                let scaleLimitByEnums = Geo.ScaleLimit(min, max)
                let scaleLimitNormal = Geo.ScaleLimit()
                scaleLimitNormal.min = minValue
                scaleLimitNormal.max = maxValue
                
                expect(scaleLimitByEnums.min).to(equal(scaleLimitNormal.min))
                expect(scaleLimitByEnums.max).to(equal(scaleLimitNormal.max))
                
                expect(scaleLimitByEnums.jsonString).to(equal(scaleLimitNormal.jsonString))
            }
        }
    }
}
