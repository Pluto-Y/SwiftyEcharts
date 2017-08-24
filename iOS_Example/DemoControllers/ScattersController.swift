//
//  ScattersController.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 23/05/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import UIKit

class ScattersController: BaseDemoController {

    override func viewDidLoad() {
        super.viewDidLoad()

        menus = ["气泡图", "全国主要城市空气质量 - 百度地图(暂缺)", "全国主要城市空气质量", "Prices and Earnings 2012(暂缺)", "Anscombe's quartet", "Scatter Aqi Color", "大规模散点图(暂缺)", "各国人均寿命与GDP关系演变(暂缺)", "Scatter Map Brush(暂缺)", "全国主要城市空气质量", "Scatter Nutrients(暂缺)", "Master Painter Color Choices Throughout History(暂缺)", "Punch Card of Github", "Punch Card of Github", "单轴散点图(暂缺)", "微博签到数据点亮中国(暂缺)", "男性女性身高体重分布", "World Population (2010)(暂缺)", "Scatter Nutrients Matrix(暂缺)", "Clustering Process(暂缺)", "Linear Regression(暂缺)", "Exponential Regression(暂缺)", "Logarithmic Regression(暂缺)", "Polynomial Regression(暂缺)", "Calendar Effectscatter(暂缺)"]
        
        optionClosures = [ScatterOptions.bubbleGradientOption, ScatterOptions.effectScatterBmapOption, ScatterOptions.effectScatterMapOption, ScatterOptions.mapParallelPricesOption, ScatterOptions.scatterAnscombeQuartetOption, ScatterOptions.scatterAqiColorOption, ScatterOptions.scatterLargeOption, ScatterOptions.scatterLifeExpectancyTimelineOption, ScatterOptions.scatterMapBrushOption, ScatterOptions.scatterMapOption, ScatterOptions.scatterNutrientsOption, ScatterOptions.scatterPainterChoiceOption, ScatterOptions.scatterPolarPunchCardOption, ScatterOptions.scatterPunchCardOption, ScatterOptions.scatterSingleAxisOption, ScatterOptions.scatterWeiboOption, ScatterOptions.scatterWeightOption, ScatterOptions.scatterWorldPopulationOption, ScatterOptions.scatterNutrientsMatrixOption, ScatterOptions.scatterClusteringProcessOption, ScatterOptions.scatterLinearRegressionOption, ScatterOptions.scatterExponentialRegressionOption, ScatterOptions.scatterLogarithmicRegressionOption, ScatterOptions.scatterPolynomialRegressionOption, ScatterOptions.calendarEffectscatterOption]
        
        self.title = "散点图"
    }

}
