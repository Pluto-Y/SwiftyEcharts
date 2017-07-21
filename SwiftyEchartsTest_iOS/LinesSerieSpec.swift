//
//  LinesSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 21/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class LinesSerieSpec: QuickSpec {
    override func spec() {
        let showEffectValue = true
        let periodEffectValue: Float = 0.5
        let constantSpeedEffectValue: Float = 9.583
        let symbolOriginValue = Symbol.roundRect
        let symbolEffectValue = OneOrMore(one: symbolOriginValue)
        let symbolSizeEffectValue = FunctionOrFloatOrPair.point([20, 88])
        let colorEffectValue = Color.green
        let trailLengthEffectValue: Float = 8.383
        let loopEffectValue = false
        
        let effect = LinesSerie.Effect()
        effect.show = showEffectValue
        effect.period = periodEffectValue
        effect.constantSpeed = constantSpeedEffectValue
        effect.symbol = symbolEffectValue
        effect.symbolSize = symbolSizeEffectValue
        effect.color = colorEffectValue
        effect.trailLength = trailLengthEffectValue
        effect.loop = loopEffectValue
        
        describe("For LinesSerie.Effect") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showEffectValue,
                    "period": periodEffectValue,
                    "constantSpeed": constantSpeedEffectValue,
                    "symbol": symbolEffectValue,
                    "symbolSize": symbolSizeEffectValue,
                    "color": colorEffectValue,
                    "trailLength": trailLengthEffectValue,
                    "loop": loopEffectValue
                ]
                
                expect(effect.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let effectByEnums = LinesSerie.Effect(
                    .show(showEffectValue),
                    .period(periodEffectValue),
                    .constantSpeed(constantSpeedEffectValue),
                    .symbol(symbolOriginValue),
                    .symbolSize(symbolSizeEffectValue),
                    .color(colorEffectValue),
                    .trailLength(trailLengthEffectValue),
                    .loop(loopEffectValue)
                )
                
                expect(effectByEnums.jsonString).to(equal(effect.jsonString))
            }
        }
    }

}
