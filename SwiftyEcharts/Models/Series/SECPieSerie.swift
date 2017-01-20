//
//  SECPieSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 20/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECPieSerie : SECSeries, SECAnimatable {
    
    public struct LabelLineContent : SECDisplayable {
        public var show: Bool?
        public var length: Float?
        public var length2: Float?
        public var smooth: Bool?
        public var lineStyle: SECCommonLineStyle?
    }
    
    public struct LabelLine : SECEmphasisable {
        public typealias Style = LabelLineContent
        
        public var normal: Style?
        public var emphasis: Style?
    }
    
    public var type: SECSerieType {
        return .pie
    }
    
    public var name: String?
    public var legendHoverLink: Bool?
    public var hoverAnimation: Bool?
    public var selectedMode: SECSelectedMode?
    public var clockwise: Bool?
    public var startAngle: Float?
    public var minAngle: Float?
    public var roseType: Bool?
    public var avoidLabelOverlap: Bool?
    public var stillShowZeroSum: Bool?
    public var label: SECFormattedLabel?
    public var labelLine: LabelLine?
    public var itemStyle: SECItemStyle?
    public var zlevel: Float?
    public var z: Float?
    public var center: [Float]? // 暂不支持百分比形式
    public var radius: [Float]? // 暂不支持百分比形式
    public var data: [Any]?
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
}

