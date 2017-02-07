//
//  SECRadiusAxis.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 05/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECRadiusAxis : SECZable {
    public var polarIndex: UInt8?
    public var type: SECAxisType?
    public var name: String?
    public var nameLocation: SECPosition?
    public var nameTextStyle: SECTextStyle?
    public var nameGap: Float?
    public var nameRotate: Float?
    public var inverse: Bool?
    public var boundaryGap: [Float]?
    public var min: Float?
    public var max: Float?
    public var scale: Bool?
    public var splitNumber: UInt8?
    public var minInterval: Float?
    public var interval: Float?
    public var logBase: Float?
    public var silent: Bool?
    public var triggerEvent: Bool?
    public var axisLine: SECAxisLine?
    public var axisTick: SECAxisTick?
    public var axisLabel: SECAxisLabel?
    public var splitLine: SECSplitLine?
    public var splitArea: SECSplitArea?
    public var zlevel: Float?
    public var z: Float?
}

extension SECRadiusAxis : SECEnumable {
	public enum Enums {
		case polarIndex(UInt8), type(SECAxisType), name(String), nameLocation(SECPosition), nameTextStyle(SECTextStyle), nameGap(Float), nameRotate(Float), inverse(Bool), boundaryGap([Float]), min(Float), max(Float), scale(Bool), splitNumber(UInt8), minInterval(Float), interval(Float), logBase(Float), silent(Bool), triggerEvent(Bool), axisLine(SECAxisLine), axisTick(SECAxisTick), axisLabel(SECAxisLabel), splitLine(SECSplitLine), splitArea(SECSplitArea), zlevel(Float), z(Float)
	}

	public typealias ContentEnum = Enums

	public init(_ elements: [Enums]) {
		for ele in elements {
			switch ele {
				case let .polarIndex(polarIndex):
					self.polarIndex = polarIndex
				case let .type(type):
					self.type = type
				case let .name(name):
					self.name = name
				case let .nameLocation(nameLocation):
					self.nameLocation = nameLocation
				case let .nameTextStyle(nameTextStyle):
					self.nameTextStyle = nameTextStyle
				case let .nameGap(nameGap):
					self.nameGap = nameGap
				case let .nameRotate(nameRotate):
					self.nameRotate = nameRotate
				case let .inverse(inverse):
					self.inverse = inverse
				case let .boundaryGap(boundaryGap):
					self.boundaryGap = boundaryGap
				case let .min(min):
					self.min = min
				case let .max(max):
					self.max = max
				case let .scale(scale):
					self.scale = scale
				case let .splitNumber(splitNumber):
					self.splitNumber = splitNumber
				case let .minInterval(minInterval):
					self.minInterval = minInterval
				case let .interval(interval):
					self.interval = interval
				case let .logBase(logBase):
					self.logBase = logBase
				case let .silent(silent):
					self.silent = silent
				case let .triggerEvent(triggerEvent):
					self.triggerEvent = triggerEvent
				case let .axisLine(axisLine):
					self.axisLine = axisLine
				case let .axisTick(axisTick):
					self.axisTick = axisTick
				case let .axisLabel(axisLabel):
					self.axisLabel = axisLabel
				case let .splitLine(splitLine):
					self.splitLine = splitLine
				case let .splitArea(splitArea):
					self.splitArea = splitArea
				case let .zlevel(zlevel):
					self.zlevel = zlevel
				case let .z(z):
					self.z = z
			}
		}
	}
}

extension SECRadiusAxis : SECMappable {
	public func mapping(map: SECMap) {
		map["polarIndex"] = polarIndex
		map["type"] = type
		map["name"] = name
		map["nameLocation"] = nameLocation
		map["nameTextStyle"] = nameTextStyle
		map["nameGap"] = nameGap
		map["nameRotate"] = nameRotate
		map["inverse"] = inverse
		map["boundaryGap"] = boundaryGap
		map["min"] = min
		map["max"] = max
		map["scale"] = scale
		map["splitNumber"] = splitNumber
		map["minInterval"] = minInterval
		map["interval"] = interval
		map["logBase"] = logBase
		map["silent"] = silent
		map["triggerEvent"] = triggerEvent
		map["axisLine"] = axisLine
		map["axisTick"] = axisTick
		map["axisLabel"] = axisLabel
		map["splitLine"] = splitLine
		map["splitArea"] = splitArea
		map["zlevel"] = zlevel
		map["z"] = z
	}
}
