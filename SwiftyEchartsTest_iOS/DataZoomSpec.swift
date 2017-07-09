//
//  DataZoomSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class DataZoomSpec: QuickSpec {
    override func spec() {
        describe("For FilterMode") {
            
            let filterString = "filter"
            let emptyString = "empty"
            
            let filterFilterMode = FilterMode.filter
            let emptyFilterMode = FilterMode.empty
            
            it("needs to check the jsonString") {
                expect(filterFilterMode.jsonString).to(equal(filterString.jsonString))
                expect(emptyFilterMode.jsonString).to(equal(emptyString.jsonString))
            }
        }
    }
}
