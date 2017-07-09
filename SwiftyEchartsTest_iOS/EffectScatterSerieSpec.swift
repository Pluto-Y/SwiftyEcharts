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
    }
}
