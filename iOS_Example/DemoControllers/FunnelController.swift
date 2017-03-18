//
//  FunnelController.swift
//  SwiftyEcharts
//
//  Created by 李岳敏 on 2017/3/7.
//  Copyright © 2017年 com.pluto-y. All rights reserved.
//

import UIKit
import SwiftyEcharts

class FunnelController: BaseDemoController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.menus = ["漏斗图（对比）", "漏斗图", "漏斗图", "漏斗图"]
        
        self.optionClosures = [FunnelOptions.unnelAlignOption, FunnelOptions.funnelCustomizeOption, FunnelOptions.funnelMutipleOption, FunnelOptions.funnelOption]
        
        self.title = "漏斗图"
    }

}
