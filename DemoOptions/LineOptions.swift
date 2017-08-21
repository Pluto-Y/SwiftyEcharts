//
//  LineOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public final class LineOptions {
    
    // MARK: 雨量流量关系图
    /// 地址:http://echarts.baidu.com/demo.html#area-rainfall
    static func areaRainfallOption() -> Option {
        guard let plistUrl = Bundle.main.path(forResource: "AreaRainfallDatas", ofType: "plist") else {
            return Option()
        }
        
        guard let plistDatas = NSDictionary(contentsOfFile: plistUrl) else {
            return Option()
        }
        
        
        let xAxisDatas = (plistDatas["XAxisDatas"] as! [String]).map({ (ele) -> Jsonable in
            return ele
        })
        let seriesDatas1 = (plistDatas["SeriesData1"] as! [Float]).map { (ele) -> Jsonable in
            return ele
        }
        let seriesDatas2 = (plistDatas["SeriesData2"] as! [Float]).map { (ele) -> Jsonable in
            return ele
        }
        let areaData1: [Jsonable] = [[["xAxis": "2009/9/12/\\n7:00"], ["xAxis": "2009/9/22\\n7:00"]]]
        let areaData2: [Jsonable] = [[["xAxis": "2009/9/10/\\n7:00"], ["xAxis": "2009/9/20\\n7:00"]]]
        return Option(
            .title(Title(
                .text("雨量流量关系图"),
                .subtext("数据来自西安兰特水电测控技术有限公司"),
                .x(.center)
                )),
            .grid(Grid(
                .bottom(.value(80))
                )),
            .toolbox(Toolbox(
                .feature(ToolboxFeature(
                    .dataZoom(ToolboxFeatureDataZoom(
                        .yAxisIndex(.bool(false))
                        )),
                    .restore(ToolboxFeatureRestore()),
                    .saveAsImage(ToolboxFeatureSaveAsImage())
                    ))
                )),
            .tooltip(Tooltip(
                .trigger(.axis),
                .axisPointer(Tooltip.AxisPointer(
                    .animation(false)
                    ))
                )),
            .legend(Legend(
                .data(["流量", "降雨量"]),
                .x(.left)
                )),
            .dataZoom([
                SliderDataZoom(
                    .show(true),
                    .realtime(true),
                    .start(65),
                    .end(85)
                ),
                InsideDataZoom(
                    .start(65),
                    .end(85)
                )
                ]),
            .xAxis(Axis(
                .type(.category),
                .boundaryGap(false),
                .axisLine(AxisLine(
                    .onZero(false)
                    )),
                .data(xAxisDatas)
                )),
            .yAxises([
                Axis(
                    .name("流量(m^3/s)"),
                    .type(.value),
                    .max(500)
                ),
                Axis(
                    .name("降雨量(mm)"),
                    .nameLocation(.start),
                    .max(5),
                    .type(.value),
                    .inverse(true)
                    
                )
                ]),
            .series([
                LineSerie(
                    .name("流量"),
                    .animation(false),
                    .areaStyle(EmphasisAreaStyle(
                        .normal(CommonAreaStyleContent(
                            ))
                        )),
                    .lineStyle(EmphasisLineStyle(
                        .normal(LineStyle(
                            .width(1)
                            ))
                        )),
                    .markArea(MarkArea(
                        .silent(true),
                        .data(areaData1)
                        )),
                    .data(seriesDatas1)
                ),
                LineSerie(
                    .name("降雨量"),
                    .yAxisIndex(1),
                    .animation(false),
                    .areaStyle(EmphasisAreaStyle(
                        .normal(CommonAreaStyleContent(
                            ))
                        )),
                    .lineStyle(EmphasisLineStyle(
                        .normal(LineStyle(
                            .width(1)
                            ))
                        )),
                    .markArea(MarkArea(
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
    static func areaSimpleOption() -> Option {
        let base = Date(dateString: "1968-09-03")
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy/M/d"
        let oneDay: TimeInterval = 24 * 3600
        var date: [Jsonable] = []
        
        var data: [Jsonable] = [Float(arc4random_uniform(300))]
        for i in 1..<2000 {
            let tmpDate = Date(timeInterval: oneDay * Double(i), since: base)
            date.append(dateFormater.string(from: tmpDate))
            let lastObj = data[i-1] as! Float
            let randomNum: Float = Float(Int(arc4random_uniform(10)) - 5)
            let tmpData =  Float(randomNum) / 10.0 * 20.0 + lastObj
            data.append(tmpData)
        }
        
        return Option(
            .tooltip(Tooltip(
                .trigger(.axis),
                .position(.function("function (pt) {return [pt[0], '10%'];}"))
                )),
            .title(Title(
                .left(.center),
                .text("大数据量面积图")
                )),
            .toolbox(Toolbox(
                .feature(Toolbox.Feature(
                    .dataZoom(Toolbox.Feature.DataZoom(
                        .yAxisIndex(.bool(false)) // FIXME: 应该有枚举 none 和 all
                        )),
                    .restore(Toolbox.Feature.Restore()),
                    .saveAsImage(Toolbox.Feature.SaveAsImage())
                    ))
                )),
            .xAxis(Axis(
                .type(.category),
                .boundaryGap(false),
                .data(date)
                )),
            .yAxis(Axis(
                .type(.value),
                .boundaryGap([0, 100%])
                )),
            .dataZoom([InsideDataZoom(
                .start(0),
                .end(10)
                ), SliderDataZoom(
                    .start(0),
                    .end(10),
                    .handleIcon("M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z"),
                    .handleSize(80%),
                    .handleStyle(SliderDataZoom.HandleStyle(
                        .color(.hexColor("fff")),
                        .shadowBlur(3),
                        .shadowColor(.rgba(0, 0, 0, 0.6)),
                        .shadowOffsetX(2),
                        .shadowOffsetY(2)
                        ))
                )]),
            .series([
                LineSerie(
                    .name("模拟数据"),
                    .smooth(true),
                    .symbol(.none),
                    .sampling(.average),
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
                            .color(.rgb(255, 70, 131))
                            ))
                        )),
                    .areaStyle(EmphasisAreaStyle(
                        .normal(CommonAreaStyleContent(
                            .color(.linearGradient(0, 0, 0, 1,
                                [
                                    GradientColorElement(0, Color.rgb(255, 158, 68)),
                                    GradientColorElement(1, Color.rgb(255, 70, 131))
                                ],
                                false
                                ))
                            ))
                        )),
                    .data(data)
                )
                ])
        )
    }
    
    // MARK: 堆叠区域图
    /// 地址:http://echarts.baidu.com/demo.html#area-stack
    static func areaStackOption() -> Option {
        return Option(
            .title(Title(
                .text("堆叠区域图")
                )),
            .tooltip(Tooltip(
                .trigger(.axis)
                )),
            .toolbox(Toolbox(
                .feature(Toolbox.Feature(
                    .saveAsImage(Toolbox.Feature.SaveAsImage(
                        
                        ))
                    ))
                )),
            .grid(Grid(
                .left(.value(3%)),
                .right(.value(4%)),
                .bottom(.value(3%)),
                .containLabel(true)
                )),
            .xAxis(Axis(
                .type(.category),
                .boundaryGap(false),
                .data(["周一","周二","周三","周四","周五","周六","周日"])
                )),
            .yAxis(Axis(
                .type(.value)
                )),
            .series([
                LineSerie(
                    .name("邮件营销"),
                    .stack("总量"),
                    .areaStyle(EmphasisAreaStyle(
                        .normal(CommonAreaStyleContent())
                        )),
                    .data([120, 132, 101, 134, 90, 230, 210])
                ),
                LineSerie(
                    .name("联盟广告"),
                    .stack("总量"),
                    .areaStyle(EmphasisAreaStyle(
                        .normal(CommonAreaStyleContent())
                        )),
                    .data([220, 182, 191, 234, 290, 330, 310])
                ),
                LineSerie(
                    .name("视频广告"),
                    .stack("总量"),
                    .areaStyle(EmphasisAreaStyle(
                        .normal(CommonAreaStyleContent())
                        )),
                    .data([150, 232, 201, 154, 190, 330, 410])
                ),
                LineSerie(
                    .name("直接访问"),
                    .stack("总量"),
                    .areaStyle(EmphasisAreaStyle(
                        .normal(CommonAreaStyleContent())
                        )),
                    .data([320, 332, 301, 334, 390, 330, 320])
                ),
                LineSerie(
                    .name("搜索引擎"),
                    .stack("总量"),
                    .label(Label(
                        .normal(CommonLabelStyle(
                            .show(true),
                            .position(.top)
                            ))
                        )),
                    .areaStyle(EmphasisAreaStyle(
                        .normal(CommonAreaStyleContent())
                        )),
                    .data([820, 932, 901, 934, 1290, 1330, 1320])
                )
                ])
        )
    }
    
    // MARK: Confidence Band
    /// 地址: http://echarts.baidu.com/demo.html#confidence-band
    static func confidenceBandOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    static var data: [Jsonable] = []
    static var now = Date(dateString: "1997-09-03")
    static let oneDay: TimeInterval = 60 * 24 * 60
    static var value: Int = Int(arc4random_uniform(1000))
    static let dateFormater = DateFormatter()
    
    static let randomData: () -> [String: Jsonable] = {
        now = Date(timeInterval: oneDay, since: now)
        value = value + Int(arc4random_uniform(21)) - 10
        let valueArr: [Jsonable] = [
            dateFormater.string(from: now),
            value
        ]
        return [
            "name": now.description,
            "value": valueArr
        ]
    }
    
    // MARK: 动态数据 + 时间坐标轴
    /// 地址: http://echarts.baidu.com/demo.html#dynamic-data2
    static func dynamicData2Option() -> Option {
        data = []
        now = Date(dateString: "1997-09-03")
        dateFormater.dateFormat = "yyyy/M/d"
        value = Int(arc4random_uniform(1000))
        
        for _ in 0 ..< 1000 {
            data.append(randomData())
        }
        return Option(
            .title(Title(
                .text("动态数据 + 时间坐标轴")
                )),
            .tooltip(Tooltip(
                .trigger(.axis),
                .formatter(.function("function (params) { params = params[0]; var date = new Date(params.name); return date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear() + ' : ' + params.value[1]; }")),
                .axisPointer(Tooltip.AxisPointer(
                    .animation(false)
                    ))
                )),
            .xAxis(Axis(
                .type(.time),
                .splitLine(SplitLine(
                    .show(false)
                    ))
                )),
            .yAxis(Axis(
                .type(.value),
                .boundaryGap([0, 100%]),
                .splitLine(SplitLine(
                    .show(false)
                    ))
                )),
            .series([
                LineSerie(
                    .name("模拟数据"),
                    .showSymbol(false),
                    .hoverAnimation(false),
                    .data(data)
                )
                ])
        )
    }
    
    // MARK: 雨量流量关系图2
    /// 地址:http://echarts.baidu.com/demo.html#grid-multiple
    static func gridMultipleOption() -> Option {
        guard let plistUrl = Bundle.main.path(forResource: "AreaRainfallDatas", ofType: "plist") else {
            return Option()
        }
        
        guard let plistDatas = NSDictionary(contentsOfFile: plistUrl) else {
            return Option()
        }
        
        
        let xAxisDatas = (plistDatas["XAxisDatas"] as! [String]).map({ (ele) -> Jsonable in
            return ele.replacingOccurrences(of: "2009/", with: "").replacingOccurrences(of: "\\n", with: " ")
        })
        let seriesDatas1 = (plistDatas["SeriesData1"] as! [Float]).map { (ele) -> Jsonable in
            return ele
        }
        let seriesDatas2 = (plistDatas["SeriesData2"] as! [Float]).map { (ele) -> Jsonable in
            return ele
        }
        return Option(
            .title(Title(
                .text("雨量流量关系图"),
                .subtext("数据来自西安兰特水电测控技术有限公司"),
                .x(.center)
                )),
            .tooltip(Tooltip(
                .trigger(.axis),
                .axisPointer(Tooltip.AxisPointer(
                    .animation(false)
                    ))
                )),
            .legend(Legend(
                .data(["流量", "降雨量"]),
                .x(.left)
                )),
            .toolbox(Toolbox(
                .feature(ToolboxFeature(
                    .dataZoom(ToolboxFeatureDataZoom(
                        .yAxisIndex(.bool(false))
                        )),
                    .restore(ToolboxFeatureRestore()),
                    .saveAsImage(ToolboxFeatureSaveAsImage())
                    ))
                )),
            .dataZoom([
                SliderDataZoom(
                    .show(true),
                    .realtime(true),
                    .start(30),
                    .end(70),
                    .xAxisIndexes([0, 1])
                ),
                InsideDataZoom(
                    .start(30),
                    .end(70),
                    .xAxisIndexes([0, 1])
                )
                ]),
            .grids([
                Grid(
                    .left(.value(50)),
                    .right(.value(50)),
                    .height(25%)
                ),
                Grid(
                    .left(.value(50)),
                    .right(.value(50)),
                    .top(.value(58%)),
                    .height(20%)
                )
                ]),
            .xAxises([
                Axis(
                    .type(.category),
                    .boundaryGap(false),
                    .axisLine(AxisLine(
                        .onZero(true)
                        )),
                    .data(xAxisDatas)
                ),
                Axis(
                    .gridIndex(1),
                    .type(.category),
                    .boundaryGap(false),
                    .axisLine(AxisLine(
                        .onZero(true)
                        )),
                    .data(xAxisDatas),
                    .position(.top)
                )
                ]),
            .yAxises([
                Axis(
                    .name("流量(m^3/s)"),
                    .type(.value),
                    .max(500)
                ),
                Axis(
                    .gridIndex(1),
                    .name("降雨量(mm)"),
                    .type(.value),
                    .inverse(true)
                )
                ]),
            .series([
                LineSerie(
                    .name("流量"),
                    .symbolSize(8),
                    .hoverAnimation(false),
                    .data(seriesDatas1)
                ),
                LineSerie(
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
    static func lineApiOption() -> Option {
        guard let plistUrl = Bundle.main.path(forResource: "BeijingAQIDatas", ofType: "plist") else {
            return Option()
        }
        
        guard let plistDatas = NSDictionary(contentsOfFile: plistUrl) else {
            return Option()
        }
        
        let datas = (plistDatas["datas"] as! [AnyObject]).map({ (ele) -> [Jsonable] in
            return [ele[0] as! String, ele[1] as! Int]
        })
        return Option(
            .title(Title(
                .text("Beijing AQI")
                )),
            .tooltip(Tooltip(
                .trigger(.axis)
                )),
            .xAxis(Axis(
                .data(datas.map { $0[0] })
                )),
            .yAxis(Axis(
                .splitLine(SplitLine(.show(false)))
                )),
            .toolbox(Toolbox(
                .left(.center),
                .feature(Toolbox.Feature(
                    .dataZoom(Toolbox.Feature.DataZoom(.yAxisIndex(.bool(false)))),
                    .restore(Toolbox.Feature.Restore()),
                    .saveAsImage(Toolbox.Feature.SaveAsImage())
                    ))
                )),
            .dataZoom([
                SliderDataZoom(
                    .startValue("2014-06-01")
                ),
                InsideDataZoom()
                ]),
            .visualMap(PiecewiseVisualMap(
                .top(.value(10)),
                .right(.value(10)),
                .outRange(
                    ["color": "#999"]
                ),
                .pieces([
                    [
                        "gt": 0,
                        "lte": 50,
                        "color": "#096"
                    ],
                    [
                        "gt": 50,
                        "lte": 100,
                        "color": "#ffde33"
                    ],
                    [
                        "gt": 100,
                        "lte": 150,
                        "color": "#ff9933"
                    ],
                    [
                        "gt": 150,
                        "lte": 200,
                        "color": "#cc0033"
                    ],
                    [
                        "gt": 200,
                        "lte": 300,
                        "color": "#660099"
                    ],
                    [
                        "gt": 300,
                        "color": "#7e0023"
                    ]
                    ])
                )),
            .series([
                LineSerie(
                    .name("Beijing AQI"),
                    .data(datas.map { $0[1] }),
                    .markLine(MarkLine(
                        .silent(true),
                        .data([
                            ["yAxis": 50],
                            ["yAxis": 100],
                            ["yAxis": 150],
                            ["yAxis": 200],
                            ["yAxis": 300]
                            ])
                        ))
                )
                ])
        )
    }
    
    // MARK: Try Dragging these Points
    /// 地址: http://echarts.baidu.com/demo.html#line-draggable
    static func lineDraggableOption() -> Option {
        // 未完成对应的拖拽代码
        let symbolSize: Float = 20
        let data: [Jsonable] =  [[15, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
        return Option(
            .title(Title(
                .text("Try Dragging these Points")
                )),
            .tooltip(Tooltip(
                .triggerOn(.none),
                .formatter(.function("function tooltipFormatter(params) { return 'X: ' + params.data[0].toFixed(2) + '<br>Y: ' + params.data[1].toFixed(2);}"))
                )),
            .grid(Grid()),
            .xAxis(Axis(
                .min(-100),
                .max(80),
                .type(.value),
                .axisLine(AxisLine(
                    .onZero(false)
                    ))
                )),
            .yAxis(Axis(
                .min(-30),
                .max(60),
                .type(.value),
                .axisLine(AxisLine(
                    .onZero(false)
                    ))
                )),
            .dataZoom([
                SliderDataZoom(
                    .xAxisIndex(0),
                    .filterMode(.empty)
                ),
                SliderDataZoom(
                    .yAxisIndex(0),
                    .filterMode(.empty)
                ),
                InsideDataZoom(
                    .xAxisIndex(0),
                    .filterMode(.empty)
                ),
                InsideDataZoom(
                    .yAxisIndex(0),
                    .filterMode(.empty)
                ),
                ]),
            .series([
                LineSerie(
                    .smooth(false),
                    .symbolSize(.value(symbolSize)),
                    .data(data)
                )
                ])
        )
    }
    
    // MARK: Different Easing Functions
    /// 地址: http://echarts.baidu.com/demo.html#line-easing
    static func lineEasingOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 指数折线图
    /// 地址: http://echarts.baidu.com/gallery/editor.html?c=line-log
    static func lineLogOption() -> Option {
        return Option(
            .title(Title(
                .text("对数轴示例"),
                .left(.center)
                )),
            .tooltip(Tooltip(
                .trigger(.item),
                .formatter(.string("{a} <br/>{b} : {c}"))
                )),
            .legend(Legend(
                .left(.left),
                .data(["2的指数", "3的指数"])
                )),
            .xAxis(Axis(
                .type(.category),
                .name("x"),
                .splitArea(SplitArea(
                    .show(false)
                    )),
                .data(["一", "二", "三", "四", "五", "六", "七", "八", "九"])
                )),
            .grid(Grid(
                .left(.value(3%)),
                .right(.value(4%)),
                .bottom(.value(3%)),
                .containLabel(true)
                )),
            .yAxis(Axis(
                .type(.log),
                .name("y")
                )),
            .series([
                LineSerie(
                    .name("3的指数"),
                    .data([1, 3, 9, 27, 81, 247, 741, 2223, 6669])
                ),
                LineSerie(
                    .name("2的指数"),
                    .data([1, 2, 4, 8, 16, 32, 64, 128, 256])
                ),
                LineSerie(
                    .name("1/2的指数"),
                    .data([1, 0.5, 0.25, 0.125, 0.0625, 0.03125, 0.015625, 0.0078125, 0.00390625])
                )
                ])
        )
    }
    
    // MARK: 未来一周气温变化
    /// 地址: http://echarts.baidu.com/demo.html#line-marker
    static func lineMarkerOption() -> Option {
        return Option(
            .title(Title(
                .text("未来一周气温变化"),
                .subtext("纯属虚构")
                )),
            .tooltip(Tooltip(
                .trigger(.axis)
                )),
            .legend(Legend(
                .data(["最高气温","低气温"])
                )),
            .toolbox(Toolbox(
                .show(true),
                .feature(Toolbox.Feature(
                    .dataZoom(ToolboxFeatureDataZoom(
                        .yAxisIndex(.bool(false))
                        )),
                    .dataView(ToolboxFeatureDataView(
                        .readOnly(false)
                        )),
                    .magicType(ToolboxFeatureMagicType(
                        .type([.line, .bar])
                        )),
                    .restore(ToolboxFeatureRestore(
                        )),
                    .saveAsImage(ToolboxFeatureSaveAsImage(
                        ))
                    ))
                )),
            .xAxis(Axis(
                .type(.category),
                .boundaryGap(false),
                .data(["周一","周二","周三","周四","周五","周六","周日"])
                )),
            .yAxis(Axis(
                .type(.value),
                .axisLabel(AxisLabel(
                    .formatter(.string("{value} °C"))
                    ))
                )),
            .series([
                LineSerie(
                    .name("最高气温"),
                    .data([11, 11, 15, 13, 12, 13, 10]),
                    .markPoint(MarkPoint(
                        .data([
                            MarkData(
                                .type(.max),
                                .name("最大值")
                            ),
                            MarkData(
                                .type(.min),
                                .name("最小值")
                            )
                            ])
                        )),
                    .markLine(MarkLine(
                        .data([
                            MarkData(
                                .type(.average),
                                .name("平均值")
                            )
                            ])
                        ))
                ),
                LineSerie(
                    .name("最低气温"),
                    .data([1, -2, 2, 5, 3, 2, 0]),
                    .markPoint(MarkPoint(
                        .data([
                            MarkData(
                                .name("周最低"),
                                .value(-2),
                                .xAxis("1"),
                                .yAxis("-1.5")
                            )
                            ])
                        )),
                    .markLine(MarkLine(
                        .data(
                            [
                                MarkData(
                                    .type(.average),
                                    .name("平均值")
                                ),
                                [
                                    MarkData(
                                        .x(90%),
                                        .symbol(.none),
                                        .yAxis("max")
                                    ),
                                    MarkData(
                                        .symbol(.circle),
                                        .label(FormattedLabel(
                                            .normal(FormattedLabelStyle(
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
    static func linePenOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 极坐标双数值轴
    /// 地址:http://echarts.baidu.com/demo.html#line-polar
    static func linePolarOption() -> Option {
        var data: [Jsonable] = []
        for i in 0...100 {
            let theta: Double = Double(i) / 100.0 * 360
            let r: Double = 5 * sin(theta / 180 * M_PI) + 5
            data.append([r, theta])
            
        }
        return Option(
            .title(Title(
                .text("极坐标双数值轴")
                )),
            .legend(Legend(
                .data(["line"])
                )),
            .polar(Polar(
                )),
            .tooltip(Tooltip(
                .trigger(.axis),
                .axisPointer(Tooltip.AxisPointer(
                    .type(.cross)
                    ))
                )),
            .angleAxis(AngleAxis(
                .type(.value),
                .startAngle(0)
                )),
            .radiusAxis(RadiusAxis(
                )),
            .series([
                LineSerie(
                    .coordinateSystem(.polar),
                    .name("line"),
                    .data(data)
                )
                ])
        )
    }
    
    // MARK: 极坐标双数值轴
    /// 地址: http://echarts.baidu.com/demo.html#line-polar2
    static func linePolar2Option() -> Option {
        var data: [Jsonable] = []
        for i in 0...360 {
            let t = Double(i) / 180 * M_PI
            let r = sin(2 * t) * cos(2 * t)
            data.append([r, Double(i)])
        }
        return Option(
            .title(Title(
                .text("极坐标双数值轴")
                )),
            .legend(Legend(
                .data(["line"])
                )),
            .polar(Polar(
                .center([50%, 54%])
                )),
            .tooltip(Tooltip(
                .trigger(.axis),
                .axisPointer(Tooltip.AxisPointer(
                    .type(.cross)
                    ))
                )),
            .angleAxis(AngleAxis(
                .type(.value),
                .startAngle(0)
                )),
            .radiusAxis(RadiusAxis(
                .min(0)
                )),
            .series([
                LineSerie(
                    .coordinateSystem(.polar),
                    .name("line"),
                    .showSymbol(false),
                    .data(data)
                )
                ]),
            .animationDuration(2000)
        )
    }
    
    // MARK: 一天用电量分布
    /// 地址:http://echarts.baidu.com/demo.html#line-sections
    static func lineSectionsOption() -> Option {
        return Option(
            .title(Title(
                .text("一天用电量分布"),
                .subtext("纯属虚构")
                )),
            .tooltip(Tooltip(
                .trigger(.axis)
                )),
            .toolbox(Toolbox(
                .show(true),
                .feature(ToolboxFeature(
                    .saveAsImage(ToolboxFeatureSaveAsImage())
                    ))
                )),
            .xAxis(Axis(
                .type(.category),
                .boundaryGap(false),
                .data(["00:00", "01:15", "02:30", "03:45", "05:00", "06:15", "07:30", "08:45", "10:00", "11:15", "12:30", "13:45", "15:00", "16:15", "17:30", "18:45", "20:00", "21:15", "22:30", "23:45"])
                )),
            .yAxis(Axis(
                .type(.value),
                .axisLabel(AxisLabel(
                    .formatter(.string("{value} W"))
                    ))
                )),
            .visualMap(PiecewiseVisualMap(
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
                LineSerie(
                    .name("用电量"),
                    .smooth(true),
                    .data([300, 280, 250, 260, 270, 300, 550, 500, 400, 390, 380, 390, 400, 500, 600, 750, 800, 700, 600, 400]),
                    .markArea(MarkArea(
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
    static func lineStackOption() -> Option {
        return Option(
            .title(Title(
                .text("折线图堆叠")
                )),
            .tooltip(Tooltip(
                .trigger(.axis)
                )),
            .legend(Legend(
                .data(["邮件营销","联盟广告","视频广告","直接访问","搜索引擎"])
                )),
            .grid(Grid(
                .left(.value(3%)),
                .right(.value(4%)),
                .bottom(.value(3%)),
                .containLabel(true)
                )),
            .toolbox(Toolbox(
                .feature(Toolbox.Feature(
                    .saveAsImage(Toolbox.Feature.SaveAsImage(
                        
                        ))
                    ))
                )),
            .xAxis(Axis(
                .type(.category),
                .boundaryGap(false),
                .data(["周一","周二","周三","周四","周五","周六","周日"])
                )),
            .yAxis(Axis(
                .type(.value)
                )),
            .series([
                LineSerie(
                    .name("邮件营销"),
                    .stack("总量"),
                    .data([120, 132, 101, 134, 90, 230, 210])
                ),
                LineSerie(
                    .name("联盟广告"),
                    .stack("总量"),
                    .data([220, 182, 191, 234, 290, 330, 310])
                ),
                LineSerie(
                    .name("视频广告"),
                    .stack("总量"),
                    .data([150, 232, 201, 154, 190, 330, 410])
                ),
                LineSerie(
                    .name("直接访问"),
                    .stack("总量"),
                    .data([320, 332, 301, 334, 390, 330, 320])
                ),
                LineSerie(
                    .name("搜索引擎"),
                    .stack("总量"),
                    .data([820, 932, 901, 934, 1290, 1330, 1320])
                )
                ])
        )
    }
    
    // MARK: Line Step
    /// 地址:http://echarts.baidu.com/demo.html#line-step
    static func lineStepOption() -> Option {
        return Option(
            .title(Title(
                .text("Step Line")
                )),
            .tooltip(Tooltip(
                .trigger(.axis)
                )),
            .grid(Grid(
                .left(.value(3%)),
                .right(.value(4%)),
                .bottom(.value(3%)),
                .containLabel(true)
                )),
            .toolbox(Toolbox(
                .feature(ToolboxFeature(
                    .saveAsImage(ToolboxFeatureSaveAsImage(
                        ))
                    ))
                )),
            .xAxis(Axis(
                .type(.category),
                .data(["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"])
                )),
            .yAxis(Axis(
                .type(.value)
                )),
            .series([
                LineSerie(
                    .name("Step Start"),
                    .step(.start),
                    .data([120, 132, 101, 134, 90, 230, 210])
                ),
                LineSerie(
                    .name("Step Middle"),
                    .step(.middle),
                    .data([220, 282, 201, 234, 290, 430, 410])
                ),
                LineSerie(
                    .name("Step End"),
                    .step(.end),
                    .data([450, 432, 401, 454, 590, 530, 510])
                )
                ])
        )
    }
    
    
    // MARK: 高度(km)与气温(°C)变化关系
    /// 地址:http://echarts.baidu.com/demo.html#line-y-category
    static func lineYCategoryOption() -> Option {
        return Option(
            .legend(Legend(
                .data(["高度(km)与气温(°C)变化关系"])
                )),
            .tooltip(Tooltip(
                .trigger(.axis),
                .formatter(.string("Temperature : <br/>{b}km : {c}°C"))
                )),
            .grid(Grid(
                .left(.value(3%)),
                .right(.value(4%)),
                .bottom(.value(3%)),
                .containLabel(true)
                )),
            .xAxis(Axis(
                .type(.value),
                .axisLabel(AxisLabel(
                    .formatter(.string("{value} °C"))
                    ))
                )),
            .yAxis(Axis(
                .type(.category),
                .axisLine(AxisLine(
                    .onZero(false)
                    )),
                .axisLabel(AxisLabel(
                    .formatter(.string("{value} km"))
                    )),
                .data(["0", "10", "20", "30", "40", "50", "60", "70", "80"])
                )),
            .series([
                LineSerie(
                    .name("高度(km)与气温(°C)变化关系"),
                    .smooth(true),
                    .lineStyle(EmphasisLineStyle(
                        .normal(LineStyle(
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
    
    // MARK: Multiple X Axes
    /// 地址: http://echarts.baidu.com/demo.html#multiple-x-axis
    static func multipleXAxisOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Tooltip and DataZoom on Mobile
    /// 地址: http://echarts.baidu.com/demo.html#line-tooltip-touch
    static func lineTooltipTouchOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
}

extension Date {
    init(dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = Locale(identifier: "en_US_POSIX")
        let d = dateStringFormatter.date(from: dateString)!
        self = Date(timeInterval: 0, since: d)
    }
}
