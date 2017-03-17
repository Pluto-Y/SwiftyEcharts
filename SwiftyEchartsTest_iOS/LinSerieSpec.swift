//
//  SECLinSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 14/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class LineSerieSpec : QuickSpec {
    
    override func spec() {
        describe("For LineSerie.AreaStyle") {
            
            it("needs to check the Jsonable for areaStyle") {
                let areaStyle = EmphasisAreaStyle(
                    .normal(CommonAreaStyleContent())
                )
                
                expect(areaStyle.jsonString).to(equal("{\n"
                    + "\"normal\":{\n"
                    + "\n}"
                    + "\n}"))
            }
            
        }
    }
    
}
