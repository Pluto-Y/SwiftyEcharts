//
//  PolarSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 01/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class PolarSpec: QuickSpec {
    override func spec() {
        describe("For Polar") {
            let zlevelValue: Float = 85.72
            let zValue: Float = 1.01
            let centerValue: Point = [50%, 50%]
            let radiusValue: SwiftyEcharts.Range = [10, 85]
            
            let polar = Polar()
            polar.zlevel = zlevelValue
            polar.z = zValue
            polar.center = centerValue
            polar.radius = radiusValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "zlevel": zlevelValue,
                    "z": zValue,
                    "center": centerValue,
                    "radius": radiusValue
                ]
                
                expect(polar.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let polarByEnums = Polar(
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .center(centerValue),
                    .radius(radiusValue)
                )
                
                expect(polarByEnums.jsonString).to(equal(polar.jsonString))
            }
        }
    }
}
