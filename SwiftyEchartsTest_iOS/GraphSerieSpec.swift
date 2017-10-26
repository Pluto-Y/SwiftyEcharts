//
//  GraphSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 26/10/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class GraphSerieSpec: QuickSpec {
    override func spec() {
        describe("For GraphSerie.Layout") {
            let noneString = "none"
            let circularString = "circular"
            let forceString = "force"
            
            let noneLayout = GraphSerie.Layout.none
            let circularLayout = GraphSerie.Layout.circular
            let forceLayout = GraphSerie.Layout.force
            
            it("needs to check the jsonString") {
                expect(noneLayout.jsonString).to(equal(noneString.jsonString))
                expect(circularLayout.jsonString).to(equal(circularString.jsonString))
                expect(forceLayout.jsonString).to(equal(forceString.jsonString))
            }
        }
    }
}
