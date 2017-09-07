//
//  BoxplotsControllers.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 08/09/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import UIKit

class BoxplotsControllers: BaseDemoController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menus = ["Boxplot Light Velocity", "Boxplot Light Velocity2", "Multiple Categories"]
        
        self.optionClosures = [BoxplotOptions.boxplotLightVelocityOption, BoxplotOptions.boxplotLightVelocity2Option, BoxplotOptions.boxplotMultiOption]
        
        self.title = "箱线图"
    }

}
