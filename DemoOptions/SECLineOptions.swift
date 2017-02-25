//
//  SECLineOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public struct SECLineOptions {
    
    // MARK: 雨量流量关系图
    /// 地址:http://echarts.baidu.com/demo.html#area-rainfall
    static func areaRainfallOption() -> SECOption {
        guard let plistUrl = NSBundle.mainBundle().pathForResource("AreaRainfallDatas", ofType: "plist") else {
            return SECOption()
        }
        
        guard let plistDatas = NSDictionary(contentsOfFile: plistUrl) else {
            return SECOption()
        }
        
        
        let xAxisDatas = (plistDatas["XAxisDatas"] as! [String]).map({ (ele) -> SECJsonable in
            return ele
        })
        let seriesDatas1 = (plistDatas["SeriesData1"] as! [Float]).map { (ele) -> SECJsonable in
            return ele
        }
        let seriesDatas2 = (plistDatas["SeriesData2"] as! [Float]).map { (ele) -> SECJsonable in
            return ele
        }
        let areaData1: [SECJsonable] = [[["xAxis": "2009/9/12/\\n7:00"], ["xAxis": "2009/9/22\\n7:00"]]]
        let areaData2: [SECJsonable] = [[["xAxis": "2009/9/10/\\n7:00"], ["xAxis": "2009/9/20\\n7:00"]]]
        return SECOption(
            .title(SECTitle(
                .text("雨量流量关系图"),
                .subtext("数据来自西安兰特水电测控技术有限公司"),
                .textAlign(.center)
                )),
            .grid(SECGrid(
                .bottom(.value(80))
                )),
            .toolbox(SECToolbox(
                .feature(SECTFeature(
                    .dataZoom(SECTFDataZoom(
                        .yAxisIndex(.bool(false))
                        )),
                    .restore(SECTFRestore()),
                    .saveAsImage(SECTFSaveAsImage())
                    ))
                )),
            .tooltip(SECTooltip(
                .trigger(.axis),
                .axisPointer(SECTooltip.AxisPointer(
                    .animation(false)
                    ))
                )),
            .legend(SECLegend(
                .data(["流量", "降雨量"]),
                .left(.left)
                )),
            .dataZoom([
                SECSliderDataZoom(
                    .show(true),
                    .realtime(true),
                    .start(65),
                    .end(85)
                ),
                SECInsideDataZoom(
                    .start(65),
                    .end(85)
                )
                ]),
            .xAxis(SECAxis(
                    .type(.category),
                    .boundaryGap(.category(false)),
                    .axisLine(SECAxisLine(
                        .onZero(false)
                        )),
                    .data(xAxisDatas)
                )),
            .yAxises([
                SECAxis(
                    .name("流量(m^3/s)"),
                    .type(.value),
                    .max(500)
                ),
                SECAxis(
                    .name("降雨量(mm)"),
                    .nameLocation("start"),
                    .max(5),
                    .type(.value),
                    .inverse(true)
                    
                )
                ]),
            .series([
                SECLineSerie(
                    .name("流量"),
                    .animation(false),
                    .areaStyle(SECEmphasisAreaStyle(
                        .normal(SECCommonAreaStyleContent(
                            ))
                        )),
                    .lineStyle(SECEmphasisLineStyle(
                        .normal(SECLineStyle(
                            .width(1)
                            ))
                        )),
                    .markArea(SECMarkArea(
                        .silent(true),
                        .data(areaData1)
                        )),
                    .data(seriesDatas1)
                ),
                SECLineSerie(
                    .name("降雨量"),
                    .yAxisIndex(1),
                    .animation(false),
                    .areaStyle(SECEmphasisAreaStyle(
                        .normal(SECCommonAreaStyleContent(
                            ))
                        )),
                    .lineStyle(SECEmphasisLineStyle(
                        .normal(SECLineStyle(
                            .width(1)
                            ))
                        )),
                    .markArea(SECMarkArea(
                        .silent(true),
                        .data(areaData2)
                        )),
                    .data(seriesDatas2)
                )
                ])
        )
    }
    
    // MARK: 大数据量面积图
    /// 地址: http://echarts.baidu.com/demo.html#area-simple
    static func areaSimpleOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
    // MARK: 堆叠区域图
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
            .xAxis(SECAxis(
                    .type(.category),
                    .boundaryGap(.category(false)),
                    .data(["周一","周二","周三","周四","周五","周六","周日"])
                )),
            .yAxis(SECAxis(
                    .type(.value)
                )),
            .series([
                SECLineSerie(
                    .name("邮件营销"),
                    .stack("总量"),
                    .areaStyle(SECEmphasisAreaStyle(
                        .normal(SECCommonAreaStyleContent())
                        )),
                    .data([120, 132, 101, 134, 90, 230, 210])
                ),
                SECLineSerie(
                    .name("联盟广告"),
                    .stack("总量"),
                    .areaStyle(SECEmphasisAreaStyle(
                        .normal(SECCommonAreaStyleContent())
                        )),
                    .data([220, 182, 191, 234, 290, 330, 310])
                ),
                SECLineSerie(
                    .name("视频广告"),
                    .stack("总量"),
                    .areaStyle(SECEmphasisAreaStyle(
                        .normal(SECCommonAreaStyleContent())
                        )),
                    .data([150, 232, 201, 154, 190, 330, 410])
                ),
                SECLineSerie(
                    .name("直接访问"),
                    .stack("总量"),
                    .areaStyle(SECEmphasisAreaStyle(
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
                    .areaStyle(SECEmphasisAreaStyle(
                        .normal(SECCommonAreaStyleContent())
                        )),
                    .data([820, 932, 901, 934, 1290, 1330, 1320])
                )
                ])
        )
    }
    
    // MARK: Confidence Band
    /// 地址: http://echarts.baidu.com/demo.html#confidence-band
    static func confidenceBandOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
    // MARK: 动态数据 + 时间坐标轴
    /// 地址: http://echarts.baidu.com/demo.html#dynamic-data2
    static func dynamicData2Option() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
    // MARK: 雨量流量关系图2
    /// 地址:http://echarts.baidu.com/demo.html#grid-multiple
    static func gridMultipleOption() -> SECOption {
        guard let plistUrl = NSBundle.mainBundle().pathForResource("AreaRainfallDatas", ofType: "plist") else {
            return SECOption()
        }
        
        guard let plistDatas = NSDictionary(contentsOfFile: plistUrl) else {
            return SECOption()
        }
        
        
        let xAxisDatas = (plistDatas["XAxisDatas"] as! [String]).map({ (ele) -> SECJsonable in
            return ele.stringByReplacingOccurrencesOfString("2009/", withString: "").stringByReplacingOccurrencesOfString("\\n", withString: " ")
        })
        let seriesDatas1 = (plistDatas["SeriesData1"] as! [Float]).map { (ele) -> SECJsonable in
            return ele
        }
        let seriesDatas2 = (plistDatas["SeriesData2"] as! [Float]).map { (ele) -> SECJsonable in
            return ele
        }
        return SECOption(
            .title(SECTitle(
                .text("雨量流量关系图"),
                .subtext("数据来自西安兰特水电测控技术有限公司"),
                .textAlign(.center)
                )),
            .tooltip(SECTooltip(
                .trigger(.axis),
                .axisPointer(SECTooltip.AxisPointer(
                    .animation(false)
                    ))
                )),
            .legend(SECLegend(
                .data(["流量", "降雨量"]),
                .left(.left)
                )),
            .toolbox(SECToolbox(
                .feature(SECTFeature(
                    .dataZoom(SECTFDataZoom(
                        .yAxisIndex(.bool(false))
                        )),
                    .restore(SECTFRestore()),
                    .saveAsImage(SECTFSaveAsImage())
                    ))
                )),
            .dataZoom([
                SECSliderDataZoom(
                    .show(true),
                    .realtime(true),
                    .start(30),
                    .end(70),
                    .xAxisIndexes([0, 1])
                ),
                SECInsideDataZoom(
                    .start(30),
                    .end(70),
                    .xAxisIndexes([0, 1])
                )
                ]),
            .grids([
                SECGrid(
                    .left(.value(50)),
                    .right(.value(50)),
                    .height(25%)
                ),
                SECGrid(
                    .left(.value(50)),
                    .right(.value(50)),
                    .top(.value(58%)),
                    .height(20%)
                )
                ]),
            .xAxises([
                SECAxis(
                    .type(.category),
                    .boundaryGap(.category(false)),
                    .axisLine(SECAxisLine(
                        .onZero(true)
                        )),
                    .data(xAxisDatas)
                ),
                SECAxis(
                    .gridIndex(1),
                    .type(.category),
                    .boundaryGap(.category(false)),
                    .axisLine(SECAxisLine(
                        .onZero(true)
                        )),
                    .data(xAxisDatas),
                    .position(.top)
                )
                ]),
            .yAxises([
                SECAxis(
                    .name("流量(m^3/s)"),
                    .type(.value),
                    .max(500)
                ),
                SECAxis(
                    .gridIndex(1),
                    .name("降雨量(mm)"),
                    .type(.value),
                    .inverse(true)
                )
                ]),
            .series([
                SECLineSerie(
                    .name("流量"),
                    .symbolSize(8),
                    .hoverAnimation(false),
                    .data(seriesDatas1)
                ),
                SECLineSerie(
                    .name("降雨量"),
                    .xAxisIndex(1),
                    .yAxisIndex(1),
                    .symbolSize(8),
                    .hoverAnimation(false),
                    .data(seriesDatas2)
                )
                ])
        )
    }
    
    // MARK: Beijing AQI
    /// 地址: http://echarts.baidu.com/demo.html#line-aqi
    static func lineApiOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
    // MARK: Try Dragging these Points
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
                .formatter(.function("function tooltipFormatter(params) { return 'X: ' + params.data[0].toFixed(2) + '<br>Y: ' + params.data[1].toFixed(2);}"))
                )),
            .grid(SECGrid()),
            .xAxis(SECAxis(
                .min(-100),
                .max(80),
                .type(.value),
                .axisLine(SECAxisLine(
                    .onZero(false)
                    ))
                )),
            .yAxis(SECAxis(
                .min(-30),
                .max(60),
                .type(.value),
                .axisLine(SECAxisLine(
                    .onZero(false)
                    ))
                )),
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
    
    // MARK: Different Easing Functions
    /// 地址: http://echarts.baidu.com/demo.html#line-easing
    static func lineEasingOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
    // MARK: 指数折线图
    /// 地址: http://echarts.baidu.com/gallery/editor.html?c=line-log
    static func lineLogOption() -> SECOption {
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
            .xAxis(SECAxis(
                    .type(.category),
                    .name("x"),
                    .splitArea(SECSplitArea(
                        .show(false)
                        )),
                    .data(["一", "二", "三", "四", "五", "六", "七", "八", "九"])
                )),
            .grid(SECGrid(
                .left(.value(3%)),
                .right(.value(4%)),
                .bottom(.value(3%)),
                .containLabel(true)
                )),
            .yAxis(SECAxis(
                    .type(.log),
                    .name("y")
                )),
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
    
    // MARK: 未来一周气温变化
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
            .xAxis(SECAxis(
                .type(.category),
                .boundaryGap(.category(false)),
                .data(["周一","周二","周三","周四","周五","周六","周日"])
                )),
            .yAxis(SECAxis(
                .type(.value),
                .axisLabel(SECAxisLabel(
                    .formatter(.string("{value} °C"))
                    ))
                )),
            .series([
                SECLineSerie(
                    .name("最高气温"),
                    .data([11, 11, 15, 13, 12, 13, 10]),
                    .markPoint(SECMarkPoint(
                        .data([
                            SECMarkPointData(
                                .type(.max),
                                .name("最大值")
                            ),
                            SECMarkPointData(
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
                            SECMarkPointData(
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
    
    // MARK: Click to Add Points
    /// 地址: http://echarts.baidu.com/demo.html#line-pen
    static func linePenOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
    // MARK: 极坐标双数值轴
    /// 地址:http://echarts.baidu.com/demo.html#line-polar
    static func linePolarOption() -> SECOption {
        var data: [SECJsonable] = []
        for i in 0...100 {
            let theta: Double = Double(i) / 100.0 * 360
            let r: Double = 5 * sin(theta / 180 * M_PI) + 5
            data.append([r, theta])
            
        }
        return SECOption(
            .title(SECTitle(
                .text("极坐标双数值轴")
                )),
            .legend(SECLegend(
                .data(["line"])
                )),
            .polar(SECPolar(
                )),
            .tooltip(SECTooltip(
                .trigger(.axis),
                .axisPointer(SECTooltip.AxisPointer(
                    .type(.cross)
                    ))
                )),
            .angleAxis([SECAngleAxis(
                .type(.value),
                .startAngle(0)
                )]),
            .radiusAxis([SECRadiusAxis(
                )]),
            .series([
                SECLineSerie(
                    .coordinateSystem(.polar),
                    .name("line"),
                    .data(data)
                )
                ])
        )
    }
    
    // MARK: 极坐标双数值轴
    /// 地址: http://echarts.baidu.com/demo.html#line-polar2
    static func linePolar2Option() -> SECOption {
        var data: [SECJsonable] = []
        for i in 0...360 {
            let t = Double(i) / 180 * M_PI
            let r = sin(2 * t) * cos(2 * t)
            data.append([r, Double(i)])
        }
        return SECOption(
            .title(SECTitle(
                .text("极坐标双数值轴")
                )),
            .legend(SECLegend(
                .data(["line"])
                )),
            .polar(SECPolar(
                .center([50%, 54%])
                )),
            .tooltip(SECTooltip(
                .trigger(.axis),
                .axisPointer(SECTooltip.AxisPointer(
                    .type(.cross)
                    ))
                )),
            .angleAxis([SECAngleAxis(
                .type(.value),
                .startAngle(0)
                )]),
            .radiusAxis([SECRadiusAxis(
                .min(0)
                )]),
            .series([
                SECLineSerie(
                    .coordinateSystem(.polar),
                    .name("line"),
                    .showSymbol(false),
                    .data(data)
                )
                ]),
            .animationDuration(.number(2000))
        )
    }
    
    // MARK: 一天用电量分布
    /// 地址:http://echarts.baidu.com/demo.html#line-sections
    static func lineSectionsOption() -> SECOption {
        return SECOption(
            .title(SECTitle(
                .text("一天用电量分布"),
                .subtext("纯属虚构")
                )),
            .tooltip(SECTooltip(
                .trigger(.axis)
                )),
            .toolbox(SECToolbox(
                .show(true),
                .feature(SECTFeature(
                    .saveAsImage(SECTFSaveAsImage())
                    ))
                )),
            .xAxis(SECAxis(
                    .type(.category),
                    .boundaryGap(.category(false)),
                    .data(["00:00", "01:15", "02:30", "03:45", "05:00", "06:15", "07:30", "08:45", "10:00", "11:15", "12:30", "13:45", "15:00", "16:15", "17:30", "18:45", "20:00", "21:15", "22:30", "23:45"])
                )),
            .yAxis(SECAxis(
                    .type(.value),
                    .axisLabel(SECAxisLabel(
                        .formatter(.string("{value} W"))
                        ))
                )),
            .visualMap(SECPiecewiseVisualMap(
                .show(false),
                .dimension(0),
                .pieces([
                    [
                        "lte": 6,
                        "color": "green"
                    ], [
                        "gt": 6,
                        "lte": 8,
                        "color": "red"
                    ], [
                        "gt": 8,
                        "lte": 14,
                        "color": "green"
                    ], [
                        "gt": 14,
                        "lte": 17,
                        "color": "red"
                    ], [
                        "gt": 17,
                        "color": "green"
                    ]
                    ])
                )),
            .series([
                SECLineSerie(
                    .name("用电量"),
                    .smooth(true),
                    .data([300, 280, 250, 260, 270, 300, 550, 500, 400, 390, 380, 390, 400, 500, 600, 750, 800, 700, 600, 400]),
                    .markArea(SECMarkArea(
                        .data([
                            [
                                [
                                    "name": "早高峰",
                                    "xAxis": "07:30"
                                ], [
                                    "xAxis": "10:00"
                                ]
                            ],
                            [
                                [
                                    "name": "晚高峰",
                                    "xAxis": "17:30"
                                ], [
                                    "xAxis": "21:15"
                                ]
                            ]
                            ])
                        ))
                )
                ])
        )
    }
    
    // MARK: 折线图堆叠
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
            .xAxis(SECAxis(
                    .type(.category),
                    .boundaryGap(.category(false)),
                    .data(["周一","周二","周三","周四","周五","周六","周日"])
                )),
            .yAxis(SECAxis(
                    .type(.value)
                )),
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
    
    // MARK: Line Step
    /// 地址:http://echarts.baidu.com/demo.html#line-step
    static func lineStepOption() -> SECOption {
        return SECOption(
            .title(SECTitle(
                .text("Step Line")
                )),
            .tooltip(SECTooltip(
                .trigger(.axis)
                )),
            .grid(SECGrid(
                .left(.value(3%)),
                .right(.value(4%)),
                .bottom(.value(3%)),
                .containLabel(true)
                )),
            .toolbox(SECToolbox(
                .feature(SECTFeature(
                    .saveAsImage(SECTFSaveAsImage(
                        ))
                    ))
                )),
            .xAxis(SECAxis(
                .type(.category),
                .data(["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"])
                )),
            .yAxis(SECAxis(
                .type(.value)
                )),
            .series([
                SECLineSerie(
                    .name("Step Start"),
                    .step(.start),
                    .data([120, 132, 101, 134, 90, 230, 210])
                ),
                SECLineSerie(
                    .name("Step Middle"),
                    .step(.middle),
                    .data([220, 282, 201, 234, 290, 430, 410])
                ),
                SECLineSerie(
                    .name("Step End"),
                    .step(.end),
                    .data([450, 432, 401, 454, 590, 530, 510])
                )
                ])
        )
    }
    
    
    // MARK: 高度(km)与气温(°C)变化关系
    /// 地址:http://echarts.baidu.com/demo.html#line-y-category
    static func lineYCategory() -> SECOption {
        return SECOption(
            .legend(SECLegend(
                .data(["高度(km)与气温(°C)变化关系"])
                )),
            .tooltip(SECTooltip(
                .trigger(.axis),
                .formatter(.string("Temperature : <br/>{b}km : {c}°C"))
                )),
            .grid(SECGrid(
                .left(.value(3%)),
                .right(.value(4%)),
                .bottom(.value(3%)),
                .containLabel(true)
                )),
            .xAxis(SECAxis(
                .type(.value),
                .axisLabel(SECAxisLabel(
                    .formatter(.string("{value} °C"))
                    ))
                )),
            .yAxis(SECAxis(
                .type(.category),
                .axisLine(SECAxisLine(
                    .onZero(false)
                    )),
                .axisLabel(SECAxisLabel(
                    .formatter(.string("{value} km"))
                    )),
                .data(["0", "10", "20", "30", "40", "50", "60", "70", "80"])
                )),
            .series([
                SECLineSerie(
                    .name("高度(km)与气温(°C)变化关系"),
                    .smooth(true),
                    .lineStyle(SECEmphasisLineStyle(
                        .normal(SECLineStyle(
                            .width(3),
                            .shadowColor(.rgba(0, 0, 0, 0.4)),
                            .shadowBlur(10.0),
                            .shadowOffsetY(10.0)
                            ))
                        )),
                    .data([15, -50, -56.5, -46.5, -22.1, -2.5, -27.7, -55.7, -76.5])
                )
                ])
        )
    }
}
