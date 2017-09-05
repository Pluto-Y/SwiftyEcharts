//
//  ThemeRiverSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 11/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class ThemeRiverSerieSpec: QuickSpec {
    override func spec() {
        describe("For ThemeRiverSerie") {
            let typeValue = SerieType.themeRiver
            let zlevelValue: Float = 8572.47
            let zValue: Float = 0.8572
            let leftValue = Position.middle
            let topValue = Position.start
            let rightValue = Position.outside
            let bottomValue = Position.end
            let widthValue: LengthValue = 20%
            let heightValue: LengthValue = 80
            let coordinateSystemValue = CoordinateSystem.polar
            let boundaryGapValue: BoundaryGap = true
            let singleAxisIndexValue: UInt8 = 46
            let labelValue = EmphasisLabel(
                .emphasis(LabelStyle(
                    .show(true),
                    .position(Position.insideBottom),
                    .lineHeight(205.238),
                    .borderColor(Color.hexColor("#88ffbb"))
                    )),
                .normal(LabelStyle(
                    .color(Color.red),
                    .align(Align.center)
                    ))
            )
            let itemStyleValue = ItemStyle(
                .normal(CommonItemStyleContent(
                    .borderColor(Color.hexColor("#8a7d7b")),
                    .borderWidth(757.57)
                    ))
            )
            let legendValue = Legend(
                .orient(.vertical),
                .left(.left),
                .data(["iphone3","iphone4","iphone5"])
            )
            let tooltipValue = Tooltip(
                .trigger(.item),
                .formatter(.string("{b}<br/>{c} (p / km2)"))
            )
            let dataValue: [Jsonable] = ["周一", "周二", ["value": 7.777, "name": "周三"], false, 0.6837, 0, Int.max]
            
            let themeRiverSerie = ThemeRiverSerie()
            themeRiverSerie.zlevel = zlevelValue
            themeRiverSerie.z = zValue
            themeRiverSerie.left = leftValue
            themeRiverSerie.top = topValue
            themeRiverSerie.right = rightValue
            themeRiverSerie.bottom = bottomValue
            themeRiverSerie.width = widthValue
            themeRiverSerie.height = heightValue
            themeRiverSerie.coordinateSystem = coordinateSystemValue
            themeRiverSerie.boundaryGap = boundaryGapValue
            themeRiverSerie.singleAxisIndex = singleAxisIndexValue
            themeRiverSerie.label = labelValue
            themeRiverSerie.itemStyle = itemStyleValue
            themeRiverSerie.legend = legendValue
            themeRiverSerie.tooltip = tooltipValue
            themeRiverSerie.data = dataValue
            
            it("needs to check type value") {
                expect(themeRiverSerie.type.jsonString).to(equal(typeValue.jsonString))
            }
            
            it("needs to check teh jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": typeValue,
                    "zlevel": zlevelValue,
                    "z": zValue,
                    "left": leftValue,
                    "top": topValue,
                    "right": rightValue,
                    "bottom": bottomValue,
                    "width": widthValue,
                    "height": heightValue,
                    "coordinateSystem": coordinateSystemValue,
                    "boundaryGap": boundaryGapValue,
                    "singleAxisIndex": singleAxisIndexValue,
                    "label": labelValue,
                    "itemStyle": itemStyleValue,
                    "legend": legendValue,
                    "tooltip": tooltipValue,
                    "data": dataValue
                ]
                
                expect(themeRiverSerie.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let themeRiverSerieByEnums = ThemeRiverSerie(
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .left(leftValue),
                    .top(topValue),
                    .right(rightValue),
                    .bottom(bottomValue),
                    .width(widthValue),
                    .height(heightValue),
                    .coordinateSystem(coordinateSystemValue),
                    .boundaryGap(boundaryGapValue),
                    .singleAxisIndex(singleAxisIndexValue),
                    .label(labelValue),
                    .itemStyle(itemStyleValue),
                    .legend(legendValue),
                    .tooltip(tooltipValue),
                    .data(dataValue)
                )
                
                expect(themeRiverSerieByEnums.jsonString).to(equal(themeRiverSerie.jsonString))
            }
        }
    }
}
