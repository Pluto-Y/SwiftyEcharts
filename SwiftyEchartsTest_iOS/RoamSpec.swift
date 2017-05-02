//
//  RoamSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 02/05/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class RoamSpec: QuickSpec {
    
    override func spec() {
        describe("For Roam jsonString") {
            let enableRoam = Roam.enable
            let disableRoam = Roam.disable
            it(" needs to check the jsonString for the Roam") {
                let scaleRoam = Roam.scale
                let zoomRoam = Roam.zoom
                let moveRoam = Roam.move
                let panRoam = Roam.pan
                
                expect(enableRoam.jsonString).to(equal("true"))
                expect(disableRoam.jsonString).to(equal("false"))
                expect(scaleRoam.jsonString).to(equal("scale".jsonString))
                expect(scaleRoam.jsonString).to(equal("scale".jsonString))
                expect(zoomRoam.jsonString).to(equal("zoom".jsonString))
                expect(moveRoam.jsonString).to(equal("move".jsonString))
                expect(panRoam.jsonString).to(equal("pan".jsonString))
            }
            
            it(" needs to check constructor for Bool") {
                let trueRoam: Roam = true
                let falseRoam: Roam = false
                
                expect(enableRoam.jsonString).to(equal(trueRoam.jsonString))
                expect(disableRoam.jsonString).to(equal(falseRoam.jsonString))
            }
        }
    }
    
}
