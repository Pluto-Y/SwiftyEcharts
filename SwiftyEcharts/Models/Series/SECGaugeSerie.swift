//
//  SECGaugeSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 07/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECGaugeSerie: SECSeries, SECAnimatable {
    
    public struct AxisLine {
        public var show: Bool?
        public var lineStyle: SECLineStyle?
        
        public init() { }
    }
    
    public struct SplitLine {
        public var show: Bool?
        public var length: SECLength?
        public var lineStyle: SECLineStyle?
        
        public init() { }
    }
    
    public struct AxisTick {
        public var show: Bool?
        public var splitNumber: UInt8?
        public var length: SECLength?
        public var lineStyle: SECLineStyle?
        
        public init() { }
    }
    
    public struct AxisLabel: SECFormatted {
        public var show: Bool?
        public var distance: Float?
        public var formatter: SECFormatter?
        public var textStyle: SECTextStyle?
        public var color: SECColor?
        
        public init() { }
    }
    
    public struct Pointer {
        public var show: Bool?
        public var length: SECLength?
        public var width: Float?
        
        public init() { }
    }
    
    public struct Title {
        public var show: Bool?
        public var offsetCenter: SECPoint?
        public var textStyle: SECTextStyle?
        
        public init() { }
    }
    
    public struct Detail: SECFormatted, SECBorderable {
        public var show: Bool?
        public var width: Float?
        public var height: Float?
        public var backgroundColor: SECColor?
        public var borderWidth: Float?
        public var borderColor: SECColor?
        public var offsetCenter: SECPoint?
        public var formatter: SECFormatter?
        public var textStyle: SECTextStyle?
        
        public init() { }
    }
    
    public var type: SECSerieType {
        return .gauge
    }
    
    public var name: String?
    public var radius: SECLength?
    public var startAngle: Float?
    public var endAngle: Float?
    public var clockwise: Bool?
    public var min: Float?
    public var max: Float?
    public var splitNumber: Float?
    public var axisLine: AxisLine?
    public var splitLine: SplitLine?
    public var axisTick: AxisTick?
    public var axisLabel: AxisLabel?
    public var pointer: Pointer?
    public var itemStyle: SECItemStyle?
    public var title: Title?
    public var detail: Detail?
    public var markPoint: SECMarkPoint?
    public var markLine: SECMarkLine?
    public var markArea: SECMarkArea?
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
