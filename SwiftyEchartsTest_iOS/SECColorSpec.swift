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
        
        describe("For SECColor") { 
            let rgbColor = SECColor.rgb(120, 0, 255)
            let rgbaColor = SECColor.rgba(80, 22, 37, 0.5)
            let hexColor = SECColor.hexColor("#209")
            let hexColor2 = SECColor.hexColor("#22EE98")
        }
    }

}
