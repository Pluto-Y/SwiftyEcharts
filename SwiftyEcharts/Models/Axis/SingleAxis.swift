//
//  SingleAxis.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SingleAxis: Zable {
    
    public struct Data {
        public var value: String?
        public var textStyle: TextStyle?
        
        public init() {}
    }
    
    public typealias NameLocation = Location
    
    public var zlevel: Float?
    public var z: Float? 
    public var left: Position? 
    public var top: Position? 
    public var right: Position? 
    public var bottom: Position? 
    public var width: Float? 
    public var height: Float? 
    public var orient: Orient? 
    public var type: AxisType? 
    public var name: String? 
    public var nameLocation: NameLocation? 
    public var nameTextStyle: TextStyle? 
    public var nameGap: Float? 
    public var nameRotate: Float? 
    public var inverse: Bool? 
    public var boundaryGap: BoundaryGap? 
    public var min: Jsonable?
    public var max: Jsonable?
    public var scale: Bool? 
    public var splitNumber: UInt8? 
    public var minInterval: UInt8? 
    public var interval: Int? 
    public var logBase: Float? 
    public var silent: Bool? 
    public var triggerEvent: Bool? 
    public var axisLine: AxisLine? 
    public var axisTick: AxisTick? 
    public var axisLabel: AxisLabel? 
    public var splitLine: SplitLine? 
    public var splitArea: SplitArea? 
    public var data: [Any]?
    
    public init() {}
}

extension SingleAxis: Enumable {
	public enum Enums {
		case zlevel(Float), z(Float), left(Position), top(Position), right(Position), bottom(Position), width(Float), height(Float), orient(Orient), type(AxisType), name(String), nameLocation(NameLocation), nameTextStyle(TextStyle), nameGap(Float), nameRotate(Float), inverse(Bool), boundaryGap(BoundaryGap), min(Jsonable), max(Jsonable), scale(Bool), splitNumber(UInt8), minInterval(UInt8), interval(Int), logBase(Float), silent(Bool), triggerEvent(Bool), axisLine(AxisLine), axisTick(AxisTick), axisLabel(AxisLabel), splitLine(SplitLine), splitArea(SplitArea), data([Any])
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

extension SingleAxis: Mappable {
	public func mapping(_ map: Mapper) {
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

extension SingleAxis.Data: Enumable {
	public enum Enums {
		case value(String), textStyle(TextStyle)
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

extension SingleAxis.Data: Mappable {
	public func mapping(_ map: Mapper) {
		map["value"] = value
		map["textStyle"] = textStyle
	}
}
