//
//  SECFunnelSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECFunnelSerie: SECSeries, SECAnimatable {
    
    public enum Sort: String, SECJsonable {
        case ascending = "ascending"
        case descending = "descending"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
        }
    }
    
    public struct LabelLineContent {
        public var show: Bool?
        public var length: Float?
        public var lineStyle: SECLineStyle?
        
        public init() { }
    }
    
    public struct LabelLine: SECEmphasisable {
        public typealias Style = LabelLineContent
        
        public var normal: Style?
        public var emphasis: Style?
        
        public init() { }
    }
    
    public struct Data {
        public var name: String?
        public var value: Float?
        public var label: SECLabel?
        public var labelLine: LabelLine?
        public var itemStyle: SECItemStyle?
        
        public init() { }
    }
    
    public var type: SECSerieType {
        return .funnel
    }
    
    public var name: String?
    public var min: Float?
    public var max: Float?
    public var minSize: SECLength?
    public var maxSize: SECLength?
    public var sort: Sort?
    public var gap: Float?
    public var legendHoverLink: Bool?
    public var funnelAlign: SECAlign?
    public var label: SECFormattedLabel?
    public var labelLine: LabelLine?
    public var itemStyle: SECItemStyle?
    public var data: [SECJsonable]?
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
