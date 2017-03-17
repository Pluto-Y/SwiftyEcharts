//
//  SECGaugeSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 07/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECGaugeSerie: SECSeries, Animatable {
    
    public struct AxisLine {
        public var show: Bool?
        public var lineStyle: LineStyle?
        
        public init() { }
    }
    
    public struct SplitLine {
        public var show: Bool?
        public var length: LengthValue?
        public var lineStyle: LineStyle?
        
        public init() { }
    }
    
    public struct AxisTick {
        public var show: Bool?
        public var splitNumber: UInt8?
        public var length: LengthValue?
        public var lineStyle: LineStyle?
        
        public init() { }
    }
    
    public struct AxisLabel: Formatted {
        public var show: Bool?
        public var distance: Float?
        public var formatter: Formatter?
        public var textStyle: TextStyle?
        public var color: Color?
        
        public init() { }
    }
    
    public struct Pointer {
        public var show: Bool?
        public var length: LengthValue?
        public var width: Float?
        
        public init() { }
    }
    
    public struct Title {
        public var show: Bool?
        public var offsetCenter: Point?
        public var textStyle: TextStyle?
        
        public init() { }
    }
    
    public struct Detail: Formatted, Borderable {
        public var show: Bool?
        public var width: Float?
        public var height: Float?
        public var backgroundColor: Color?
        public var borderWidth: Float?
        public var borderColor: Color?
        public var offsetCenter: Point?
        public var formatter: Formatter?
        public var textStyle: TextStyle?
        
        public init() { }
    }
    
    public var type: SECSerieType {
        return .gauge
    }
    
    public var name: String?
    public var radius: LengthValue?
    public var center: Point?
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
    public var itemStyle: ItemStyle?
    public var title: Title?
    public var detail: Detail?
    public var markPoint: SECMarkPoint?
    public var markLine: SECMarkLine?
    public var markArea: SECMarkArea?
    public var data: [Jsonable]?
    public var silent: Bool?
    public var animation: Bool?
    public var animationThreshold: Float?
    public var animationDuration: Time?
    public var animationEasing: EasingFunction?
    public var animationDelay: Time?
    public var animationDurationUpdate: Time?
    public var animationEasingUpdate: EasingFunction?
    public var animationDelayUpdate: Time?
    
    public init() { }
}

public typealias SECGSAxisLine = SECGaugeSerie.AxisLine
public typealias SECGSSplitLine = SECGaugeSerie.SplitLine
public typealias SECGSAxisTick = SECGaugeSerie.AxisTick
public typealias SECGSAxisLabel = SECGaugeSerie.AxisLabel
public typealias SECGSPointer = SECGaugeSerie.Pointer
public typealias SECGSTitle = SECGaugeSerie.Title
public typealias SECGSDetail = SECGaugeSerie.Detail

extension SECGSAxisLine: Enumable {
    public enum Enums {
        case show(Bool), lineStyle(LineStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            }
        }
    }
}

extension SECGSAxisLine: Mappable {
    public func mapping(map: Mapper) {
        map["show"] = show
        map["lineStyle"] = lineStyle
    }
}

extension SECGSSplitLine: Enumable {
    public enum Enums {
        case show(Bool), length(LengthValue), lineStyle(LineStyle)
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

extension SECGSSplitLine: Mappable {
    public func mapping(map: Mapper) {
        map["show"] = show
        map["length"] = length
        map["lineStyle"] = lineStyle
    }
}

extension SECGSAxisTick: Enumable {
    public enum Enums {
        case show(Bool), splitNumber(UInt8), length(LengthValue), lineStyle(LineStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .splitNumber(splitNumber):
                self.splitNumber = splitNumber
            case let .length(length):
                self.length = length
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            }
        }
    }
}

extension SECGSAxisTick: Mappable {
    public func mapping(map: Mapper) {
        map["show"] = show
        map["splitNumber"] = splitNumber
        map["length"] = length
        map["lineStyle"] = lineStyle
    }
}

extension SECGSAxisLabel: Enumable {
    public enum Enums {
        case show(Bool), distance(Float), formatter(Formatter), textStyle(TextStyle), color(Color)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .distance(distance):
                self.distance = distance
            case let .formatter(formatter):
                self.formatter = formatter
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            case let .color(color):
                self.color = color
            }
        }
    }
}

extension SECGSAxisLabel: Mappable {
    public func mapping(map: Mapper) {
        map["show"] = show
        map["distance"] = distance
        map["formatter"] = formatter
        map["textStyle"] = textStyle
        map["color"] = color
    }
}

