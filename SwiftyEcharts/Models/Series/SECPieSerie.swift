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

extension SECPieSerie.LabelLineContent : SECEnumable {
    public enum Enums {
        case show(Bool), length(Float), length2(Float), smooth(Bool), lineStyle(SECCommonLineStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .length(length):
                self.length = length
            case let .length2(length2):
                self.length2 = length2
            case let .smooth(smooth):
                self.smooth = smooth
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            }
        }
    }
}

extension SECPieSerie.LabelLineContent : SECMappable {
    public func mapping(map: SECMap) {
        map["show"] = show
        map["length"] = length
        map["length2"] = length2
        map["smooth"] = smooth
        map["lineStyle"] = lineStyle
    }
}

extension SECPieSerie.LabelLine : SECEnumable {
    public enum Enums {
        case normal(Style), emphasis(Style)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
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

extension SECPieSerie.LabelLine : SECMappable {
    public func mapping(map: SECMap) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}

extension SECPieSerie : SECEnumable {
    public enum Enums {
        case name(String), legendHoverLink(Bool), hoverAnimation(Bool), selectedMode(SECSelectedMode), clockwise(Bool), startAngle(Float), minAngle(Float), roseType(Bool), avoidLabelOverlap(Bool), stillShowZeroSum(Bool), label(SECFormattedLabel), labelLine(LabelLine), itemStyle(SECItemStyle), zlevel(Float), z(Float), center([Float]), radius([Float]), data([Any]), markPoint(SECMarkPoint), markLine(SECMarkLine), markArea(SECMarkArea), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(SECTime), animationEasing(SECAnimation), animationDelay(SECTime), animationDurationUpdate(SECTime), animationEasingUpdate(SECAnimation), animationDelayUpdate(SECTime)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .legendHoverLink(legendHoverLink):
                self.legendHoverLink = legendHoverLink
            case let .hoverAnimation(hoverAnimation):
                self.hoverAnimation = hoverAnimation
            case let .selectedMode(selectedMode):
                self.selectedMode = selectedMode
            case let .clockwise(clockwise):
                self.clockwise = clockwise
            case let .startAngle(startAngle):
                self.startAngle = startAngle
            case let .minAngle(minAngle):
                self.minAngle = minAngle
            case let .roseType(roseType):
                self.roseType = roseType
            case let .avoidLabelOverlap(avoidLabelOverlap):
                self.avoidLabelOverlap = avoidLabelOverlap
            case let .stillShowZeroSum(stillShowZeroSum):
                self.stillShowZeroSum = stillShowZeroSum
            case let .label(label):
                self.label = label
            case let .labelLine(labelLine):
                self.labelLine = labelLine
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .zlevel(zlevel):
                self.zlevel = zlevel
            case let .z(z):
                self.z = z
            case let .center(center):
                self.center = center
            case let .radius(radius):
                self.radius = radius
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

extension SECPieSerie : SECMappable {
    public func mapping(map: SECMap) {
        map["type"] = type
        map["name"] = name
        map["legendHoverLink"] = legendHoverLink
        map["selectedMode"] = selectedMode
        map["clockwise"] = clockwise
        map["startAngle"] = startAngle
        map["minAngle"] = minAngle
        map["roseType"] = roseType
        map["avoidLabelOverlap"] = avoidLabelOverlap
        map["stillShowZeroSum"] = stillShowZeroSum
        map["label"] = label
        map["labelLine"] = labelLine
        map["itemStyle"] = itemStyle
        map["zlevel"] = zlevel
        map["z"] = z
        map["center"] = center
        map["radius"] = radius
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

