//
//  TooltipSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 26/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class TooltipSpec: QuickSpec {
    override func spec() {
        describe("For Tooltip.Trigger.TriggerOn") {
            let mousemoveString = "mousemove"
            let clickString = "click"
            let noneString = "none"
            
            let mousemoveTriggerOn = Tooltip.Trigger.TriggerOn.mousemove
            let clickTriggerOn = Tooltip.Trigger.TriggerOn.click
            let noneTriggerOn = Tooltip.Trigger.TriggerOn.none
            
            it("needs to check the enum case jsonString") {
                expect(mousemoveTriggerOn.jsonString).to(equal(mousemoveString.jsonString))
                expect(clickTriggerOn.jsonString).to(equal(clickString.jsonString))
                expect(noneTriggerOn.jsonString).to(equal(noneString.jsonString))
            }
        }
    }
}
