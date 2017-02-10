//
//  SECParallel.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECParallel : SECZable {
    
    public struct ParallelAxisDefault { 
        
        public struct Data {
            public var value: String?
            public var textStyle: SECTextStyle?
        }
        
        public var type: SECAxisType?
        public var name: String? 
        public var nameLocation: SECPosition? 
        public var nameTextStyle: SECTextStyle? 
        public var nameGap: Float? 
        public var nameRotate: Float? 
        public var inverse: Bool? 
        public var boundaryGap: SECBoundaryGap? 
        public var min: String? 
        public var max: String? 
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
        
    }
    
    public var zlevel: Float?
    public var z: Float?
    public var left: SECPosition?
    public var top: SECPosition?
    public var right: SECPosition?
    public var bottom: SECPosition?
    public var width: Float?
    public var height: Float?
    public var layout: SECOrient?
    public var axisExpandable: Bool?
    public var axisExpandCenter: Float?
    public var axisExpandCount: Float?
    public var axisExpandWidth: Float?
    public var parallelAxisDefault: ParallelAxisDefault?
}

extension SECParallel : SECEnumable {
	public enum Enums {
		case zlevel(Float), z(Float), left(SECPosition), top(SECPosition), right(SECPosition), bottom(SECPosition), width(Float), height(Float), layout(SECOrient), axisExpandable(Bool), axisExpandCenter(Float), axisExpandCount(Float), axisExpandWidth(Float), parallelAxisDefault(ParallelAxisDefault)
	}

	public typealias ContentEnum = Enums

	public init(_ elements: Enums...) {
		for ele in elements {
			switch ele {
				case let .zlevel(zlevel):
					self.zlevel = zlevel
				case let .z(z):
					self.z = z
				case let .left(left):
					self.left = left
				case let .top(top):
					self.top = top
				case let .right(right):
					self.right = right
				case let .bottom(bottom):
					self.bottom = bottom
				case let .width(width):
					self.width = width
				case let .height(height):
					self.height = height
				case let .layout(layout):
					self.layout = layout
				case let .axisExpandable(axisExpandable):
					self.axisExpandable = axisExpandable
				case let .axisExpandCenter(axisExpandCenter):
					self.axisExpandCenter = axisExpandCenter
				case let .axisExpandCount(axisExpandCount):
					self.axisExpandCount = axisExpandCount
				case let .axisExpandWidth(axisExpandWidth):
					self.axisExpandWidth = axisExpandWidth
				case let .parallelAxisDefault(parallelAxisDefault):
					self.parallelAxisDefault = parallelAxisDefault
			}
		}
	}
}

extension SECParallel : SECMappable {
	public func mapping(map: SECMap) {
		map["zlevel"] = zlevel
		map["z"] = z
		map["left"] = left
		map["top"] = top
		map["right"] = right
		map["bottom"] = bottom
		map["width"] = width
		map["height"] = height
		map["layout"] = layout
		map["axisExpandable"] = axisExpandable
		map["axisExpandCenter"] = axisExpandCenter
		map["axisExpandCount"] = axisExpandCount
		map["axisExpandWidth"] = axisExpandWidth
		map["parallelAxisDefault"] = parallelAxisDefault
	}
}

extension SECParallel.ParallelAxisDefault : SECEnumable {
	public enum Enums {
		case type(SECAxisType), name(String), nameLocation(SECPosition), nameTextStyle(SECTextStyle), nameGap(Float), nameRotate(Float), inverse(Bool), boundaryGap(SECBoundaryGap), min(String), max(String), scale(Bool), splitNumber(UInt8), minInterval(UInt8), interval(UInt), logBase(Float), silent(Bool), triggerEvent(Bool), axisLine(SECAxisLine), axisTick(SECAxisTick), axisLabel(SECAxisLabel)
	}

	public typealias ContentEnum = Enums

	public init(_ elements: Enums...) {
		for ele in elements {
			switch ele {
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
			}
		}
	}
}

extension SECParallel.ParallelAxisDefault : SECMappable {
	public func mapping(map: SECMap) {
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
	}
}

extension SECParallel.ParallelAxisDefault.Data : SECEnumable {
	public enum Enums {
		case value(String), textStyle(SECTextStyle)
	}

	public typealias ContentEnum = Enums

	public init(_ elements: Enums...) {
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

extension SECParallel.ParallelAxisDefault.Data : SECMappable {
	public func mapping(map: SECMap) {
		map["value"] = value
		map["textStyle"] = textStyle
	}
}
