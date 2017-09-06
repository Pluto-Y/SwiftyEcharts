//
//  BarOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public final class BarOptions {
    
    // MARK: 柱状图动画延迟
    /// 地址: http://echarts.baidu.com/demo.html#bar-animation-delay
    static func barAnimationDelayOption() -> Option {
        func calculateData(_ index: Float, function: (Double) -> Double) -> Float {
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
                .feature(ToolboxFeature(
                    .magicType(ToolboxFeatureMagicType(
                        .type([.stack, .tiled])
                        )),
                    .dataView(ToolboxFeatureDataView(
                        )),
                    .saveAsImage(ToolboxFeatureSaveAsImage(
                        .pixelRatio(2)
                        ))
                    ))
                )),
            .tooltip(Tooltip()),
            .xAxis(Axis(
                .data(xAxisData),
                .silent(false),
                .splitLine(SplitLine(
                    .show(false)
                    ))
                )),
            .yAxis(Axis()),
            .series([
                BarSerie(
                    .name("bar"),
                    .data(data1),
                    .animationDelay(.function("function seriesDelay(idx){ return idx * 10; }"))
                ),
                BarSerie(
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
        var tmp: Double = 0.0
        for i in 0..<10 {
            xAxisData.append("Class\(i)")
            tmp = Double((arc4random_uniform(100)+1)) / 100.0 * 2
            data1.append(tmp)
            tmp = Double((arc4random_uniform(100)+1)) / -100.0
            data2.append(tmp)
            tmp = Double((arc4random_uniform(100)+1)) / 100.0 * 5
            data3.append(tmp)
            tmp = Double((arc4random_uniform(100)+1)) / 100.0 + 0.3
            data4.append(tmp)
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
            .brush(Brush(
                .toolbox([.rect, .polygon, .lineX, .lineY, .keep, .clear]),
                .xAxisIndex(.indexes([0]))
                )),
            .toolbox(Toolbox(
                .feature(ToolboxFeature(
                    .magicType(ToolboxFeatureMagicType(
                        .type([.stack, .tiled])
                        )),
                    .dataView(ToolboxFeatureDataView())
                    ))
                )),
            .tooltip(Tooltip()),
            .xAxis(Axis(
                .data(xAxisData),
                .name("X Axis"),
                .silent(false),
                .axisLine(AxisLine(
                    .onZero(true)
                    )),
                .splitLine(SplitLine(
                    .show(false)
                    )),
                .splitArea(SplitArea(
                    .show(false)
                    ))
                )),
            .yAxis(Axis(
                .inverse(true),
                .splitArea(SplitArea(
                    .show(false)
                    ))
                )),
            .grid(Grid(
                .left(.value(100))
                )),
            .visualMap(ContinuousVisualMap(
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
                .controller(VisualMapController(
                    .inRange(["color": Color.hexColor("#2f4554")])
                    ))
                )),
            .series([
                BarSerie(
                    .name("bar"),
                    .stack("one"),
                    .itemStyle(itemStyle),
                    .data(data1)
                ),
                BarSerie(
                    .name("bar2"),
                    .stack("one"),
                    .itemStyle(itemStyle),
                    .data(data2)
                ),
                BarSerie(
                    .name("bar3"),
                    .stack("two"),
                    .itemStyle(itemStyle),
                    .data(data3)
                ),
                BarSerie(
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
            .xAxis(Axis(
                .data(dataAxis),
                .axisLabel(AxisLabel(
                    .inside(true),
                    .color(.hexColor("#fff"))
                    )),
                .axisTick(AxisTick(
                    .show(false)
                    )),
                .axisLine(AxisLine(
                    .show(false)
                    )),
                .z(10)
                )),
            .yAxis(Axis(
                .axisLine(AxisLine(
                    .show(false)
                    )),
                .axisTick(AxisTick(
                    .show(false)
                    )),
                .axisLabel(AxisLabel(
                    .color(.hexColor("#999"))
                    ))
                )),
            .dataZoom([InsideDataZoom(
                )]),
            .series([
                BarSerie(
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
                            .color(.rgba(0, 0, 0, 0.05))
                            ))
                        )),
                    .barGap((-100)%),
                    .barCategoryGap(40%),
                    .data(dataShadow),
                    .animation(false)
                ),
                BarSerie(
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
                .axisPointer(AxisPointerForTooltip(
                    .type(.shadow)
                    ))
                )),
            .legend(Legend(
                .data(["利润", "支出", "收入"])
                )),
            .xAxis(Axis(
                .type(.value)
                )),
            .yAxis(Axis(
                .type(.category),
                .axisTick(AxisTick(
                    .show(false)
                    )),
                .data(["周一","周二","周三","周四","周五","周六","周日"])
                )),
            .series([
                BarSerie(
                    .name("利润"),
                    .label(EmphasisLabel(
                        .normal(LabelStyle(
                            .show(true),
                            .position(.inside)
                            ))
                        )),
                    .data([200, 170, 240, 244, 200, 220, 210])
                ),
                BarSerie(
                    .name("收入"),
                    .stack("总量"),
                    .label(EmphasisLabel(
                        .normal(LabelStyle(
                            .show(true)
                            ))
                        )),
                    .data([320, 302, 341, 374, 390, 450, 420])
                ),
                BarSerie(
                    .name("支出"),
                    .stack("总量"),
                    .label(EmphasisLabel(
                        .normal(LabelStyle(
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
                .axisPointer(AxisPointerForTooltip(
                    .type(.shadow)
                    ))
                )),
            .grid(Grid(
                .top(.value(80)),
                .bottom(.value(30))
                )),
            .xAxis(Axis(
                .type(.value),
                .position(.top),
                .splitLine(SplitLine(
                    .lineStyle(LineStyle(
                        .type(.dashed)
                        ))
                    ))
                )),
            .yAxis(Axis(
                .type(.category),
                .axisLine(AxisLine(
                    .show(false)
                    )),
                .axisLabel(AxisLabel(
                    .show(false)
                    )),
                .axisTick(AxisTick(
                    .show(false)
                    )),
                .splitLine(SplitLine(
                    .show(false)
                    )),
                .data(["ten", "nine", "eight", "seven", "six", "five", "four", "three", "two", "one"])
                )),
            .series([
                BarSerie(
                    .name("生活费"),
                    .stack("总量"),
                    .label(EmphasisLabel(
                        .normal(LabelStyle(
                            .show(true),
                            .formatter(.string("{b}"))
                            ))
                        )),
                    .data([
                        BarSerieData(
                            .value(-0.07),
                            .label(labelRight)
                        ),
                        BarSerieData(
                            .value(-0.09),
                            .label(labelRight)
                        ),
                        0.2, 0.44,
                        BarSerieData(
                            .value(-0.23),
                            .label(labelRight)
                        ),
                        0.08,
                        BarSerieData(
                            .value(-0.17),
                            .label(labelRight)
                        ),
                        0.47,
                        BarSerieData(
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
                .axisPointer(AxisPointerForTooltip(
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
            .xAxis(Axis(
                .type(.category),
                .data(["周一","周二","周三","周四","周五","周六","周日"])
                )),
            .yAxis(Axis(
                .type(.value)
                )),
            .series([
                BarSerie(
                    .name("直接访问"),
                    .data([320, 332, 301, 334, 390, 330, 320])
                ),
                BarSerie(
                    .name("邮件营销"),
                    .stack("广告"),
                    .data([120, 132, 101, 134, 90, 230, 210])
                ),
                BarSerie(
                    .name("联盟广告"),
                    .stack("广告"),
                    .data([220, 182, 191, 234, 290, 330, 310])
                ),
                BarSerie(
                    .name("视频广告"),
                    .stack("广告"),
                    .data([150, 232, 201, 154, 190, 330, 410])
                ),
                BarSerie(
                    .name("搜索引擎"),
                    .data([820, 932, 901, 934, 1290, 1330, 1320]),
                    .markLine(MarkLine(
                        .lineStyle(EmphasisLineStyle(
                            .normal(LineStyle(
                                .type(.dashed)
                                ))
                            )),
                        .data([
                            // 如果有两个点组成一条线，要将两个点放在一个数组中
                            [
                                MarkData(
                                    .type(.min)
                                ),
                                MarkData(
                                    .type(.max)
                                )]
                            ])
                        ))
                ),
                BarSerie(
                    .name("百度"),
                    .barWidth(5),
                    .stack("搜索引擎"),
                    .data([620, 732, 701, 734, 1090, 1130, 1120])
                ),
                BarSerie(
                    .name("谷歌"),
                    .stack("搜索引擎"),
                    .data([120, 132, 101, 134, 290, 230, 220])
                ),
                BarSerie(
                    .name("必应"),
                    .stack("搜索引擎"),
                    .data([60, 72, 71, 74, 190, 130, 110])
                ),
                BarSerie(
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
                .axisPointer(AxisPointerForTooltip(
                    .type(.shadow)
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
                .data(["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]),
                .axisTick(AxisTick(
                    .alignWithLabel(true)
                    ))
                )),
            .yAxis(Axis(
                .type(.value)
                )),
            .series([
                BarSerie(
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
                .axisPointer(AxisPointerForTooltip(
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
            .xAxis(Axis(
                .type(.category),
                .splitLine(SplitLine(
                    .show(false)
                    )),
                .data(["总费用","房租","水电费","交通费","伙食费","日用品数"])
                )),
            .yAxis(Axis(
                .type(.value)
                )),
            .series([
                BarSerie(
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
                BarSerie(
                    .name("生活费"),
                    .stack("总量"),
                    .label(EmphasisLabel(
                        .normal(LabelStyle(
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
                .axisPointer(AxisPointerForTooltip(
                    .type(.shadow)
                    )),
                .formatter(.function("function axisPointer(params){ var tar; if(params[1].value != '-') { tar = params[1]; } else { tar = param[0]; } return tar.name + '<br/>' + tar.seriesName + ' : ' + tar.value}"))
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
            .xAxis(Axis(
                .type(.category),
                .splitLine(SplitLine(
                    .show(false)
                    )),
                .data(list)
                )),
            .yAxis(Axis(
                .type(.value)
                )),
            .series([
                BarSerie(
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
                BarSerie(
                    .name("收入"),
                    .stack("总量"),
                    .label(EmphasisLabel(
                        .normal(LabelStyle(
                            .show(true),
                            .position(.top)
                            ))
                        )),
                    .data([900, 345, 393, "-", "-", 135, 178, 286, "-", "-", "-"])
                ),
                BarSerie(
                    .name("支出"),
                    .stack("总量"),
                    .label(EmphasisLabel(
                        .normal(LabelStyle(
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
                .axisPointer(AxisPointerForTooltip(
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
            .xAxis(Axis(
                .type(.value)
                )),
            .yAxis(Axis(
                .type(.category),
                .data(["周一","周二","周三","周四","周五","周六","周日"])
                )),
            .series([
                BarSerie(
                    .name("直接访问"),
                    .stack("总量"),
                    .label(EmphasisLabel(
                        .normal(LabelStyle(
                            .show(true),
                            .position(.insideRight)
                            ))
                        )),
                    .data([320, 332, 301, 334, 390, 330, 320])
                ),
                BarSerie(
                    .name("邮件营销"),
                    .stack("总量"),
                    .label(EmphasisLabel(
                        .normal(LabelStyle(
                            .show(true),
                            .position(.insideRight)
                            ))
                        )),
                    .data([120, 132, 101, 134, 90, 230, 210])
                ),
                BarSerie(
                    .name("联盟广告"),
                    .stack("总量"),
                    .label(EmphasisLabel(
                        .normal(LabelStyle(
                            .show(true),
                            .position(.insideRight)
                            ))
                        )),
                    .data([220, 182, 191, 234, 290, 330, 310])
                ),
                BarSerie(
                    .name("视频广告"),
                    .stack("总量"),
                    .label(EmphasisLabel(
                        .normal(LabelStyle(
                            .show(true),
                            .position(.insideRight)
                            ))
                        )),
                    .data([150, 232, 201, 154, 190, 330, 410])
                ),
                
                BarSerie(
                    .name("搜索引擎"),
                    .stack("总量"),
                    .label(EmphasisLabel(
                        .normal(LabelStyle(
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
                .axisPointer(AxisPointerForTooltip(
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
            .xAxis(Axis(
                .type(.value),
                .boundaryGap(.notCategory([0, 0.01]))
                )),
            .yAxis(Axis(
                .type(.category),
                .data(["巴西","印尼","美国","印度","中国","世界人口(万)"])
                )),
            .series([
                BarSerie(
                    .name("2011年"),
                    .data([18203, 23489, 29034, 104970, 131744, 630230])
                ),
                BarSerie(
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
                .feature(ToolboxFeature(
                    .dataView(ToolboxFeatureDataView(
                        .show(true),
                        .readOnly(false)
                        )),
                    .magicType(ToolboxFeatureMagicType(
                        .show(true),
                        .type([.line, .bar])
                        )),
                    .restore(ToolboxFeatureRestore(
                        .show(true)
                        )),
                    .saveAsImage(ToolboxFeatureSaveAsImage(
                        .show(true)
                        ))
                    ))
                )),
            .xAxis(Axis(
                .type(.category),
                .data(["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"])
                )),
            .yAxis(Axis(
                .type(.value)
                )),
            .series([
                BarSerie(
                    .name("蒸发量"),
                    .data([2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]),
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
                BarSerie(
                    .name("降水量"),
                    .data([2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]),
                    .markPoint(MarkPoint(
                        .data([
                            MarkData(
                                .name("年最高"),
                                .value(182.2),
                                .xAxis("7"),
                                .yAxis("183")
                            ),
                            MarkData(
                                .name("年最低"),
                                .value(2.3),
                                .xAxis("11"),
                                .yAxis("3")
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
                )
                ])
        )
    }
    
    // MARK: Stacked Bar in Polar System
    /// 地址: http://echarts.baidu.com/demo.html#bar-polar-stack
    static func barPolarStackOption() -> Option {
        return Option(
            .angleAxis(AngleAxis()),
            .radiusAxis(RadiusAxis(
                .type(.category),
                .data(["周一", "周二", "周三", "周四"]),
                .z(10)
                )),
            .polar(Polar()),
            .series([
                BarSerie(
                    .data([1, 2, 3, 4]),
                    .coordinateSystem(.polar),
                    .name("A"),
                    .stack("a")
                ),
                BarSerie(
                    .data([2, 4, 6, 8]),
                    .coordinateSystem(.polar),
                    .name("B"),
                    .stack("a")
                ),
                BarSerie(
                    .data([1, 2, 3, 4]),
                    .coordinateSystem(.polar),
                    .name("C"),
                    .stack("a")
                )
                ]),
            .legend(Legend(
                .show(true),
                .data(["A", "B", "C"])
                ))
        )
    }
    
    // MARK: Stacked Bar in Polar System
    /// 地址: http://echarts.baidu.com/demo.html#bar-polar-stack-radial
    static func barPolarStackRadialOption() -> Option {
        return Option(
            .angleAxis(AngleAxis(
                .type(.category),
                .data(["周一", "周二", "周三", "周四", "周五", "周六", "周日"]),
                .z(10)
                )),
            .radiusAxis(RadiusAxis()),
            .polar(Polar()),
            .series([
                BarSerie(
                    .data([1, 2, 3, 4, 3, 5, 1]),
                    .coordinateSystem(.polar),
                    .name("A"),
                    .stack("a")
                ),
                BarSerie(
                    .data([2, 4, 6, 1, 3, 2, 1]),
                    .coordinateSystem(.polar),
                    .name("B"),
                    .stack("a")
                ),
                BarSerie(
                    .data([1, 2, 3, 4, 1, 2, 5]),
                    .coordinateSystem(.polar),
                    .name("C"),
                    .stack("a")
                )
                ]),
            .legend(Legend(
                .show(true),
                .data(["A", "B", "C"])
                ))
        )
    }
    
    // MARK: 在中国租个房子有多贵
    /// 地址: http://echarts.baidu.com/demo.html#bar-polar-real-estate
    static func barPolarRealEstateOption() -> Option {
        let data: [[Float]] = [
            [5000, 10000, 6785.71],
            [4000, 10000, 6825],
            [3000, 6500, 4463.33],
            [2500, 5600, 3793.83],
            [2000, 4000, 3060],
            [2000, 4000, 3222.33],
            [2500, 4000, 3133.33],
            [1800, 4000, 3100],
            [2000, 3500, 2750],
            [2000, 3000, 2500],
            [1800, 3000, 2433.33],
            [2000, 2700, 2375],
            [1500, 2800, 2150],
            [1500, 2300, 2100],
            [1600, 3500, 2057.14],
            [1500, 2600, 2037.5],
            [1500, 2417.54, 1905.85],
            [1500, 2000, 1775],
            [1500, 1800, 1650]
        ]
        
        let cities: [Jsonable] = ["北京", "上海", "深圳", "广州", "苏州", "杭州", "南京", "福州", "青岛", "济南", "长春", "大连", "温州", "郑州", "武汉", "成都", "东莞", "沈阳", "烟台"]
        
        let barHeight: Float = 50
        
        return Option(
            .title(Title(
                .text("在中国租个房子有多贵?"),
                .subtext("市中心一室月租费（数据来源：https://www.numbeo.com）")
                )),
            .legend(Legend(
                .show(true),
                .data(["价格范围", "均值"])
                )),
            .grid(Grid(
                .top(Position.value(100))
                )),
            .angleAxis(AngleAxis(
                .type(.category),
                .data(cities)
                )),
            .tooltip(Tooltip(
                .show(true),
                .formatter(.string("function (params) { var id = params.dataIndex; return cities[id] + '<br>最低：' + data[id][0] + '<br>最高：' + data[id][1] + '<br>平均：' + data[id][2]; }"))
                )),
            .radiusAxis(RadiusAxis()),
            .polar(Polar()),
            .series([
                BarSerie(
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
                            .color(Color.transparent)
                            ))
                        )),
                    .data(data.map{ $0[0] }),
                    .coordinateSystem(.polar),
                    .stack("最大最小值"),
                    .silent(true)
                ),
                BarSerie(
                    .data(data.map { $0[1] - $0[0] }),
                    .coordinateSystem(.polar),
                    .name("价格范围"),
                    .stack("最大最小值")
                ),
                BarSerie(
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
                            .color(Color.transparent)
                            ))
                        )),
                    .data(data.map { $0[2] - barHeight }),
                    .coordinateSystem(.polar),
                    .stack("均值"),
                    .silent(true),
                    .z(10)
                ),
                BarSerie(
                    .data(data.map { _ in barHeight * 2 }),
                    .coordinateSystem(.polar),
                    .name("均值"),
                    .stack("均值"),
                    .barGap((-100)%),
                    .z(10)
                )
                ]),
            .legend(Legend(
                .show(true),
                .data(["A", "B", "C"])
                ))
        )
    }
    
    // MARK: 标签旋转
    /// 地址: http://echarts.baidu.com/demo.html#bar-label-rotation
    static func barLabelRotationOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 富文本标签
    /// 地址: http://echarts.baidu.com/demo.html#bar-rich-text
    static func barRichTextOption() -> Option {
        let weatherIcons: [String: Jsonable] = [
            "Sunny": "http://echarts.baidu.com/data/asset/img/weather/sunny_128.png",
            "Cloudy": "http://echarts.baidu.com/data/asset/img/weather/cloudy_128.png",
            "Showers": "http://echarts.baidu.com/data/asset/img/weather/showers_128.png"
        ]
        
        let seriesLabel = EmphasisLabel(
            .normal(LabelStyle(
                .show(true),
                .textBorderColor(.hexColor("#333")),
                .textBorderWidth(2)
                ))
        )
        
        return Option(
            .title(Title(
                .text("Wheater Statistics")
                )),
            .tooltip(Tooltip(
                .trigger(.axis),
                .axisPointer(AxisPointerForTooltip(
                    .type(.shadow)
                    ))
                )),
            .legend(Legend(
                .data(["City Alpha", "City Beta", "City Gamma"])
                )),
            .grid(Grid(
                .left(Position.value(100))
                )),
            .toolbox(Toolbox(
                .show(true),
                .feature(ToolboxFeature(
                    .saveAsImage(ToolboxFeatureSaveAsImage())
                    ))
                )),
            .xAxis(Axis(
                .type(.value),
                .name("Days"),
                .axisLabel(AxisLabel(
                    .formatter(.string("{value}"))
                    ))
                )),
            .yAxis(Axis(
                .type(.category),
                .inverse(true),
                .data(["Sunny", "Cloudy", "Showers"]),
                .axisLabel(AxisLabel(
                    .formatter(.function("function (value) { return '{' + value + '| }\\n{value|' + value + '}'; }")),
                    .margin(20),
                    .rich([
                        "value": [
                            "lineHeight": 30,
                            "align": "center"
                        ],
                        "Sunny": [
                            "height": 40,
                            "align": "center",
                            "backgroundColor": (["image": weatherIcons["Sunny"]] as Jsonable)
                        ],
                        "Cloudy": [
                            "height": 40,
                            "width": 40,
                            "align": "center",
                            "backgroundColor": (["image": weatherIcons["Cloudy"]] as Jsonable)
                        ],
                        "Showers": [
                            "height": 40,
                            "align": "center",
                            "backgroundColor": (["image": weatherIcons["Showers"]] as Jsonable)
                        ]
                        ])
                    ))
                )),
            .series([
                BarSerie(
                    .name("City Alpha"),
                    .data([165, 170, 30]),
                    .label(seriesLabel),
                    .markPoint(MarkPoint(
                        .symbolSize(1),
                        .symbolOffset([0, 50%]),
                        .label(EmphasisLabel(
                            .normal(LabelStyle(
                                .formatter(.string("{a|{a}\\n}{b|{b} }{c|{c}}")),
                                .backgroundColor(rgb(242, 242, 242)),
                                .borderColor("#aaa"),
                                .borderWidth(1),
                                .borderRadius(4),
                                .padding([4, 10]),
                                .lineHeight(13),
                                .position(.right),
//                                .distance(20),
                                .rich([
                                    "a": [
                                        "align": "center",
                                        "color": "#fff",
                                        "fontSize": 9,
                                        "textShadowBlur": 2,
                                        "textShadowColor": "#000",
                                        "textShadowOffsetX": 0,
                                        "textShadowOffsetY": 1,
                                        "textBorderColor": "#333",
                                        "textBorderWidth": 2
                                    ],
                                    "b": ["color": "#333"],
                                    "c": [
                                        "color": "#ff8811",
                                        "textBorderColor": "#000",
                                        "textBorderWidth": 1,
                                        "fontSize": 11
                                    ]
                                    ])
                                ))
                            )),
                        .data([
                            ["type": "max","name": "max days: "],
                            ["type": "min","name": "min days: "]
                            ])
                        ))
                ),
                BarSerie(
                    .name("City Beta"),
                    .label(seriesLabel),
                    .data([150, 105, 110])
                ),
                BarSerie(
                    .name("City Gamma"),
                    .label(seriesLabel),
                    .data([220, 82, 63])
                )
                ])
        )
    }
    
    // MARK: 动态数据
    /// 地址: http://echarts.baidu.com/demo.html#dynamic-data
    static func dynamicDataOption() -> Option {
        var xAxisData1: [Jsonable] = []
        var xAxisData2: [Jsonable] = []
        var date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss a"
        for i in 0..<10 {
            xAxisData1.append(dateFormatter.string(from: date))
            xAxisData2.append(i)
            date = Date(timeIntervalSince1970: date.timeIntervalSince1970)
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
                .feature(ToolboxFeature(
                    .dataView(ToolboxFeatureDataView(.readOnly(false))),
                    .restore(ToolboxFeatureRestore()),
                    .saveAsImage(ToolboxFeatureSaveAsImage())
                    ))
                )),
            .dataZoom([SliderDataZoom(
                .show(false),
                .start(0),
                .end(100)
                )]),
            .xAxises([
                Axis(
                    .type(.category),
                    .boundaryGap(true),
                    .data(xAxisData1)
                ),
                Axis(
                    .type(.category),
                    .boundaryGap(true),
                    .data(xAxisData2)
                )
                ]),
            .yAxises([
                Axis(
                    .type(.value),
                    .scale(true),
                    .name("价格"),
                    .max(30),
                    .min(0),
                    .boundaryGap(.notCategory([0.2, 0.2]))
                ),
                Axis(
                    .type(.value),
                    .scale(true),
                    .name("预购量"),
                    .max(1200),
                    .min(0),
                    .boundaryGap(.notCategory([0.2, 0.2]))
                )
                ]),
            .series([
                BarSerie(
                    .name("预购队列"),
                    .xAxisIndex(1),
                    .yAxisIndex(1),
                    .data(seriesData1)
                ),
                LineSerie(
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
                .feature(ToolboxFeature(
                    .dataView(ToolboxFeatureDataView(
                        .show(true),
                        .readOnly(false)
                        )),
                    .magicType(ToolboxFeatureMagicType(
                        .show(true),
                        .type([.line, .bar])
                        )),
                    .restore(ToolboxFeatureRestore(
                        .show(true)
                        )),
                    .saveAsImage(ToolboxFeatureSaveAsImage(
                        .show(true)
                        ))
                    ))
                )),
            .legend(Legend(
                .data(["蒸发量","降水量","平均温度"])
                )),
            .xAxis(Axis(
                .type(.category),
                .data(["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"])
                )),
            .yAxises([
                Axis(
                    .type(.value),
                    .name("水量"),
                    .min(0),
                    .max(250),
                    .interval(50),
                    .axisLabel(AxisLabel(
                        .formatter(.string("{value} ml"))
                        ))
                ),
                Axis(
                    .type(.value),
                    .name("温度"),
                    .min(0),
                    .max(25),
                    .interval(5),
                    .axisLabel(AxisLabel(
                        .formatter(.string("{value} °C"))
                        ))
                )
                ]),
            .series([
                BarSerie(
                    .name("蒸发量"),
                    .data([2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3])
                ),
                BarSerie(
                    .name("降水量"),
                    .data([2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3])
                ),
                LineSerie(
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
    static func mixZoomOnValueOption() -> Option { // FIXME: 缺少showLoading和hideLoading
        guard let jsonUrl = Bundle.main.url(forResource: "MixZoomOnValue", withExtension: "json"), let jsonData = try? Data(contentsOf: jsonUrl), let jsonObj = try? JSONSerialization.jsonObject(with: jsonData, options: []) else {
            return Option()
        }
        
        let data = jsonObj as! [String: Any]
        
        return Option(
            .tooltip(Tooltip(
                .trigger(.axis),
                .axisPointer(AxisPointerForTooltip(// 没有label
                    .type(.shadow)//,
//                    .label(EmphasisLabel())
                ))
            )),
            .toolbox(Toolbox(
                .show(true),
                .feature(ToolboxFeature(// 好像没有mark
                    .dataView(ToolboxFeatureDataView(.show(true), .readOnly(false))),
                    .magicType(ToolboxFeatureMagicType(.show(true), .type([.line, .bar]))),
                    .restore(ToolboxFeatureRestore(.show(true))),
                    .saveAsImage(ToolboxFeatureSaveAsImage(.show(true)))
                ))
            )),
//            .calculable(true),// FIXME: 没有calculable
            .legend(Legend(
                .data(["Growth", "Budget 2011", "Budget 2012"]),
                .itemGap(5)
            )),
            .grid(Grid(
                .top(Position.value(12%)),
                .left(.value(1%)),
                .right(.value(10%)),
                .containLabel(true)
            )),
            .xAxis(Axis(
                .type(.category),
                .data((data["names"] as! [String]))
            )),
            .yAxis(Axis(
                .type(.value),
                .name("Budget (million USD)"),
                .axisLabel(AxisLabel(
                    .formatter(.function("function (a) { a = +a; return isFinite(a) ? echarts.format.addCommas(+a / 1000) : ''; }"))
                ))
            )),
            .dataZoom([
                SliderDataZoom(
                    .show(true),
                    .start(94),
                    .end(100)
                ),
                InsideDataZoom(
                    .start(94),
                    .end(100)
                ),
                SliderDataZoom(
                    .show(true),
                    .xAxisIndex(0),
                    .filterMode(.empty),
                    .width(30),
                    .height(80%),
                    .showDataShadow("false"),
                    .left(.value(93%))
                )
                ]),
            .series([
                BarSerie(
                    .name("Budget 2011"),
                    .data((data["budget2011List"] as! [Any]).map { return $0 as! Jsonable })
                ),
                BarSerie(
                    .name("Budget 2012"),
                    .data((data["budget2012List"] as! [Any]).map { return $0 as! Jsonable } )
                )
                ])
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
                .feature(ToolboxFeature(
                    .dataView(ToolboxFeatureDataView(
                        .show(true),
                        .readOnly(false)
                        )),
                    .restore(ToolboxFeatureRestore(
                        .show(true)
                        )),
                    .saveAsImage(ToolboxFeatureSaveAsImage(
                        .show(true)
                        ))
                    ))
                )),
            .legend(Legend(
                .data(["蒸发量","降水量","平均温度"])
                )),
            .xAxis(Axis(
                .type(.category),
                .axisTick(AxisTick(
                    .alignWithLabel(true)
                    )),
                .data(["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"])
                )),
            .yAxises([
                Axis(
                    .type(.value),
                    .name("蒸发量"),
                    .min(0),
                    .max(250),
                    .position(.right),
                    .axisLine(AxisLine(
                        .lineStyle(LineStyle(
                            .color(colors[0])
                            ))
                        )),
                    .axisLabel(AxisLabel(
                        .formatter(.string("{value} ml"))
                        ))
                ),
                Axis(
                    .type(.value),
                    .name("降水量"),
                    .min(0),
                    .max(250),
                    .position(.right),
                    .offset(40), // 针对屏幕小进行调整
                    .axisLine(AxisLine(
                        .lineStyle(LineStyle(
                            .color(colors[1])
                            ))
                        )),
                    .axisLabel(AxisLabel(
                        .formatter(.string("{value} ml"))
                        ))
                ),
                Axis(
                    .type(.value),
                    .name("平均温度"),
                    .min(0),
                    .max(25),
                    .position(.left),
                    .axisLine(AxisLine(
                        .lineStyle(LineStyle(
                            .color(colors[2])
                            ))
                        )),
                    .axisLabel(AxisLabel(
                        .formatter(.string("{value} °C"))
                        ))
                )
                ]),
            .series([
                BarSerie(
                    .name("蒸发量"),
                    .data([2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3])
                ),
                BarSerie(
                    .name("降水量"),
                    .yAxisIndex(1),
                    .data([2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3])
                ),
                LineSerie(
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
    
    // MARK: Histogram
    /// 地址: http://echarts.baidu.com/demo.html#bar-histogram
    static func barHistogramOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
}
