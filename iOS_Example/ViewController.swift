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
        let option = SECOption([
            .title(SECTitle([
                .text("对数轴示例"),
                .left(.center)
                ])),
            .tooltip(SECTooltip([
                .trigger(.item),
                .formatter(.string("{a} <br/>{b} : {c}"))
                ])),
            .legend(SECLegend([
                .left(.left),
                .datas(["2的指数", "3的指数"])
                ])),
            .xAxis(SECAxis([
                .type(.category),
                .name("x"),
                .splitArea(SECSplitArea([
                    .show(false)
                    ])),
                .data(["一", "二", "三", "四", "五", "六", "七", "八", "九"])
                ])),
            .grid(SECGrid([
                .left(.percent(3)),
                .right(.percent(4)),
                .bottom(.percent(3)),
                .containLabel(true)
                ])),
            .yAxis(SECAxis([
                .type(.log),
                .name("y")
                ])),
            .series([
                SECLineSeries([
                    .name("3的指数"),
                    .data([1, 3, 9, 27, 81, 247, 741, 2223, 6669])
                    ]),
                SECLineSeries([
                    .name("2的指数"),
                    .data([1, 2, 4, 8, 16, 32, 64, 128, 256])
                    ]),
                SECLineSeries([
                    .name("1/2的指数"),
                    .data([1, 0.5, 0.25, 0.125, 0.0625, 0.03125, 0.015625, 0.0078125, 0.00390625])
                    ])
                ])
            ])
        
        echartsView?.option = option;
        echartsView?.loadEcharts()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    

}

