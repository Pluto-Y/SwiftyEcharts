//
//  ViewController.swift
//  OSX_Example
//
//  Created by Pluto Y on 02/11/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Cocoa
import SwiftyEcharts

class EchartsViewController: NSViewController {

    private var echartsView: EchartsView?
    override func viewDidLoad() {
        print("viewDidLoad")
        super.viewDidLoad()

        echartsView = EchartsView(frame: CGRect(x: 0, y: 30, width: 300, height: 300))
        self.view.addSubview(echartsView!)
        let leadingConstraint = NSLayoutConstraint(item: echartsView!,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self.view,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: echartsView!,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: self.view,
                                                    attribute: .trailing,
                                                    multiplier: 1.0,
                                                    constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: echartsView!,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: self.view,
                                                  attribute: .bottom,
                                                  multiplier: 1.0,
                                                  constant: 0)
        let topConstraint = NSLayoutConstraint(item: echartsView!,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: self.view,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: 30)
//        self.view.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
        print("loadEcharts")
        let option = LineOptions.areaStackOption()
        echartsView?.option = option
        echartsView?.loadEcharts()
        print("loadEcharts finished")
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

