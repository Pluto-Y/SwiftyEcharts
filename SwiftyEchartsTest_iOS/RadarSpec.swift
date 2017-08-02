//
//  RadarSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 02/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class RadarSpec: QuickSpec {
    override func spec() {
        let showNameValue = false
        let formatterNameValue: Formatter = .string("nameFormatterValue")
        let textStyleNameValue = TextStyle(
            .color(Color.transparent),
            .fontWeight(.lighter),
            .fontSize(20)
        )
        
        let name = Radar.Name()
        name.show = showNameValue
        name.formatter = formatterNameValue
        name.textStyle = textStyleNameValue
        
        describe("For Radar.Name") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showNameValue,
                    "formatter": formatterNameValue,
                    "textStyle": textStyleNameValue
                ]
                
                expect(name.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let nameByEnums = Radar.Name(
                    .show(showNameValue),
                    .formatter(formatterNameValue),
                    .textStyle(textStyleNameValue)
                )
                
                expect(nameByEnums.jsonString).to(equal(name.jsonString))
            }
        }
    }
}
