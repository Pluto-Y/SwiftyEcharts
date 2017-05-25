//
//  ScatterOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public final class ScatterOptions {
    
    // MARK: 气泡图
    /// 地址: http://echarts.baidu.com/demo.html#bubble-gradient
    static func bubbleGradientOption() -> Option { // FIXME: 缺少 symbolSize 的函数支持
        let data: [[[Jsonable]]] = [
            [[28604,77,17096869,"Australia",1990],[31163,77.4,27662440,"Canada",1990],[1516,68,1154605773,"China",1990],[13670,74.7,10582082,"Cuba",1990],[28599,75,4986705,"Finland",1990],[29476,77.1,56943299,"France",1990],[31476,75.4,78958237,"Germany",1990],[28666,78.1,254830,"Iceland",1990],[1777,57.7,870601776,"India",1990],[29550,79.1,122249285,"Japan",1990],[2076,67.9,20194354,"North Korea",1990],[12087,72,42972254,"South Korea",1990],[24021,75.4,3397534,"New Zealand",1990],[43296,76.8,4240375,"Norway",1990],[10088,70.8,38195258,"Poland",1990],[19349,69.6,147568552,"Russia",1990],[10670,67.3,53994605,"Turkey",1990],[26424,75.7,57110117,"United Kingdom",1990],[37062,75.4,252847810,"United States",1990]],
            [[44056,81.8,23968973,"Australia",2015],[43294,81.7,35939927,"Canada",2015],[13334,76.9,1376048943,"China",2015],[21291,78.5,11389562,"Cuba",2015],[38923,80.8,5503457,"Finland",2015],[37599,81.9,64395345,"France",2015],[44053,81.1,80688545,"Germany",2015],[42182,82.8,329425,"Iceland",2015],[5903,66.8,1311050527,"India",2015],[36162,83.5,126573481,"Japan",2015],[1390,71.4,25155317,"North Korea",2015],[34644,80.7,50293439,"South Korea",2015],[34186,80.6,4528526,"New Zealand",2015],[64304,81.6,5210967,"Norway",2015],[24787,77.3,38611794,"Poland",2015],[23038,73.13,143456918,"Russia",2015],[19360,76.5,78665830,"Turkey",2015],[38225,81.4,64715810,"United Kingdom",2015],[53354,79.1,321773631,"United States",2015]]
        ]
        let backgrounGradient: [GradientColorElement] = [
            [
                "offset": 0,
                "color": Color.hexColor("#f7f8fa")
            ], [
                "offset": 1,
                "color": Color.hexColor("#cdd0d5")
            ]
        ]
        let serieDataGradient1: [GradientColorElement] = [
            [
                "offset": 0,
                "color": Color.rgb(251, 118, 123)
            ], [
                "offset": 1,
                "color": Color.rgb(204, 46, 72)
            ]
        ]
        let serieDataGradient2: [GradientColorElement] = [
            [
                "offset": 0,
                "color": Color.rgb(129, 227, 238)
            ], [
                "offset": 1,
                "color": Color.rgb(25, 183, 207)
            ]
        ]
        return Option(
            .backgroundColor(.radialGradient(0.3, 0.3, 0.8, backgrounGradient, false)),
            .title(Title(
                .text("1990 与 2015 年各国家人均寿命与 GDP")
                )),
            .legend(Legend(
                .right(.value(10)),
                .data(["1990", "2015"])
                )),
            .xAxis(Axis(
                .splitLine(SplitLine(
                    .lineStyle(LineStyle(
                        .type(.dashed)
                        ))
                    ))
                )),
            .yAxis(Axis(
                .splitLine(SplitLine(
                    .lineStyle(LineStyle(
                        .type(.dashed)
                        ))
                    )),
                .scale(true)
                )),
            .series([
                ScatterSerie(
                    .name("1990"),
                    .data(data[0]),
                    .symbolSize("function (data) {return Math.sqrt(data[2]) / 5e2;}"),
                    .label(FormattedLabel(
                        .emphasis(FormattedLabelStyle(
                            .show(true),
                            .formatter(.string("function (param) {return param.data[3];}")),
                            .position(.top)
                            ))
                        )),
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
                            .shadowBlur(10),
                            .shadowColor(.rgba(120, 36, 50, 0.5)),
                            .shadowOffsetY(5),
                            .color(.radialGradient(0.4, 0.3, 1, serieDataGradient1, true))
                            ))
                        ))
                ),
                ScatterSerie(
                    .name("2015"),
                    .data(data[1]),
                    .symbolSize("function (data) {return Math.sqrt(data[2]) / 5e2;}"),
                    .label(FormattedLabel(
                        .emphasis(FormattedLabelStyle(
                            .show(true),
                            .formatter(.string("function (param) {return param.data[3];}")),
                            .position(.top)
                            ))
                        )),
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
                            .shadowBlur(10),
                            .shadowColor(.rgba(25, 100, 150, 0.5)),
                            .shadowOffsetY(5),
                            .color(.radialGradient(0.4, 0.3, 1, serieDataGradient2, false))
                            ))
                        ))
                )
                ])
        )
    }
    
    // MARK: 全国主要城市空气质量 - 百度地图
    /// 地址: http://echarts.baidu.com/demo.html#effectScatter-bmap
    static func effectScatterBmapOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 全国主要城市空气质量
    /// 地址: http://echarts.baidu.com/demo.html#effectScatter-map
    static func effectScatterMapOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Prices and Earnings 2012
    /// 地址: http://echarts.baidu.com/demo.html#map-parallel-prices
    static func mapParallelPricesOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Anscombe's quartet
    /// 地址: http://echarts.baidu.com/demo.html#scatter-anscombe-quartet
    static func scatterAnscombeQuartetOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Scatter Aqi Color
    /// 地址: http://echarts.baidu.com/demo.html#scatter-aqi-color
    static func scatterAqiColorOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 大规模散点图
    /// 地址: http://echarts.baidu.com/demo.html#scatter-large
    static func scatterLargeOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 各国人均寿命与GDP关系演变
    /// 地址: http://echarts.baidu.com/demo.html#scatter-life-expectancy-timeline
    static func scatterLifeExpectancyTimelineOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Scatter Map Brush
    /// 地址: http://echarts.baidu.com/demo.html#scatter-map-brush
    static func scatterMapBrushOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 全国主要城市空气质量
    /// 地址: http://echarts.baidu.com/demo.html#scatter-map
    static func scatterMapOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }

    // MARK: Scatter Nutrients
    /// 地址: http://echarts.baidu.com/demo.html#scatter-nutrients
    static func scatterNutrientsOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Master Painter Color Choices Throughout History
    /// 地址: http://echarts.baidu.com/demo.html#scatter-painter-choice
    static func scatterPainterChoiceOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Punch Card of Github
    /// 地址: http://echarts.baidu.com/demo.html#scatter-polar-punchCard
    static func scatterPolarPunchCardOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Punch Card of Github
    /// 地址: http://echarts.baidu.com/demo.html#scatter-punchCard
    static func scatterPunchCardOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 单轴散点图
    /// 地址: http://echarts.baidu.com/demo.html#scatter-single-axis
    static func scatterSingleAxisOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 微博签到数据点亮中国
    /// 地址: http://echarts.baidu.com/demo.html#scatter-weibo
    static func scatterWeiboOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 男性女性身高体重分布
    /// 地址: http://echarts.baidu.com/demo.html#scatter-weight
    static func scatterWeightOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: World Population (2010)
    /// 地址: http://echarts.baidu.com/demo.html#scatter-world-population
    static func scatterWorldPopulationOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }

}
