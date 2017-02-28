//
//  SECRadarOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public struct SECRadarOptions {
    
    // MARK: AQI - 雷达图
    /// 地址: http://echarts.baidu.com/demo.html#radar-aqi
    static func radarAqiOption() -> SECOption {
        
        let lineStyle = SECEmphasisLineStyle(
            .normal(SECLineStyle(
                .width(1),
                .opacity(0.5)
                ))
        )
        
        return SECOption(
            .backgroundColor(.hexColor("#161627")),
            .title(SECTitle(
                .text("AQI - 雷达图"),
                .left(.center),
                .textStyle(SECTextStyle(
                    .color(.hexColor("#eee"))
                    ))
                )),
            .legend(SECLegend(
                .bottom(.value(5)),
                .data(["北京", "上海", "广州"]),
                .itemGap(20),
                .textStyle(SECTextStyle(
                    .color(.hexColor("#fff")),
                    .fontSize(14)
                    )),
                .selectedMode(.single)
                )),
            .radar(SECRadar(
                .indicator([
                    SECIndicator(
                        .name("AQI"),
                        .max(300)
                    ),
                    SECIndicator(
                        .name("PM2.5"),
                        .max(250)
                    ),
                    SECIndicator(
                        .name("PM10"),
                        .max(300)
                    ),
                    SECIndicator(
                        .name("CO"),
                        .max(5)
                    ),
                    SECIndicator(
                        .name("NO2"),
                        .max(200)
                    ),
                    SECIndicator(
                        .name("SO2"),
                        .max(100)
                    )
                    ]),
                .shape(.circle),
                .splitNumber(5),
                .name(SECRadar.Name(
                    .textStyle(SECTextStyle(
                        .color(.rgb(238, 197, 102))
                        ))
                    )),
                .splitLine(SECSplitLine(
                    .lineStyle(SECLineStyle(
                        .color(.array([
                            .rgba(238,197, 102, 0.1), .rgba(238, 197, 102, 0.2),
                            .rgba(238,197, 102, 0.4), .rgba(238, 197, 102, 0.6),
                            .rgba(238,197, 102, 0.8), .rgba(238, 197, 102, 0.1)
                            ]))
                        ))
                    )),
                .splitArea(SECSplitArea(
                    .show(false)
                    )),
                .axisLine(SECAxisLine(
                    .lineStyle(SECLineStyle(
                        .color(.rgba(238, 197, 102, 0.5))
                        ))
                    ))
                )),
            .series([
                SECRadarSerie(
                    .name("北京"),
                    .lineStyle(lineStyle),
                    .data([
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
                        ]),
                    .symbol(.none),
                    .itemStyle(SECItemStyle(
                        .normal(SECCommonItemStyleContent(
                            .color(.hexColor("#F9713C"))
                            ))
                        )),
                    .areaStyle(SECEmphasisAreaStyle(
                        .normal(SECCommonAreaStyleContent(
                            .opacity(0.1)
                            ))
                        ))
                ),
                SECRadarSerie(
                    .name("上海"),
                    .lineStyle(lineStyle),
                    .data([
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
                        ]),
                    .symbol(.none),
                    .itemStyle(SECItemStyle(
                        .normal(SECCommonItemStyleContent(
                            .color(.hexColor("#B3E4A1"))
                            ))
                        )),
                    .areaStyle(SECEmphasisAreaStyle(
                        .normal(SECCommonAreaStyleContent(
                            .opacity(0.05)
                            ))
                        ))
                ),
                SECRadarSerie(
                    .name("广州"),
                    .lineStyle(lineStyle),
                    .data([
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
                        ]),
                    .symbol(.none),
                    .itemStyle(SECItemStyle(
                        .normal(SECCommonItemStyleContent(
                            .color(.rgb(238, 197, 102))
                            ))
                        )),
                    .areaStyle(SECEmphasisAreaStyle(
                        .normal(SECCommonAreaStyleContent(
                            .opacity(0.05)
                            ))
                        ))
                )
                ])
        )
    }
    
    // MARK: 自定义雷达图
    /// 地址: http://echarts.baidu.com/demo.html#radar-custom
    static func radarCustomOption() -> SECOption {
        return SECOption(
            .title(SECTitle(
                .text("'自定义雷达图'")
                )),
            .legend(SECLegend(
                .data(["图一","图二", "张三", "李四"])
                )),
            .radars([
                SECRadar(
                    .indicator([
                        SECIndicator(.text("指标一")),
                        SECIndicator(.text("指标二")),
                        SECIndicator(.text("指标三")),
                        SECIndicator(.text("指标四")),
                        SECIndicator(.text("指标五"))
                        ]),
                    .center([25%, 50%]),
                    .radius(120),
                    .startAngle(90),
                    .splitNumber(4),
                    .shape(.circle),
                    .name(SECRadar.Name(
                        .formatter(.string("【{value}】")),
                        .textStyle(SECTextStyle(
                            .color(.hexColor("#72ACD1"))
                            ))
                        )),
                    .splitArea(SECSplitArea(
                        .areaStyle(SECAreaStyle(
                            .color(.array([.rgba(114, 172, 209, 0.2), .rgba(114, 172, 209, 0.4), .rgba(114, 172, 209, 0.6), .rgba(114, 172, 209, 0.8), .rgba(114, 172, 209, 1)])),
                            .shadowColor(.rgba(0, 0, 0, 0.3)),
                            .shadowBlur(10)
                            ))
                        )),
                    .axisLine(SECAxisLine(
                        .lineStyle(SECLineStyle(
                            .color(.rgba(255, 255, 255, 0.5))
                            ))
                        )),
                    .splitLine(SECSplitLine(
                        .lineStyle(SECLineStyle(
                            .color(.rgba(255, 255, 255, 0.5))
                            ))
                        ))
                ),
                SECRadar(
                    .indicator([
                        SECIndicator(.text("语文"), .max(150)),
                        SECIndicator(.text("数学"), .max(150)),
                        SECIndicator(.text("英语"), .max(150)),
                        SECIndicator(.text("物理"), .max(120)),
                        SECIndicator(.text("化学"), .max(102)),
                        SECIndicator(.text("生物"), .max(72))
                        ]),
                    .center([75%, 50%]),
                    .radius(120)
                )
                ]),
            .series([
                SECRadarSerie(
                    .name("雷达图"),
                    .lineStyle(SECEmphasisLineStyle( // 这里进行了修改
                        .emphasis(SECLineStyle(
                            .width(4)
                            ))
                        )),
                    .data([
                        SECRadarSerie.Data(
                            .value([100, 8, 0.40, -80, 2000]),
                            .name("图一"),
                            .symbol(.rect),
                            .symbolSize(5),
                            .lineStyle(SECEmphasisLineStyle(
                                .normal(SECLineStyle(
                                    .type(.dashed)
                                    ))
                                ))
                        ),
                        SECRadarSerie.Data(
                            .value([60, 5, 0.30, -100, 1500]),
                            .name("图二"),
                            .areaStyle(SECEmphasisAreaStyle(
                                .normal(SECCommonAreaStyleContent(
                                    .color(.rgba(255, 255, 255, 0.5))
                                    ))
                                ))
                        )
                        ])
                ),
                SECRadarSerie(
                    .name("成绩单"),
                    .radarIndex(1),
                    .data([
                        SECRadarSerie.Data(
                            .value([120, 118, 130, 100, 99, 70]),
                            .name("张三"),
                            .label(SECFormattedLabel(
                                .normal(SECFormattedLabelStyle(
                                    .show(true)//,
//                                    .formatter(.function("function labelFormatter(params){ return params.value; }"))
                                    ))
                                ))
                        ),
                        SECRadarSerie.Data(
                            .value([90, 113, 140, 30, 70, 60]),
                            .name("李四"),
                            .areaStyle(SECEmphasisAreaStyle(
                                .normal(SECCommonAreaStyleContent(
                                    .opacity(0.9),
                                    .color(.red) // FIXME: 新类型？
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
    static func radarMultipleOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
    // MARK: 基础雷达图
    /// 地址: http://echarts.baidu.com/demo.html#radar
    static func radarOption() -> SECOption {
        return SECOption(
            .title(SECTitle(
                .text("基础雷达图")
                )),
            .tooltip(SECTooltip()),
            .legend(SECLegend(
                .data(["预算分配（Allocated Budget）", "实际开销（Actual Spending）"])
                )),
            .radar(SECRadar(
                .indicator([
                    SECIndicator(.name("销售（sales）"), .max(6500)),
                    SECIndicator(.name("管理（Administration）"), .max(16000)),
                    SECIndicator(.name("信息技术（Information Techology）"), .max(30000)),
                    SECIndicator(.name("客服（Customer Support）"), .max(38000)),
                    SECIndicator(.name("研发（Development）"), .max(52000)),
                    SECIndicator(.name("市场（Marketing）"), .max(25000))
                    ])
                )),
            .series([
                SECRadarSerie(
                    .name("预算 vs 开销（Budget vs spending）"),
                    .data([
                        SECRadarSerie.Data(
                            .value([4300, 10000, 28000, 35000, 50000, 19000]),
                            .name("预算分配（Allocated Budget）")
                        ),
                        SECRadarSerie.Data(
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
    static func radar2Option() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
}
