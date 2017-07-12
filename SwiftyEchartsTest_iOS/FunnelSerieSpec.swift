//
//  FunnelSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 12/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class FunnelSerieSpec: QuickSpec {
    override func spec() {
        let ascendingSort = FunnelSerie.Sort.ascending
        let descendingSort = FunnelSerie.Sort.descending
        
        describe("For FunnelSerie.Sort") {
            let ascendingString = "ascending"
            let descendingString = "descending"
            it("needs to check the jsonString") {
                expect(ascendingSort.jsonString).to(equal(ascendingString.jsonString))
                expect(descendingSort.jsonString).to(equal(descendingString.jsonString))
            }
        }
        
        let labelLineShowValue = false
        let labelLineLengthValue: Float = 0.512
        let 
        
        describe("For FunnelSerie.LabelLineContent") { 
            
        }
    }
}
