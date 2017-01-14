
//  ViewController.swift
//  iOS_Example
//
//  Created by Pluto Y on 25/11/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//

import UIKit
import SwiftyEcharts

class ViewController: UIViewController {

    var echartsView: SECEchartsView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        echartsView = SECEchartsView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 300))
        self.view.addSubview(echartsView!)
        
        SECMap.ignoreNil = true
        var option = SECOption()
        
        var title = SECTitle()
        title.text = "对数轴示例"
        title.left = .center
        option.title = title
        
        var tooltip = SECTooltip()
        tooltip.trigger = .item
        //.string("{a} <br/>{b} : {c}")
        tooltip.formatter = .function("function test(params, ticket, callback) {return '[' + params.value + ']'; }")
        option.tooltip = tooltip
        
        var legend = SECLegend()
        legend.left = .left
        legend.datas = ["2的指数", "3的指数"]
        option.legend = legend
        
        var xAxis = SECAxis()
        xAxis.type = .category
        xAxis.name = "x"
        xAxis.splitLine = SECSplitLine()
        xAxis.splitLine?.show = false
        xAxis.data = ["一", "二", "三", "四", "五", "六", "七", "八", "九"]
        option.xAxis = xAxis
        
        var  grid = SECGrid()
        grid.left = .percent(3)
        grid.right = .percent(4)
        grid.bottom = .percent(3)
        grid.containLabel = true
        option.grid = grid
        
        var yAxis = SECAxis()
        yAxis.type = .log
        yAxis.name = "y"
        option.yAxis = yAxis
        
        var serie1 = SECLineSeries()
        serie1.name = "3的指数"
        serie1.data = [1, 3, 9, 27, 81, 247, 741, 2223, 6669]
        var serie2 = SECLineSeries()
        serie2.name = "2的指数"
        serie2.data = [1, 2, 4, 8, 16, 32, 64, 128, 256]
        var serie3 = SECLineSeries()
        serie3.name = "1/2的指数"
        serie3.data = [1, 1/2.0, 1/4.0, 1/8.0, 1/16.0, 1/32.0, 1/64.0, 1/128.0, 1/256.0]
        let series: [SECSeries]? = [serie1, serie2, serie3]
        option.series = series
        
//        print(option.jsonString)
        echartsView?.option = option;
        echartsView?.loadEcharts()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    

}

