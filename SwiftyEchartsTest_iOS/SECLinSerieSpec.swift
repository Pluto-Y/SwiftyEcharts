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

class SECLineSerieSpec : QuickSpec {
    
    override func spec() {
        describe("For SECLineSerie.AreaStyle") {
            
            it("needs to check the SECJsonable for areaStyle") {
                let areaStyle = SECEmphasisAreaStyle(
                    .normal(SECCommonAreaStyleContent())
                )
                
                expect(areaStyle.jsonString).to(equal("{\n"
                    + "\"normal\":{\n"
                    + "\n}"
                    + "\n}"))
            }
            
        }
    }
    
}
