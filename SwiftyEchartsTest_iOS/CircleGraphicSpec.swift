//
//  CircleGraphicSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 08/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class CircleGraphicSpec: QuickSpec {
    override func spec() {
        let cxValue: Float = 5.2356
        let cyValue: Float = 8.2714
        let rValue: Float = 5.0
        
        let shape = CircleGraphic.Shape()
        shape.cx = cxValue
        shape.cy = cyValue
        shape.r = rValue
        
        describe("For CircleGraphic.Shape") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "cx": cxValue,
                    "cy": cyValue,
                    "r": rValue
                ]
                expect(shape.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let shapeByEnums = CircleGraphic.Shape(
                    .cx(cxValue),
                    .cy(cyValue),
                    .r(rValue)
                )
                
                expect(shapeByEnums.jsonString).to(equal(shape.jsonString))
            }
        }
    }
}
