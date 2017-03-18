//
//  ThemeRiversController.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 13/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import UIKit
import SwiftyEcharts

class ThemeRiversController: BaseDemoController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus = ["主题河流图", "ThemeRiver Lastfm"]
        
        optionClosures = [ThemeRiverOptions.themeRiverBasicOption, ThemeRiverOptions.themeRiverLastfmOption]
        
        self.title = "主题河流图"
        
    }
}
