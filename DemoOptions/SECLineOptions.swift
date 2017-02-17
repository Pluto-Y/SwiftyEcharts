//
//  SECLineOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public struct SECLineOptions {
    
    /// 堆叠区域图
    /// 地址:http://echarts.baidu.com/demo.html#area-stack
    static func areaStackOption() -> SECOption {
        return SECOption(
            .title(SECTitle(
                .text("堆叠区域图")
                )),
            .tooltip(SECTooltip(
                .trigger(.axis)
                )),
            .toolbox(SECToolbox(
                .feature(SECToolbox.Feature(
                    .saveAsImage(SECToolbox.Feature.SaveAsImage(
                        
                        ))
                    ))
                )),
            .grid(SECGrid(
                .left(.value(3%)),
                .right(.value(4%)),
                .bottom(.value(3%)),
                .containLabel(true)
                )),
            .xAxis([
                SECAxis(
                    .type(.category),
                    .boundaryGap(.category(false)),
                    .data(["周一","周二","周三","周四","周五","周六","周日"])
                )
                ]),
            .yAxis([
                SECAxis(
                    .type(.value)
                )
                ]),
            .series([
                SECLineSerie(
                    .name("邮件营销"),
                    .stack("总量"),
                    .areaStyle(SECLineSerie.AreaStyle(
                        .normal(SECCommonAreaStyleContent())
                        )),
                    .data([120, 132, 101, 134, 90, 230, 210])
                ),
                SECLineSerie(
                    .name("联盟广告"),
                    .stack("总量"),
                    .areaStyle(SECLineSerie.AreaStyle(
                        .normal(SECCommonAreaStyleContent())
                        )),
                    .data([220, 182, 191, 234, 290, 330, 310])
                ),
                SECLineSerie(
                    .name("视频广告"),
                    .stack("总量"),
                    .areaStyle(SECLineSerie.AreaStyle(
                        .normal(SECCommonAreaStyleContent())
                        )),
                    .data([150, 232, 201, 154, 190, 330, 410])
                ),
                SECLineSerie(
                    .name("直接访问"),
                    .stack("总量"),
                    .areaStyle(SECLineSerie.AreaStyle(
                        .normal(SECCommonAreaStyleContent())
                        )),
                    .data([320, 332, 301, 334, 390, 330, 320])
                ),
                SECLineSerie(
                    .name("搜索引擎"),
                    .stack("总量"),
                    .label(SECLabel(
                        .normal(SECCommonLabelStyle(
                            .show(true),
                            .position(.top)
                            ))
                        )),
                    .areaStyle(SECLineSerie.AreaStyle(
                        .normal(SECCommonAreaStyleContent())
                        )),
                    .data([820, 932, 901, 934, 1290, 1330, 1320])
                )
                ])
        )
    }
    
    /// 未来一周气温变化
    /// 地址: http://echarts.baidu.com/demo.html#line-marker
    static func lineMarkerOption() -> SECOption {
        return SECOption(
            .title(SECTitle(
                .text("未来一周气温变化"),
                .subtext("纯属虚构")
                )),
            .tooltip(SECTooltip(
                .trigger(.axis)
                )),
            .legend(SECLegend(
                .data(["最高气温","低气温"])
                )),
            .toolbox(SECToolbox(
                .show(true),
                .feature(SECToolbox.Feature(
                    .dataZoom(SECTFDataZoom(
                        .yAxisIndex(.bool(false))
                        )),
                    .dataView(SECTFDataView(
                        .readOnly(false)
                        )),
                    .magicType(SECTFMagicType(
                        .type([.line, .bar])
                        )),
                    .restore(SECTFRestore(
                        )),
                    .saveAsImage(SECTFSaveAsImage(
                        ))
                    ))
                )),
            .xAxis([
                SECAxis(
                    .type(.category),
                    .boundaryGap(.category(false)),
                    .data(["周一","周二","周三","周四","周五","周六","周日"])
                )
                ]),
            .yAxis([
                SECAxis(
                    .type(.value),
                    .axisLabel(SECAxisLabel(
                        .formatter(.string("{value} °C"))
                        ))
                )
                ]),
            .series([
                SECLineSerie(
                    .name("最高气温"),
                    .data([11, 11, 15, 13, 12, 13, 10]),
                    .markPoint(SECMarkPoint(
                        .data([
                            SECMarkPoint.Data(
                                .type(.max),
                                .name("最大值")
                            ),
                            SECMarkPoint.Data(
                                .type(.min),
                                .name("最小值")
                            )
                            ])
                        )),
                    .markLine(SECMarkLine(
                        .data([
                            SECMarkLine.Data(
                                .type(.average),
                                .name("平均值")
                            )
                            ])
                        ))
                ),
                SECLineSerie(
                    .name("最低气温"),
                    .data([1, -2, 2, 5, 3, 2, 0]),
                    .markPoint(SECMarkPoint(
                        .data([
                            SECMarkPoint.Data(
                                .name("周最低"),
                                .value(-2),
                                .xAxis(1),
                                .yAxis(-1.5)
                            )
                            ])
                        )),
                    .markLine(SECMarkLine(
                        .data(
                            [
                                SECMarkLine.Data(
                                    .type(.average),
                                    .name("平均值")
                                ),
                                [
                                    SECMarkLine.Data(
                                        .x(90%),
                                        .symbol(.none),
                                        .yAxis("max")
                                    ),
                                    SECMarkLine.Data(
                                        .symbol(.circle),
                                        .label(SECFormattedLabel(
                                            .normal(SECFormattedLabelStyle(
                                                .position(.start),
                                                .formatter(.string("最大值"))
                                                ))
                                            )),
                                        .type(.max),
                                        .name("最高点")
                                    )
                                ]
                                
                            ])
                        ))
                )
                ])
        )
    }
    
    /// 指数折线图
    /// 地址: http://echarts.baidu.com/gallery/editor.html?c=line-log
    static func logAxisOption() -> SECOption {
        return SECOption(
            .title(SECTitle(
                .text("对数轴示例"),
                .left(.center)
                )),
            .tooltip(SECTooltip(
                .trigger(.item),
                .formatter(.string("{a} <br/>{b} : {c}"))
                )),
            .legend(SECLegend(
                .left(.left),
                .data(["2的指数", "3的指数"])
                )),
            .xAxis([
                SECAxis(
                    .type(.category),
                    .name("x"),
                    .splitArea(SECSplitArea(
                        .show(false)
                        )),
                    .data(["一", "二", "三", "四", "五", "六", "七", "八", "九"])
                )
                ]),
            .grid(SECGrid(
                .left(.value(3%)),
                .right(.value(4%)),
                .bottom(.value(3%)),
                .containLabel(true)
                )),
            .yAxis([
                SECAxis(
                    .type(.log),
                    .name("y")
                )
                ]),
            .series([
                SECLineSerie(
                    .name("3的指数"),
                    .data([1, 3, 9, 27, 81, 247, 741, 2223, 6669])
                ),
                SECLineSerie(
                    .name("2的指数"),
                    .data([1, 2, 4, 8, 16, 32, 64, 128, 256])
                ),
                SECLineSerie(
                    .name("1/2的指数"),
                    .data([1, 0.5, 0.25, 0.125, 0.0625, 0.03125, 0.015625, 0.0078125, 0.00390625])
                )
                ])
        )
    }
    
    /// Try Dragging these Points
    /// 地址: http://echarts.baidu.com/demo.html#line-draggable
    static func lineDraggableOption() -> SECOption {
        // 未完成对应的拖拽代码
        let symbolSize: Float = 20
        let data: [SECJsonable] =  [[15, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
        return SECOption(
            .title(SECTitle(
                .text("Try Dragging these Points")
                )),
            .tooltip(SECTooltip(
                .triggerOn(.none),
                .formatter(.function("function (params) { return 'X: ' + params.data[0].toFixed(2) + '<br>Y: ' + params.data[1].toFixed(2);}"))
                )),
            .grid(SECGrid()),
            .xAxis([
                SECAxis(
                    .min(-100),
                    .max(80),
                    .type(.value),
                    .axisLine(SECAxisLine(
                        .onZero(false)
                        ))
                )
                ]),
            .yAxis([
                SECAxis(
                    .min(-30),
                    .max(60),
                    .type(.value),
                    .axisLine(SECAxisLine(
                        .onZero(false)
                        ))
                )
                ]),
            .dataZoom([
                SECSliderDataZoom(
                    .xAxisIndex(0),
                    .filterMode(.empty)
                ),
                SECSliderDataZoom(
                    .yAxisIndex(0),
                    .filterMode(.empty)
                ),
                SECInsideDataZoom(
                    .xAxisIndex(0),
                    .filterMode(.empty)
                ),
                SECInsideDataZoom(
                    .yAxisIndex(0),
                    .filterMode(.empty)
                ),
                ]),
            .series([
                SECLineSerie(
                    .smooth(false),
                    .symbolSize(symbolSize),
                    .data(data)
                )
                ])
        )
    }
    
    /// 折线图堆叠
    /// 地址:http://echarts.baidu.com/demo.html#line-stack
    static func lineStackOption() -> SECOption {
        return SECOption(
            .title(SECTitle(
                .text("折线图堆叠")
                )),
            .tooltip(SECTooltip(
                .trigger(.axis)
                )),
            .legend(SECLegend(
                .data(["邮件营销","联盟广告","视频广告","直接访问","搜索引擎"])
                )),
            .grid(SECGrid(
                .left(.value(3%)),
                .right(.value(4%)),
                .bottom(.value(3%)),
                .containLabel(true)
                )),
            .toolbox(SECToolbox(
                .feature(SECToolbox.Feature(
                    .saveAsImage(SECToolbox.Feature.SaveAsImage(
                        
                        ))
                    ))
                )),
            .xAxis([
                SECAxis(
                    .type(.category),
                    .boundaryGap(.category(false)),
                    .data(["周一","周二","周三","周四","周五","周六","周日"])
                )
                ]),
            .yAxis([
                SECAxis(
                    .type(.value)
                )
                ]),
            .series([
                SECLineSerie(
                    .name("邮件营销"),
                    .stack("总量"),
                    .data([120, 132, 101, 134, 90, 230, 210])
                ),
                SECLineSerie(
                    .name("联盟广告"),
                    .stack("总量"),
                    .data([220, 182, 191, 234, 290, 330, 310])
                ),
                SECLineSerie(
                    .name("视频广告"),
                    .stack("总量"),
                    .data([150, 232, 201, 154, 190, 330, 410])
                ),
                SECLineSerie(
                    .name("直接访问"),
                    .stack("总量"),
                    .data([320, 332, 301, 334, 390, 330, 320])
                ),
                SECLineSerie(
                    .name("搜索引擎"),
                    .stack("总量"),
                    .data([820, 932, 901, 934, 1290, 1330, 1320])
                )
                ])
        )
    }
}
