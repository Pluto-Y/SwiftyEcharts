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
    }
}
