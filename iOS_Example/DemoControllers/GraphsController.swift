//
//  GraphsController.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 26/10/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import UIKit

class GraphsController: BaseDemoController {

    override func viewDidLoad() {
        super.viewDidLoad()
        menus = ["Les Miserables(暂缺)", "力引导布局(暂缺)", "力引导布局", "笛卡尔坐标系上的 Graph", "Graph Life Expectancy(暂缺)", "NPM Dependencies", "Graph 简单示例", "Graph Webkit Dep", "Les Miserables(暂缺)", "Calendar Graph"]
        
        optionClosures = [GraphOptions.graphCircularLayoutOption, GraphOptions.graphForceOption, GraphOptions.graphForce2Option, GraphOptions.graphGridOption, GraphOptions.graphLifeExpectancyOption, GraphOptions.graphNpmOption, GraphOptions.graphSimpleOption, GraphOptions.graphWebkitDepOption, GraphOptions.graphOption, GraphOptions.calendarGraphOption]
        
        self.title = "关系图"
    }
    
}
