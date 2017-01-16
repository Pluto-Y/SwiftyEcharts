// 
//  ViewController.swift
//  iOS_Example
//
//  Created by Pluto Y on 25/11/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//

import UIKit
import SwiftyEcharts

class ViewController: UIViewController {

    var echartsView: SECEchartsView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        echartsView = SECEchartsView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 300))
        self.view.addSubview(echartsView!)
        
        SECMap.ignoreNil = true
        
        echartsView?.option = SECLineOptions.logAxisOption()
        echartsView?.loadEcharts()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    

}

