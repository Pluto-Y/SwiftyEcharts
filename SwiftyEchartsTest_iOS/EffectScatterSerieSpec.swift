//
//  EffectScatterSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class EffectScatterSerieSpec: QuickSpec {
    override func spec() {
        let renderShowEffectOn = EffectScatterSerie.ShowEffectOn.render
        let emphasisShowEffectOn = EffectScatterSerie.ShowEffectOn.emphasis
        
        describe("For EffectScatterSerie.ShowEffectOn") {
            let renderString = "render"
            let emphasisString = "emphasis"
            
            expect(renderShowEffectOn.jsonString).to(equal(renderString.jsonString))
            expect(emphasisShowEffectOn.jsonString).to(equal(emphasisString.jsonString))
        }
        
        let strokeBrushType = EffectScatterSerie.RippleEffect.BrushType.stroke
        let fillBrushType = EffectScatterSerie.RippleEffect.BrushType.fill
        
        describe("For EffectScatterSerie.RippleEffect.BrushType") {
            let strokeString = "stroke"
            let fillString = "fill"
            
            expect(strokeBrushType.jsonString).to(equal(strokeString.jsonString))
            expect(fillBrushType.jsonString).to(equal(fillString.jsonString))
        }
        
        let periodValue: Float = 5.0
        let scaleValue: Float = 1.5
        let brushTypeValue = strokeBrushType
        
        let rippleEffect = EffectScatterSerie.RippleEffect()
        rippleEffect.period = periodValue
        rippleEffect.scale = scaleValue
        rippleEffect.brushType = brushTypeValue
        
        describe("For EffectScatterSerie.RippleEffect") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "period": periodValue,
                    "scale": scaleValue,
                    "brushType": brushTypeValue
                ]
                
                expect(rippleEffect.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let rippleEffectByEnums = EffectScatterSerie.RippleEffect(
                    .period(periodValue),
                    .scale(scaleValue),
                    .brushType(brushTypeValue)
                )
                
                expect(rippleEffectByEnums.jsonString).to(equal(rippleEffect.jsonString))
            }
        }
    }
}
