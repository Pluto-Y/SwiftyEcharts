//
//  SECLineSeries.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 03/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 折线/面积图
/// 折线图是用折线将各个数据点标志连接起来的图表，用于展现数据的变化趋势。可用于直角坐标系和极坐标系上。
///
/// - Note: 设置 areaStyle 后可以绘制面积图。
/// - Note: 配合分段型 visualMap 组件可以将折线/面积图通过不同颜色分区间。如下示例
public struct SECLineSeries: SECSeries {
    
}

extension SECSeries {
    public var type: String {
        return "line"
    }
}

