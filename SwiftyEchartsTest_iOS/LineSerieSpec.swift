//
//  LineSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 20/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class LineSerieSpec: QuickSpec {
    override func spec() {
        describe("For LineSerie.Sampling") {
            let averageString = "average"
            let maxString = "max"
            let minString = "min"
            let sumString = "sum"
            
            let averageSampling = LineSerie.Sampling.average
            let maxSampling = LineSerie.Sampling.max
            let minSampling = LineSerie.Sampling.min
            let sumSampling = LineSerie.Sampling.sum
            
            it("needs to check the enum case") {
                expect(averageSampling.jsonString).to(equal(averageString.jsonString))
                expect(maxSampling.jsonString).to(equal(maxString.jsonString))
                expect(minSampling.jsonString).to(equal(minString.jsonString))
                expect(sumSampling.jsonString).to(equal(sumString.jsonString))
            }
        }
    }
}
