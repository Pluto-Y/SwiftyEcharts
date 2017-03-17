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
    /// 地址: http://echarts.baidu.com/demo.html#bar-animation-delay
    static func barAnimationDelayOption() -> Option {
        func calculateData(index: Float, function: (Double) -> Double) -> Float {
            var tmp: Float = Float(function(Double(index) / 5.0))
            tmp *= (index / 5.0 - 1.0)
            tmp += index / 6.0
            tmp *= 5.0
            return tmp
        }
        var xAxisData: [Jsonable] = []
        var data1: [Jsonable] = []
        var data2: [Jsonable] = []
        for i in 0..<100 {
            xAxisData.append("类目\(i)")
            data1.append(calculateData(Float(i), function: sin))
            data2.append(calculateData(Float(i), function: cos))
        }
        return Option(
            .title(Title(
                .text("柱状图动画延迟")
                )),
            .legend(Legend(
                .data(["bar", "bar2"]),
                .align(.left)
                )),
            .toolbox(Toolbox(
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
            .tooltip(Tooltip()),
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
    
    // MARK: 柱状图框选
    /// 地址: http://echarts.baidu.com/demo.html#bar-brush
    static func barBrushOption() -> Option { // FIXME: 缺少事件
        var xAxisData: [Jsonable] = []
        var data1: [Jsonable] = []
        var data2: [Jsonable] = []
        var data3: [Jsonable] = []
        var data4: [Jsonable] = []
        for i in 0..<10 {
            xAxisData.append("Class\(i)")
            data1.append(Double((arc4random_uniform(100)+1)) / 100.0 * 2)
            data2.append(Double((arc4random_uniform(100)+1)) / -100.0)
            data3.append(Double((arc4random_uniform(100)+1)) / 100.0 * 5)
            data4.append(Double((arc4random_uniform(100)+1)) / 100.0 + 0.3)
        }
        
        let itemStyle = ItemStyle(
            .normal(CommonItemStyleContent()),
            .emphasis(CommonItemStyleContent(
//                .barBorderWidth(1), // 这个属性在网页上好像没用
                .shadowBlur(10),
                .shadowOffsetX(0),
                .shadowOffsetY(0),
                .shadowColor(.rgba(0, 0, 0, 0.5))
                ))
        )
        return Option(
            .backgroundColor(.hexColor("#eee")),
            .legend(Legend(
                .data(["bar", "bar2", "bar3", "bar4"]),
                .align(.left),
                .left(.value(10))
                )),
            .brush(SECBrush(
                .toolbox([.rect, .polygon, .lineX, .lineY, .keep, .clear]),
                .xAxisIndex(.indexes([0]))
                )),
            .toolbox(Toolbox(
                .feature(SECTFeature(
                    .magicType(SECTFMagicType(
                        .type([.stack, .tiled])
                        )),
                    .dataView(SECTFDataView())
                    ))
                )),
            .tooltip(Tooltip()),
            .xAxis(SECAxis(
                .data(xAxisData),
                .name("X Axis"),
                .silent(false),
                .axisLine(SECAxisLine(
                    .onZero(true)
                    )),
                .splitLine(SECSplitLine(
                    .show(false)
                    )),
                .splitArea(SECSplitArea(
                    .show(false)
                    ))
                )),
            .yAxis(SECAxis(
                .inverse(true),
                .splitArea(SECSplitArea(
                    .show(false)
                    ))
                )),
            .grid(Grid(
                .left(.value(100))
                )),
            .visualMap(SECContinuousVisualMap(
                .dimension(1),
                .text(["Hight", "Low"]),
                .inverse(true),
                .itemHeight(200),
                .calculable(true),
                .min(-2),
                .max(6),
                .top(.value(60)),
                .left(.value(10)),
                .inRange(["colorLightness": [0.4, 0.8]]),
                .outRange(["color": Color.hexColor("#bbb")]),
                .controller(SECVMController(
                    .inRange(["color": Color.hexColor("#2f4554")])
                    ))
                )),
            .series([
                SECBarSerie(
                    .name("bar"),
                    .stack("one"),
                    .itemStyle(itemStyle),
                    .data(data1)
                ),
                SECBarSerie(
                    .name("bar2"),
                    .stack("one"),
                    .itemStyle(itemStyle),
                    .data(data2)
                ),
                SECBarSerie(
                    .name("bar3"),
                    .stack("two"),
                    .itemStyle(itemStyle),
                    .data(data3)
                ),
                SECBarSerie(
                    .name("bar4"),
                    .stack("two"),
                    .itemStyle(itemStyle),
                    .data(data4)
                )
                ])
        )
    }
    
    // MARK: 特性示例：渐变色 阴影 点击缩放
    /// 地址: http://echarts.baidu.com/demo.html#bar-gradient
    static func barGradientOption() -> Option { // FIXME: 缺少点击事件
        let dataAxis: [Jsonable] =  ["点", "击", "柱", "子", "或", "者", "两", "指", "在", "触", "屏", "上", "滑", "动", "能", "够", "自", "动", "缩", "放"]
        let yMax = 500
        var dataShadow: [Jsonable] = []
        
        for _ in 0..<dataAxis.count {
            dataShadow.append(yMax)
        }
        return Option(
            .title(Title(
                .text("特性示例：渐变色 阴影 点击缩放"),
                .subtext("Feature Sample: Gradient Color, Shadow, Click Zoom")
                )),
            .xAxis(SECAxis(
                .data(dataAxis),
                .axisLabel(SECAxisLabel(
                    .inside(true),
                    .textStyle(TextStyle(
                        .color(.hexColor("#fff"))
                        ))
                    )),
                .axisTick(SECAxisTick(
                    .show(false)
                    )),
                .axisLine(SECAxisLine(
                    .show(false)
                    )),
                .z(10)
                )),
            .yAxis(SECAxis(
                .axisLine(SECAxisLine(
                    .show(false)
                    )),
                .axisTick(SECAxisTick(
                    .show(false)
                    )),
                .axisLabel(SECAxisLabel(
                    .textStyle(TextStyle(
                        .color(.hexColor("#999"))
                        ))
                    ))
                )),
            .dataZoom([SECInsideDataZoom(
                )]),
            .series([
                SECBarSerie(
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
                            .color(.rgba(0, 0, 0, 0.05))
                            ))
                        )),
                    .barGap("-100%"),
                    .barCategoryGap("40%"),
                    .data(dataShadow),
                    .animation(false)
                ),
                SECBarSerie(
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
                            .color(.linearGradient(0, 0, 0, 1,
                                [
                                    ["offset": 0, "color": Color.hexColor("#83bff6")],
                                    ["offset": 0.5, "color": Color.hexColor("#188df0")],
                                    ["offset": 1, "color": Color.hexColor("#188df0")]
                                ], false))
                            )),
                        .emphasis(CommonItemStyleContent(
                            .color(.linearGradient(0, 0, 0, 1,
                                [
                                    ["offset": 0, "color": Color.hexColor("#2378f7")],
                                    ["offset": 0.7, "color": Color.hexColor("#2378f7")],
                                    ["offset": 1, "color": Color.hexColor("#83bff6")]
                                ], false))
                            ))
                        )),
                    .data([220, 182, 191, 234, 290, 330, 310, 123, 442, 321, 90, 149, 210, 122, 133, 334, 198, 123, 125, 220])
                )
                ])
        )
    }
    
    // MARK: 正负条形图
    /// 地址:http://echarts.baidu.com/demo.html#bar-negative
    static func barNegativeOption() -> Option {
        return Option(
            .tooltip(Tooltip(
                .trigger(.axis),
                .axisPointer(Tooltip.AxisPointer(
                    .type(.shadow)
                    ))
                )),
            .legend(Legend(
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
    static func barNegative2Option() -> Option {
        let labelRight = FormattedLabel(
            .normal(FormattedLabelStyle(
                .position(.right)
                ))
        )
        return Option(
            .title(Title(
                .text("交错正负轴标签"),
                .subtext("From ExcelHome"),
                .sublink("http://e.weibo.com/1341556070/AjwF2AgQm")
                )),
            .tooltip(Tooltip(
                .trigger(.axis),
                .axisPointer(Tooltip.AxisPointer(
                    .type(.shadow)
                    ))
                )),
            .grid(Grid(
                .top(.value(80)),
                .bottom(.value(30))
                )),
            .xAxis(SECAxis(
                .type(.value),
                .position(.top),
                .splitLine(SECSplitLine(
                    .lineStyle(LineStyle(
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
                        SECBarSerieData(
                            .value(-0.07),
                            .label(labelRight)
                        ),
                        SECBarSerieData(
                            .value(-0.09),
                            .label(labelRight)
                        ),
                        0.2, 0.44,
                        SECBarSerieData(
                            .value(-0.23),
                            .label(labelRight)
                        ),
                        0.08,
                        SECBarSerieData(
                            .value(-0.17),
                            .label(labelRight)
                        ),
                        0.47,
                        SECBarSerieData(
                            .value(-0.36),
                            .label(labelRight)
                        ),
                        0.18
                        ])
                )
                ])
        )
    }
    
    // MARK: 堆叠柱状图
    /// 地址: http://echarts.baidu.com/demo.html#bar-stack
    static func barStackOption() -> Option {
        return Option(
            .tooltip(Tooltip(
                .trigger(.axis),
                .axisPointer(Tooltip.AxisPointer(
                    .type(.shadow)
                    ))
                )),
            .legend(Legend(
                .data(["直接访问","邮件营销","联盟广告","视频广告","搜索引擎","百度","谷歌","必应","其他"])
                )),
            .grid(Grid(
                .left(.value(3%)),
                .right(.value(4%)),
                .bottom(.value(3%)),
                .containLabel(true)
                )),
            .xAxis(SECAxis(
                .type(.category),
                .data(["周一","周二","周三","周四","周五","周六","周日"])
                )),
            .yAxis(SECAxis(
                .type(.value)
                )),
            .series([
                SECBarSerie(
                    .name("直接访问"),
                    .data([320, 332, 301, 334, 390, 330, 320])
                ),
                SECBarSerie(
                    .name("邮件营销"),
                    .stack("广告"),
                    .data([120, 132, 101, 134, 90, 230, 210])
                ),
                SECBarSerie(
                    .name("联盟广告"),
                    .stack("广告"),
                    .data([220, 182, 191, 234, 290, 330, 310])
                ),
                SECBarSerie(
                    .name("视频广告"),
                    .stack("广告"),
                    .data([150, 232, 201, 154, 190, 330, 410])
                ),
                SECBarSerie(
                    .name("搜索引擎"),
                    .data([820, 932, 901, 934, 1290, 1330, 1320]),
                    .markLine(SECMarkLine(
                        .lineStyle(EmphasisLineStyle(
                            .normal(LineStyle(
                                .type(.dashed)
                                ))
                            )),
                        .data([
                            // 如果有两个点组成一条线，要将两个点放在一个数组中
                            [SECMarkLineData(
                                .type(.min)
                                ),
                                SECMarkLineData(
                                    .type(.max)
                                )]
                            ])
                        ))
                ),
                SECBarSerie(
                    .name("百度"),
                    .barWidth(5),
                    .stack("搜索引擎"),
                    .data([620, 732, 701, 734, 1090, 1130, 1120])
                ),
                SECBarSerie(
                    .name("谷歌"),
                    .stack("搜索引擎"),
                    .data([120, 132, 101, 134, 290, 230, 220])
                ),
                SECBarSerie(
                    .name("必应"),
                    .stack("搜索引擎"),
                    .data([60, 72, 71, 74, 190, 130, 110])
                ),
                SECBarSerie(
                    .name("其他"),
                    .stack("搜索引擎"),
                    .data([62, 82, 91, 84, 109, 110, 120])
                )
                ])
        )
    }
    
    // MARK: 坐标轴刻度与标签对齐
    /// 地址: http://echarts.baidu.com/demo.html#bar-tick-align
    static func barTickAlignOption() -> Option {
        return Option(
            .color([.hexColor("#3398DB")]),
            .tooltip(Tooltip(
                .trigger(.axis),
                .axisPointer(Tooltip.AxisPointer(
                    .type(.shadow)
                    ))
                )),
            .grid(Grid(
                .left(.value(3%)),
                .right(.value(4%)),
                .bottom(.value(3%)),
                .containLabel(true)
                )),
            .xAxis(SECAxis(
                .type(.category),
                .data(["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]),
                .axisTick(SECAxisTick(
                    .alignWithLabel(true)
                    ))
                )),
            .yAxis(SECAxis(
                .type(.value)
                )),
            .series([
                SECBarSerie(
                    .name("直接访问"),
                    .barWidth(60%),
                    .data([10, 52, 200, 334, 390, 330, 220])
                )
                ])
        )
    }
    
    // MARK: 深圳月最低生活费组成（单位:元）
    /// 地址: http://echarts.baidu.com/demo.html#bar-waterfall
    static func barWaterfallOption() -> Option {
        return Option(
            .title(Title(
                .text("深圳月最低生活费组成（单位:元）"),
                .subtext("From ExcelHome"),
                .sublink("http://e.weibo.com/1341556070/AjQH99che")
                )),
            .tooltip(Tooltip(
                .trigger(.axis),
                .axisPointer(Tooltip.AxisPointer(
                    .type(.shadow)
                    )),
                .formatter(.function("function tooltipFomatter(params) { var tar = params[1]; return tar.name + '<br/>' + tar.seriesName + ' : ' + tar.value;}"))
                )),
            .grid(Grid(
                .left(.value(3%)),
                .right(.value(4%)),
                .bottom(.value(3%)),
                .containLabel(true)
                )),
            .xAxis(SECAxis(
                .type(.category),
                .splitLine(SECSplitLine(
                    .show(false)
                    )),
                .data(["总费用","房租","水电费","交通费","伙食费","日用品数"])
                )),
            .yAxis(SECAxis(
                .type(.value)
                )),
            .series([
                SECBarSerie(
                    .name("辅助"),
                    .stack("总量"),
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
                            .borderColor(.rgba(0, 0, 0, 0)),
                            .color(.rgba(0, 0, 0, 0))
                            )),
                        .emphasis(CommonItemStyleContent(
                            .borderColor(.rgba(0, 0, 0, 0)),
                            .color(.rgba(0, 0, 0, 0))
                            ))
                        )),
                    .data([0, 1700, 1400, 1200, 300, 0])
                ),
                SECBarSerie(
                    .name("生活费"),
                    .stack("总量"),
                    .label(SECBarSerie.Label(
                        .normal(SECBarSerie.LabelContent(
                            .show(true),
                            .position(.inside)
                            ))
                        )),
                    .data([2900, 1200, 300, 200, 900, 300])
                )
                ])
        )
    }
    
    // MARK: 阶梯瀑布图
    /// 地址：http://echarts.baidu.com/demo.html#bar-waterfall2
    static func barWaterfall2Option() -> Option {
        var list: [Jsonable] = []
        for i in 1...11 {
            list.append("11月\(i)日")
        }
        return Option(
            .title(Title(
                .text("阶梯瀑布图"),
                .subtext("From ExcelHome"),
                .sublink("http://e.weibo.com/1341556070/Aj1J2x5a5")
                )),
            .tooltip(Tooltip(
                .trigger(.axis),
                .axisPointer(Tooltip.AxisPointer(
                    .type(.shadow)
                    )),
                .formatter(.function("function tooltipAxisPointer(params){ var tar; if(params[1].value != '-') { tar = params[1]; } else { tar = param[0]; } return tar.name + '<br/>' + tar.seriesName + ' : ' + tar.value}"))
                )),
            .legend(Legend(
                .data(["支出","收入"])
                )),
            .grid(Grid(
                .left(.value(3%)),
                .right(.value(4%)),
                .bottom(.value(3%)),
                .containLabel(true)
                )),
            .xAxis(SECAxis(
                .type(.category),
                .splitLine(SECSplitLine(
                    .show(false)
                    )),
                .data(list)
                )),
            .yAxis(SECAxis(
                .type(.value)
                )),
            .series([
                SECBarSerie(
                    .name("辅助"),
                    .stack("总量"),
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
                            .borderColor(.rgba(0, 0, 0, 0)),
                            .color(.rgba(0, 0, 0, 0))
                            )),
                        .emphasis(CommonItemStyleContent(
                            .borderColor(.rgba(0, 0, 0, 0)),
                            .color(.rgba(0, 0, 0, 0))
                            ))
                        )),
                    .data([0, 900, 1245, 1530, 1376, 1376, 1511, 1689, 1856, 1495, 1292])
                ),
                SECBarSerie(
                    .name("收入"),
                    .stack("总量"),
                    .label(SECBarSerie.Label(
                        .normal(SECBarSerie.LabelContent(
                            .show(true),
                            .position(.top)
                            ))
                        )),
                    .data([900, 345, 393, "-", "-", 135, 178, 286, "-", "-", "-"])
                ),
                SECBarSerie(
                    .name("支出"),
                    .stack("总量"),
                    .label(SECBarSerie.Label(
                        .normal(SECBarSerie.LabelContent(
                            .show(true),
                            .position(.bottom)
                            ))
                        )),
                    .data(["-", "-", "-", 108, 154, "-", "-", "-", 119, 361, 203])
                )
                ])
        )
    }
    
    // MARK: 堆叠条形图
    /// 地址: http://echarts.baidu.com/demo.html#bar-y-category-stack
    static func barYCategoryStackOption() -> Option {
        return Option(
            .tooltip(Tooltip(
                .trigger(.axis),
                .axisPointer(Tooltip.AxisPointer(
                    .type(.shadow)
                    ))
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
            .xAxis(SECAxis(
                .type(.value)
                )),
            .yAxis(SECAxis(
                .type(.category),
                .data(["周一","周二","周三","周四","周五","周六","周日"])
                )),
            .series([
                SECBarSerie(
                    .name("直接访问"),
                    .stack("总量"),
                    .label(SECBarSerie.Label(
                        .normal(SECBarSerie.LabelContent(
                            .show(true),
                            .position(.insideRight)
                            ))
                        )),
                    .data([320, 332, 301, 334, 390, 330, 320])
                ),
                SECBarSerie(
                    .name("邮件营销"),
                    .stack("总量"),
                    .label(SECBarSerie.Label(
                        .normal(SECBarSerie.LabelContent(
                            .show(true),
                            .position(.insideRight)
                            ))
                        )),
                    .data([120, 132, 101, 134, 90, 230, 210])
                ),
                SECBarSerie(
                    .name("联盟广告"),
                    .stack("总量"),
                    .label(SECBarSerie.Label(
                        .normal(SECBarSerie.LabelContent(
                            .show(true),
                            .position(.insideRight)
                            ))
                        )),
                    .data([220, 182, 191, 234, 290, 330, 310])
                ),
                SECBarSerie(
                    .name("视频广告"),
                    .stack("总量"),
                    .label(SECBarSerie.Label(
                        .normal(SECBarSerie.LabelContent(
                            .show(true),
                            .position(.insideRight)
                            ))
                        )),
                    .data([150, 232, 201, 154, 190, 330, 410])
                ),
                
                SECBarSerie(
                    .name("搜索引擎"),
                    .stack("总量"),
                    .label(SECBarSerie.Label(
                        .normal(SECBarSerie.LabelContent(
                            .show(true),
                            .position(.insideRight)
                            ))
                        )),
                    .data([820, 932, 901, 934, 1290, 1330, 1320])
                )
                ])
        )
    }
    
    // MARK: 世界人口总量 - 条形图
    /// 地址:http://echarts.baidu.com/demo.html#bar-y-category
    static func barYCategoryOption() -> Option {
        return Option(
            .title(Title(
                .text("世界人口总量"),
                .subtext("数据来自网络")
                )),
            .tooltip(Tooltip(
                .trigger(.axis),
                .axisPointer(Tooltip.AxisPointer(
                    .type(.shadow)
                    ))
                )),
            .legend(Legend(
                .data(["2011年", "2012年"])
                )),
            .grid(Grid(
                .left(.value(3%)),
                .right(.value(4%)),
                .bottom(.value(3%)),
                .containLabel(true)
                )),
            .xAxis(SECAxis(
                .type(.value),
                .boundaryGap(.notCategory([0, 0.01]))
                )),
            .yAxis(SECAxis(
                .type(.category),
                .data(["巴西","印尼","美国","印度","中国","世界人口(万)"])
                )),
            .series([
                SECBarSerie(
                    .name("2011年"),
                    .data([18203, 23489, 29034, 104970, 131744, 630230])
                ),
                SECBarSerie(
                    .name("2012年"),
                    .data([19325, 23438, 31000, 121594, 134141, 681807])
                )
                ])
        )
    }
    
    // MARK: 某地区蒸发量和降水量
    /// 地址: http://echarts.baidu.com/demo.html#bar1
    static func bar1Option() -> Option {
        return Option(
            .title(Title(
                .text("某地区蒸发量和降水量"),
                .subtext("纯属虚构")
                )),
            .tooltip(Tooltip(
                .trigger(.axis)
                )),
            .legend(Legend(
                .data(["蒸发量","降水量"])
                )),
            .toolbox(Toolbox(
                .show(true),
                .feature(SECTFeature(
                    .dataView(SECTFDataView(
                        .show(true),
                        .readOnly(false)
                        )),
                    .magicType(SECTFMagicType(
                        .show(true),
                        .type([.line, .bar])
                        )),
                    .restore(SECTFRestore(
                        .show(true)
                        )),
                    .saveAsImage(SECTFSaveAsImage(
                        .show(true)
                        ))
                    ))
                )),
            .xAxis(SECAxis(
                .type(.category),
                .data(["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"])
                )),
            .yAxis(SECAxis(
                .type(.value)
                )),
            .series([
                SECBarSerie(
                    .name("蒸发量"),
                    .data([2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]),
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
                            SECMarkLineData(
                                .type(.average),
                                .name("平均值")
                            )
                            ])
                        ))
                ),
                SECBarSerie(
                    .name("降水量"),
                    .data([2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]),
                    .markPoint(SECMarkPoint(
                        .data([
                            SECMarkPointData(
                                .name("年最高"),
                                .value(182.2),
                                .xAxis(7),
                                .yAxis(183)
                            ),
                            SECMarkPointData(
                                .name("年最低"),
                                .value(2.3),
                                .xAxis(11),
                                .yAxis(3)
                            )
                            ])
                        )),
                    .markLine(SECMarkLine(
                        .data([
                            SECMarkLineData(
                                .type(.average),
                                .name("平均值")
                            )
                            ])
                        ))
                )
                ])
        )
    }
    
    // MARK: 动态数据
    /// 地址: http://echarts.baidu.com/demo.html#dynamic-data
    static func dynamicDataOption() -> Option {
        var xAxisData1: [Jsonable] = []
        var xAxisData2: [Jsonable] = []
        var date = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss a"
        for i in 0..<10 {
            xAxisData1.append(dateFormatter.stringFromDate(date))
            xAxisData2.append(i)
            date = NSDate(timeIntervalSince1970: date.timeIntervalSince1970)
        }
        var seriesData1: [Jsonable] = []
        var seriesData2: [Jsonable] = []
        for _ in 0..<10 {
            seriesData1.append(arc4random_uniform(1000) + 1)
            seriesData2.append(Double(arc4random_uniform(100) + 1) / 10.0 + 5)
        }
        
        return Option(
            .title(Title(
                .text("动态数据"),
                .subtext("纯属虚构")
                )),
            .tooltip(Tooltip(
                .trigger(.axis)
                )),
            .legend(Legend(
                .data(["最新成交价", "预购队列"])
                )),
            .toolbox(Toolbox(
                .show(true),
                .feature(SECTFeature(
                    .dataView(SECTFDataView(.readOnly(false))),
                    .restore(SECTFRestore()),
                    .saveAsImage(SECTFSaveAsImage())
                    ))
                )),
            .dataZoom([SECSliderDataZoom(
                .show(false),
                .start(0),
                .end(100)
                )]),
            .xAxises([
                SECAxis(
                    .type(.category),
                    .boundaryGap(true),
                    .data(xAxisData1)
                ),
                SECAxis(
                    .type(.category),
                    .boundaryGap(true),
                    .data(xAxisData2)
                )
                ]),
            .yAxises([
                SECAxis(
                    .type(.value),
                    .scale(true),
                    .name("价格"),
                    .max(30),
                    .min(0),
                    .boundaryGap(.notCategory([0.2, 0.2]))
                ),
                SECAxis(
                    .type(.value),
                    .scale(true),
                    .name("预购量"),
                    .max(1200),
                    .min(0),
                    .boundaryGap(.notCategory([0.2, 0.2]))
                )
                ]),
            .series([
                SECBarSerie(
                    .name("预购队列"),
                    .xAxisIndex(1),
                    .yAxisIndex(1),
                    .data(seriesData1)
                ),
                SECLineSerie(
                    .name("最新的成交价"),
                    .data(seriesData2)
                )
                ])
        )
    }
    
    // MARK: 折柱混合
    /// 地址: http://echarts.baidu.com/demo.html#mix-line-bar
    static func mixLineBarOption() -> Option {
        return Option(
            .tooltip(Tooltip(
                .trigger(.axis)
                )),
            .toolbox(Toolbox(
                .feature(SECTFeature(
                    .dataView(SECTFDataView(
                        .show(true),
                        .readOnly(false)
                        )),
                    .magicType(SECTFMagicType(
                        .show(true),
                        .type([.line, .bar])
                        )),
                    .restore(SECTFRestore(
                        .show(true)
                        )),
                    .saveAsImage(SECTFSaveAsImage(
                        .show(true)
                        ))
                    ))
                )),
            .legend(Legend(
                .data(["蒸发量","降水量","平均温度"])
                )),
            .xAxis(SECAxis(
                .type(.category),
                .data(["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"])
                )),
            .yAxises([
                SECAxis(
                    .type(.value),
                    .name("水量"),
                    .min(0),
                    .max(250),
                    .interval(50),
                    .axisLabel(SECAxisLabel(
                        .formatter(.string("{value} ml"))
                        ))
                ),
                SECAxis(
                    .type(.value),
                    .name("温度"),
                    .min(0),
                    .max(25),
                    .interval(5),
                    .axisLabel(SECAxisLabel(
                        .formatter(.string("{value} °C"))
                        ))
                )
                ]),
            .series([
                SECBarSerie(
                    .name("蒸发量"),
                    .data([2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3])
                ),
                SECBarSerie(
                    .name("降水量"),
                    .data([2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3])
                ),
                SECLineSerie(
                    .name("平均温度"),
                    .yAxisIndex(1),
                    .data([2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2])
                )
                ])
        )
    }
    
    // MARK: 全国宏观经济
    /// 地址: http://echarts.baidu.com/demo.html#mix-timeline-finance
    static func mixTimelineFinanceOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Budge
    /// 地址: http://echarts.baidu.com/demo.html#mix-zoom-on-value
    static func mixZoomOnValueOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 多 Y 轴示例
    /// 地址: http://echarts.baidu.com/demo.html#multiple-y-axis
    static func multipleYAxisOption() -> Option {
        let colors: [Color] = [.hexColor("#5793f3"), .hexColor("#d14a61"), .hexColor("#675bba")]
        return Option(
            .color(colors),
            .tooltip(Tooltip(
                .trigger(.axis)
                )),
            .grid(Grid(
                .right(.value(20%))
                )),
            .toolbox(Toolbox(
                .feature(SECTFeature(
                    .dataView(SECTFDataView(
                        .show(true),
                        .readOnly(false)
                        )),
                    .restore(SECTFRestore(
                        .show(true)
                        )),
                    .saveAsImage(SECTFSaveAsImage(
                        .show(true)
                        ))
                    ))
                )),
            .legend(Legend(
                .data(["蒸发量","降水量","平均温度"])
                )),
            .xAxis(SECAxis(
                .type(.category),
                .axisTick(SECAxisTick(
                    .alignWithLabel(true)
                    )),
                .data(["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"])
                )),
            .yAxises([
                SECAxis(
                    .type(.value),
                    .name("蒸发量"),
                    .min(0),
                    .max(250),
                    .position(.right),
                    .axisLine(SECAxisLine(
                        .lineStyle(LineStyle(
                            .color(colors[0])
                            ))
                        )),
                    .axisLabel(SECAxisLabel(
                        .formatter(.string("{value} ml"))
                        ))
                ),
                SECAxis(
                    .type(.value),
                    .name("降水量"),
                    .min(0),
                    .max(250),
                    .position(.right),
                    .offset(40), // 针对屏幕小进行调整
                    .axisLine(SECAxisLine(
                        .lineStyle(LineStyle(
                            .color(colors[1])
                            ))
                        )),
                    .axisLabel(SECAxisLabel(
                        .formatter(.string("{value} ml"))
                        ))
                ),
                SECAxis(
                    .type(.value),
                    .name("平均温度"),
                    .min(0),
                    .max(25),
                    .position(.left),
                    .axisLine(SECAxisLine(
                        .lineStyle(LineStyle(
                            .color(colors[2])
                            ))
                        )),
                    .axisLabel(SECAxisLabel(
                        .formatter(.string("{value} °C"))
                        ))
                )
                ]),
            .series([
                SECBarSerie(
                    .name("蒸发量"),
                    .data([2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3])
                ),
                SECBarSerie(
                    .name("降水量"),
                    .yAxisIndex(1),
                    .data([2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3])
                ),
                SECLineSerie(
                    .name("平均温度"),
                    .yAxisIndex(2),
                    .data([2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2])
                )
                ])
        )
    }
    
    // MARK: 水印 - ECharts 下载统计
    /// 地址: http://echarts.baidu.com/demo.html#watermark
    static func watermarkOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
}
