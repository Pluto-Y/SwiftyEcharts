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
