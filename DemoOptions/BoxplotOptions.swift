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
        let data: [String: [Jsonable]] = [
            "boxData":[[655, 850, 940, 980, 1175], [672.5, 800, 845, 885, 1012.5], [780, 840, 855, 880, 940], [621.25, 767.5, 815, 865, 1011.25], [713.75, 807.5, 810, 870, 963.75]],
            "outliers":[[0, 650], [2, 620], [2, 720], [2, 720], [2, 950], [2, 970]],
            "axisData":["0", "1", "2", "3", "4"]]
        
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
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Multiple Categories
    /// 地址: http://echarts.baidu.com/demo.html#boxplot-multi
    static func boxplotMultiOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
}
