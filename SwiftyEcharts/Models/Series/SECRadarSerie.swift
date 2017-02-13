//
//  SECRadarSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 13/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECRadarSerie : SECSeries, SECSymbolized, SECZable, SECAnimatable {
    
    public struct Data : SECSymbolized {
        public var name: String?
        public var value: Float?
        public var symbol: SECSymbol?
        public var symbolSize: Float?
        public var symbolRotate: Float?
        public var symbolOffset: [Float]?
        public var label: SECFormattedLabel?
        public var itemStyle: SECItemStyle?
        public var lineStyle: SECLineStyle?
        public var areStyle: SECAreaStyle?
        
        public init() {}
    }
    
    public var type: SECSerieType {
        return .radar
    }
    
    public var name: String?
    public var radarIndex: UInt8?
    public var symbol: SECSymbol?
    public var symbolSize: Float?
    public var symbolRotate: Float?
    public var symbolOffset: [Float]?
    public var label: SECFormattedLabel?
    public var itemStyle: SECItemStyle?
    public var lineStyle: SECLineStyle?
    public var areStyle: SECAreaStyle?
    public var data: [Any]?
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
    
    public init() {}
}

extension SECRadarSerie.Data : SECEnumable {
    public enum Enums {
        case name(String), value(Float), symbol(SECSymbol), symbolSize(Float), symbolRotate(Float), symbolOffset([Float]), label(SECFormattedLabel), itemStyle(SECItemStyle), lineStyle(SECLineStyle), areStyle(SECAreaStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .value(value):
                self.value = value
            case let .symbol(symbol):
                self.symbol = symbol
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            case let .symbolRotate(symbolRotate):
                self.symbolRotate = symbolRotate
            case let .symbolOffset(symbolOffset):
                self.symbolOffset = symbolOffset
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            case let .areStyle(areStyle):
                self.areStyle = areStyle
            }
        }
    }
}

extension SECRadarSerie.Data : SECMappable {
    public func mapping(map: SECMap) {
        map["name"] = name
        map["value"] = value
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["symbolRotate"] = symbolRotate
        map["symbolOffset"] = symbolOffset
        map["label"] = label
        map["itemStyle"] = itemStyle
        map["lineStyle"] = lineStyle
        map["areStyle"] = areStyle
    }
}

extension SECRadarSerie : SECEnumable {
	public enum Enums {
		case name(String), radarIndex(UInt8), symbol(SECSymbol), symbolSize(Float), symbolRotate(Float), symbolOffset([Float]), label(SECFormattedLabel), itemStyle(SECItemStyle), lineStyle(SECLineStyle), areStyle(SECAreaStyle), data([Any]), zlevel(Float), z(Float), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(SECTime), animationEasing(SECAnimation), animationDelay(SECTime), animationDurationUpdate(SECTime), animationEasingUpdate(SECAnimation), animationDelayUpdate(SECTime)
	}

	public typealias ContentEnum = Enums

	public init(_ elements: Enums...) {
		for ele in elements {
			switch ele {
				case let .name(name):
					self.name = name
				case let .radarIndex(radarIndex):
					self.radarIndex = radarIndex
				case let .symbol(symbol):
					self.symbol = symbol
				case let .symbolSize(symbolSize):
					self.symbolSize = symbolSize
				case let .symbolRotate(symbolRotate):
					self.symbolRotate = symbolRotate
				case let .symbolOffset(symbolOffset):
					self.symbolOffset = symbolOffset
				case let .label(label):
					self.label = label
				case let .itemStyle(itemStyle):
					self.itemStyle = itemStyle
				case let .lineStyle(lineStyle):
					self.lineStyle = lineStyle
				case let .areStyle(areStyle):
					self.areStyle = areStyle
				case let .data(data):
					self.data = data
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

extension SECRadarSerie : SECMappable {
	public func mapping(map: SECMap) {
		map["type"] = type
		map["name"] = name
		map["radarIndex"] = radarIndex
		map["symbol"] = symbol
		map["symbolSize"] = symbolSize
		map["symbolRotate"] = symbolRotate
		map["symbolOffset"] = symbolOffset
		map["label"] = label
		map["itemStyle"] = itemStyle
		map["lineStyle"] = lineStyle
		map["areStyle"] = areStyle
		map["data"] = data
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
