//
//  BrushSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 05/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class BrushSpec: QuickSpec {
    override func spec() {
        let rectToolbox = Brush.Toolbox.rect
        let polygonToolbox = Brush.Toolbox.polygon
        let lineXToolbox = Brush.Toolbox.lineX
        let lineYToolbox = Brush.Toolbox.lineY
        let keepToolbox = Brush.Toolbox.keep
        let clearToolbox = Brush.Toolbox.clear
        
        describe("For Brush.Toolbox") {
            let rectString = "rect"
            let polygonString = "polygon"
            let lineXString = "lineX"
            let lineYString = "lineY"
            let keepString = "keep"
            let clearString = "clear"
            
            it("needs to check the jsonString") {
                expect(rectToolbox.jsonString).to(equal(rectString.jsonString))
                expect(polygonToolbox.jsonString).to(equal(polygonString.jsonString))
                expect(lineXToolbox.jsonString).to(equal(lineXString.jsonString))
                expect(lineYToolbox.jsonString).to(equal(lineYString.jsonString))
                expect(keepToolbox.jsonString).to(equal(keepString.jsonString))
                expect(clearToolbox.jsonString).to(equal(clearString.jsonString))
            }
        }
        
        describe("") { 
            
        }
    }
}
