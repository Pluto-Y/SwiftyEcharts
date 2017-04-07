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
    
    var timer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus = ["圣诞节儿童愿望清单和山峰高度", "驯鹿的速度", "交通工具", "精灵", "人体含水量", "虚线柱状图效果", "森林的增长(暂缺)"]
        
        optionClosures = [PictoriaBarOptions.pictorialBarHillOption, PictoriaBarOptions.pictorialBarVelocityOption, PictoriaBarOptions.pictorialBarVehicleOption, PictoriaBarOptions.pictorialBarSpiritOption, PictoriaBarOptions.pictorialBarBodyFillOption, PictoriaBarOptions.pictorialBarDottedOption, PictoriaBarOptions.pictorialBarForestOption]
        
        self.title = "折线图"
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        super.tableView(tableView, didSelectRowAtIndexPath: indexPath)
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
        if indexPath.row == 3 { // 精灵
            timer = NSTimer(timeInterval: 3, target: self, selector: #selector(self.pictorialBarSpirit), userInfo: nil, repeats: true)
            NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
        } else if indexPath.row == optionClosures.count - 1 { // 森林的增长
            timer = NSTimer(timeInterval: 0.8, target: self, selector: #selector(self.pictorialBarForest), userInfo: nil, repeats: true)
            NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
        }
    }
    
    func pictorialBarSpirit() {
        let random = {
            return Float(Float(arc4random_uniform(1000))/1000.0) * 1990 as! Jsonable
        }
        let dynamicData = [random(), random(), random(), random()]
        var tmpOption = self.option
        var tmpSeries: [PictorialBarSerie] = []
        for serie in tmpOption.series! {
            var tmpSerie = serie as! PictorialBarSerie
            tmpSerie.data = dynamicData
            tmpSeries.append(tmpSerie)
        }
        tmpOption.series = tmpSeries.map { $0 as! Serie }
        self.echartsView.refreshEcharts(tmpOption)
        
    }
    
    var currentYear = PictoriaBarOptions.beginYear
    func pictorialBarForest() {
        currentYear += 1
        if currentYear > PictoriaBarOptions.endYear {
            currentYear = PictoriaBarOptions.beginYear
        }
        
        self.echartsView.refreshEcharts(Option(
            .xAxis(Axis(
                .name("\(currentYear)")
                )),
            .series([
                PictorialBarSerie(
                    .data(PictoriaBarOptions.makeSeriesData(currentYear))
                ),
                PictorialBarSerie(
                    .data(PictoriaBarOptions.makeSeriesData(currentYear, true))
                )
                ])
        ))
    }
    
}
