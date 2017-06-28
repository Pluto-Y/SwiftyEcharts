//
//  GraphicSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 28/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class GraphicSpec: QuickSpec {
    override func spec() {
        describe("For GraphicAction") {
            it("needs to check the jsonString") {
                let mergeString = "merge"
                let replaceString = "replace"
                let removeString = "remove"
                
                let mergeGraphicAction = GraphicAction.merge
                let replaceGraphicAction = GraphicAction.replace
                let removeGraphicAction = GraphicAction.remove
                
                expect(mergeGraphicAction.jsonString).to(equal(mergeString.jsonString))
                expect(replaceGraphicAction.jsonString).to(equal(replaceString.jsonString))
                expect(removeGraphicAction.jsonString).to(equal(removeString.jsonString))
            }
        }
    }
}
