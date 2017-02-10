//
//  SECParallelAxis.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//
    
public struct SECParallelAxis {

    public struct AreaSelectStyle : SECColorful, SECOpacitable {
        public var width: Float?
        public var borderWidth: Float?
        public var borderColor: SECColor?
        public var color: SECColor?
        public var opacity: Float?
    }
    
    /// <#Description#>
    ///
    /// - start: <#start description#>
    /// - middle: <#middle description#>
    /// - end: <#end description#>
    public enum NameLocation : String, SECJsonable {
        case start = "start"
        case middle = "middle"
        case end = "end"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
        }
    }
    
    public var dim: Float?
    public var parallelIndex: UInt8?
    public var realtiem: Bool?
    public var areaSelectedStyle: AreaSelectStyle?
    public var type: SECAxisType?
    public var name: String?
    public var nameTextStyle: SECTextStyle?
    public var nameLocation: NameLocation?
    public var nameGap: Float?
    public var nameRotate: Float?
    public var inverse: Bool?
    public var boudaryGap: SECBoundaryGap?
    public var min: Float?
    public var max: Float?
    public var scale: Bool?
    public var splitName: UInt8?
    public var minInterval: UInt8?
    public var interval: Int?
    public var logBase: Float?
    public var silent: Bool?
    public var triggerEvent: Bool?
    public var axisLine: SECAxisLine?
    public var axisTick: SECAxisTick?
    public var axisLabel: SECAxisLabel?
    public var data: [Any]?
}

extension SECParallelAxis.AreaSelectStyle : SECEnumable {
    public enum Enums {
        case width(Float), borderWidth(Float), borderColor(SECColor), color(SECColor), opacity(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .width(width):
                self.width = width
            case let .borderWidth(borderWidth):
                self.borderWidth = borderWidth
            case let .borderColor(borderColor):
                self.borderColor = borderColor
            case let .color(color):
                self.color = color
            case let .opacity(opacity):
                self.opacity = opacity
            }
        }
    }
}

extension SECParallelAxis.AreaSelectStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["width"] = width
        map["borderWidth"] = borderWidth
        map["borderColor"] = borderColor
        map["color"] = color
        map["opacity"] = opacity
    }
}

extension SECParallelAxis : SECEnumable {
	public enum Enums {
		case dim(Float), parallelIndex(UInt8), realtiem(Bool), areaSelectedStyle(AreaSelectStyle), type(SECAxisType), name(String), nameTextStyle(SECTextStyle), nameLocation(NameLocation), nameGap(Float), nameRotate(Float), inverse(Bool), boudaryGap(SECBoundaryGap), min(Float), max(Float), scale(Bool), splitName(UInt8), minInterval(UInt8), interval(Int), logBase(Float), silent(Bool), triggerEvent(Bool), axisLine(SECAxisLine), axisTick(SECAxisTick), axisLabel(SECAxisLabel), data([Any])
	}

	public typealias ContentEnum = Enums

	public init(_ elements: Enums...) {
		for ele in elements {
			switch ele {
				case let .dim(dim):
					self.dim = dim
				case let .parallelIndex(parallelIndex):
					self.parallelIndex = parallelIndex
				case let .realtiem(realtiem):
					self.realtiem = realtiem
				case let .areaSelectedStyle(areaSelectedStyle):
					self.areaSelectedStyle = areaSelectedStyle
				case let .type(type):
					self.type = type
				case let .name(name):
					self.name = name
				case let .nameTextStyle(nameTextStyle):
					self.nameTextStyle = nameTextStyle
				case let .nameLocation(nameLocation):
					self.nameLocation = nameLocation
				case let .nameGap(nameGap):
					self.nameGap = nameGap
				case let .nameRotate(nameRotate):
					self.nameRotate = nameRotate
				case let .inverse(inverse):
					self.inverse = inverse
				case let .boudaryGap(boudaryGap):
					self.boudaryGap = boudaryGap
				case let .min(min):
					self.min = min
				case let .max(max):
					self.max = max
				case let .scale(scale):
					self.scale = scale
				case let .splitName(splitName):
					self.splitName = splitName
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
				case let .data(data):
					self.data = data
			}
		}
	}
}

extension SECParallelAxis : SECMappable {
	public func mapping(map: SECMap) {
		map["dim"] = dim
		map["parallelIndex"] = parallelIndex
		map["realtiem"] = realtiem
		map["areaSelectedStyle"] = areaSelectedStyle
		map["type"] = type
		map["name"] = name
		map["nameTextStyle"] = nameTextStyle
		map["nameLocation"] = nameLocation
		map["nameGap"] = nameGap
		map["nameRotate"] = nameRotate
		map["inverse"] = inverse
		map["boudaryGap"] = boudaryGap
		map["min"] = min
		map["max"] = max
		map["scale"] = scale
		map["splitName"] = splitName
		map["minInterval"] = minInterval
		map["interval"] = interval
		map["logBase"] = logBase
		map["silent"] = silent
		map["triggerEvent"] = triggerEvent
		map["axisLine"] = axisLine
		map["axisTick"] = axisTick
		map["axisLabel"] = axisLabel
		map["data"] = data
	}
}
