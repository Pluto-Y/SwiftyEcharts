//
//  SECBarOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public struct SECBarOptions {
    
    // MARK: 柱状图动画延迟
    // FIXME: (未成功)
    /// 地址: http://echarts.baidu.com/demo.html#bar-animation-delay
    static func barAnimationDelayOption() -> SECOption {
        func calculateData(index: Float, function: (Double) -> Double) -> Float {
            var tmp: Float = Float(function(Double(index) / 5.0))
            tmp *= (index / 5.0 - 1.0)
            tmp += index / 6.0
            tmp *= 5.0
            return tmp
        }
        var xAxisData: [SECJsonable] = []
        var data1: [SECJsonable] = []
        var data2: [SECJsonable] = []
        for i in 0..<100 {
            xAxisData.append("类目\(i)")
            data1.append(calculateData(Float(i), function: sin))
            data2.append(calculateData(Float(i), function: cos))
        }
        return SECOption(
            .title(SECTitle(
                .text("柱状图动画延迟")
                )),
            .legend(SECLegend(
                .data(["bar", "bar2"]),
                .align(.left)
                )),
            .toolbox(SECToolbox(
                .feature(SECTFeature(
                    .magicType(SECTFMagicType(
                        .type([.stack, .tiled])
                        )),
                    .dataView(SECTFDataView(
                        )),
                    .saveAsImage(SECTFSaveAsImage(
                        .pixelRatio(2)
                        ))
                    ))
                )),
            .tooltip(SECTooltip()),
            .xAxis(SECAxis(
                    .data(xAxisData),
                    .silent(false),
                    .splitLine(SECSplitLine(
                        .show(false)
                        ))
                )),
            .yAxis(SECAxis()),
            .series([
                SECBarSerie(
                    .name("bar"),
                    .data(data1),
                    .animationDelay(.function("function seriesDelay(idx){ return idx * 10; }"))
                ),
                SECBarSerie(
                    .name("bar2"),
                    .data(data2),
                    .animationDelay(.function("function seriesDelay2(idx){ return idx * 10 + 100; }"))
                )
                ]),
            .animationEasing(.elasticOut),
            .animationDelayUpdate(.function("function optionDelayUpdate(idx){ return idx * 5; }"))
        )
    }
    
    // MARK: 正负条形图
    /// 地址:http://echarts.baidu.com/demo.html#bar-negative
    static func barNegativeOption() -> SECOption {
        return SECOption(
            .tooltip(SECTooltip(
                .trigger(.axis),
                .axisPointer(SECTooltip.AxisPointer(
                    .type(.shadow)
                    ))
                )),
            .legend(SECLegend(
                .data(["利润", "支出", "收入"])
                )),
            .xAxis(SECAxis(
                .type(.value)
                )),
            .yAxis(SECAxis(
                .type(.category),
                .axisTick(SECAxisTick(
                    .show(false)
                    )),
                .data(["周一","周二","周三","周四","周五","周六","周日"])
                )),
            .series([
                SECBarSerie(
                    .name("利润"),
                    .label(SECBarSerie.Label(
                        .normal(SECBarSerie.LabelContent(
                            .show(true),
                            .position(.inside)
                            ))
                        )),
                    .data([200, 170, 240, 244, 200, 220, 210])
                ),
                SECBarSerie(
                    .name("收入"),
                    .stack("总量"),
                    .label(SECBarSerie.Label(
                        .normal(SECBarSerie.LabelContent(
                            .show(true)
                            ))
                        )),
                    .data([320, 302, 341, 374, 390, 450, 420])
                ),
                SECBarSerie(
                    .name("支出"),
                    .stack("总量"),
                    .label(SECBarSerie.Label(
                        .normal(SECBarSerie.LabelContent(
                            .show(true),
                            .position(.left)
                            ))
                        )),
                    .data([-120, -132, -101, -134, -190, -230, -210])
                )
                ])
        )
    }
    
    // MARK: 交错正负轴标签
    /// 地址: http://echarts.baidu.com/demo.html#bar-negative2
    static func barNegative2Option() -> SECOption {
        let labelRight = SECFormattedLabel(
            .normal(SECFormattedLabelStyle(
                .position(.right)
                ))
        )
        return SECOption(
            .title(SECTitle(
                .text("交错正负轴标签"),
                .subtext("From ExcelHome"),
                .sublink("http://e.weibo.com/1341556070/AjwF2AgQm")
                )),
            .tooltip(SECTooltip(
                .trigger(.axis),
                .axisPointer(SECTooltip.AxisPointer(
                    .type(.shadow)
                    ))
                )),
            .grid(SECGrid(
                .top(.value(80)),
                .bottom(.value(30))
                )),
            .xAxis(SECAxis(
                .type(.value),
                .position(.top),
                .splitLine(SECSplitLine(
                    .lineStyle(SECLineStyle(
                        .type(.dashed)
                        ))
                    ))
                )),
            .yAxis(SECAxis(
                .type(.category),
                .axisLine(SECAxisLine(
                    .show(false)
                    )),
                .axisLabel(SECAxisLabel(
                    .show(false)
                    )),
                .axisTick(SECAxisTick(
                    .show(false)
                    )),
                .splitLine(SECSplitLine(
                    .show(false)
                    )),
                .data(["ten", "nine", "eight", "seven", "six", "five", "four", "three", "two", "one"])
                )),
            .series([
                SECBarSerie(
                    .name("生活费"),
                    .stack("总量"),
                    .label(SECBarSerie.Label(
                        .normal(SECBarSerie.LabelContent(
                            .show(true),
                            .formatter(.string("{b}"))
                            ))
                        )),
                    .data([
                        SECBarSerie.Data(
                            .value(-0.07),
                            .label(labelRight)
                        ),
                        SECBarSerie.Data(
                            .value(-0.09),
                            .label(labelRight)
                        ),
                        0.2, 0.44,
                        SECBarSerie.Data(
                            .value(-0.23),
                            .label(labelRight)
                        ),
                        0.08,
                        SECBarSerie.Data(
                            .value(-0.17),
                            .label(labelRight)
                        ),
                        0.47,
                        SECBarSerie.Data(
                            .value(-0.36),
                            .label(labelRight)
                        ),
                        0.18
                        ])
                )
                ])
            
        )
    }
}
