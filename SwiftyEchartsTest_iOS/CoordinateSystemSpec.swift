//
//  CoordinateSystemSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 02/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class CoordinateSystemSpec: QuickSpec {
    override func spec() {
        describe("For CoordinateSystem") {
            let cartesian2dString = "cartesian2d"
            let polarString = "polar"
            let geoString = "geo"
            let parallelString = "parallel"
            let calendarString = "calendar"
            let noneString = "none"
            
            let cartesian2dCoordinateSystem = CoordinateSystem.cartesian2d
            let polarCoordinateSystem = CoordinateSystem.polar
            let geoCoordinateSystem = CoordinateSystem.geo
            let parallelCoordinateSystem = CoordinateSystem.parallel
            let calendarCoordinateSystem = CoordinateSystem.calendar
            let noneCoordinateSystem = CoordinateSystem.none
            
            it("needs to check the jsonString") {
                expect(cartesian2dCoordinateSystem.jsonString).to(equal(cartesian2dString.jsonString))
                expect(polarCoordinateSystem.jsonString).to(equal(polarString.jsonString))
                expect(geoCoordinateSystem.jsonString).to(equal(geoString.jsonString))
                expect(parallelCoordinateSystem.jsonString).to(equal(parallelString.jsonString))
                expect(calendarCoordinateSystem.jsonString).to(equal(calendarString.jsonString))
                expect(noneCoordinateSystem.jsonString).to(equal(noneString.jsonString))
            }
        }
    }
}
