//
//  SECRadar.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECRadar : SECZable {
    public struct Name : SECDisplayable, SECFormatted, SECTextful {
        public var show: Bool?
        public var formatter: SECFormatter?
        public var textStyle: SECTextStyle?
        
        public init() {}
    }

    /// 雷达图绘制类型
    ///
    /// - polygon:
    /// - circle: 
    public enum Shape : String, SECJsonable {
        case polygon = "polygon"
        case circle = "circle"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
        }
    }
    
    public struct Indicator {
        public var name: String?
        public var max: Float?
        public var min: Float?
        
        public init() {}
    }
    
    public var zlevel: Float?
    public var z: Float?
    public var center: [Float]?
    public var radius: Float?
    public var startAngle: Float?
    public var name: Name?
    public var nameGap: Float?
    public var splitNumber: Int?
    public var shape: Shape?
    public var silent: Bool?
    public var triggerEvent: Bool?
    public var axisLine: SECAxisLine?
    public var axisTick: SECAxisTick?
    public var axisLabel: SECAxisLabel?
    public var splitLine: SECSplitLine?
    public var splitArea: SECSplitArea?
    public var indicator: [Indicator]?
    
    public init() {}
}


extension SECRadar.Name : SECEnumable {
    public enum Enums {
        case show(Bool), formatter(SECFormatter), textStyle(SECTextStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .formatter(formatter):
                self.formatter = formatter
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            }
        }
    }
}

extension SECRadar.Name : SECMappable {
    public func mapping(map: SECMap) {
        map["show"] = show
        map["formatter"] = formatter
        map["textStyle"] = textStyle
    }
}

extension SECRadar.Indicator : SECEnumable {
    public enum Enums {
        case name(String), max(Float), min(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .max(max):
                self.max = max
            case let .min(min):
                self.min = min
            }
        }
    }
}

extension SECRadar.Indicator : SECMappable {
    public func mapping(map: SECMap) {
        map["name"] = name
        map["max"] = max
        map["min"] = min
    }
}

extension SECRadar : SECEnumable {
	public enum Enums {
		case zlevel(Float), z(Float), center([Float]), radius(Float), startAngle(Float), name(Name), nameGap(Float), splitNumber(Int), shape(Shape), silent(Bool), triggerEvent(Bool), axisLine(SECAxisLine), axisTick(SECAxisTick), axisLabel(SECAxisLabel), splitLine(SECSplitLine), splitArea(SECSplitArea), indicator([Indicator])
	}

	public typealias ContentEnum = Enums

	public init(_ elements: [Enums]) {
		for ele in elements {
			switch ele {
				case let .zlevel(zlevel):
					self.zlevel = zlevel
				case let .z(z):
					self.z = z
				case let .center(center):
					self.center = center
				case let .radius(radius):
					self.radius = radius
				case let .startAngle(startAngle):
					self.startAngle = startAngle
				case let .name(name):
					self.name = name
				case let .nameGap(nameGap):
					self.nameGap = nameGap
				case let .splitNumber(splitNumber):
					self.splitNumber = splitNumber
				case let .shape(shape):
					self.shape = shape
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
				case let .indicator(indicator):
					self.indicator = indicator
			}
		}
	}
}

extension SECRadar : SECMappable {
	public func mapping(map: SECMap) {
		map["zlevel"] = zlevel
		map["z"] = z
		map["center"] = center
		map["radius"] = radius
		map["startAngle"] = startAngle
		map["name"] = name
		map["nameGap"] = nameGap
		map["splitNumber"] = splitNumber
		map["shape"] = shape
		map["silent"] = silent
		map["triggerEvent"] = triggerEvent
		map["axisLine"] = axisLine
		map["axisTick"] = axisTick
		map["axisLabel"] = axisLabel
		map["splitLine"] = splitLine
		map["splitArea"] = splitArea
		map["indicator"] = indicator
	}
}
