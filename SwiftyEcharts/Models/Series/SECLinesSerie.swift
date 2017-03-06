//
//  SECLinesSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECLinesSerie : SECSeries, SECZable, SECAnimatable {
    
    public struct Effect {
        public var show: Bool?
        public var period: Float?
        public var constantSpeed: Float?
        public var symbol: SECSymbol?
        public var symbolSize: Float?
        public var color: SECColor?
        public var trailLength: Float?
        public var loop: Bool?
        
        public init() { }
    }
    
    public var type: SECSerieType {
        return .lines
    }
    
    public var name: String?
    public var coordinateSystem: SECCoordinateSystem?
    public var xAxisIndex: UInt8?
    public var yAxisIndex: UInt8?
    public var geoIndex: UInt8?
    public var polyline: Bool?
    public var effect: Effect?
    public var large: Bool?
    public var largeThreshold: Float?
    public var symbol: SECSymbol?
    public var symbolSize: Float?
    public var lineStyle: SECLineStyle?
    public var label: SECFormattedLabel?
    public var data: [SECJsonable]?
    public var markPoint: SECMarkPoint?
    public var markLine: SECMarkLine?
    public var markArea: SECMarkArea?
    public var zlevel: Float?
    public var z: Float?
    public var silent: Bool?
    public var animation: Bool?
    public var animationThreshold: Float?
    public var animationDuration: SECTime?
    public var animationEasing: SECAnimation?
    public var animationDelay: SECTime?
    public var animationDurationUpdate: SECTime?
    public var animationEasingUpdate: SECAnimation?
    public var animationDelayUpdate: SECTime?
    
    public init() { }
}
