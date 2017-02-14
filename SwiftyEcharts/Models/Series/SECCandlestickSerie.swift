//
//  SECCandlestickSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 14/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECCandlestickSerie : SECSeries, SECZable {
    
    public struct Data {
        public var name: String?
        public var value: [SECJsonable]?
        public var itemStyle: SECItemStyle?
        
        public init() {}
    }
    
    public var type: SECSerieType {
        return .candlestick
    }
    
    public var coordinateSystem: SECCoordinateSystem?
    public var xAxisIndex: UInt8?
    public var yAxisIndex: UInt8?
    public var name: String?
    public var legendHoverLink: Bool?
    public var hoverAnimation: Bool?
    public var layout: SECOrient?
    public var barWidth: Float?
    public var barMinWidth: Float?
    public var barMaxWidth: Float?
    public var itemStyle: SECItemStyle?
    public var data: [SECJsonable]?
    public var markPoint: SECMarkPoint?
    public var markLine: SECMarkLine?
    public var markArea: SECMarkArea?
    public var zlevel: Float?
    public var z: Float?
    public var silent: Bool?
    public var animationDuration: Float?
    public var animationEasing: SECAnimation?
    public var animationDelay: Float?
}

extension SECCandlestickSerie.Data : SECEnumable {
    public enum Enums {
        case name(String), value([SECJsonable]), itemStyle(SECItemStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .value(value):
                self.value = value
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            }
        }
    }
}

extension SECCandlestickSerie.Data : SECMappable {
    public func mapping(map: SECMap) {
        map["name"] = name
        map["value"] = value
        map["itemStyle"] = itemStyle
    }
}

extension SECCandlestickSerie : SECEnumable {
    public enum Enums {
        case coordinateSystem(SECCoordinateSystem), xAxisIndex(UInt8), yAxisIndex(UInt8), name(String), legendHoverLink(Bool), hoverAnimation(Bool), layout(SECOrient), barWidth(Float), barMinWidth(Float), barMaxWidth(Float), itemStyle(SECItemStyle), data([SECJsonable]), markPoint(SECMarkPoint), markLine(SECMarkLine), markArea(SECMarkArea), zlevel(Float), z(Float), silent(Bool), animationDuration(Float), animationEasing(SECAnimation), animationDelay(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .coordinateSystem(coordinateSystem):
                self.coordinateSystem = coordinateSystem
            case let .xAxisIndex(xAxisIndex):
                self.xAxisIndex = xAxisIndex
            case let .yAxisIndex(yAxisIndex):
                self.yAxisIndex = yAxisIndex
            case let .name(name):
                self.name = name
            case let .legendHoverLink(legendHoverLink):
                self.legendHoverLink = legendHoverLink
            case let .hoverAnimation(hoverAnimation):
                self.hoverAnimation = hoverAnimation
            case let .layout(layout):
                self.layout = layout
            case let .barWidth(barWidth):
                self.barWidth = barWidth
            case let .barMinWidth(barMinWidth):
                self.barMinWidth = barMinWidth
            case let .barMaxWidth(barMaxWidth):
                self.barMaxWidth = barMaxWidth
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .data(data):
                self.data = data
            case let .markPoint(markPoint):
                self.markPoint = markPoint
            case let .markLine(markLine):
                self.markLine = markLine
            case let .markArea(markArea):
                self.markArea = markArea
            case let .zlevel(zlevel):
                self.zlevel = zlevel
            case let .z(z):
                self.z = z
            case let .silent(silent):
                self.silent = silent
            case let .animationDuration(animationDuration):
                self.animationDuration = animationDuration
            case let .animationEasing(animationEasing):
                self.animationEasing = animationEasing
            case let .animationDelay(animationDelay):
                self.animationDelay = animationDelay
            }
        }
    }
}

extension SECCandlestickSerie : SECMappable {
    public func mapping(map: SECMap) {
        map["type"] = type
        map["coordinateSystem"] = coordinateSystem
        map["xAxisIndex"] = xAxisIndex
        map["yAxisIndex"] = yAxisIndex
        map["name"] = name
        map["legendHoverLink"] = legendHoverLink
        map["hoverAnimation"] = hoverAnimation
        map["layout"] = layout
        map["barWidth"] = barWidth
        map["barMinWidth"] = barMinWidth
        map["barMaxWidth"] = barMaxWidth
        map["itemStyle"] = itemStyle
        map["data"] = data
        map["markPoint"] = markPoint
        map["markLine"] = markLine
        map["markArea"] = markArea
        map["zlevel"] = zlevel
        map["z"] = z
        map["silent"] = silent
        map["animationDuration"] = animationDuration
        map["animationEasing"] = animationEasing
        map["animationDelay"] = animationDelay
    }
}
