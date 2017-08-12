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
            let labelValue = FormattedLabel(
                .emphasis(FormattedLabelStyle(
                    .show(true),
                    .position(Position.insideBottom),
                    .offset([20, 50])
                    )),
                .normal(FormattedLabelStyle(
                    .textStyle(TextStyle(
                        .color(Color.red),
                        .align(Position.auto)
                        ))
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
            let dataValue: [Jsonable] = [["2015/11/08",10,"DQ"],["2015/11/09",15,"DQ"],["2015/11/10",35,"DQ"],
                                         // ["2015/11/11",38,"DQ"],["2015/11/12",22,"DQ"],["2015/11/13",16,"DQ"],
                ["2015/11/14",7,"DQ"],["2015/11/15",2,"DQ"],["2015/11/16",17,"DQ"],
                ["2015/11/17",33,"DQ"],["2015/11/18",40,"DQ"],["2015/11/19",32,"DQ"],
                ["2015/11/20",26,"DQ"],["2015/11/21",35,"DQ"],["2015/11/22",40,"DQ"],
                ["2015/11/23",32,"DQ"],["2015/11/24",26,"DQ"],["2015/11/25",22,"DQ"],
                // ["2015/11/26",16,"DQ"],["2015/11/27",22,"DQ"],["2015/11/28",10,"DQ"],
                ["2015/11/08",35,"TY"],["2015/11/09",36,"TY"],["2015/11/10",37,"TY"],
                ["2015/11/11",22,"TY"],["2015/11/12",24,"TY"],["2015/11/13",26,"TY"],
                ["2015/11/14",34,"TY"],["2015/11/15",21,"TY"],["2015/11/16",18,"TY"],
                ["2015/11/17",45,"TY"],["2015/11/18",32,"TY"],["2015/11/19",35,"TY"],
                ["2015/11/20",30,"TY"],["2015/11/21",28,"TY"],["2015/11/22",27,"TY"],
                ["2015/11/23",26,"TY"],["2015/11/24",15,"TY"],["2015/11/25",30,"TY"],
                ["2015/11/26",35,"TY"],["2015/11/27",42,"TY"],["2015/11/28",42,"TY"],
                ["2015/11/08",21,"SS"],["2015/11/09",25,"SS"],["2015/11/10",27,"SS"],
                ["2015/11/11",23,"SS"],["2015/11/12",24,"SS"],["2015/11/13",21,"SS"],
                ["2015/11/14",35,"SS"],["2015/11/15",39,"SS"],["2015/11/16",40,"SS"],
                ["2015/11/17",36,"SS"],["2015/11/18",33,"SS"],["2015/11/19",43,"SS"],
                ["2015/11/20",40,"SS"],["2015/11/21",34,"SS"],["2015/11/22",28,"SS"]]
            
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
