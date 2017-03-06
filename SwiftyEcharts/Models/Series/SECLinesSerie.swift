//
//  SECLinesSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECLinesSerie : SECSeries, SECZable, SECAnimatable {
    
    public struct Effect {
        public var show: Bool?
        public var period: Float?
        public var constantSpeed: Float?
        public var symbol: SECSymbol?
        public var symbolSize: Float?
        public var color: SECColor?
        public var trailLength: Float?
        public var loop: Bool?
        
        public init() { }
    }
    
    public var type: SECSerieType {
        return .lines
    }
    
    public var name: String?
    public var coordinateSystem: SECCoordinateSystem?
    public var xAxisIndex: UInt8?
    public var yAxisIndex: UInt8?
    public var geoIndex: UInt8?
    public var polyline: Bool?
    public var effect: Effect?
    public var large: Bool?
    public var largeThreshold: Float?
    public var symbol: SECSymbol?
    public var symbolSize: Float?
    public var lineStyle: SECLineStyle?
    public var label: SECFormattedLabel?
    public var data: [SECJsonable]?
    public var markPoint: SECMarkPoint?
    public var markLine: SECMarkLine?
    public var markArea: SECMarkArea?
    public var zlevel: Float?
    public var z: Float?
    public var silent: Bool?
    public var animation: Bool?
    public var animationThreshold: Float?
    public var animationDuration: SECTime?
    public var animationEasing: SECAnimation?
    public var animationDelay: SECTime?
    public var animationDurationUpdate: SECTime?
    public var animationEasingUpdate: SECAnimation?
    public var animationDelayUpdate: SECTime?
    
    public init() { }
}

extension SECLinesSerie.Effect : SECEnumable {
    public enum Enums {
        case show(Bool), period(Float), constantSpeed(Float), symbol(SECSymbol), symbolSize(Float), color(SECColor), trailLength(Float), loop(Bool)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .period(period):
                self.period = period
            case let .constantSpeed(constantSpeed):
                self.constantSpeed = constantSpeed
            case let .symbol(symbol):
                self.symbol = symbol
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            case let .color(color):
                self.color = color
            case let .trailLength(trailLength):
                self.trailLength = trailLength
            case let .loop(loop):
                self.loop = loop
            }
        }
    }
}

extension SECLinesSerie.Effect : SECMappable {
    public func mapping(map: SECMap) {
        map["show"] = show
        map["period"] = period
        map["constantSpeed"] = constantSpeed
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["color"] = color
        map["trailLength"] = trailLength
        map["loop"] = loop
    }
}

extension SECLinesSerie : SECEnumable {
    public enum Enums {
        case name(String), coordinateSystem(SECCoordinateSystem), xAxisIndex(UInt8), yAxisIndex(UInt8), geoIndex(UInt8), polyline(Bool), effect(Effect), large(Bool), largeThreshold(Float), symbol(SECSymbol), symbolSize(Float), lineStyle(SECLineStyle), label(SECFormattedLabel), data([SECJsonable]), markPoint(SECMarkPoint), markLine(SECMarkLine), markArea(SECMarkArea), zlevel(Float), z(Float), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(SECTime), animationEasing(SECAnimation), animationDelay(SECTime), animationDurationUpdate(SECTime), animationEasingUpdate(SECAnimation), animationDelayUpdate(SECTime)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .coordinateSystem(coordinateSystem):
                self.coordinateSystem = coordinateSystem
            case let .xAxisIndex(xAxisIndex):
                self.xAxisIndex = xAxisIndex
            case let .yAxisIndex(yAxisIndex):
                self.yAxisIndex = yAxisIndex
            case let .geoIndex(geoIndex):
                self.geoIndex = geoIndex
            case let .polyline(polyline):
                self.polyline = polyline
            case let .effect(effect):
                self.effect = effect
            case let .large(large):
                self.large = large
            case let .largeThreshold(largeThreshold):
                self.largeThreshold = largeThreshold
            case let .symbol(symbol):
                self.symbol = symbol
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            case let .label(label):
                self.label = label
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
            case let .animation(animation):
                self.animation = animation
            case let .animationThreshold(animationThreshold):
                self.animationThreshold = animationThreshold
            case let .animationDuration(animationDuration):
                self.animationDuration = animationDuration
            case let .animationEasing(animationEasing):
                self.animationEasing = animationEasing
            case let .animationDelay(animationDelay):
                self.animationDelay = animationDelay
            case let .animationDurationUpdate(animationDurationUpdate):
                self.animationDurationUpdate = animationDurationUpdate
            case let .animationEasingUpdate(animationEasingUpdate):
                self.animationEasingUpdate = animationEasingUpdate
            case let .animationDelayUpdate(animationDelayUpdate):
                self.animationDelayUpdate = animationDelayUpdate
            }
        }
    }
}

extension SECLinesSerie : SECMappable {
    public func mapping(map: SECMap) {
        map["type"] = type
        map["name"] = name
        map["coordinateSystem"] = coordinateSystem
        map["xAxisIndex"] = xAxisIndex
        map["yAxisIndex"] = yAxisIndex
        map["geoIndex"] = geoIndex
        map["polyline"] = polyline
        map["effect"] = effect
        map["large"] = large
        map["largeThreshold"] = largeThreshold
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["lineStyle"] = lineStyle
        map["label"] = label
        map["data"] = data
        map["markPoint"] = markPoint
        map["markLine"] = markLine
        map["markArea"] = markArea
        map["zlevel"] = zlevel
        map["z"] = z
        map["silent"] = silent
        map["animation"] = animation
        map["animationThreshold"] = animationThreshold
        map["animationDuration"] = animationDuration
        map["animationEasing"] = animationEasing
        map["animationDelay"] = animationDelay
        map["animationDurationUpdate"] = animationDurationUpdate
        map["animationEasingUpdate"] = animationEasingUpdate
        map["animationDelayUpdate"] = animationDelayUpdate
    }
}

