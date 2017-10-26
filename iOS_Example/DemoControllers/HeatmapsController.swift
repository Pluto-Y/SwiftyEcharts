//
//  HeatmapsController.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 23/10/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import UIKit

class HeatmapsController: BaseDemoController {

    override func viewDidLoad() {
        super.viewDidLoad()

        menus = ["热力图与百度地图扩展(暂缺)", "笛卡尔坐标系上的热力图", "热力图 - 颜色的离散映射(暂缺)", "热力图 - 2w 数据(暂缺)", "Calendar Heatmap Vertical", "Calendar Heatmap Horizontal"]
        optionClosures = [HeatmapOptions.heatmapBmapOption, HeatmapOptions.heatmapCartesianOption, HeatmapOptions.heatmapLargePiecewiseOption, HeatmapOptions.heatmapLargeOption, HeatmapOptions.calendarVerticalOption, HeatmapOptions.calendarHorizontalOption]
        
        self.title = "热力图"
    }


}
