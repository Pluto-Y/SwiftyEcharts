//
//  SECSingleAxis.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECSingleAxis : SECZable {
    
    public struct Data {
        public var value: String?
        public var textStyle: SECTextStyle?
        
        public init() {}
    }
    
    public typealias NameLocation = SECLocation
    
    public var zlevel: Float?
    public var z: Float? 
    public var left: SECPosition? 
    public var top: SECPosition? 
    public var right: SECPosition? 
    public var bottom: SECPosition? 
    public var width: Float? 
    public var height: Float? 
    public var orient: SECOrient? 
    public var type: SECAxisType? 
    public var name: String? 
    public var nameLocation: NameLocation? 
    public var nameTextStyle: SECTextStyle? 
    public var nameGap: Float? 
    public var nameRotate: Float? 
    public var inverse: Bool? 
    public var boundaryGap: SECBoundaryGap? 
    public var min: SECJsonable?
    public var max: SECJsonable?
    public var scale: Bool? 
    public var splitNumber: UInt8? 
    public var minInterval: UInt8? 
    public var interval: Int? 
    public var logBase: Float? 
    public var silent: Bool? 
    public var triggerEvent: Bool? 
    public var axisLine: SECAxisLine? 
    public var axisTick: SECAxisTick? 
    public var axisLabel: SECAxisLabel? 
    public var splitLine: SECSplitLine? 
    public var splitArea: SECSplitArea? 
    public var data: [Any]?
    
    public init() {}
}

extension SECSingleAxis : SECEnumable {
	public enum Enums {
		case zlevel(Float), z(Float), left(SECPosition), top(SECPosition), right(SECPosition), bottom(SECPosition), width(Float), height(Float), orient(SECOrient), type(SECAxisType), name(String), nameLocation(NameLocation), nameTextStyle(SECTextStyle), nameGap(Float), nameRotate(Float), inverse(Bool), boundaryGap(SECBoundaryGap), min(SECJsonable), max(SECJsonable), scale(Bool), splitNumber(UInt8), minInterval(UInt8), interval(Int), logBase(Float), silent(Bool), triggerEvent(Bool), axisLine(SECAxisLine), axisTick(SECAxisTick), axisLabel(SECAxisLabel), splitLine(SECSplitLine), splitArea(SECSplitArea), data([Any])
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
				case let .orient(orient):
					self.orient = orient
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
				case let .data(data):
					self.data = data
			}
		}
	}
}

extension SECSingleAxis : SECMappable {
	public func mapping(map: SECMap) {
		map["zlevel"] = zlevel
		map["z"] = z
		map["left"] = left
		map["top"] = top
		map["right"] = right
		map["bottom"] = bottom
		map["width"] = width
		map["height"] = height
		map["orient"] = orient
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
		map["data"] = data
	}
}

extension SECSingleAxis.Data : SECEnumable {
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

extension SECSingleAxis.Data : SECMappable {
	public func mapping(map: SECMap) {
		map["value"] = value
		map["textStyle"] = textStyle
	}
}
