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
    
    private var timer: NSTimer?
    private var dynamicCount = 11
    private var newOptionForDynamicData = SECOption()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus = ["柱状图动画延迟", "柱状图框选", "特性示例：渐变色 阴影 点击缩放", "正负条形图", "交错正负轴标签", "堆叠柱状图", "坐标轴刻度与标签对齐", "深圳月最低生活费组成（单位:元）", "阶梯瀑布图", "堆叠条形图", "世界人口总量 - 条形图", "某地区蒸发量和降水量", "动态数据", "折柱混合", "全国宏观经济(暂缺)", "Budge(暂缺)", "多 Y 轴示例", "水印 - ECharts 下载统计(暂缺)"]
        
       optionClosures = [SECBarOptions.barAnimationDelayOption, SECBarOptions.barBrushOption, SECBarOptions.barGradientOption, SECBarOptions.barNegativeOption, SECBarOptions.barNegative2Option, SECBarOptions.barStackOption, SECBarOptions.barTickAlignOption, SECBarOptions.barWaterfallOption, SECBarOptions.barWaterfall2Option, SECBarOptions.barYCategoryStackOption, SECBarOptions.barYCategoryOption, SECBarOptions.bar1Option, SECBarOptions.dynamicDataOption, SECBarOptions.mixLineBarOption, SECBarOptions.mixTimelineFinanceOption, SECBarOptions.mixZoomOnValueOption, SECBarOptions.multipleYAxisOption, SECBarOptions.watermarkOption]
        
        self.title = "柱状图"
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        super.tableView(tableView, didSelectRowAtIndexPath: indexPath)
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
        if menus[indexPath.row] == "动态数据" {
            dynamicCount = 11
            newOptionForDynamicData = self.option
            timer = NSTimer(timeInterval: 2.1, target: self, selector: #selector(self.dynamicData), userInfo: nil, repeats: true)
        }
        if timer != nil {
            NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
        }
    }
    
    func dynamicData() {
        var serie0 = newOptionForDynamicData.series![0] as! SECBarSerie
        var serie1 = newOptionForDynamicData.series![1] as! SECLineSerie
        var data0 = serie0.data
        var data1 = serie1.data
        data0?.removeFirst()
        data1?.removeFirst()
        data0?.append(arc4random_uniform(1000) + 1)
        data1?.append(Double(arc4random_uniform(100) + 1) / 10.0 + 5)
        serie0.data = data0
        serie1.data = data1
        newOptionForDynamicData.series = [serie0, serie1]
        var xAxis0 = newOptionForDynamicData.xAxis![0]
        var xAxis1 = newOptionForDynamicData.xAxis![1]
        
        let date = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss a"
        xAxis0?.data?.removeFirst()
        xAxis0?.data?.append(dateFormatter.stringFromDate(date))
        xAxis1?.data?.removeFirst()
        xAxis1?.data?.append(dynamicCount++)
        
        newOptionForDynamicData.xAxis = [xAxis0!, xAxis1!]
        echartsView.refreshEcharts(newOptionForDynamicData)
    }
}
