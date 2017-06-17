//
//  TextSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 12/05/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class TextSpec: QuickSpec {
    
    override func spec() {
        describe("For Align") {
            it(" needs to check the jsonString ") {
                let leftAlign = Align.left
                let rightAlign = Align.right
                let centerAlign = Align.center
                let autoAlign = Align.auto
                let noneAlign = Align.none
                
                expect(leftAlign.jsonString).to(equal("left".jsonString))
                expect(rightAlign.jsonString).to(equal("right".jsonString))
                expect(centerAlign.jsonString).to(equal("center".jsonString))
                expect(autoAlign.jsonString).to(equal("auto".jsonString))
                expect(noneAlign.jsonString).to(equal("".jsonString))
            }
        }
        
        describe("For VerticalAlign") { 
            it(" needs to check the jsonString ") {
                let topVerticalAlign = VerticalAlign.top
                let middleVerticalAlign = VerticalAlign.middle
                let bottomVerticalAlign = VerticalAlign.bottom
                
                expect(topVerticalAlign.jsonString).to(equal("top".jsonString))
                expect(middleVerticalAlign.jsonString).to(equal("middle".jsonString))
                expect(bottomVerticalAlign.jsonString).to(equal("bottom".jsonString))
            }
        }
        
        describe("For TextStyle") {
            let color: Color = .red
            let fontStyle: FontStyle = .italic
            let fontWeight: FontWeight = .bolder
            let fontFamily: String = "Arial"
            let fontSize: UInt = 32
            let align: Position = .center
            let textStyleDic: [String: Jsonable] = ["color": color, "fontStyle": fontStyle, "fontWeight": fontWeight, "fontFamily": fontFamily, "fontSize": fontSize, "align": align]
            
            it(" needs to check the jsonString ") {
                let textStyle = TextStyle()
                textStyle.color = color
                textStyle.fontStyle = fontStyle
                textStyle.fontWeight = fontWeight
                textStyle.fontFamily = fontFamily
                textStyle.fontSize = fontSize
                textStyle.align = align
                expect(textStyle.jsonString).to(equal(textStyleDic.jsonString))
            }
        }
    }

}
