//
//  GaugesController.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 07/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import UIKit
import SwiftyEcharts

class GaugesController: BaseDemoController {
    
    private var timer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menus = ["Gauge Car Dark(暂缺)", "Gauge Car", "Gauge"]
        
        self.optionClosures = [SECGaugeOptions.gaugeCarDarkOption, SECGaugeOptions.gaugeCarOption, SECGaugeOptions.gaugeOption]
        
        self.title = "仪表盘"
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        super.tableView(tableView, didSelectRowAtIndexPath: indexPath)
        
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
        
        switch indexPath.row {
        case 0:
            print("")
        case 1:
            timer = NSTimer(timeInterval: 2, target: self, selector: #selector(self.randomForGaugeCar), userInfo: nil, repeats: true)
        case 2:
            timer = NSTimer(timeInterval: 2, target: self, selector: #selector(self.randomForGauge), userInfo: nil, repeats: true)
        default:
            print("错误输入")
        }
        if let t = timer {
            NSRunLoop.currentRunLoop().addTimer(t, forMode: NSRunLoopCommonModes)
        }
    }
    
    func randomForGauge() {
        var option = self.option
        let data: [String: Jsonable] = ["value": Double(arc4random_uniform(100) + 1), "name": "完成率"]
        var serie = option.series![0] as! SECGaugeSerie
        serie.data = [data]
        option.series = [serie]
        self.echartsView.refreshEcharts(option)
    }
    
    func randomForGaugeCar() {
        var option = self.option
        let data1: [String: Jsonable] = ["value": Double(arc4random_uniform(100) + 1), "name": "km/h"]
        var serie1 = option.series![0] as! SECGaugeSerie
        serie1.data = [data1]
        let data2: [String: Jsonable] = ["value": Double(arc4random_uniform(7) + 1), "name": "x1000 r/min"]
        var serie2 = option.series![1] as! SECGaugeSerie
        serie2.data = [data2]
        let data3: [String: Jsonable] = ["value": Double(arc4random_uniform(2) + 1), "name": "gas"]
        var serie3 = option.series![2] as! SECGaugeSerie
        serie3.data = [data3]
        let data4: [String: Jsonable] = ["value": Double(arc4random_uniform(2) + 1), "name": "gas"]
        var serie4 = option.series![3] as! SECGaugeSerie
        serie4.data = [data4]

        option.series = [serie1, serie2, serie3, serie4]
        self.echartsView.refreshEcharts(option)
    }
    
}
