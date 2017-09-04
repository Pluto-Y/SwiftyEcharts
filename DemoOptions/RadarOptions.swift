//
//  RadarOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public final class RadarOptions {
    
    // MARK: AQI - 雷达图
    /// 地址: http://echarts.baidu.com/demo.html#radar-aqi
    static func radarAqiOption() -> Option {
        
        let serieData1: [Jsonable] = [
            [55,9,56,0.46,18,6,1],
            [25,11,21,0.65,34,9,2],
            [56,7,63,0.3,14,5,3],
            [33,7,29,0.33,16,6,4],
            [42,24,44,0.76,40,16,5],
            [82,58,90,1.77,68,33,6],
            [74,49,77,1.46,48,27,7],
            [78,55,80,1.29,59,29,8],
            [267,216,280,4.8,108,64,9],
            [185,127,216,2.52,61,27,10],
            [39,19,38,0.57,31,15,11],
            [41,11,40,0.43,21,7,12],
            [64,38,74,1.04,46,22,13],
            [108,79,120,1.7,75,41,14],
            [108,63,116,1.48,44,26,15],
            [33,6,29,0.34,13,5,16],
            [94,66,110,1.54,62,31,17],
            [186,142,192,3.88,93,79,18],
            [57,31,54,0.96,32,14,19],
            [22,8,17,0.48,23,10,20],
            [39,15,36,0.61,29,13,21],
            [94,69,114,2.08,73,39,22],
            [99,73,110,2.43,76,48,23],
            [31,12,30,0.5,32,16,24],
            [42,27,43,1,53,22,25],
            [154,117,157,3.05,92,58,26],
            [234,185,230,4.09,123,69,27],
            [160,120,186,2.77,91,50,28],
            [134,96,165,2.76,83,41,29],
            [52,24,60,1.03,50,21,30],
            [46,5,49,0.28,10,6,31]
        ]
        let serieData2: [Jsonable] = [
            [26,37,27,1.163,27,13,1],
            [85,62,71,1.195,60,8,2],
            [78,38,74,1.363,37,7,3],
            [21,21,36,0.634,40,9,4],
            [41,42,46,0.915,81,13,5],
            [56,52,69,1.067,92,16,6],
            [64,30,28,0.924,51,2,7],
            [55,48,74,1.236,75,26,8],
            [76,85,113,1.237,114,27,9],
            [91,81,104,1.041,56,40,10],
            [84,39,60,0.964,25,11,11],
            [64,51,101,0.862,58,23,12],
            [70,69,120,1.198,65,36,13],
            [77,105,178,2.549,64,16,14],
            [109,68,87,0.996,74,29,15],
            [73,68,97,0.905,51,34,16],
            [54,27,47,0.592,53,12,17],
            [51,61,97,0.811,65,19,18],
            [91,71,121,1.374,43,18,19],
            [73,102,182,2.787,44,19,20],
            [73,50,76,0.717,31,20,21],
            [84,94,140,2.238,68,18,22],
            [93,77,104,1.165,53,7,23],
            [99,130,227,3.97,55,15,24],
            [146,84,139,1.094,40,17,25],
            [113,108,137,1.481,48,15,26],
            [81,48,62,1.619,26,3,27],
            [56,48,68,1.336,37,9,28],
            [82,92,174,3.29,0,13,29],
            [106,116,188,3.628,101,16,30],
            [118,50,0,1.383,76,11,31]
        ]
        let serieData3: [Jsonable] = [
            [91,45,125,0.82,34,23,1],
            [65,27,78,0.86,45,29,2],
            [83,60,84,1.09,73,27,3],
            [109,81,121,1.28,68,51,4],
            [106,77,114,1.07,55,51,5],
            [109,81,121,1.28,68,51,6],
            [106,77,114,1.07,55,51,7],
            [89,65,78,0.86,51,26,8],
            [53,33,47,0.64,50,17,9],
            [80,55,80,1.01,75,24,10],
            [117,81,124,1.03,45,24,11],
            [99,71,142,1.1,62,42,12],
            [95,69,130,1.28,74,50,13],
            [116,87,131,1.47,84,40,14],
            [108,80,121,1.3,85,37,15],
            [134,83,167,1.16,57,43,16],
            [79,43,107,1.05,59,37,17],
            [71,46,89,0.86,64,25,18],
            [97,71,113,1.17,88,31,19],
            [84,57,91,0.85,55,31,20],
            [87,63,101,0.9,56,41,21],
            [104,77,119,1.09,73,48,22],
            [87,62,100,1,72,28,23],
            [168,128,172,1.49,97,56,24],
            [65,45,51,0.74,39,17,25],
            [39,24,38,0.61,47,17,26],
            [39,24,39,0.59,50,19,27],
            [93,68,96,1.05,79,29,28],
            [188,143,197,1.66,99,51,29],
            [174,131,174,1.55,108,50,30],
            [187,143,201,1.39,89,53,31]
        ]
        let lineStyleColor: [Color] = [
            .rgba(238,197, 102, 0.1), .rgba(238, 197, 102, 0.2),
            .rgba(238,197, 102, 0.4), .rgba(238, 197, 102, 0.6),
            .rgba(238,197, 102, 0.8), .rgba(238, 197, 102, 0.1)
        ]
        let lineStyle = EmphasisLineStyle(
            .normal(LineStyle(
                .width(1),
                .opacity(0.5)
                ))
        )
        
        let serie1: RadarSerie = RadarSerie(
            .name("北京"),
            .lineStyle(lineStyle),
            .data(serieData1),
            .symbol(.none),
            .itemStyle(ItemStyle(
                .normal(CommonItemStyleContent(
                    .color(.hexColor("#F9713C"))
                    ))
                )),
            .areaStyle(EmphasisAreaStyle(
                .normal(CommonAreaStyleContent(
                    .opacity(0.1)
                    ))
                ))
        )
        let serie2: RadarSerie = RadarSerie(
            .name("上海"),
            .lineStyle(lineStyle),
            .data(serieData2),
            .symbol(.none),
            .itemStyle(ItemStyle(
                .normal(CommonItemStyleContent(
                    .color(.hexColor("#B3E4A1"))
                    ))
                )),
            .areaStyle(EmphasisAreaStyle(
                .normal(CommonAreaStyleContent(
                    .opacity(0.05)
                    ))
                ))
        )
        let serie3: RadarSerie = RadarSerie(
            .name("广州"),
            .lineStyle(lineStyle),
            .data(serieData3),
            .symbol(.none),
            .itemStyle(ItemStyle(
                .normal(CommonItemStyleContent(
                    .color(.rgb(238, 197, 102))
                    ))
                )),
            .areaStyle(EmphasisAreaStyle(
                .normal(CommonAreaStyleContent(
                    .opacity(0.05)
                    ))
                ))
        )
        let series: [Serie] = [serie1, serie2, serie3]
        
        return Option(
            .backgroundColor(.hexColor("#161627")),
            .title(Title(
                .text("AQI - 雷达图"),
                .left(.center),
                .textStyle(TextStyle(
                    .color(.hexColor("#eee"))
                    ))
                )),
            .legend(Legend(
                .bottom(.value(5)),
                .data(["北京", "上海", "广州"]),
                .itemGap(20),
                .textStyle(TextStyle(
                    .color(.hexColor("#fff")),
                    .fontSize(14)
                    )),
                .selectedMode(.single)
                )),
            .radar(Radar(
                .indicator([
                    RadarIndicator(
                        .name("AQI"),
                        .max(300)
                    ),
                    RadarIndicator(
                        .name("PM2.5"),
                        .max(250)
                    ),
                    RadarIndicator(
                        .name("PM10"),
                        .max(300)
                    ),
                    RadarIndicator(
                        .name("CO"),
                        .max(5)
                    ),
                    RadarIndicator(
                        .name("NO2"),
                        .max(200)
                    ),
                    RadarIndicator(
                        .name("SO2"),
                        .max(100)
                    )
                    ]),
                .shape(.circle),
                .splitNumber(5),
                .name(Radar.Name(
                    .textStyle(TextStyle(
                        .color(.rgb(238, 197, 102))
                        ))
                    )),
                .splitLine(SplitLine(
                    .lineStyle(LineStyle(
                        .color(.array(lineStyleColor))
                        ))
                    )),
                .splitArea(SplitArea(
                    .show(false)
                    )),
                .axisLine(AxisLine(
                    .lineStyle(LineStyle(
                        .color(.rgba(238, 197, 102, 0.5))
                        ))
                    ))
                )),
            .series(series)
        )
    }
    
    // MARK: 自定义雷达图
    /// 地址: http://echarts.baidu.com/demo.html#radar-custom
    static func radarCustomOption() -> Option {
        return Option(
            .title(Title(
                .text("自定义雷达图")
                )),
            .legend(Legend(
                .data(["图一","图二", "张三", "李四"])
                )),
            .radars([
                Radar(
                    .indicator([
                        RadarIndicator(.text("指标一")),
                        RadarIndicator(.text("指标二")),
                        RadarIndicator(.text("指标三")),
                        RadarIndicator(.text("指标四")),
                        RadarIndicator(.text("指标五"))
                        ]),
                    .center([25%, 50%]),
                    .radius(50),  // 根据需要调整了大小
                    .startAngle(90),
                    .splitNumber(4),
                    .shape(.circle),
                    .name(Radar.Name(
                        .formatter(.string("【{value}】")),
                        .textStyle(TextStyle(
                            .color(.hexColor("#72ACD1"))
                            ))
                        )),
                    .splitArea(SplitArea(
                        .areaStyle(AreaStyle(
                            .color(.array([.rgba(114, 172, 209, 0.2), .rgba(114, 172, 209, 0.4), .rgba(114, 172, 209, 0.6), .rgba(114, 172, 209, 0.8), .rgba(114, 172, 209, 1)])),
                            .shadowColor(.rgba(0, 0, 0, 0.3)),
                            .shadowBlur(10)
                            ))
                        )),
                    .axisLine(AxisLine(
                        .lineStyle(LineStyle(
                            .color(.rgba(255, 255, 255, 0.5))
                            ))
                        )),
                    .splitLine(SplitLine(
                        .lineStyle(LineStyle(
                            .color(.rgba(255, 255, 255, 0.5))
                            ))
                        ))
                ),
                Radar(
                    .indicator([
                        RadarIndicator(.text("语文"), .max(150)),
                        RadarIndicator(.text("数学"), .max(150)),
                        RadarIndicator(.text("英语"), .max(150)),
                        RadarIndicator(.text("物理"), .max(120)),
                        RadarIndicator(.text("化学"), .max(108)),
                        RadarIndicator(.text("生物"), .max(72))
                        ]),
                    .center([75%, 50%]),
                    .radius(50)   // 根据需要调整了大小
                )
                ]),
            .series([
                RadarSerie(
                    .name("雷达图"),
                    .lineStyle(EmphasisLineStyle( // 这里进行了修改
                        .emphasis(LineStyle(
                            .width(4)
                            ))
                        )),
                    .data([
                        RadarSerieData(
                            .value([100, 8, 0.40, -80, 2000]),
                            .name("图一"),
                            .symbol(.rect),
                            .symbolSize(5),
                            .lineStyle(EmphasisLineStyle(
                                .normal(LineStyle(
                                    .type(.dashed)
                                    ))
                                ))
                        ),
                        RadarSerieData(
                            .value([60, 5, 0.30, -100, 1500]),
                            .name("图二"),
                            .areaStyle(EmphasisAreaStyle(
                                .normal(CommonAreaStyleContent(
                                    .color(.rgba(255, 255, 255, 0.5))
                                    ))
                                ))
                        )
                        ])
                ),
                RadarSerie(
                    .name("成绩单"),
                    .radarIndex(1),
                    .data([
                        RadarSerieData(
                            .value([120, 118, 130, 100, 99, 70]),
                            .name("张三"),
                            .label(EmphasisLabel(
                                .normal(LabelStyle(
                                    .show(true),
                                    .formatter(.function("function labelFormatter(params){ return params.value; }"))
                                    ))
                                ))
                        ),
                        RadarSerieData(
                            .value([90, 113, 140, 30, 70, 60]),
                            .name("李四"),
                            .areaStyle(EmphasisAreaStyle(
                                .normal(CommonAreaStyleContent(
                                    .opacity(0.9),
                                    .color(Color.radialGradient(0.5, 0.5, 1, [
                                        GradientColorElement(
                                            0, "#B8D3E4"
                                        ),
                                        GradientColorElement(
                                            1, "#72ACD1"
                                        )
                                        ], false))
                                    ))
                                ))
                        )
                        ])
                )
                ])
            
        )
    }
    
    // MARK: 多雷达图
    /// 地址: http://echarts.baidu.com/demo.html#radar-multiple
    static func radarMultipleOption() -> Option {
        var indicator: [RadarIndicator] = []
        for i in 1...12 {
            indicator.append(RadarIndicator(.text("\(i)月"), .max(100)))
        }
        return Option(
            .title(Title(
                .text("多雷达图")
                )),
            .tooltip(Tooltip(
                .trigger(.axis)
                )),
            .legend(Legend(
                .x(.center),
                .data(["某软件","某主食手机","某水果手机","降水量","蒸发量"])
                )),
            .radars([
                Radar(
                    .indicator([
                        RadarIndicator(.text("品牌"), .max(100)),
                        RadarIndicator(.text("内容"), .max(100)),
                        RadarIndicator(.text("可用性"), .max(100)),
                        RadarIndicator(.text("功能"), .max(100))
                        ]),
                    .center([25%, 40%]),
                    .radius(40)
                ),
                Radar(
                    .indicator([
                        RadarIndicator(.text("外观"), .max(100)),
                        RadarIndicator(.text("拍照"), .max(100)),
                        RadarIndicator(.text("系统"), .max(100)),
                        RadarIndicator(.text("性能"), .max(100)),
                        RadarIndicator(.text("屏幕"), .max(100))
                        ]),
                    .center([50%, 60%]),
                    .radius(40)
                ),
                Radar(
                    .indicator(indicator),
                    .center([75%, 40%]),
                    .radius(40)
                )
                ]),
            .series([
                RadarSerie(// 好像itemStyle里面的设置没有作用
                    .tooltip(Tooltip(.trigger(.item))),
                    .data([
                        RadarSerieData(
                            .value([60,73,85,40]),
                            .name("某软件")
                        )
                        ])
                ),
                RadarSerie(
                    .radarIndex(1),
                    .data([
                        RadarSerieData(
                            .value([85, 90, 90, 95, 95]),
                            .name("某主食手机")
                        ),
                        RadarSerieData(
                            .value([95, 80, 95, 90, 93]),
                            .name("某水果手机")
                        )
                        ])
                ),
                RadarSerie(// 好像itemStyle里面的设置没有作用
                    .radarIndex(2),
                    .data([
                        RadarSerieData(
                            .name("降雨量"),
                            .value([2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 75.6, 82.2, 48.7, 18.8, 6.0, 2.3])
                        ),
                        RadarSerieData(
                            .name("蒸发量"),
                            .value([2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 35.6, 62.2, 32.6, 20.0, 6.4, 3.3])
                        )
                        ])
                )
                ])
        )
    }
    
    // MARK: 基础雷达图
    /// 地址: http://echarts.baidu.com/demo.html#radar
    static func radarOption() -> Option {
        return Option(
            .title(Title(
                .text("基础雷达图")
                )),
            .tooltip(Tooltip()),
            .legend(Legend(
                .data(["预算分配（Allocated Budget）", "实际开销（Actual Spending）"])
                )),
            .radar(Radar(
                .indicator([
                    RadarIndicator(.name("销售（sales）"), .max(6500)),
                    RadarIndicator(.name("管理（Administration）"), .max(16000)),
                    RadarIndicator(.name("信息技术（Information Techology）"), .max(30000)),
                    RadarIndicator(.name("客服（Customer Support）"), .max(38000)),
                    RadarIndicator(.name("研发（Development）"), .max(52000)),
                    RadarIndicator(.name("市场（Marketing）"), .max(25000))
                    ])
                )),
            .series([
                RadarSerie(
                    .name("预算 vs 开销（Budget vs spending）"),
                    .data([
                        RadarSerieData(
                            .value([4300, 10000, 28000, 35000, 50000, 19000]),
                            .name("预算分配（Allocated Budget）")
                        ),
                        RadarSerieData(
                            .value([5000, 14000, 28000, 31000, 42000, 21000]),
                            .name("实际开销（Actual Spending）")
                        )
                        ])
                )
                ])
        )
    }
    
    // MARK: 浏览器占比变化
    /// 地址: http://echarts.baidu.com/demo.html#radar2
    static func radar2Option() -> Option {
        var list: [Jsonable] = []
        for i in 1...28 {
            list.append("\(i + 2000)")
        }
        
        var series: [Serie] = []
        for i in 1...28 {
            let datas = [(40 - i) * 10, (38 - i) * 4 + 60, i * 5 + 10, i * 9, i * i / 2]
            series.append(RadarSerie(
                .name("浏览器（数据纯属虚构）"),
                .symbol(.none),
                .lineStyle(EmphasisLineStyle( // itemStyle里面没有lineStyle， 而直接用外层的lineStyle即可
                    .normal(LineStyle(
                        .width(1)
                        ))
                    )),
                .data([
                    RadarSerieData(
                        .value(datas),
                        .name("\(i+2000)")
                    )
                    ])
                ))
        }
        return Option(
            .title(Title(
                .text("浏览器占比变化"),
                .subtext("纯属虚构"),
                .x(.right),
                .y(.bottom)
                )),
            .tooltip(Tooltip(
                .trigger(.item),
                .backgroundColor(.rgba(0, 0, 250, 0.2))
                )),
            .legend(Legend(
                .show(false), // 由于屏幕太小隐藏
                .data(list)
                )),
            .visualMap(ContinuousVisualMap(
                .color(.array([.red, .yellow]))
                )),
            .radar(Radar(
                .indicator([
                    RadarIndicator(.text("IE8-"), .max(400)),
                    RadarIndicator(.text("IE9+"), .max(400)),
                    RadarIndicator(.text("Safari"), .max(400)),
                    RadarIndicator(.text("Firefox"), .max(400)),
                    RadarIndicator(.text("Chrome"), .max(400))
                    ])
                )),
            .series(series)
        )
    }
    
}
