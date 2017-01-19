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
    
    public struct LineStyle {
        
    }
    
    public struct CheckpointStyle {
        
    }
    
    public struct ControlStyle {
        
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
