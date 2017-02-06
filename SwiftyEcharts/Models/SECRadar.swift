//
//  SECRadar.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECRadar {
    public struct Name : SECDisplayable, SECFormatted, SECTextful {
        public var show: Bool?
        public var formatter: SECFormatter?
        public var textStyle: SECTextStyle?
    }
    
    /// 雷达图绘制类型
    ///
    /// - polygon:
    /// - circle: 
    public enum Shape : String {
        case polygon = "polygon"
        case circle = "circle"
    }
    
    public struct Indicator {
        public var name: String?
        public var max: Float?
        public var min: Float?
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
    
}
