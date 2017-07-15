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
    }
}
