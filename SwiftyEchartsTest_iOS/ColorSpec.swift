//
//  ColorSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 02/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class ColorSpec: QuickSpec {
    
    override func spec() {
        
        describe("For Color.ImageRepeat") {
            let repeatAll = Color.ImageRepeat.repeatAll
            let noRepeat = Color.ImageRepeat.noRepeat
            let repeatX = Color.ImageRepeat.repeatX
            let repeatY = Color.ImageRepeat.repeatY
            
            it(" needs to check the jsonString for repeat ") {
                expect(repeatAll.jsonString).to(equal("\"repeat\""))
                expect(noRepeat.jsonString).to(equal("\"no-repeat\""))
                expect(repeatX.jsonString).to(equal("\"repeat-x\""))
                expect(repeatY.jsonString).to(equal("\"repeat-y\""))
            }
            
        }
        
        describe("For GradientColorElement") {
            let normalPosition: Float = 0
            let normalElement = GradientColorElement(normalPosition, .red)
            let dictionaryPosition: Float = 1
            let dictionaryElement: GradientColorElement = ["offset": dictionaryPosition, "color": Color.blue]
            let offsetOnlyElement: GradientColorElement = ["offset": dictionaryPosition, "test": false]
            
            it (" needs to check the constructor and jsonString for GradientColorElement") {
                expect(normalElement.jsonString).to(equal("{\"offset\": \(normalPosition.jsonString), \"color\": \"red\"}"))
                expect(dictionaryElement.jsonString).to(equal("{\"offset\": \(dictionaryPosition.jsonString), \"color\": \"blue\"}"))
                expect(offsetOnlyElement.jsonString).to(equal("null"))
            }
        }
        
        
        describe("For Color") { 
            let rgbColor = Color.rgb(120, 0, 255)
            let rgbaColor = Color.rgba(80, 22, 37, 0.5)
            let hexColor = Color.hexColor("#209")
            let hexColor2 = Color.hexColor("#22EE98")
            
            it(" needs to check the linearGradient case ") {
                let x0: Float = 0, y0: Float = 0, x2: Float = 0, y2: Float = 1
                let offset1: Float = 0, offset2: Float = 1
                let color1 = Color.red, color2 = Color.blue
                let gradientElement1: GradientColorElement = ["offset": offset1, "color": color1]
                let gradientElement2 = GradientColorElement(offset2, color2)
                JsCache.removeAll()
                let linearGradient = Color.linearGradient(x0, y0, x2, y2, [gradientElement1, gradientElement2], false)
                expect(linearGradient.jsonString).to(equal("\"linearGradient0\""))
                let linearGradientJs = JsCache.allJsStrings()[0]
                expect(linearGradientJs).to(equal("var linearGradient0 = new echarts.graphic.LinearGradient(\(x0.jsonString), \(y0.jsonString), \(x2.jsonString), \(y2.jsonString), [\(gradientElement1.jsonString),\(gradientElement2.jsonString)], false);"))
            }
            
            it(" needs to check the radialGradient case ") {
                let x: Float = 3.0, y: Float = 9.27, r: Float = 85.3
                let offset1: Float = 0, offset2: Float = 0.5, offset3: Float = 1
                let color1 = Color.blue, color2 = Color.transparent, color3 = Color.green
                let gradientElement1: GradientColorElement = ["offset": offset1, "color": color1]
                let gradientElement2 = GradientColorElement(offset2, color2)
                let gradientElement3 = GradientColorElement(offset3, color3)
                JsCache.removeAll()
                let radialGradient = Color.radialGradient(x, y, r, [gradientElement1, gradientElement2, gradientElement3], true)
                expect(radialGradient.jsonString).to(equal("\"radialGradient0\""))
                
                let radialGradientJs = JsCache.allJsStrings()[0]
                expect(radialGradientJs).to(equal("var radialGradient0 = new echarts.graphic.RadialGradient(\(x.jsonString), \(y.jsonString), \(r.jsonString), [\(gradientElement1.jsonString),\(gradientElement2.jsonString),\(gradientElement3.jsonString)], true);"))
            }
        }
        
        
    }

}
