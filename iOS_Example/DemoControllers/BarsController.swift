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
        self.title = "柱状图"
    }
    
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0: // 柱状图动画延迟
            option = SECBarOptions.barAnimationDelayOption()
        case 1: // 柱状图框选
            option = SECBarOptions.barBrushOption()
        case 2: // 特性示例：渐变色 阴影 点击缩放
            option = SECBarOptions.barGradientOption()
        case 3: // 正负条形图
            option = SECBarOptions.barNegativeOption()
        case 4: // 交错正负轴标签
            option = SECBarOptions.barNegative2Option()
        case 5: // 堆叠柱状图
            option = SECBarOptions.barStackOption()
        case 6: // 坐标轴刻度与标签对齐
            option = SECBarOptions.barTickAlignOption()
        case 7: // 深圳月最低生活费组成（单位:元）
            option = SECBarOptions.barWaterfallOption()
        case 8: // 阶梯瀑布图
            option = SECBarOptions.barWaterfall2Option()
        case 9: // 堆叠条形图
            option = SECBarOptions.barYCategoryStackOption()
        case 10: // 世界人口总量 - 条形图
            option = SECBarOptions.barYCategory()
        case 11: // 某地区蒸发量和降水量
            option = SECBarOptions.bar1Option()
        case 12: // 动态数据
            option = SECBarOptions.dynamicDataOption()
        case 13: // 折柱混合
            option = SECBarOptions.mixLineBarOption()
        case 14: // 全国宏观经济
            option = SECBarOptions.mixTimelineFinanceOption()
        case 15: // Budge
            option = SECBarOptions.mixZoomOnValueOption()
        case 16: // 多 Y 轴示例
            option = SECBarOptions.multipleYAxisOption()
        case 17: // 水印 - ECharts 下载统计
            option = SECBarOptions.watermarkOption()
        default:
            option = SECOption()
        }
    }

}
