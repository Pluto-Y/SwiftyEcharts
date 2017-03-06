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

public typealias SECFunnelSerieData = SECFunnelSerie.Data

extension SECFunnelSerie.LabelLineContent : SECEnumable {
    public enum Enums {
        case show(Bool), length(Float), lineStyle(SECLineStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .length(length):
                self.length = length
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            }
        }
    }
}

extension SECFunnelSerie.LabelLineContent : SECMappable {
    public func mapping(map: SECMap) {
        map["show"] = show
        map["length"] = length
        map["lineStyle"] = lineStyle
    }
}

extension SECFunnelSerie.LabelLine : SECEnumable {
    public enum Enums {
        case normal(Style), emphasis(Style)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .normal(normal):
                self.normal = normal
            case let .emphasis(emphasis):
                self.emphasis = emphasis
            }
        }
    }
}

extension SECFunnelSerie.LabelLine : SECMappable {
    public func mapping(map: SECMap) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}

extension SECFunnelSerieData : SECEnumable {
    public enum Enums {
        case name(String), value(Float), label(SECLabel), labelLine(SECFunnelSerie.LabelLine), itemStyle(SECItemStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .value(value):
                self.value = value
            case let .label(label):
                self.label = label
            case let .labelLine(labelLine):
                self.labelLine = labelLine
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            }
        }
    }
}

extension SECFunnelSerieData : SECMappable {
    public func mapping(map: SECMap) {
        map["name"] = name
        map["value"] = value
        map["label"] = label
        map["labelLine"] = labelLine
        map["itemStyle"] = itemStyle
    }
}

extension SECFunnelSerie : SECEnumable {
    public enum Enums {
        case name(String), min(Float), max(Float), minSize(SECLength), maxSize(SECLength), sort(Sort), gap(Float), legendHoverLink(Bool), funnelAlign(SECAlign), label(SECFormattedLabel), labelLine(LabelLine), itemStyle(SECItemStyle), data([SECJsonable]), markPoint(SECMarkPoint), markLine(SECMarkLine), markArea(SECMarkArea), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(SECTime), animationEasing(SECAnimation), animationDelay(SECTime), animationDurationUpdate(SECTime), animationEasingUpdate(SECAnimation), animationDelayUpdate(SECTime)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .min(min):
                self.min = min
            case let .max(max):
                self.max = max
            case let .minSize(minSize):
                self.minSize = minSize
            case let .maxSize(maxSize):
                self.maxSize = maxSize
            case let .sort(sort):
                self.sort = sort
            case let .gap(gap):
                self.gap = gap
            case let .legendHoverLink(legendHoverLink):
                self.legendHoverLink = legendHoverLink
            case let .funnelAlign(funnelAlign):
                self.funnelAlign = funnelAlign
            case let .label(label):
                self.label = label
            case let .labelLine(labelLine):
                self.labelLine = labelLine
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .data(data):
                self.data = data
            case let .markPoint(markPoint):
                self.markPoint = markPoint
            case let .markLine(markLine):
                self.markLine = markLine
            case let .markArea(markArea):
                self.markArea = markArea
            case let .silent(silent):
                self.silent = silent
            case let .animation(animation):
                self.animation = animation
            case let .animationThreshold(animationThreshold):
                self.animationThreshold = animationThreshold
            case let .animationDuration(animationDuration):
                self.animationDuration = animationDuration
            case let .animationEasing(animationEasing):
                self.animationEasing = animationEasing
            case let .animationDelay(animationDelay):
                self.animationDelay = animationDelay
            case let .animationDurationUpdate(animationDurationUpdate):
                self.animationDurationUpdate = animationDurationUpdate
            case let .animationEasingUpdate(animationEasingUpdate):
                self.animationEasingUpdate = animationEasingUpdate
            case let .animationDelayUpdate(animationDelayUpdate):
                self.animationDelayUpdate = animationDelayUpdate
            }
        }
    }
}

extension SECFunnelSerie : SECMappable {
    public func mapping(map: SECMap) {
        map["type"] = type
        map["name"] = name
        map["min"] = min
        map["max"] = max
        map["minSize"] = minSize
        map["maxSize"] = maxSize
        map["sort"] = sort
        map["gap"] = gap
        map["legendHoverLink"] = legendHoverLink
        map["funnelAlign"] = funnelAlign
        map["label"] = label
        map["labelLine"] = labelLine
        map["itemStyle"] = itemStyle
        map["data"] = data
        map["markPoint"] = markPoint
        map["markLine"] = markLine
        map["markArea"] = markArea
        map["silent"] = silent
        map["animation"] = animation
        map["animationThreshold"] = animationThreshold
        map["animationDuration"] = animationDuration
        map["animationEasing"] = animationEasing
        map["animationDelay"] = animationDelay
        map["animationDurationUpdate"] = animationDurationUpdate
        map["animationEasingUpdate"] = animationEasingUpdate
        map["animationDelayUpdate"] = animationDelayUpdate
    }
}
