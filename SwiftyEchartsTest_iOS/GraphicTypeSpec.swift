//
//  GraphicTypeSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 27/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class GraphicTypeSpec: QuickSpec {
    override func spec() {
        describe("For GraphicType") {
            let groupString = "group"
            let imageString = "image"
            let textString = "text"
            let rectString = "rect"
            let circleString = "circle"
            let ringString = "ring"
            let sectorString = "sector"
            let arcString = "arc"
            let polygonString = "polygon"
            let polylineString = "polyline"
            let lineString = "line"
            let bezierCurveString = "bezierCurve"
            
            let groupGraphicType = GraphicType.group
            let imageGraphicType = GraphicType.image
            let textGraphicType = GraphicType.text
            let rectGraphicType = GraphicType.rect
            let circleGraphicType = GraphicType.circle
            let ringGraphicType = GraphicType.ring
            let sectorGraphicType = GraphicType.sector
            let arcGraphicType = GraphicType.arc
            let polygonGraphicType = GraphicType.polygon
            let polylineGraphicType = GraphicType.polyline
            let lineGraphicType = GraphicType.line
            let bezierCurveGraphicType = GraphicType.bezierCurve
            
            it("needs to check the jsonString") {
                expect(groupGraphicType.jsonString).to(equal(groupString.jsonString))
                expect(imageGraphicType.jsonString).to(equal(imageString.jsonString))
                expect(textGraphicType.jsonString).to(equal(textString.jsonString))
                expect(rectGraphicType.jsonString).to(equal(rectString.jsonString))
                expect(circleGraphicType.jsonString).to(equal(circleString.jsonString))
                expect(ringGraphicType.jsonString).to(equal(ringString.jsonString))
                expect(sectorGraphicType.jsonString).to(equal(sectorString.jsonString))
                expect(arcGraphicType.jsonString).to(equal(arcString.jsonString))
                expect(polygonGraphicType.jsonString).to(equal(polygonString.jsonString))
                expect(polylineGraphicType.jsonString).to(equal(polylineString.jsonString))
                expect(lineGraphicType.jsonString).to(equal(lineString.jsonString))
                expect(bezierCurveGraphicType.jsonString).to(equal(bezierCurveString.jsonString))
            }
        }
    }
}
