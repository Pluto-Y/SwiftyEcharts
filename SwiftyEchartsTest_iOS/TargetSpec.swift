//
//  TargetSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 21/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class TargetSpec: QuickSpec {
    override func spec() {
        describe("For Target") {
            it(" needs to check the jsonString ") {
                let selfTarget = Target.`self`
                let blankTarget = Target.blank
                let selfString = "self"
                let blankString = "blank"
                
                expect(selfTarget.description).to(equal(selfString))
                expect(blankTarget.description).to(equal(blankString))
                expect(selfTarget.jsonString).to(equal(selfString.jsonString))
                expect(blankTarget.jsonString).to(equal(blankString.jsonString))
                
            }
        }
    }
}
