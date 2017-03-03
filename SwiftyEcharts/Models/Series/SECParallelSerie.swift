//
//  SECParallelSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 04/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECParallelSerie : SECSeries, SECZable, SECAnimatable {
    
    public var type: SECSerieType {
        return .parallel
    }
    
    public var coordinateSystem: SECCoordinateSystem?
    public var parallelIndex: UInt8?
    public var name: String?
    public var lineStyle: SECEmphasisLineStyle?
    public var inactiveOpacity: Float?
    public var activeOpacity: Float?
    public var realtime: Bool?
    public var data: [SECJsonable]?
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
}

extension SECParallelSerie : SECEnumable {
	public enum Enums {
		case coordinateSystem(SECCoordinateSystem), parallelIndex(UInt8), name(String), lineStyle(SECEmphasisLineStyle), inactiveOpacity(Float), activeOpacity(Float), realtime(Bool), data([SECJsonable]), zlevel(Float), z(Float), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(SECTime), animationEasing(SECAnimation), animationDelay(SECTime), animationDurationUpdate(SECTime), animationEasingUpdate(SECAnimation), animationDelayUpdate(SECTime)
	}

	public typealias ContentEnum = Enums

	public init(_ elements: Enums...) {
		for ele in elements {
			switch ele {
				case let .coordinateSystem(coordinateSystem):
					self.coordinateSystem = coordinateSystem
				case let .parallelIndex(parallelIndex):
					self.parallelIndex = parallelIndex
				case let .name(name):
					self.name = name
				case let .lineStyle(lineStyle):
					self.lineStyle = lineStyle
				case let .inactiveOpacity(inactiveOpacity):
					self.inactiveOpacity = inactiveOpacity
				case let .activeOpacity(activeOpacity):
					self.activeOpacity = activeOpacity
				case let .realtime(realtime):
					self.realtime = realtime
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

extension SECParallelSerie : SECMappable {
	public func mapping(map: SECMap) {
		map["coordinateSystem"] = coordinateSystem
		map["parallelIndex"] = parallelIndex
		map["name"] = name
		map["lineStyle"] = lineStyle
		map["inactiveOpacity"] = inactiveOpacity
		map["activeOpacity"] = activeOpacity
		map["realtime"] = realtime
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
