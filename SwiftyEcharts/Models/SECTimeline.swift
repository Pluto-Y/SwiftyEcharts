//
//  SECTimeline.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 19/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECTimeline : SECDisplayable, SECSymbolized {
    public enum AxisType : String, SECJsonable {
        case value = "value"
        case category = "category"
        case time = "time"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
        }
    }
    
    public struct LineStyle : SECDisplayable, SECShadowable, SECColorful, SECOpacitable {
        public var show: Bool?
        public var color: SECColor?
        public var width: Float?
        public var type: SECLineType?
        public var shadowBlur: Float?
        public var shadowColor: SECColor?
        public var shadowOffsetX: Float?
        public var shadowOffsetY: Float?
        public var opacity: Float?
    }
    
    public struct CheckpointStyle : SECSymbolized, SECColorful, SECBorderable {
       public var symbol: SECSymbol?
        public var symbolSize: Float?
        public var symbolRotate: Float?
        public var symbolOffset: [Float]?
        public var color: SECColor?
        public var borderWidth: Float?
        public var borderColor: SECColor?
        public var animation: Bool?
        public var animationDuration: Float?
        public var animationEasing: SECAnimation?
    }
    
    public struct ControlStyle : SECDisplayable, SECEmphasisable {
        
        public struct CStyle : SECColorful, SECBorderable {
            public var color: SECColor?
            public var borderWidth: Float?
            public var borderColor: SECColor?
        }
        
        public typealias Style = CStyle
        
        public var show: Bool?
        public var showPlayBtn: Bool?
        public var showPrevBtn: Bool?
        public var showNextBtn: Bool?
        public var itemSize: Float?
        public var itemGap: Float?
        public var position: SECPosition?
        public var palyIcon: String?
        public var stopIcon: String?
        public var prevIcon: String?
        public var nextIcon: String?
        public var normal: CStyle?
        public var emphasis: CStyle?
    }
    
    public var show: Bool?
    public var type: String {
        return "slider"
    }
    public var current: UInt?
    public var autoPlay: Bool??
    public var rewind: Bool?
    public var loop: Bool?
    public var playInterval: Float?
    public var realtime: Bool?
    public var controlPosition: String?
    public var zlevel: Float?
    public var z: Float?
    public var left: SECPosition?
    public var top: SECPosition?
    public var right: SECPosition?
    public var bottom: SECPosition?
    public var padding: SECPadding?
    public var orient: SECOrient?
    public var inverse: Bool?
    public var symbol: SECSymbol?
    public var symbolSize: Float?
    public var symbolRotate: Float?
    public var symbolOffset: [Float]?
    public var lineStyle: LineStyle?
//    public var label: // FIXME?
    public var itemStyle: SECItemStyle?
    public var checkpointStyle: CheckpointStyle?
    public var controlStyle: ControlStyle?
    public var data: [Any]?
    
}
