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
    
    // MARK: 柱状图框选
    /// 地址: http://echarts.baidu.com/demo.html#bar-brush
    static func barBrushOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
    // MARK: 特性示例：渐变色 阴影 点击缩放
    /// 地址: http://echarts.baidu.com/demo.html#bar-gradient
    static func barGradientOption() -> SECOption {
        let dataAxis: [SECJsonable] =  ["点", "击", "柱", "子", "或", "者", "两", "指", "在", "触", "屏", "上", "滑", "动", "能", "够", "自", "动", "缩", "放"]
        let data = [220, 182, 191, 234, 290, 330, 310, 123, 442, 321, 90, 149, 210, 122, 133, 334, 198, 123, 125, 220]
        let yMax = 500
        var dataShadow: [SECJsonable] = []
        
        for _ in 0..<data.count {
            dataShadow.append(yMax)
        }
        return SECOption(
            .title(SECTitle(
                .text("特性示例：渐变色 阴影 点击缩放"),
                .subtext("Feature Sample: Gradient Color, Shadow, Click Zoom")
                )),
            .xAxis(SECAxis(
                .data(dataAxis),
                .axisLabel(SECAxisLabel(
                    .inside(true),
                    .textStyle(SECTextStyle(
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
                    .inside(true),
                    .textStyle(SECTextStyle(
                        .color(.hexColor("#999"))
                        ))
                    ))
                )),
            .dataZoom([SECInsideDataZoom(
                )]),
            .series([
                SECBarSerie(
                    .itemStyle(SECItemStyle(
                        .normal(SECCommonItemStyleContent(
                            .color(.rgba(0, 0, 0, 0.05))
                            ))
                        )),
                    .barGap("-100%"),
                    .barCategoryGap("40%"),
                    .data(dataShadow),
                    .animation(false)
                ),
                SECBarSerie(
                    .itemStyle(SECItemStyle(
                        .normal(SECCommonItemStyleContent(
//                            .color
                            ))
                        ))
                )
                ])
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
    static func barStackOption() -> SECOption {
        return SECOption(
            .tooltip(SECTooltip(
                .trigger(.axis),
                .axisPointer(SECTooltip.AxisPointer(
                    .type(.shadow)
                    ))
                )),
            .legend(SECLegend(
                .data(["直接访问","邮件营销","联盟广告","视频广告","搜索引擎","百度","谷歌","必应","其他"])
                )),
            .grid(SECGrid(
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
                        .lineStyle(SECEmphasisLineStyle(
                            .normal(SECLineStyle(
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
    static func barTickAlignOption() -> SECOption {
        return SECOption(
            .color([.hexColor("#3398DB")]),
            .tooltip(SECTooltip(
                .trigger(.axis),
                .axisPointer(SECTooltip.AxisPointer(
                    .type(.shadow)
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
    static func barWaterfallOption() -> SECOption {
        return SECOption(
            .title(SECTitle(
                .text("深圳月最低生活费组成（单位:元）"),
                .subtext("From ExcelHome"),
                .sublink("http://e.weibo.com/1341556070/AjQH99che")
                )),
            .tooltip(SECTooltip(
                .trigger(.axis),
                .axisPointer(SECTooltip.AxisPointer(
                    .type(.shadow)
                    )),
                .formatter(.function("function tooltipFomatter(params) { var tar = params[1]; return tar.name + '<br>/' + tar.seriesName + ' : ' + tar.value;}"))
                )),
            .grid(SECGrid(
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
                    .itemStyle(SECItemStyle(
                        .normal(SECCommonItemStyleContent(
                            .borderColor(.rgba(0, 0, 0, 0)),
                            .color(.rgba(0, 0, 0, 0))
                            )),
                        .emphasis(SECCommonItemStyleContent(
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
    static func barWaterfall2Option() -> SECOption {
        var list: [SECJsonable] = []
        for i in 1...11 {
            list.append("11月\(i)日")
        }
        return SECOption(
            .title(SECTitle(
                .text("阶梯瀑布图"),
                .subtext("From ExcelHome"),
                .sublink("http://e.weibo.com/1341556070/Aj1J2x5a5")
                )),
            .tooltip(SECTooltip(
                .trigger(.axis),
                .axisPointer(SECTooltip.AxisPointer(
                    .type(.shadow)
                    )),
                .formatter(.function("function tooltipAxisPointer(params){ var tar; if(params[1].value != '-') { tar = params[1]; } else { tar = param[0]; } return tar.name + '<br/>' + tar.seriesName + ' : ' + tar.value}"))
                )),
            .legend(SECLegend(
                .data(["支出","收入"])
                )),
            .grid(SECGrid(
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
                    .itemStyle(SECItemStyle(
                        .normal(SECCommonItemStyleContent(
                            .borderColor(.rgba(0, 0, 0, 0)),
                            .color(.rgba(0, 0, 0, 0))
                            )),
                        .emphasis(SECCommonItemStyleContent(
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
    static func barYCategoryStackOption() -> SECOption {
        return SECOption(
            .tooltip(SECTooltip(
                .trigger(.axis),
                .axisPointer(SECTooltip.AxisPointer(
                    .type(.shadow)
                    ))
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
    static func barYCategoryOption() -> SECOption {
        return SECOption(
            .title(SECTitle(
                .text("世界人口总量"),
                .subtext("数据来自网络")
                )),
            .tooltip(SECTooltip(
                .trigger(.axis),
                .axisPointer(SECTooltip.AxisPointer(
                    .type(.shadow)
                    ))
                )),
            .legend(SECLegend(
                .data(["2011年", "2012年"])
                )),
            .grid(SECGrid(
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
    static func bar1Option() -> SECOption {
        return SECOption(
            .title(SECTitle(
                .text("某地区蒸发量和降水量"),
                .subtext("纯属虚构")
                )),
            .tooltip(SECTooltip(
                .trigger(.axis)
                )),
            .legend(SECLegend(
                .data(["蒸发量","降水量"])
                )),
            .toolbox(SECToolbox(
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
    static func dynamicDataOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
            
        )
    }
    
    // MARK: 折柱混合
    /// 地址: http://echarts.baidu.com/demo.html#mix-line-bar
    static func mixLineBarOption() -> SECOption {
        return SECOption(
            .tooltip(SECTooltip(
                .trigger(.axis)
                )),
            .toolbox(SECToolbox(
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
            .legend(SECLegend(
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
    static func mixTimelineFinanceOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
    // MARK: Budge
    /// 地址: http://echarts.baidu.com/demo.html#mix-zoom-on-value
    static func mixZoomOnValueOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
    // MARK: 多 Y 轴示例
    /// 地址: http://echarts.baidu.com/demo.html#multiple-y-axis
    static func multipleYAxisOption() -> SECOption {
        let colors: [SECColor] = [.hexColor("#5793f3"), .hexColor("#d14a61"), .hexColor("#675bba")]
        return SECOption(
            .color(colors),
            .tooltip(SECTooltip(
                .trigger(.axis)
                )),
            .grid(SECGrid(
                .right(.value(20%))
                )),
            .toolbox(SECToolbox(
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
            .legend(SECLegend(
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
                        .lineStyle(SECLineStyle(
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
                        .lineStyle(SECLineStyle(
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
                        .lineStyle(SECLineStyle(
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
    static func watermarkOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
}
