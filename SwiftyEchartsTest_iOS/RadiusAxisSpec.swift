//
//  RadiusAxisSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class RadiusAxisSpec: QuickSpec {
    override func spec() {
        describe("For RadiusAxis.AxisPointer.Type") { 
            let lineString = "line"
            let shadowString = "shadow"
            
            let lineType = RadiusAxis.AxisPointer.Type.line
            let shadowType = RadiusAxis.AxisPointer.Type.shadow
            
            it("needs to check the jsonString") {
                expect(lineType.jsonString).to(equal(lineString.jsonString))
                expect(shadowType.jsonString).to(equal(shadowString.jsonString))
            }
        }
    }
}
