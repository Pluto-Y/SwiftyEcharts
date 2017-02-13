//
//  SECTreemapSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 13/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECTreemapSerie : SECSeries, SECZable {
    
    public struct Level {
        public var visualDimension: Float?
        public var visualMin: Float?
        public var visualMax: Float?
        public var color: [SECColor]?
        public var colorAlpha: [Float]?
        public var colorSaturation: [Float]?
        public var colorMappingBy: ColorMappingBy?
        public var visibleMin: Float?
        public var childrenVisibleMin: Float?
        public var label: SECLabel?
        public var itemStyle: SECItemStyle?
        
        public init() {}
    }
    
    public struct Silent {
        public var link: String?
        public var target: SECTarget?
        public var children: [Any]?
        
        public init() {}
    }
    
    public struct Breadcrumb : SECDisplayable {
        public var show: Bool?
        public var left: SECPosition?
        public var top: SECPosition?
        public var right: SECPosition?
        public var bottom: SECPosition?
        public var height: Float?
        public var emptyItemWidth: Float?
        public var itemStyle: SECItemStyle?
        
        public init() {}
    }
    
    public struct Data {
        public var value: Float?
        public var id: String?
        public var name: String?
        public var visualDimension: Float?
        public var visualMin: Float?
        public var visualMax: Float?
        public var color: [SECColor]?
        public var colorAlpha: [Float]?
        public var colorSaturation: Float?
        public var colorMappingBy: ColorMappingBy?
        public var visibleMin: Float?
        public var childrenVisibleMin: Float?
        public var label: SECLabel?
        public var itemStyle: SECItemStyle?
        
        public init() {}
    }
    
    public enum NodeClick : String, SECJsonable {
        case disable = "false"
        case zoomToNode = "zoomToNode"
        case link = "link"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
        }
    }
    
    public enum ColorMappingBy : String, SECJsonable {
        case value = "value"
        case index = "index"
        case id = "id"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
        }
    }
    
    public var type: SECSerieType {
        return .treemap
    }

    public var zlevel: Float?
    public var z: Float?
    public var left: SECPosition?
    public var top: SECPosition?
    public var right: SECPosition?
    public var bottom: SECPosition?
    public var width: Float?
    public var height: Float?
    public var squareRotio: Float?
    public var leafDepth: Float?
    public var roam: Bool?
    public var nodeClick: NodeClick?
    public var zoomToNodeRatio: Float?
    public var level: [Level]?
    public var silent: Silent?
    public var visualDimentsion: Float?
    public var visualMin: Float?
    public var visualMax: Float?
    public var colorAlpha: [Float]?
    public var colorSaturation: [Float]?
    public var colorMappingBy: ColorMappingBy?
    public var visibleMin: Float?
    public var childrenVisibleMin: Float?
    public var label: SECLabel?
    public var itemStyle: SECItemStyle?
    public var breadcrumb: Breadcrumb?
    public var data: [Any]?
    public var animationDuration: Float?
    public var animationEasing: SECAnimation?
    public var animationDelay: SECTime?
    
    public init() {}
}
