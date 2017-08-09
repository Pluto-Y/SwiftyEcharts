//
//  SliderDataZoomSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class SliderDataZoomSpec: QuickSpec {
    override func spec() {
        let lineStyleDataBackgroundValue = EmphasisLineStyle(
            .emphasis(LineStyle(
                .color(Color.hexColor("#9988ff")),
                .width(125),
                .type(LineType.solid),
                .shadowOffsetY(8758)
                )),
            .normal(LineStyle(
                .shadowBlur(0.0278),
                .shadowColor(rgba(128, 128, 128, 0.5))
                ))
        )
        let areaStyleDataBackgroundValue = AreaStyle(
            .color(Color.hexColor("#123456")),
            .opacity(0.5826),
            .shadowOffsetX(7461)
        )
        
        let dataBackground = SliderDataZoom.DataBackground()
        dataBackground.lineStyle = lineStyleDataBackgroundValue
        dataBackground.areaStyle = areaStyleDataBackgroundValue
        
        describe("For SliderDataZoom.DataBackground") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "lineStyle": lineStyleDataBackgroundValue,
                    "areaStyle": areaStyleDataBackgroundValue
                ]
                
                expect(dataBackground.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let dataBackgroundByEnums = SliderDataZoom.DataBackground(
                    .lineStyle(lineStyleDataBackgroundValue),
                    .areaStyle(areaStyleDataBackgroundValue)
                )
                
                expect(dataBackgroundByEnums.jsonString).to(equal(dataBackground.jsonString))
            }
        }
    }
}
