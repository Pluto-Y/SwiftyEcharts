//
//  SECOption.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 09/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Foundation

public struct SECOption {
    public var title: SECTitle?
    public var tooltip: SECTooltip?
    public var legend: SECLegend?
    public var xAxis: SECAxis?
    public var yAxis: SECAxis?
    public var grid: SECGrid?
    public var series: [SECLineSeries]?
    
}

extension SECOption: SECMappable {
    public func mapping(map: SECMap) {
        map["title"] = title
        map["tooltip"] = tooltip
        map["legend"] = legend
        map["xAxis"] = xAxis
        map["yAxis"] = yAxis
        map["grid"] = grid
        map["series"] = series
    }
}
