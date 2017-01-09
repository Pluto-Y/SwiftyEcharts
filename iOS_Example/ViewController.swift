
//  ViewController.swift
//  iOS_Example
//
//  Created by Pluto Y on 25/11/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//

import UIKit
import SwiftyEcharts

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SECMap.ignoreNil = true
        let title = SECTitle()
        print(title.jsonString)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

