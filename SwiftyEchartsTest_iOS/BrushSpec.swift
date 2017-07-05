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
        
        let indexIndexes = Brush.Indexes.indexes([0, 4, 2])
        let allIndexes = Brush.Indexes.all
        let noneIndexes = Brush.Indexes.none
        
        describe("For Brush.Indexes") {
            let indexArray = [0, 4, 2]
            let allString = "all"
            let noneString = "none"
            
            it("needs to check the jsonString") {
                expect(indexIndexes.jsonString).to(equal(indexArray.jsonString))
                expect(allIndexes.jsonString).to(equal(allString.jsonString))
                expect(noneIndexes.jsonString).to(equal(noneString.jsonString))
            }
        }
        
        let rectType = SwiftyEcharts.Brush.Type.rect
        let polygonType = SwiftyEcharts.Brush.Type.polygon
        let lineXType = SwiftyEcharts.Brush.Type.lineX
        let lineYType = SwiftyEcharts.Brush.Type.lineY
        
        describe("For Brush.Type") {
            let rectString = "rect"
            let polygonString = "polygon"
            let lineXString = "lineX"
            let lineYString = "lineY"
            
            expect(rectType.jsonString).to(equal(rectString.jsonString))
            expect(polygonType.jsonString).to(equal(polygonString.jsonString))
            expect(lineXType.jsonString).to(equal(lineXString.jsonString))
            expect(lineYType.jsonString).to(equal(lineYString.jsonString))
        }
        
        let singleMode = Brush.Mode.single
        let multipleMode = Brush.Mode.multiple
        
        describe("For Brush.Mode") { 
            let singleString = "single"
            let multipleString = "multiple"
            
            expect(singleMode.jsonString).to(equal(singleString.jsonString))
            expect(multipleMode.jsonString).to(equal(multipleString.jsonString))
        }
        
        let debounceThrottleType = Brush.ThrottleType.debounce
        let fixRateThrottleType = Brush.ThrottleType.fixRate
        
        describe("For Brush.ThrottleType") { 
            let debounceString = "debounce"
            let fixRateString = "fixRate"
            
            expect(debounceThrottleType.jsonString).to(equal(debounceString.jsonString))
            expect(fixRateThrottleType.jsonString).to(equal(fixRateString.jsonString))
        }
    }
}
