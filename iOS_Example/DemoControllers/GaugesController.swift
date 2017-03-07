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
        
        self.menus = ["Gauge Car Dark(暂缺)", "Gauge Car(暂缺)", "Gauge"]
        
        self.optionClosures = [SECGaugeOptions.gaugeCarDarkOption, SECGaugeOptions.gaugeCarOption, SECGaugeOptions.gaugeOption]
        
        self.title = "仪表盘"
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        super.tableView(tableView, didSelectRowAtIndexPath: indexPath)
        
        switch indexPath.row {
        case 0:
            print("")
        case 1:
            print("")
        case 2:
            timer = NSTimer(timeInterval: 2, target: self, selector: #selector(self.randomForGauge), userInfo: nil, repeats: true)
        default:
            print("错误输入")
        }
        NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
    }
    
    func randomForGauge() {
        var option = self.option
        let data: [String: SECJsonable] = ["value": Double(arc4random_uniform(100) + 1), "name": "完成率"]
        var serie = option.series![0] as! SECGaugeSerie
        serie.data = [data]
        option.series = [serie]
        self.echartsView.setOption(option)
    }
    
}