extension SECGSPointer: Enumable {
    public enum Enums {
        case show(Bool), length(LengthValue), width(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .length(length):
                self.length = length
            case let .width(width):
                self.width = width
            }
        }
    }
}

extension SECGSPointer: Mappable {
    public func mapping(map: Mapper) {
        map["show"] = show
        map["length"] = length
        map["width"] = width
    }
}

extension SECGSTitle: Enumable {
    public enum Enums {
        case show(Bool), offsetCenter(Point), textStyle(TextStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .offsetCenter(offsetCenter):
                self.offsetCenter = offsetCenter
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            }
        }
    }
}

extension SECGSTitle: Mappable {
    public func mapping(map: Mapper) {
        map["show"] = show
        map["offsetCenter"] = offsetCenter
        map["textStyle"] = textStyle
    }
}

extension SECGSDetail: Enumable {
    public enum Enums {
        case show(Bool), width(Float), height(Float), backgroundColor(Color), borderWidth(Float), borderColor(Color), offsetCenter(Point), formatter(Formatter), textStyle(TextStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .width(width):
                self.width = width
            case let .height(height):
                self.height = height
            case let .backgroundColor(backgroundColor):
                self.backgroundColor = backgroundColor
            case let .borderWidth(borderWidth):
                self.borderWidth = borderWidth
            case let .borderColor(borderColor):
                self.borderColor = borderColor
            case let .offsetCenter(offsetCenter):
                self.offsetCenter = offsetCenter
            case let .formatter(formatter):
                self.formatter = formatter
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            }
        }
    }
}

extension SECGSDetail: Mappable {
    public func mapping(map: Mapper) {
        map["show"] = show
        map["width"] = width
        map["height"] = height
        map["backgroundColor"] = backgroundColor
        map["borderWidth"] = borderWidth
        map["borderColor"] = borderColor
        map["offsetCenter"] = offsetCenter
        map["formatter"] = formatter
        map["textStyle"] = textStyle
    }
}

extension SECGaugeSerie: Enumable {
    public enum Enums {
        case name(String), radius(LengthValue), center(Point), startAngle(Float), endAngle(Float), clockwise(Bool), min(Float), max(Float), splitNumber(Float), axisLine(AxisLine), splitLine(SplitLine), axisTick(AxisTick), axisLabel(AxisLabel), pointer(Pointer), itemStyle(ItemStyle), title(Title), detail(Detail), markPoint(SECMarkPoint), markLine(SECMarkLine), markArea(SECMarkArea), data([Jsonable]), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(Time), animationEasing(EasingFunction), animationDelay(Time), animationDurationUpdate(Time), animationEasingUpdate(EasingFunction), animationDelayUpdate(Time)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .radius(radius):
                self.radius = radius
            case let .center(center):
                self.center = center
            case let .startAngle(startAngle):
                self.startAngle = startAngle
            case let .endAngle(endAngle):
                self.endAngle = endAngle
            case let .clockwise(clockwise):
                self.clockwise = clockwise
            case let .min(min):
                self.min = min
            case let .max(max):
                self.max = max
            case let .splitNumber(splitNumber):
                self.splitNumber = splitNumber
            case let .axisLine(axisLine):
                self.axisLine = axisLine
            case let .splitLine(splitLine):
                self.splitLine = splitLine
            case let .axisTick(axisTick):
                self.axisTick = axisTick
            case let .axisLabel(axisLabel):
                self.axisLabel = axisLabel
            case let .pointer(pointer):
                self.pointer = pointer
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .title(title):
                self.title = title
            case let .detail(detail):
                self.detail = detail
            case let .markPoint(markPoint):
                self.markPoint = markPoint
            case let .markLine(markLine):
                self.markLine = markLine
            case let .markArea(markArea):
                self.markArea = markArea
            case let .data(data):
                self.data = data
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

extension SECGaugeSerie: Mappable {
    public func mapping(map: Mapper) {
        map["type"] = type
        map["name"] = name
        map["radius"] = radius
        map["center"] = center
        map["startAngle"] = startAngle
        map["endAngle"] = endAngle
        map["clockwise"] = clockwise
        map["min"] = min
        map["max"] = max
        map["splitNumber"] = splitNumber
        map["axisLine"] = axisLine
        map["splitLine"] = splitLine
        map["axisTick"] = axisTick
        map["axisLabel"] = axisLabel
        map["pointer"] = pointer
        map["itemStyle"] = itemStyle
        map["title"] = title
        map["detail"] = detail
        map["markPoint"] = markPoint
        map["markLine"] = markLine
        map["markArea"] = markArea
        map["data"] = data
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

