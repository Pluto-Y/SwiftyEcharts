//
//  RadarsController.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 28/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import UIKit

class RadarsController: BaseDemoController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.menus = ["AQI - 雷达图", "自定义雷达图", "多雷达图", "基础雷达图", "浏览器占比变化"]
        
        self.optionClosures = [SECRadarOptions.radarAqiOption, SECRadarOptions.radarCustomOption, SECRadarOptions.radarMultipleOption, SECRadarOptions.radarOption, SECRadarOptions.radar2Option]
        
        self.title = "雷达图"
    }

}
