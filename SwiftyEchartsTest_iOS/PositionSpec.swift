//
//  PositionSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 18/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class PositionSpec: QuickSpec {
    
    override func spec() {
        describe("For Position") {
            let autoString = "auto"
            let leftString = "left"
            let centerString = "center"
            let rightString = "right"
            let topString = "top"
            let middleString = "middle"
            let bottomString = "bottom"
            let startString = "start"
            let endString = "end"
            let insideString = "inside"
            let innerString = "inner"
            let outsideString = "outside"
            let insideLeftString = "insideLeft"
            let insideTopString = "insideTop"
            let insideRightString = "insideRight"
            let insideBottomString = "insideBottom"
            let insideTopLeftString = "insideTopLeft"
            let insideBottomLeftString = "insideBottomLeft"
            let insideTopRightString = "insideTopRight"
            let insideBottomRightString = "insideBottomRight"
            let lengthValue1 = 10%
            let lengthValue2 = 87.5
            let point: Point = [lengthValue1, lengthValue2]
            let function: Function = "function (pt) {return [pt[0], '10%'];}"
            
            let autoPosition = Position.auto
            let leftPosition = Position.left
            let centerPosition = Position.center
            let rightPosition = Position.right
            let topPosition = Position.top
            let middlePosition = Position.middle
            let bottomPosition = Position.bottom
            let startPosition = Position.start
            let endPosition = Position.end
            let insidePosition = Position.inside
            let innerPosition = Position.inner
            let outsidePosition = Position.outside
            let insideLeftPosition = Position.insideLeft
            let insideTopPosition = Position.insideTop
            let insideRightPosition = Position.insideRight
            let insideBottomPosition = Position.insideBottom
            let insideTopLeftPosition = Position.insideTopLeft
            let insideBottomLeftPosition = Position.insideBottomLeft
            let insideTopRightPosition = Position.insideTopRight
            let insideBottomRightPosition = Position.insideBottomRight
            let valuePosition1 = Position.value(lengthValue1)
            let valuePosition2 = Position.value(lengthValue2)
            let pointPosition = Position.point(point)
            let functionPosition = Position.function(function)
            
            beforeEach {
                JsCache.removeAll()
            }
            
            it("needs to check the jsonString") {
                expect(autoPosition.jsonString).to(equal(autoString.jsonString))
                expect(leftPosition.jsonString).to(equal(leftString.jsonString))
                expect(centerPosition.jsonString).to(equal(centerString.jsonString))
                expect(rightPosition.jsonString).to(equal(rightString.jsonString))
                expect(topPosition.jsonString).to(equal(topString.jsonString))
                expect(middlePosition.jsonString).to(equal(middleString.jsonString))
                expect(bottomPosition.jsonString).to(equal(bottomString.jsonString))
                expect(startPosition.jsonString).to(equal(startString.jsonString))
                expect(endPosition.jsonString).to(equal(endString.jsonString))
                expect(insidePosition.jsonString).to(equal(insideString.jsonString))
                expect(innerPosition.jsonString).to(equal(innerString.jsonString))
                expect(outsidePosition.jsonString).to(equal(outsideString.jsonString))
                expect(insideLeftPosition.jsonString).to(equal(insideLeftString.jsonString))
                expect(insideTopPosition.jsonString).to(equal(insideTopString.jsonString))
                expect(insideRightPosition.jsonString).to(equal(insideRightString.jsonString))
                expect(insideBottomPosition.jsonString).to(equal(insideBottomString.jsonString))
                expect(insideTopLeftPosition.jsonString).to(equal(insideTopLeftString.jsonString))
                expect(insideBottomLeftPosition.jsonString).to(equal(insideBottomLeftString.jsonString))
                expect(insideTopRightPosition.jsonString).to(equal(insideTopRightString.jsonString))
                expect(insideBottomRightPosition.jsonString).to(equal(insideBottomRightString.jsonString))
                expect(valuePosition1.jsonString).to(equal(lengthValue1.jsonString))
                expect(valuePosition2.jsonString).to(equal(lengthValue2.jsonString))
                expect(pointPosition.jsonString).to(equal(point.jsonString))
                
                expect(functionPosition.jsonString).to(equal(function.jsonString))
            }
            
            it("needs to check the FloatLiteralConvertible and IntegerLiteralConvertible") {
                let integerLiteralPosition: Position = 255
                let integerPosition = Position.value(255)
                let floatLiteralPosition: Position = 255.0
                let floatPosition = Position.value(255.0)
                
                expect(integerLiteralPosition.jsonString).to(equal(integerPosition.jsonString))
                expect(floatLiteralPosition.jsonString).to(equal(floatPosition.jsonString))
            }
        }
        
        describe("For Location") {
            let startString = "start"
            let middleString = "middle"
            let endString = "end"
            
            let startLocation = Location.start
            let middleLocation = Location.middle
            let endLocation = Location.end
            
            it("needs to check the jsonString") {
                expect(startLocation.jsonString).to(equal(startString.jsonString))
                expect(middleLocation.jsonString).to(equal(middleString.jsonString))
                expect(endLocation.jsonString).to(equal(endString.jsonString))
                
            }
        }
    }
    
}
