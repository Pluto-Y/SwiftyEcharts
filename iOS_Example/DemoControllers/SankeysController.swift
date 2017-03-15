//
//  SankeysController.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 14/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import UIKit

class SankeysController: BaseDemoController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus = ["Sankey Diagram", "Sankey Diagram"]
        
        optionClosures = [SECSankeyOptions.sankeyEnergyOption, SECSankeyOptions.sankeyProductOption]
        
        self.title = "桑基图"
        
    }

}
