//
//  BarsViewController.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 25/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import UIKit
import SwiftyEcharts

class BarsController: BaseDemoController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus = ["柱状图动画延迟", "柱状图框选(暂缺)", "特性示例：渐变色 阴影 点击缩放(暂缺)", "正负条形图", "交错正负轴标签", "堆叠柱状图", "坐标轴刻度与标签对齐", "深圳月最低生活费组成（单位:元）", "阶梯瀑布图", "堆叠条形图", "世界人口总量 - 条形图", "某地区蒸发量和降水量", "动态数据(暂缺)", "折柱混合", "全国宏观经济(暂缺)", "Budge(暂缺)", "多 Y 轴示例", "水印 - ECharts 下载统计(暂缺)"]
        
       optionClosures = [SECBarOptions.barAnimationDelayOption, SECBarOptions.barBrushOption, SECBarOptions.barGradientOption, SECBarOptions.barNegativeOption, SECBarOptions.barNegative2Option, SECBarOptions.barStackOption, SECBarOptions.barTickAlignOption, SECBarOptions.barWaterfallOption, SECBarOptions.barWaterfall2Option, SECBarOptions.barYCategoryStackOption, SECBarOptions.barYCategoryOption, SECBarOptions.bar1Option, SECBarOptions.dynamicDataOption, SECBarOptions.mixLineBarOption, SECBarOptions.mixTimelineFinanceOption, SECBarOptions.mixZoomOnValueOption, SECBarOptions.multipleYAxisOption, SECBarOptions.watermarkOption]
        
        self.title = "柱状图"
    }
}
