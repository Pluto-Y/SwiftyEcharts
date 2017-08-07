//
//  SankeySerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 07/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class SankeySerieSpec: QuickSpec {
    override func spec() {
        let nameDataValue = "dataNameValue"
        let valueDataValue: Float = 200.0
        let itemStyleDataValue = ItemStyle(
            .emphasis(CommonItemStyleContent(
                .borderColor(Color.red),
                .shadowBlur(200.0285),
                .shadowOffsetX(0.526)
                )),
            .normal(CommonItemStyleContent(
                .opacity(0.500000)
                ))
        )
        let labelDataValue = FormattedLabel(
            .normal(FormattedLabelStyle(
                .show(false),
                .position(Position.inside)
                ))
        )
        
        let data = SankeySerie.Data()
        data.name = nameDataValue
        data.value = valueDataValue
        data.itemStyle = itemStyleDataValue
        data.label = labelDataValue
        
        describe("For SankeySerie.Data") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameDataValue,
                    "value": valueDataValue,
                    "itemStyle": itemStyleDataValue,
                    "label": labelDataValue
                ]
                
                expect(data.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let dataByEnums = SankeySerie.Data(
                    .name(nameDataValue),
                    .value(valueDataValue),
                    .itemStyle(itemStyleDataValue),
                    .label(labelDataValue)
                )
                
                expect(dataByEnums.jsonString).to(equal(data.jsonString))
            }
        }
    }
}
