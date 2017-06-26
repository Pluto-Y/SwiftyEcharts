//
//  MarkDataTypeSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 26/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class MarkDataTypeSpec: QuickSpec {
    override func spec() {
        describe("For MarkDataType") { 
            it("needs to check the jsonString") {
                let minString = "min"
                let maxString = "max"
                let averageString = "average"
                
                let minMarkDataType = MarkDataType.min
                let maxMarkDataType = MarkDataType.max
                let avgMarkDataType = MarkDataType.average
                
                expect(minMarkDataType.jsonString).to(equal(minString.jsonString))
                expect(maxMarkDataType.jsonString).to(equal(maxString.jsonString))
                expect(avgMarkDataType.jsonString).to(equal(averageString.jsonString))
            }
        }
    }
}
