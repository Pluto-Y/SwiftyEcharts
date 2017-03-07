//
//  GaugesController.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 07/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import UIKit

class GaugesController: BaseDemoController {
    
    private var timer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menus = ["Gauge Car Dark(暂缺)", "Gauge Car(暂缺)", "Gauge(暂缺)"]
        
        self.optionClosures = [SECGaugeOptions.gaugeCarDarkOption, SECGaugeOptions.gaugeCarOption, SECGaugeOptions.gaugeOption]
        
        self.title = "仪表盘"
    }
    
    
}
