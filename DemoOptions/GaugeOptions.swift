//
//  GaugeOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public final class GaugeOptions {
    
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
        let serieData1: [Jsonable] = [["value": 40, "name": "km/h"]]
        let serieData2: [Jsonable] = [["value": 1.5, "name": "x1000 r/min"]]
        let serieData3: [Jsonable] = [["value": 0.5, "name": "gas"]]
        let serieData4: [Jsonable] = [["value": 0.5, "name": "gas"]]
        let serie1: GaugeSerie = GaugeSerie(
            .name("速度"), // 缺少z
            .min(0),
            .max(220),
            .splitNumber(11),
            .radius(50%),
            .axisLine(AxisLine(
                .lineStyle(LineStyle(
                    .width(10)
                    ))
                )),
            .axisTick(GaugeSerie.AxisTick(
                .length(15),
                .lineStyle(LineStyle(
                    .color(Color.auto)
                    ))
                )),
            .splitLine(SplitLine(
                .length(20),
                .lineStyle(LineStyle(
                    .color(Color.auto)
                    ))
                )),
            .title(GaugeSerie.Title(
                .textStyle(TextStyle(
                    .fontWeight(.bolder),
                    .fontSize(20),
                    .fontStyle(.italic)
                    ))
                )),
            .detail(GaugeSerie.Detail(
                .textStyle(TextStyle(
                    .fontWeight(.bolder)
                    ))
                )),
            .data(serieData1)
        )
        let serie2: GaugeSerie = GaugeSerie(
            .name("转速"),
            .center([20%, 55%]),
            .radius(35%),
            .min(0),
            .max(7),
            .endAngle(45),
            .splitNumber(7),
            .axisLine(AxisLine(
                .lineStyle(LineStyle(
                    .width(8)
                    ))
                )),
            .axisTick(GaugeSerie.AxisTick(
                .length(12),
                .lineStyle(LineStyle(
                    .color(Color.auto)
                    ))
                )),
            .splitLine(SplitLine(
                .length(20),
                .lineStyle(LineStyle(
                    .color(Color.auto)
                    ))
                )),
            .pointer(GaugeSerie.Pointer(
                .width(5)
                )),
            .title(GaugeSerie.Title(
                .offsetCenter([0, (-30)%])
                )),
            .detail(GaugeSerie.Detail(
                .textStyle(TextStyle(
                    .fontWeight(.bolder)
                    ))
                )),
            .data(serieData2)
        )
        let serie3: GaugeSerie = GaugeSerie(
            .name("油表"),
            .center([77%, 50%]),
            .radius(25%),
            .min(0),
            .max(2),
            .startAngle(135),
            .endAngle(45),
            .splitNumber(2),
            .axisLine(AxisLine(
                .lineStyle(LineStyle(
                    .width(8)
                    ))
                )),
            .axisTick(GaugeSerie.AxisTick(
                .splitNumber(5),
                .length(10),
                .lineStyle(LineStyle(
                    .color(Color.auto)
                    ))
                )),
            .axisLabel(GaugeSerie.AxisLabel(
                .formatter(.function("function axisLabelFormattter(v){ switch (v + '') { case '0' : return 'E'; case '1' : return 'Gas'; case '2' : return 'F'; }}"))
                )),
            .splitLine(SplitLine(
                .length(15),
                .lineStyle(LineStyle(
                    .color(Color.auto)
                    ))
                )),
            .pointer(GaugeSerie.Pointer(
                .width(2)
                )),
            .title(GaugeSerie.Title(
                .show(false)
                )),
            .detail(GaugeSerie.Detail(
                .show(false)
                )),
            .data(serieData3)
        )
        let serie4 = GaugeSerie(
            .name("水表"),
            .center([77%, 50%]),
            .radius(25%),
            .min(0),
            .max(2),
            .startAngle(315),
            .endAngle(225),
            .splitNumber(2),
            .axisLine(AxisLine(
                .lineStyle(LineStyle(
                    .width(8)
                    ))
                )),
            .axisLabel(GaugeSerie.AxisLabel(
                .formatter(.function("function axisLabelFomatter2(v){ switch (v + '') { case '0' : return 'H'; case '1' : return 'Water'; case '2' : return 'C'; } }"))
                )),
            .splitLine(SplitLine(
                .length(15),
                .lineStyle(LineStyle(
                    .color(Color.auto)
                    ))
                )),
            .pointer(GaugeSerie.Pointer(
                .width(2)
                )),
            .title(GaugeSerie.Title(
                .show(false)
                )),
            .detail(GaugeSerie.Detail(
                .show(false)
                )),
            .data(serieData4)
        )
        
        let series: [Serie] = [
            serie1,
            serie2,
            serie3,
            serie4
        ]
        return Option(
            .tooltip(Tooltip(
                .formatter(.string("{a}<br/>{c} {b}"))
                )),
            .toolbox(Toolbox(
                .show(true),
                .feature(ToolboxFeature(
                    .restore(ToolboxFeatureRestore(.show(true))),
                    .saveAsImage(ToolboxFeatureSaveAsImage(.show(true)))
                    ))
                )),
            .series(series)
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
                .feature(ToolboxFeature(
                    .restore(ToolboxFeatureRestore()),
                    .saveAsImage(ToolboxFeatureSaveAsImage())
                    ))
                )),
            .series([
                GaugeSerie(
                    .name("业务指标"),
                    .detail(GaugeSerieDetail(
                        .formatter(.string("{value}%"))
                        )),
                    .data([["name":"完成率", "value": 50]]) // FIXIM: 封装Data类型？
                )
                ])
        )
    }
}
