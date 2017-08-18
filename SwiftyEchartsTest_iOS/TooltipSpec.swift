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
        
        describe("For Tooltip.Trigger") {
            let itemString = "item"
            let axisString = "axis"
            
            let itemTrigger = Tooltip.Trigger.item
            let axisTrigger = Tooltip.Trigger.axis
            
            it("needs to check the enum case jsonString") {
                expect(itemTrigger.jsonString).to(equal(itemString.jsonString))
                expect(axisTrigger.jsonString).to(equal(axisString.jsonString))
            }
        }
        
        describe("For Tooltip.AxisPointer.Type") {
            let lineString = "line"
            let crossString = "cross"
            let shadowString = "shadow"
            let noneString = "none"
            
            let lineType = Tooltip.AxisPointer.Type.line
            let crossType = Tooltip.AxisPointer.Type.cross
            let shadowType = Tooltip.AxisPointer.Type.shadow
            let noneType = Tooltip.AxisPointer.Type.none
            
            it("needs to check the enum case jsonString") {
                expect(lineType.jsonString).to(equal(lineString.jsonString))
                expect(crossType.jsonString).to(equal(crossString.jsonString))
                expect(shadowType.jsonString).to(equal(shadowString.jsonString))
                expect(noneType.jsonString).to(equal(noneString.jsonString))
            }
        }
    }
}
