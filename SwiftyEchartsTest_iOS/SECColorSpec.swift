//
//  SECColorSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 02/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class SECColorSpec: QuickSpec {
    
    override func spec() {
        
        describe("For SECColor.ImageRepeat") {
            let repeatAll = SECColor.ImageRepeat.repeatAll
            let noRepeat = SECColor.ImageRepeat.noRepeat
            let repeatX = SECColor.ImageRepeat.repeatX
            let repeatY = SECColor.ImageRepeat.repeatY
            
            it(" needs to check the jsonString for repeat ") {
                expect(repeatAll.jsonString).to(equal("\"repeat\""))
                expect(noRepeat.jsonString).to(equal("\"no-repeat\""))
                expect(repeatX.jsonString).to(equal("\"repeat-x\""))
                expect(repeatY.jsonString).to(equal("\"repeat-y\""))
            }
            
        }
        
        describe("For SECGradientColorElement") {
            let normalPosition: Float = 0
            let normalElement = SECGradientColorElement(normalPosition, .red)
            let dictionaryPosition: Float = 1
            let dictionaryElement: SECGradientColorElement = ["offset": dictionaryPosition, "color": SECColor.blue]
            let offsetOnlyElement: SECGradientColorElement = ["offset": dictionaryPosition, "test": false]
            
            it (" needs to check the constructor and jsonString for SECGradientColorElement") {
                expect(normalElement.jsonString).to(equal("{\"offset\": \(normalPosition.jsonString), \"color\": \"red\"}"))
                expect(dictionaryElement.jsonString).to(equal("{\"offset\": \(dictionaryPosition.jsonString), \"color\": \"blue\"}"))
                expect(offsetOnlyElement.jsonString).to(equal("null"))
            }
        }
        
        
        describe("For SECColor") { 
            let rgbColor = SECColor.rgb(120, 0, 255)
            let rgbaColor = SECColor.rgba(80, 22, 37, 0.5)
            let hexColor = SECColor.hexColor("#209")
            let hexColor2 = SECColor.hexColor("#22EE98")
            
            
            it(" needs to check the linearGradient case ") {
                let x0: Float = 0, y0: Float = 0, x2: Float = 0, y2: Float = 1
                let offset1: Float = 0, offset2: Float = 1
                let color1 = SECColor.red, color2 = SECColor.blue
                let gradientElement1: SECGradientColorElement = ["offset": offset1, "color": color1]
                let gradientElement2 = SECGradientColorElement(offset2, color2)
                let linearGradient = SECColor.linearGradient(x0, y0, x2, y2, [gradientElement1, gradientElement2], false)
//                print(linearGradient.jsonString)
                let linearGrandientJs = SECJsCache.allFunctions()[0]
                expect(linearGrandientJs).to(equal("var linearGradient0 = new echarts.graphic.LinearGradient(\(x0.jsonString), \(y0.jsonString), \(x2.jsonString), \(y2.jsonString), [\(gradientElement1.jsonString),\(gradientElement2.jsonString)], false);"))
            }
        }
        
        
    }

}
