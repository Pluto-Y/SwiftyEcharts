//
//  SECAngleAxis.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECAngleAxis : SECZable {
    public struct Data {
        public var value: String?
        public var textStyle: SECTextStyle?
        
        public init() {}
    }
    public var polarIndex: UInt8?
    public var startAngle: Float?
    public var clockwise: Bool?
    public var type: SECAxisType?
    public var boundaryGap: [Float]?
    public var min: Float?
    public var max: Float?
    public var scale: Bool?
    public var splitNumber: UInt8?
    public var minInterval: UInt8?
    public var interval: UInt?
    public var logBase: Float?
    public var silent: Bool?
    public var triggerEvent: Bool?
    public var axisLine: SECAxisLine?
    public var axisTick: SECAxisTick?
    public var axisLabel: SECAxisLabel?
    public var splitLine: SECSplitLine?
    public var splitArea: SECSplitArea?
    public var data: [Any]?
    public var zlevel: Float?
    public var z: Float?
    
    public init() {}
}

extension SECAngleAxis.Data : SECEnumable {
    public enum Enums {
        case value(String), textStyle(SECTextStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .value(value):
                self.value = value
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            }
        }
    }
}

extension SECAngleAxis.Data : SECMappable {
    public func mapping(map: SECMap) {
        map["value"] = value
        map["textStyle"] = textStyle
    }
}

extension SECAngleAxis : SECEnumable {
	public enum Enums {
		case polarIndex(UInt8), startAngle(Float), clockwise(Bool), type(SECAxisType), boundaryGap([Float]), min(Float), max(Float), scale(Bool), splitNumber(UInt8), minInterval(UInt8), interval(UInt), logBase(Float), silent(Bool), triggerEvent(Bool), axisLine(SECAxisLine), axisTick(SECAxisTick), axisLabel(SECAxisLabel), splitLine(SECSplitLine), splitArea(SECSplitArea), data([Any]), zlevel(Float), z(Float)
	}

	public typealias ContentEnum = Enums

	public init(_ elements: [Enums]) {
		for ele in elements {
			switch ele {
				case let .polarIndex(polarIndex):
					self.polarIndex = polarIndex
				case let .startAngle(startAngle):
					self.startAngle = startAngle
				case let .clockwise(clockwise):
					self.clockwise = clockwise
				case let .type(type):
					self.type = type
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
				case let .data(data):
					self.data = data
				case let .zlevel(zlevel):
					self.zlevel = zlevel
				case let .z(z):
					self.z = z
			}
		}
	}
}

extension SECAngleAxis : SECMappable {
	public func mapping(map: SECMap) {
		map["polarIndex"] = polarIndex
		map["startAngle"] = startAngle
		map["clockwise"] = clockwise
		map["type"] = type
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
		map["data"] = data
		map["zlevel"] = zlevel
		map["z"] = z
	}
}
