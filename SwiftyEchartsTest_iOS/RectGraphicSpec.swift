//
//  RectGraphicSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class RectGraphicSpec: QuickSpec {
    override func spec() {
        let xShapeValue: Float = 0.2785
        let yShapeValue: Float = 555.863
        let widthShapeValue: Float = 888888
        let heightShapeValue: Float = 55.99999
        
        let shape = RectGraphic.Shape()
        shape.x = xShapeValue
        shape.y = yShapeValue
        shape.width = widthShapeValue
        shape.height = heightShapeValue
        
        describe("For RectGraphic.Shap") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "x": xShapeValue,
                    "y": yShapeValue,
                    "width": widthShapeValue,
                    "height": heightShapeValue
                ]
                
                expect(shape.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let shapeByEnums = RectGraphic.Shape(
                    .x(xShapeValue),
                    .y(yShapeValue),
                    .width(widthShapeValue),
                    .height(heightShapeValue)
                )
                
                expect(shapeByEnums.jsonString).to(equal(shapeByEnums.jsonString))
            }
        }
    }
}
