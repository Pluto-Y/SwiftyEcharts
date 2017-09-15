//
//  BoxplotOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public final class BoxplotOptions {
    
    // MARK: Boxplot Light Velocity
    /// 地址: http://echarts.baidu.com/demo.html#boxplot-light-velocity
    static func boxplotLightVelocityOption() -> Option {
        let data: [String: [Jsonable]] = Echarts.DataTool.prepareBoxplotData([
            [850, 740, 900, 1070, 930, 850, 950, 980, 980, 880, 1000, 980, 930, 650, 760, 810, 1000, 1000, 960, 960],
            [960, 940, 960, 940, 880, 800, 850, 880, 900, 840, 830, 790, 810, 880, 880, 830, 800, 790, 760, 800],
            [880, 880, 880, 860, 720, 720, 620, 860, 970, 950, 880, 910, 850, 870, 840, 840, 850, 840, 840, 840],
            [890, 810, 810, 820, 800, 770, 760, 740, 750, 760, 910, 920, 890, 860, 880, 720, 840, 850, 850, 780],
            [890, 840, 780, 810, 760, 810, 790, 810, 820, 850, 870, 870, 810, 740, 810, 940, 950, 800, 810, 870]
            ])
        
        return Option(
            .titles([
                Title(
                    .text("Michelson-Morley Experiment"),
                    .left(.center)
                ),
                Title(
                    .text("upper: Q3 + 1.5 * IRQ \\nlower: Q1 - 1.5 * IRQ"),
                    .borderColor("#999"),
                    .borderWidth(1),
                    .textStyle(TextStyle(
                        .fontSize(14)
                        )),
                    .left(.value(10%)),
                    .top(.value(90%))
                )
                ]),
            .tooltip(Tooltip(
                .trigger(.item),
                .axisPointer(AxisPointerForTooltip(
                    .type(.shadow)
                    ))
                )),
            .grid(Grid(
                .left(.value(10%)),
                .right(.value(10%)),
                .bottom(.value(15%))
                )),
            .xAxis(Axis(
                .type(.category),
                .data(data["axisData"]!),
                .boundaryGap(true),
                .nameGap(30),
                .splitArea(SplitArea(
                    .show(false)
                    )),
                .axisLabel(AxisLabel(
                    .formatter(.string("expr {value}"))
                    )),
                .splitLine(SplitLine(
                    .show(false)
                    ))
                )),
            .yAxis(Axis(
                .type(.value),
                .name("km/s minus 299,000"),
                .splitArea(SplitArea(
                    .show(true)
                    ))
                )),
            .series([
                BoxplotSerie(
                    .name("boxplot"),
                    .data(data["boxData"]!),
                    .tooltip(Tooltip(
                        .formatter(.function("function (param) { return [ 'Experiment ' + param.name + ': ', 'upper: ' + param.data[4], 'Q3: ' + param.data[3], 'median: ' + param.data[2], 'Q1: ' + param.data[1], 'lower: ' + param.data[0] ].join('<br/>') }"))
                        ))
                ),
                ScatterSerie(
                    .name("outlier"),
                    .data(data["outliers"]!)
                )
                ])
        )
    }
    
    // MARK: Boxplot Light Velocity2
    /// 地址: http://echarts.baidu.com/demo.html#boxplot-light-velocity2
    static func boxplotLightVelocity2Option() -> Option {
        let originData: [[Float]] = [
            [850, 740, 900, 1070, 930, 850, 950, 980, 980, 880, 1000, 980, 930, 650, 760, 810, 1000, 1000, 960, 960],
            [960, 940, 960, 940, 880, 800, 850, 880, 900, 840, 830, 790, 810, 880, 880, 830, 800, 790, 760, 800],
            [880, 880, 880, 860, 720, 720, 620, 860, 970, 950, 880, 910, 850, 870, 840, 840, 850, 840, 840, 840],
            [890, 810, 810, 820, 800, 770, 760, 740, 750, 760, 910, 920, 890, 860, 880, 720, 840, 850, 850, 780],
            [890, 840, 780, 810, 760, 810, 790, 810, 820, 850, 870, 870, 810, 740, 810, 940, 950, 800, 810, 870]
        ]
        let option: [String: String] = [
            "layout": "vertical"
        ]
        let data: [String: [Jsonable]] = Echarts.DataTool.prepareBoxplotData(originData, option)
        return Option(
            .titles([
                Title(
                    .text("Michelson-Morley Experiment"),
                    .x(.center)
                ),
                Title(
                    .text("upper: Q3 + 1.5 * IRQ \\nlower: Q1 - 1.5 * IRQ"),
                    .borderColor("#999"),
                    .borderWidth(1),
                    .textStyle(TextStyle(
                        .fontSize(14)
                        )),
                    .left(.value(10%)),
                    .top(.value(90%))
                )
                ]),
            .tooltip(Tooltip(
                .trigger(.item),
                .axisPointer(AxisPointerForTooltip(
                    .type(.shadow)
                    ))
                )),
            .grid(Grid(
                .left(.value(10%)),
                .right(.value(10%)),
                .bottom(.value(15%))
                )),
            .yAxis(Axis(
                .type(.category),
                .data(data["axisData"]!),
                .boundaryGap(true),
                .nameGap(30),
                .splitArea(SplitArea(
                    .show(false)
                    )),
                .axisLabel(AxisLabel(
                    .formatter(.string("expr {value}"))
                    )),
                .splitLine(SplitLine(
                    .show(false)
                    ))
                )),
            .xAxis(Axis(
                .type(.value),
                .name("km/s minus 299,000"),
                .splitArea(SplitArea(
                    .show(true)
                    ))
                )),
            .series([
                BoxplotSerie(
                    .name("boxplot"),
                    .data(data["boxData"]!),
                    .tooltip(Tooltip(
                        .formatter(.function("function (param) { return [ 'Experiment ' + param.name + ': ', 'upper: ' + param.data[4], 'Q3: ' + param.data[3], 'median: ' + param.data[2], 'Q1: ' + param.data[1], 'lower: ' + param.data[0] ].join('<br/>') }"))
                        ))
                ),
                ScatterSerie(
                    .name("outlier"),
                    .data(data["outliers"]!)
                )
                ])
        )
    }
    
    // MARK: Multiple Categories
    /// 地址: http://echarts.baidu.com/demo.html#boxplot-multi
    static func boxplotMultiOption() -> Option {
        var data: [[String: [Jsonable]]] = []
        for _ in 0...4 {
            var seriesData: [[Float]] = []
            for _ in 0..<18 {
                var cate: [Float] = []
                for _ in 0..<100 {
                    cate.append(Float(arc4random()) / Float(UInt32.max) * 200.0)
                }
                seriesData.append(cate)
            }
            data.append(Echarts.DataTool.prepareBoxplotData(seriesData))
        }
        
        let formatter = Formatter.function("function formatter(param) { return [ 'Experiment ' + param.name + ': ', 'upper: ' + param.data[0], 'Q1: ' + param.data[1], 'median: ' + param.data[2], 'Q3: ' + param.data[3], 'lower: ' + param.data[4] ].join('<br/>') }")
        
        return Option(
            .title(Title(
                .text("Multiple Categories"),
                .left(.center)
                )),
            .legend(Legend(
                .y(.value(10%)),
                .data(["category0", "category1", "category2", "category3"])
                )),
            .tooltip(Tooltip(
                .trigger(.item),
                .axisPointer(AxisPointerForTooltip(
                    .type(.shadow)
                    ))
                )),
            .grid(Grid(
                .left(.value(10%)),
                .top(.value(20%)),
                .right(.value(10%)),
                .bottom(.value(15%))
                )),
            .xAxis(Axis(
                .type(.category),
                .data(data[0]["axisData"]!),
                .boundaryGap(true),
                .nameGap(30),
                .splitArea(SplitArea(
                    .show(true)
                    )),
                .axisLabel(AxisLabel(
                    .formatter(.string("expr {value}"))
                    )),
                .splitLine(SplitLine(
                    .show(false)
                    ))
                )),
            .yAxis(Axis(
                .type(.value),
                .name("Value"),
                .min(-400),
                .max(600),
                .splitArea(SplitArea(
                    .show(false)
                    ))
                )),
            .dataZoom([
                InsideDataZoom(
                    .start(0),
                    .end(20)
                ),
                SliderDataZoom(
                    .show(true),
                    .height(20),
                    .top(.value(90%)),
                    .xAxisIndex(0),
                    .start(0),
                    .end(20)
                )
                ]),
            .series([
                BoxplotSerie(
                    .name("category0"),
                    .data(data[0]["boxData"]!),
                    .tooltip(Tooltip(.formatter(formatter)))
                ),
                BoxplotSerie(
                    .name("category1"),
                    .data(data[1]["boxData"]!),
                    .tooltip(Tooltip(.formatter(formatter)))
                ),
                BoxplotSerie(
                    .name("category2"),
                    .data(data[2]["boxData"]!),
                    .tooltip(Tooltip(.formatter(formatter)))
                )
                ])
        )
    }
}
