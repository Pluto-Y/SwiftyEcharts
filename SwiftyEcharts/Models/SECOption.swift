//
//  SECOption.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 09/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECOption {
    public var title: SECTitle?
    public var legend: SECLegend?
    public var grid: SECGrid?
    public var xAxis: [SECAxis]?
    public var yAxis: [SECAxis]?
    public var tooltip: SECTooltip?
    public var series: [SECSeries]?
    
    public init() { }
}

extension SECOption : SECEnumable {
    
    public enum Enums {
        case title(SECTitle), legend(SECLegend), grid(SECGrid), xAxis([SECAxis]), yAxis([SECAxis]), tooltip(SECTooltip), series([SECSeries])
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .title(title):
                self.title = title
            case let .legend(legend):
                self.legend = legend
            case let .grid(grid):
                self.grid = grid
            case let .xAxis(xAxis):
                self.xAxis = xAxis
            case let .yAxis(yAxis):
                self.yAxis = yAxis
            case let .tooltip(tooltip):
                self.tooltip = tooltip
            case let .series(series):
                self.series = series
            }
        }
    }
}

extension SECOption : SECMappable {
    public func mapping(map: SECMap) {
        map["title"] = title
        map["legend"] = legend
        map["grid"] = grid
        map["xAxis"] = xAxis
        map["yAxis"] = yAxis
        map["tooltip"] = tooltip
        map["series"] = series
    }
}
