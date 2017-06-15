//
//  ColorSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 02/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class ColorSpec: QuickSpec {
    
    override func spec() {
        // 错误的颜色的 jsontString
        let errorColorJsonString = "null".jsonString
        
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
        
        
        describe("For Color enum") {
            let redValue = Int(arc4random_uniform(256))
            let greenValue = Int(arc4random_uniform(256))
            let blueValue = Int(arc4random_uniform(256))
            let alphaValue = Float(Float(arc4random_uniform(100)) / 100.0)
            let errorRedValue = 256
            let errorRedColor = Color.rgb(errorRedValue, greenValue, blueValue)
            let errorGreenValue = -1
            let errorGreenColor = Color.rgb(redValue, errorGreenValue, blueValue)
            let errorBlueValue = -10
            let errorBlueColor = Color.rgb(redValue, greenValue, errorBlueValue)
            let errorAlphaValue: Float = 1.01
            let errorAlphaColor = Color.rgba(redValue, greenValue, blueValue, errorAlphaValue)
            let rgbColor = Color.rgb(redValue, greenValue, blueValue)
            let rgbaColor = Color.rgba(redValue, greenValue, blueValue, alphaValue)
            
            it(" needs to check the Color.validate(_:_:_:_:) function ") {
                expect(Color.validate(errorRedValue, greenValue, blueValue)).to(equal(false))
                expect(Color.validate(redValue, errorGreenValue, blueValue)).to(equal(false))
                expect(Color.validate(redValue, greenValue, errorBlueValue)).to(equal(false))
                expect(Color.validate(redValue, greenValue, blueValue, errorAlphaValue)).to(equal(false))
                expect(Color.validate(redValue, greenValue, blueValue)).to(equal(true))
                expect(Color.validate(redValue, greenValue, blueValue, alphaValue)).to(equal(true))
            }
            
            it(" needs to check the rgba and rgb case ") {
                expect(rgbColor.jsonString).to(equal("rgba(\(redValue), \(greenValue), \(blueValue), 1.0)".jsonString))
                expect(rgbaColor.jsonString).to(equal("rgba(\(redValue), \(greenValue), \(blueValue), \(alphaValue))".jsonString))
                expect(errorRedColor.jsonString).to(equal(errorColorJsonString))
                expect(errorGreenColor.jsonString).to(equal(errorColorJsonString))
                expect(errorBlueColor.jsonString).to(equal(errorColorJsonString))
                expect(errorAlphaColor.jsonString).to(equal(errorColorJsonString))
            }
            
            let sixCharactersHexString = "#22EE98"
            let errorSixCharactersHexStringWithoutPound = "22ee98"
            let threeeCharactersHexString = "#2e8"
            let errorEightCharactersHexString = "#FF0088C0"
            let errorFourCharactersHexString = "#F08c"
            let errorFourCharactersHexStringWihtoutPound = "f08C"
            let errorCharacterHexString = "#gg08CC"
            let errorCountsOfCharacterHexString = "#gg088CC"
            let sixCharacterHexColor = Color.hexColor(sixCharactersHexString)
            let errorSixCharacterWithoutPoundHexColor = Color.hexColor(errorSixCharactersHexStringWithoutPound)
            let threeCharacterHexColor = Color.hexColor(threeeCharactersHexString)
            let errorEightCharacterHexColor = Color.hexColor(errorEightCharactersHexString)
            let errorFourCharacterHexColor = Color.hexColor(errorFourCharactersHexString)
            let errorFourCharacterWitoutPoundHexColor = Color.hexColor(errorFourCharactersHexStringWihtoutPound)
            let errorCharacterHexColor = Color.hexColor(errorCharacterHexString)
            let errorCountsOfCharacterHexColor = Color.hexColor(errorCountsOfCharacterHexString)
            
            it(" needs to check the Color.validate(_:) ") {
                expect(Color.validate(sixCharactersHexString)).to(equal(true))
                expect(Color.validate(errorSixCharactersHexStringWithoutPound)).to(equal(false))
                expect(Color.validate(threeeCharactersHexString)).to(equal(true))
                expect(Color.validate(errorEightCharactersHexString)).to(equal(false))
                expect(Color.validate(errorFourCharactersHexString)).to(equal(false))
                expect(Color.validate(errorFourCharactersHexStringWihtoutPound)).to(equal(false))
                expect(Color.validate(errorCharacterHexString)).to(equal(false))
                expect(Color.validate(errorCountsOfCharacterHexString)).to(equal(false))
            }
            
            it(" needs to check the hexColor case ") {
                expect(sixCharacterHexColor.jsonString).to(equal(sixCharactersHexString.jsonString))
                expect(errorSixCharacterWithoutPoundHexColor.jsonString).to(equal(errorColorJsonString))
                expect(threeCharacterHexColor.jsonString).to(equal(threeeCharactersHexString.jsonString))
                expect(errorEightCharacterHexColor.jsonString).to(equal(errorColorJsonString))
                expect(errorFourCharacterHexColor.jsonString).to(equal(errorColorJsonString))
                expect(errorFourCharacterWitoutPoundHexColor.jsonString).to(equal(errorColorJsonString))
                expect(errorCharacterHexColor.jsonString).to(equal(errorColorJsonString))
                expect(errorCountsOfCharacterHexColor.jsonString).to(equal(errorColorJsonString))
            }
            
            let sixCharactersLiteralColor: Color = "#22EE98"
            let errorSixCharactersWithoutPoundLiteralColor: Color = "22ee98"
            let threeeCharactersLiteralColor: Color = "#2e8"
            let errorEightCharactersLiteralColor: Color = "#FF0088C0"
            let errorFourCharactersLiteralColor: Color = "#F08c"
            let errorFourCharactersLiteralColorWihtoutPound: Color = "f08C"
            let errorCharacterLiteralColor: Color = "#gg08CC"
            let errorCountsOfCharacterLiteralColor: Color = "#gg088CC"
            
            it(" needs to check the StringLiteralConvertible ") {
                expect(sixCharactersLiteralColor.jsonString).to(equal(sixCharacterHexColor.jsonString))
                expect(errorSixCharactersWithoutPoundLiteralColor.jsonString).to(equal(errorSixCharacterWithoutPoundHexColor.jsonString))
                expect(threeeCharactersLiteralColor.jsonString).to(equal(threeCharacterHexColor.jsonString))
                expect(errorEightCharactersLiteralColor.jsonString).to(equal(errorEightCharacterHexColor.jsonString))
                expect(errorFourCharactersLiteralColor.jsonString).to(equal(errorFourCharacterHexColor.jsonString))
                expect(errorFourCharactersLiteralColorWihtoutPound.jsonString).to(equal(errorFourCharacterWitoutPoundHexColor.jsonString))
                expect(errorCharacterLiteralColor.jsonString).to(equal(errorCharacterHexColor.jsonString))
                expect(errorCountsOfCharacterLiteralColor.jsonString).to(equal(errorCountsOfCharacterHexColor.jsonString))
            }
            
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
        
        describe("For rgb or rgba extension") {
            
            it(" needs can check the creation of functions") {
                for _ in 0..<10 {
                    let red = Int(arc4random_uniform(300))
                    let green = Int(arc4random_uniform(300))
                    let blue = Int(arc4random_uniform(300))
                    let alpha = Float(arc4random_uniform(300)) / 400
                    expect(rgb(red, green, blue).jsonString).to(equal(Color.rgb(red, green, blue).jsonString))
                    expect(rgba(red, green, blue, alpha).jsonString).to(equal(Color.rgba(red, green, blue, alpha).jsonString))
                }
            }
        }
        
        
    }

}
