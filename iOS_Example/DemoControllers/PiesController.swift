//
//  PiesControllerViewController.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 25/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import UIKit

class PiesController: BaseDemoController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus = ["Customized Pie", "环形图", "嵌套环形图", "饼图纹理", "某站点用户访问来源", "南丁格尔玫瑰图"]
        
        optionClosures = [SECPieOptions.pieCustomOption, SECPieOptions.pieDoughnutOption, SECPieOptions.pieNestOption, SECPieOptions.piePatternOption, SECPieOptions.pieSimpleOption, SECPieOptions.pieRoseTypeOption]

        self.title = "饼图"
    }
    
}
