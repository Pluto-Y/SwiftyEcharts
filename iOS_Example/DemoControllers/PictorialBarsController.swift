//
//  PictorialBarsController.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 04/04/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

class PictorialBarsController: BaseDemoController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus = ["圣诞节儿童愿望清单和山峰高度", "驯鹿的速度", "交通工具(暂缺)", "精灵(暂缺)", "人体含水量(暂缺)", "虚线柱状图效果(暂缺)", "森林的增长(暂缺)"]
        
        optionClosures = [PictoriaBarOptions.pictorialBarHillOption, PictoriaBarOptions.pictorialBarVelocityOption, PictoriaBarOptions.pictorialBarVehicleOption, PictoriaBarOptions.pictorialBarSpiritOption, PictoriaBarOptions.pictorialBarBodyFillOption, PictoriaBarOptions.pictorialBarDottedOption, PictoriaBarOptions.pictorialBarForestOption]
        
        self.title = "折线图"
        
    }
    
}
