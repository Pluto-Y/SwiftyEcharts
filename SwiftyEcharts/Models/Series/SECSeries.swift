//
//  SECSeries.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 03/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//


public enum SECSerieType: String {
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
}

public protocol SECSeries: CustomStringConvertible {
    
    /// 系列列表。每个系列通过 type 决定自己的图表类型
    var type: String { get }
}

extension SECSeries {
    public var description: String {
        return ""
    }
}
