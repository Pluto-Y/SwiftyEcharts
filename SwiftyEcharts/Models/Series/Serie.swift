//
//  Serie.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 03/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 图表类型
///
/// - line: 折线/面积图
/// - bar: 柱状/条形图
/// - pie: 饼图
/// - scatter: 散点（气泡）图
/// - effectScatter: 带有涟漪特效动画的散点（气泡）图
/// - radar: 雷达图
/// - treemap: 常见的表达『层级数据』『树状数据』的可视化形式
/// - boxplot: 『箱形图』、『盒须图』、『盒式图』、『盒状图』、『箱线图』
/// - candlestick: K线图
/// - heatmap: 热力图
/// - map: 地图
/// - parallel: 平行坐标系
/// - lines: 线图
/// - graph: 关系图
/// - sankey: 桑基图
/// - funnel: 漏斗图
/// - gauge: 仪表盘
/// - pictorialBar: 象形柱图
/// - themeRiver: 主题河流
public enum SerieType: String, Jsonable {
    case line = "line"
    case bar = "bar"
    case pie = "pie"
    case scatter = "scatter"
    case effectScatter = "effectScatter"
    case radar = "radar"
    case treemap = "treemap"
    case boxplot = "boxplot"
    case candlestick = "candlestick"
    case heatmap = "heatmap"
    case map = "map"
    case parallel = "parallel"
    case lines = "lines"
    case graph = "graph"
    case sankey = "sankey"
    case funnel = "funnel"
    case gauge = "gauge"
    case pictorialBar = "pictorialBar"
    case themeRiver = "themeRiver"
    case custom = "custom"
    
    public var jsonString: String {
        return self.rawValue.jsonString
    }
}

public protocol Serie {
    
    /// 系列列表。每个系列通过 type 决定自己的图表类型
    var type: SerieType { get }
}
