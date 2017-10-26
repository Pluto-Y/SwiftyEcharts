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
        menus = ["Les Miserables(暂缺)", "力引导布局(暂缺)", "力引导布局(暂缺)", "笛卡尔坐标系上的 Graph(暂缺)", "Graph Life Expectancy(暂缺)", "NPM Dependencies(暂缺)", "Graph 简单示例(暂缺)", "Graph Webkit Dep(暂缺)", "Les Miserables(暂缺)"]
        
        optionClosures = [GraphOptions.graphCircularLayoutOption, GraphOptions.graphForceOption, GraphOptions.graphForce2Option, GraphOptions.graphGridOption, GraphOptions.graphLifeExpectancyOption, GraphOptions.graphNpmOption, GraphOptions.graphSimpleOption, GraphOptions.graphWebkitDepOption, GraphOptions.graphOption]
        
        self.title = "关系图"
    }
    
}