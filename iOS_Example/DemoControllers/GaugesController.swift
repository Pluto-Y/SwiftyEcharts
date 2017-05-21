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
    
    fileprivate var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menus = ["Gauge Car Dark(暂缺)", "Gauge Car", "Gauge"]
        
        self.optionClosures = [GaugeOptions.gaugeCarDarkOption, GaugeOptions.gaugeCarOption, GaugeOptions.gaugeOption]
        
        self.title = "仪表盘"
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if timer != nil {
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
        
        switch indexPath.row {
        case 0:
            print("")
        case 1:
            timer = Timer(timeInterval: 2, target: self, selector: #selector(self.randomForGaugeCar), userInfo: nil, repeats: true)
        case 2:
            timer = Timer(timeInterval: 2, target: self, selector: #selector(self.randomForGauge), userInfo: nil, repeats: true)
        default:
            print("错误输入")
        }
        if let t = timer {
            RunLoop.current.add(t, forMode: RunLoopMode.commonModes)
        }
    }
    
    func randomForGauge() {
        let option = self.option
        let data: [String: Jsonable] = ["value": Double(arc4random_uniform(100) + 1), "name": "完成率"]
        let serie = option?.series![0] as! GaugeSerie
        serie.data = [data]
        option?.series = [serie]
        self.echartsView.refreshEcharts(option!)
    }
    
    func randomForGaugeCar() {
        let option = self.option
        let data1: [String: Jsonable] = ["value": Double(arc4random_uniform(100) + 1), "name": "km/h"]
        let serie1 = option?.series![0] as! GaugeSerie
        serie1.data = [data1]
        let data2: [String: Jsonable] = ["value": Double(arc4random_uniform(7) + 1), "name": "x1000 r/min"]
        let serie2 = option?.series![1] as! GaugeSerie
        serie2.data = [data2]
        let data3: [String: Jsonable] = ["value": Double(arc4random_uniform(2) + 1), "name": "gas"]
        let serie3 = option?.series![2] as! GaugeSerie
        serie3.data = [data3]
        let data4: [String: Jsonable] = ["value": Double(arc4random_uniform(2) + 1), "name": "gas"]
        let serie4 = option?.series![3] as! GaugeSerie
        serie4.data = [data4]

        option?.series = [serie1, serie2, serie3, serie4]
        self.echartsView.refreshEcharts(option!)
    }
    
}
