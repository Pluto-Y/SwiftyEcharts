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
    }
}
