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
    
    fileprivate var timer: Timer?
    fileprivate var dynamicCount = 11
    fileprivate var newOptionForDynamicData = Option()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus = ["柱状图动画延迟", "柱状图框选", "特性示例：渐变色 阴影 点击缩放", "正负条形图", "交错正负轴标签", "堆叠柱状图", "坐标轴刻度与标签对齐", "深圳月最低生活费组成（单位:元）", "阶梯瀑布图", "堆叠条形图", "世界人口总量 - 条形图", "某地区蒸发量和降水量", "Stacked Bar in Polar System", "Stacked Bar in Polar System", "在中国租个房子有多贵", "标签旋转(暂缺)", "富文本标签", "动态数据", "折柱混合", "全国宏观经济(暂缺)", "Budge", "多 Y 轴示例", "水印 - ECharts 下载统计(暂缺)", "Histogram(暂缺)"]
        
       optionClosures = [BarOptions.barAnimationDelayOption, BarOptions.barBrushOption, BarOptions.barGradientOption, BarOptions.barNegativeOption, BarOptions.barNegative2Option, BarOptions.barStackOption, BarOptions.barTickAlignOption, BarOptions.barWaterfallOption, BarOptions.barWaterfall2Option, BarOptions.barYCategoryStackOption, BarOptions.barYCategoryOption, BarOptions.bar1Option, BarOptions.barPolarStackOption, BarOptions.barPolarStackRadialOption, BarOptions.barPolarRealEstateOption, BarOptions.barLabelRotationOption, BarOptions.barRichTextOption, BarOptions.dynamicDataOption, BarOptions.mixLineBarOption, BarOptions.mixTimelineFinanceOption, BarOptions.mixZoomOnValueOption, BarOptions.multipleYAxisOption, BarOptions.watermarkOption, BarOptions.barHistogramOption]
        
        self.title = "柱状图"
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if timer != nil{
            timer?.invalidate()
            timer = nil
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
        if menus[indexPath.row] == "动态数据" {
            dynamicCount = 11
            newOptionForDynamicData = self.option
            timer = Timer(timeInterval: 2.1, target: self, selector: #selector(self.dynamicData), userInfo: nil, repeats: true)
        }
        if timer != nil {
            RunLoop.current.add(timer!, forMode: RunLoopMode.commonModes)
        }
    }
    
    func dynamicData() {
        let serie0 = newOptionForDynamicData.series![0] as! BarSerie
        let serie1 = newOptionForDynamicData.series![1] as! LineSerie
        var data0 = serie0.data
        var data1 = serie1.data
        data0?.removeFirst()
        data1?.removeFirst()
        data0?.append(arc4random_uniform(1000) + 1)
        data1?.append(Double(arc4random_uniform(100) + 1) / 10.0 + 5)
        serie0.data = data0
        serie1.data = data1
        newOptionForDynamicData.series = [serie0, serie1]
        let xAxis0 = newOptionForDynamicData.xAxis![0]
        let xAxis1 = newOptionForDynamicData.xAxis![1]
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss a"
        xAxis0?.data?.removeFirst()
        xAxis0?.data?.append(dateFormatter.string(from: date))
        xAxis1?.data?.removeFirst()
        xAxis1?.data?.append(dynamicCount)
        dynamicCount += 1
        
        newOptionForDynamicData.xAxis = [xAxis0!, xAxis1!]
        echartsView.refreshEcharts(newOptionForDynamicData)
    }
}
