//
//  PercentSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 15/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class PercentSpec: QuickSpec {
    override func spec() {
        describe("Testing for type named 'Percent'") {
            
            it(" needs to check jsonString ") {
                let value = Double(Float(arc4random()) / Float(UINT32_MAX))
                let percent = Percent(value)
                let formatStr = String(format: "%%.%df", Percent.precision)
                expect(percent.jsonString).to(equal("\"\(String(format: formatStr, value))%\""))
            }
            
            it(" needs to support for 'num%' format constructor") {
                // 检查 Double + %
                let percent: Percent = 32.0%
                expect(percent.jsonString).to(equal("\"32.00%\""))
                // 检查 Float + %
                let percentFloat = Float(23.6)%
                expect(percentFloat.jsonString).to(equal("\"23.60%\""))
                // 检查 Int + %
                let percentInt = 10%
                expect(percentInt.jsonString).to(equal("\"10.00%\""))
            }
            
            
            it(" needs to check the precision for Percent") {
                // 检查精度问题
                let originPrecision = Percent.precision
                
                let precision = 4
                Percent.precision = precision
                let formatStr = String(format: "%%.%df", precision)
                let value = 78.9012345
                let percent: Percent = value%
                expect(percent.jsonString).to(equal("\"\(String(format: formatStr, value))%\""))
                
                Percent.precision = originPrecision
            }
        }
    }
}
