//
//  AxisTypeSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 21/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class AxisTypeSpec: QuickSpec {
    override func spec() {
        describe("For AxisType") {
            it(" needs to check the jsonString ") {
                let valueString = "value"
                let categoryString = "category"
                let timeString = "time"
                let logString = "log"
                
                let valueAxisType = AxisType.value
                let categoryAxisType = AxisType.category
                let timeAxisType = AxisType.time
                let logAxisType = AxisType.log
                
                expect(valueAxisType.jsonString).to(equal(valueString.jsonString))
                expect(categoryAxisType.jsonString).to(equal(categoryString.jsonString))
                expect(timeAxisType.jsonString).to(equal(timeString.jsonString))
                expect(logAxisType.jsonString).to(equal(logString.jsonString))
            }
        }
    }
}
