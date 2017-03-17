//
//  SECGaugeOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public struct SECGaugeOptions {
    
    // MARK: Gauge Car Dark
    /// 地址: http://echarts.baidu.com/demo.html#gauge-car-dark
    static func gaugeCarDarkOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Gauge Car
    /// 地址: http://echarts.baidu.com/demo.html#gauge-car
    static func gaugeCarOption() -> Option {
        return Option(
            .tooltip(Tooltip(
                .formatter(.string("{a}<br/>{c} {b}"))
                )),
            .toolbox(Toolbox(
                .show(true),
                .feature(SECTFeature(
                    .restore(SECTFRestore(.show(true))),
                    .saveAsImage(SECTFSaveAsImage(.show(true)))
                    ))
                )),
            .series([
                SECGaugeSerie(
                    .name("速度"), // 缺少z
                    .min(0),
                    .max(220),
                    .splitNumber(11),
                    .radius(50%),
                    .axisLine(SECGaugeSerie.AxisLine(
                        .lineStyle(LineStyle(
                            .width(10)
                            ))
                        )),
                    .axisTick(SECGaugeSerie.AxisTick(
                        .length(15) // FIXME: 缺少lineStyle
                        )),
                    .splitLine(SECGaugeSerie.SplitLine(
                        .length(20) // FIXME: 缺少lineStyle
                        )),
                    .title(SECGaugeSerie.Title(
                        .textStyle(TextStyle(
                            .fontWeight(.bolder),
                            .fontSize(20),
                            .fontStyle(.italic)
                            ))
                        )),
                    .detail(SECGaugeSerie.Detail(
                        .textStyle(TextStyle(
                            .fontWeight(.bolder)
                            ))
                        )),
                    .data([["value": 40, "name": "km/h"]])
                ),
                SECGaugeSerie(
                    .name("转速"),
                    .center([20%, 55%]),
                    .radius(35%),
                    .min(0),
                    .max(7),
                    .endAngle(45),
                    .splitNumber(7),
                    .axisLine(SECGaugeSerie.AxisLine(
                        .lineStyle(LineStyle(
                            .width(8)
                            ))
                        )),
                    .axisTick(SECGaugeSerie.AxisTick(
                        .length(12) // FIXME: 缺少lineStyle
                        )),
                    .splitLine(SECGaugeSerie.SplitLine(
                        .length(20) // FIXME: 缺少lineStyle
                        )),
                    .pointer(SECGaugeSerie.Pointer(
                        .width(5)
                        )),
                    .title(SECGaugeSerie.Title(
                        .offsetCenter([0, (-30)%])
                        )),
                    .detail(SECGaugeSerie.Detail(
                        .textStyle(TextStyle(
                            .fontWeight(.bolder)
                            ))
                        )),
                    .data([["value": 1.5, "name": "x1000 r/min"]])
                ),
                SECGaugeSerie(
                    .name("油表"),
                    .center([77%, 50%]),
                    .radius(25%),
                    .min(0),
                    .max(2),
                    .startAngle(135),
                    .endAngle(45),
                    .splitNumber(2),
                    .axisLine(SECGaugeSerie.AxisLine(
                        .lineStyle(LineStyle(
                            .width(8)
                            ))
                        )),
                    .axisTick(SECGaugeSerie.AxisTick(
                        .splitNumber(5),
                        .length(10) // FIXME: 缺少lineStyle
                        )),
                    .axisLabel(SECGaugeSerie.AxisLabel(
                        .formatter(.function("function axisLabelFormattter(v){ switch (v + '') { case '0' : return 'E'; case '1' : return 'Gas'; case '2' : return 'F'; }}"))
                        )),
                    .splitLine(SECGaugeSerie.SplitLine(
                        .length(15) // FIXME: 缺少lineStyle
                        )),
                    .pointer(SECGaugeSerie.Pointer(
                        .width(2)
                        )),
                    .title(SECGaugeSerie.Title(
                        .show(false)
                        )),
                    .detail(SECGaugeSerie.Detail(
                        .show(false)
                        )),
                    .data([["value": 0.5, "name": "gas"]])
                ),
                SECGaugeSerie(
                    .name("水表"),
                    .center([77%, 50%]),
                    .radius(25%),
                    .min(0),
                    .max(2),
                    .startAngle(315),
                    .endAngle(225),
                    .splitNumber(2),
                    .axisLine(SECGaugeSerie.AxisLine(
                        .lineStyle(LineStyle(
                            .width(8)
                            ))
                        )),
                    .axisLabel(SECGaugeSerie.AxisLabel(
                        .formatter(.function("function axisLabelFomatter2(v){ switch (v + '') { case '0' : return 'H'; case '1' : return 'Water'; case '2' : return 'C'; } }"))
                        )),
                    .splitLine(SECGaugeSerie.SplitLine(
                        .length(15) // FIXME: 缺少lineStyle
                        )),
                    .pointer(SECGaugeSerie.Pointer(
                        .width(2)
                        )),
                    .title(SECGaugeSerie.Title(
                        .show(false)
                        )),
                    .detail(SECGaugeSerie.Detail(
                        .show(false)
                        )),
                    .data([["value": 0.5, "name": "gas"]])
                )
                ])
        )
    }
    
    // MARK: Gauge
    /// 地址: http://echarts.baidu.com/demo.html#gauge
    static func gaugeOption() -> Option {
        return Option(
            .tooltip(Tooltip(
                .formatter(.string("{a} <br/>{b} : {c}%"))
                )),
            .toolbox(Toolbox(
                .feature(SECTFeature(
                    .restore(SECTFRestore()),
                    .saveAsImage(SECTFSaveAsImage())
                    ))
                )),
            .series([
                SECGaugeSerie(
                    .name("业务指标"),
                    .detail(SECGSDetail(
                        .formatter(.string("{value}%"))
                        )),
                    .data([["name":"完成率", "value": 50]]) // FIXIM: 封装Data类型？
                )
                ])
        )
    }
}
