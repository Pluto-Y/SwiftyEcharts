//
//  BezierCurveGraphicSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class BezierCurveGraphicSpec: QuickSpec {
    override func spec() {
        let x1Value: Float = 7.5
        let y1Value: Float = 1500.22
        let x2Value: Float = 382.12
        let y2Value: Float = 0.11
        let cpx1Value: Float = 2.55
        let cpy1Value: Float = 5.55
        let cpx2Value: Float = 7.882
        let cpy2Value: Float = 8.2356
        let percentValue: Float = 0.5
        
        let bezierCurveGraphicShape = BezierCurveGraphic.Shape()
        bezierCurveGraphicShape.x1 = x1Value
        bezierCurveGraphicShape.y1 = y1Value
        bezierCurveGraphicShape.x2 = x2Value
        bezierCurveGraphicShape.y2 = y2Value
        bezierCurveGraphicShape.cpx1 = cpx1Value
        bezierCurveGraphicShape.cpy1 = cpy1Value
        bezierCurveGraphicShape.cpx2 = cpx2Value
        bezierCurveGraphicShape.cpy2 = cpy2Value
        bezierCurveGraphicShape.percent = percentValue
        
        describe("For BezierCurverGraphic.Shape") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "x1": x1Value,
                    "y1": y1Value,
                    "x2": x2Value,
                    "y2": y2Value,
                    "cpx1": cpx1Value,
                    "cpy1": cpy1Value,
                    "cpx2": cpx2Value,
                    "cpy2": cpy2Value,
                    "percent": percentValue
                ]
                
                expect(bezierCurveGraphicShape.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let bezierCurveGraphicShapeByEnums = BezierCurveGraphic.Shape(
                    .x1(x1Value),
                    .y1(y1Value),
                    .x2(x2Value),
                    .y2(y2Value),
                    .cpx1(cpx1Value),
                    .cpy1(cpy1Value),
                    .cpx2(cpx2Value),
                    .cpy2(cpy2Value),
                    .percent(percentValue)
                )
                
                expect(bezierCurveGraphicShapeByEnums.jsonString).to(equal(bezierCurveGraphicShape.jsonString))
            }
        }
    }
}
