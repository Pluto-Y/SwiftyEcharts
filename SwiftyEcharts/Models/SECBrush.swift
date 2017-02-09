//
//  SECBrush.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 09/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECBrush {
    /// <#Description#>
    ///
    /// - indexs: <#indexs description#>
    /// - all: <#all description#>
    /// - none: <#none description#>
    public enum Indexes : SECJsonable {
        case indexes([Int])
        case all
        case none
        
        public var jsonString: String {
            switch self {
            case .all:
                return "\"all\""
            case .none:
                return "\"none\""
            case let .indexes(indexes):
                return indexes.jsonString
            }
        }
    }
    
    /// <#Description#>
    ///
    /// - rect: <#rect description#>
    /// - polygon: <#polygon description#>
    /// - lineX: <#lineX description#>
    /// - lineY: <#lineY description#>
    public enum Type : String, SECJsonable {
       case rect = "rect"
        case polygon = "polygon"
        case lineX = "lineX"
        case lineY = "lineY"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
        }
    }
    
    /// <#Description#>
    ///
    /// - single: <#single description#>
    /// - multiple: <#multiple description#>
    public enum Mode : String, SECJsonable {
        case single = "single"
        case multiple = "multiple"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
        }
    }
    
    /// <#Description#>
    ///
    /// - debounce: <#debounce description#>
    /// - fixRate: <#fixRate description#>
    public enum ThrottleType : String, SECJsonable {
        case debounce = "debounce"
        case fixRate = "fixRate"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
        }
    }
    
    public struct Style : SECColorful {
        public var borderWidth: Float?
        public var color: SECColor?
        public var borderColor: SECColor?
        public var width: Float?
    }
    
    public var toolbox: SECToolbox?
    public var brushLink: Indexes?
    public var seriesIndex: Indexes?
    public var geoIndex: Indexes?
    public var xAxisIndex: Indexes?
    public var yAxisIndex: Indexes?
    public var brushType: Type?
    public var brushMode: Mode?
    public var transformable: Bool?
    public var brushStyle: Style?
    public var throttleType: ThrottleType?
    public var throttleDelay: Float?
    public var inBrush: String?  // FIXME: 还需研究
    public var outOfBrush: String? // FIXME: 还需研究
}

extension SECBrush.Style : SECEnumable {
	public enum Enums {
		case borderWidth(Float), color(SECColor), borderColor(SECColor), width(Float)
	}

	public typealias ContentEnum = Enums

	public init(_ elements: [Enums]) {
		for ele in elements {
			switch ele {
				case let .borderWidth(borderWidth):
					self.borderWidth = borderWidth
				case let .color(color):
					self.color = color
				case let .borderColor(borderColor):
					self.borderColor = borderColor
				case let .width(width):
					self.width = width
			}
		}
	}
}

extension SECBrush.Style : SECMappable {
	public func mapping(map: SECMap) {
		map["borderWidth"] = borderWidth
		map["color"] = color
		map["borderColor"] = borderColor
		map["width"] = width
	}
}

extension SECBrush : SECEnumable {
	public enum Enums {
		case toolbox(SECToolbox), brushLink(Indexes), seriesIndex(Indexes), geoIndex(Indexes), xAxisIndex(Indexes), yAxisIndex(Indexes), brushType(Type), brushMode(Mode), transformable(Bool), brushStyle(Style), throttleType(ThrottleType), throttleDelay(Float), inBrush(String), outOfBrush(String)
	}

	public typealias ContentEnum = Enums

	public init(_ elements: [Enums]) {
		for ele in elements {
			switch ele {
				case let .toolbox(toolbox):
					self.toolbox = toolbox
				case let .brushLink(brushLink):
					self.brushLink = brushLink
				case let .seriesIndex(seriesIndex):
					self.seriesIndex = seriesIndex
				case let .geoIndex(geoIndex):
					self.geoIndex = geoIndex
				case let .xAxisIndex(xAxisIndex):
					self.xAxisIndex = xAxisIndex
				case let .yAxisIndex(yAxisIndex):
					self.yAxisIndex = yAxisIndex
				case let .brushType(brushType):
					self.brushType = brushType
				case let .brushMode(brushMode):
					self.brushMode = brushMode
				case let .transformable(transformable):
					self.transformable = transformable
				case let .brushStyle(brushStyle):
					self.brushStyle = brushStyle
				case let .throttleType(throttleType):
					self.throttleType = throttleType
				case let .throttleDelay(throttleDelay):
					self.throttleDelay = throttleDelay
				case let .inBrush(inBrush):
					self.inBrush = inBrush
				case let .outOfBrush(outOfBrush):
					self.outOfBrush = outOfBrush
			}
		}
	}
}

extension SECBrush : SECMappable {
	public func mapping(map: SECMap) {
		map["toolbox"] = toolbox
		map["brushLink"] = brushLink
		map["seriesIndex"] = seriesIndex
		map["geoIndex"] = geoIndex
		map["xAxisIndex"] = xAxisIndex
		map["yAxisIndex"] = yAxisIndex
		map["brushType"] = brushType
		map["brushMode"] = brushMode
		map["transformable"] = transformable
		map["brushStyle"] = brushStyle
		map["throttleType"] = throttleType
		map["throttleDelay"] = throttleDelay
		map["inBrush"] = inBrush
		map["outOfBrush"] = outOfBrush
	}
}
