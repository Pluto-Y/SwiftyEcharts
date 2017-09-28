//
//  CandlesticksController.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 13/09/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import UIKit

class CandlesticksController: BaseDemoController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menus = ["Candlestick Brush(暂缺)", "2015 年上证指数", "上证指数", "触屏上的坐标轴指示器", "OHLC Chart"]
        
        self.optionClosures = [CandlestickOptions.candlestickBrushOption, CandlestickOptions.candlestickSh2015Option, CandlestickOptions.candlestickShOption, CandlestickOptions.candlestickTouchOption, CandlestickOptions.customOhlcOption]
        
        self.title = "k线图"
    }

}
