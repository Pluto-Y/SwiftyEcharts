//
//  RingGraphicSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class RingGraphicSpec: QuickSpec {
    override func spec() {
        let cxShapeValue: Float = 85.3747
        let cyShapeValue: Float = 0.48347
        let rShapeValue: Float = 7675834
        let r0ShapeValue: Float = 94757.83732
        
        let shape = RingGraphic.Shape()
        shape.cx = cxShapeValue
        shape.cy = cyShapeValue
        shape.r = rShapeValue
        shape.r0 = r0ShapeValue
        
        describe("For RingGraphic.Shape") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "cx": cxShapeValue,
                    "cy": cyShapeValue,
                    "r": rShapeValue,
                    "r0": r0ShapeValue
                ]
                
                expect(shape.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let shapeByEnums = RingGraphic.Shape(
                    .cx(cxShapeValue),
                    .cy(cyShapeValue),
                    .r(rShapeValue),
                    .r0(r0ShapeValue)
                )
                
                expect(shapeByEnums.jsonString).to(equal(shape.jsonString))
            }
        }
    }
}
