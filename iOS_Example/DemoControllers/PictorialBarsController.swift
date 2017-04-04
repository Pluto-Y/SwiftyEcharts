//
//  PictorialBarsController.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 04/04/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import UIKit
import SwiftyEcharts

class PictorialBarsController: BaseDemoController {
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus = ["圣诞节儿童愿望清单和山峰高度", "驯鹿的速度", "交通工具", "精灵", "人体含水量(暂缺)", "虚线柱状图效果(暂缺)", "森林的增长(暂缺)"]
        
        optionClosures = [PictoriaBarOptions.pictorialBarHillOption, PictoriaBarOptions.pictorialBarVelocityOption, PictoriaBarOptions.pictorialBarVehicleOption, PictoriaBarOptions.pictorialBarSpiritOption, PictoriaBarOptions.pictorialBarBodyFillOption, PictoriaBarOptions.pictorialBarDottedOption, PictoriaBarOptions.pictorialBarForestOption]
        
        self.title = "折线图"
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
        if indexPath.row == 3 { // 精灵
            
            timer = Timer(timeInterval: 3, target: self, selector: #selector(self.pictorialBarSpirit), userInfo: nil, repeats: true)
            RunLoop.current.add(timer!, forMode: .commonModes)
            
        }
    }
    
    func pictorialBarSpirit() {
        let random = {
            return Float(Float(arc4random_uniform(1000))/1000.0) * 1990 as! Jsonable
        }
        let dynamicData = [random(), random(), random(), random()]
        var tmpOption = self.option
        var tmpSeries: [PictorialBarSerie] = []
        for serie in (tmpOption!.series!) {
            var tmpSerie = serie as! PictorialBarSerie
            tmpSerie.data = dynamicData
            tmpSeries.append(tmpSerie)
        }
        tmpOption?.series = tmpSeries.map { $0 as! Serie }
        self.echartsView.refreshEcharts(tmpOption!)
        
    }
    
}
