//
//  BoundaryGapSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 05/05/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class BoundaryGapSpec: QuickSpec {
    
    override func spec() {
        describe("For BoundaryGap") {
            
            let enableBoundaryGap = BoundaryGap.category(true)
            let disableBoundaryGap = BoundaryGap.category(false)
            let rangeBoundaryGap = BoundaryGap.notCategory([20%, 20%])
            
            it(" needs to check the jsonString for the BoundaryGap ") {
                expect(enableBoundaryGap.jsonString).to(equal(true.jsonString))
                expect(disableBoundaryGap.jsonString).to(equal(false.jsonString))
                expect(rangeBoundaryGap.jsonString).to(equal("[\"20.00%\",\"20.00%\"]"))
            }
            
        }
    }

}
