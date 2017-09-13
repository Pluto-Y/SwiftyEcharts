//
//  CandlestickOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public final class CandlestickOptions {
    
    // MARK: Candlestick Brush
    /// 地址: http://echarts.baidu.com/demo.html#candlestick-brush
    static func candlestickBrushOption() -> Option {
        let splitData: [[Float]] -> [String: [Jsonable]] = { rowData in
            var categoryData: [Float] = []
            var values: [[Float]] = []
            for i in 0..<rowData.count {
                var d = rowData[i]
                categoryData.append(d[0])
                d[0] = Float(i)
                values.append(d)
            }
            return [
                "categoryData": categoryData,
                "values": values
            ]
        }
        
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 2015 年上证指数
    /// 地址: http://echarts.baidu.com/demo.html#candlestick-sh-2015
    static func candlestickSh2015Option() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 上证指数
    /// 地址: http://echarts.baidu.com/demo.html#candlestick-sh
    static func candlestickShOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 触屏上的坐标轴指示器
    /// 地址: http://echarts.baidu.com/demo.html#candlestick-touch
    static func candlestickTouchOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: OHLC Chart
    /// 地址: http://echarts.baidu.com/demo.html#custom-ohlc
    static func customOhlcOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
}
