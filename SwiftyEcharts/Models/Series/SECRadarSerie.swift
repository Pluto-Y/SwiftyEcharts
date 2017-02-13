//
//  SECRadarSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 13/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECRadarSerie : SECSeries, SECSymbolized, SECZable, SECAnimatable {
    
    public struct Data : SECSymbolized {
        public var name: String?
        public var value: Float?
        public var symbol: SECSymbol?
        public var symbolSize: Float?
        public var symbolRotate: Float?
        public var symbolOffset: [Float]?
        public var label: SECFormattedLabel?
        public var itemStyle: SECItemStyle?
        public var lineStyle: SECLineStyle?
        public var areStyle: SECAreaStyle?
        
        public init() {}
    }
    
    public var type: SECSerieType {
        return .radar
    }
    
    public var name: String?
    public var radarIndex: UInt8?
    public var symbol: SECSymbol?
    public var symbolSize: Float?
    public var symbolRotate: Float?
    public var symbolOffset: [Float]?
    public var label: SECFormattedLabel?
    public var itemStyle: SECItemStyle?
    public var lineStyle: SECLineStyle?
    public var areStyle: SECAreaStyle?
    public var data: [Any]?
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
    
    public init() {}
}
