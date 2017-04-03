//
//  PictorialBarSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/04/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct PictorialBarSerie: Serie, Symbolized, Zable, Animatable {
    
    public struct Data: Symbolized, Animatable {
        public var name: String?
        public var value: Jsonable?
        public var symbol: Symbol?
        public var symbolSize: Float?
        public var symbolPosition: Position?
        public var symbolOffset: Point?
        public var symbolRotate: Float?
        public var symbolRepeat: String?
        public var symbolRepeatDirection: String?
        public var symbolMargin: String?
        public var symbolClip: String?
        public var symbolBoundingData: String?
        public var symbolPatterSize: Float?
        public var z: Float?
        public var hoverAnimation: Bool?
        public var animation: Bool?
        public var animationThreshold: Float?
        public var animationDuration: Time?
        public var animationEasing: EasingFunction?
        public var animationDurationUpdate: Time?
        public var animationEasingUpdate: EasingFunction?
        public var animationDelay: Time?
        public var animationDelayUpdate: Time?
        public var label: FormattedLabel?
        public var itemStyle: ItemStyle?
        public var tooltip: Tooltip?
        
        public init() { }
    }
    
    public var type: SerieType {
        return .pictorialBar
    }
    
    public var name: String?
    public var legendHoverLine: Bool?
    public var coordinateSystem: CoordinateSystem?
    public var xAxisIndex: UInt8?
    public var yAxisIndex: UInt8?
    public var label: FormattedLabel?
    public var itemStyle: ItemStyle?
    public var barWidth: LengthValue?
    public var barMaxWidth: LengthValue?
    public var barMinHeight: LengthValue?
    public var barGap: LengthValue?
    public var barCategoryGap: LengthValue?
    public var symbol: Symbol?
    public var symbolSize: Float?
    public var symbolPosition: Position?
    public var symbolOffset: Point?
    public var symbolRotate: Float?
    public var symbolRepeat: String?  // ?????
    public var symbolRepeatDirection: String?   // ?????
    public var symbolMargin: String?   // ?????
    public var symbolClip: Bool?
    public var symbolBoundingData: String?   // ?????
    public var symbolPatternSize: Float?
    public var hoverAnimation: Bool?
    public var data: [Jsonable]?
    public var markPoint: MarkPoint?
    public var markLine: MarkLine?
    public var markArea: MarkArea?
    public var zlevel: Float?
    public var z: Float?
    public var silent: Bool?
    public var animation: Bool?
    public var animationThreshold: Float?
    public var animationDuration: Time?
    public var animationEasing: EasingFunction?
    public var animationDurationUpdate: Time?
    public var animationDelayUpdate: Time?
    public var animationDelay: Time?
    public var animationEasingUpdate: EasingFunction?
    public var tooltip: Tooltip?
    
    public init() { }
}

extension PictorialBarSerie.Data : Enumable {
    public enum Enums {
        case name(String), value(Jsonable), symbol(Symbol), symbolSize(Float), symbolPosition(Position), symbolOffset(Point), symbolRotate(Float), symbolRepeat(String), symbolRepeatDirection(String), symbolMargin(String), symbolClip(String), symbolBoundingData(String), symbolPatterSize(Float), z(Float), hoverAnimation(Bool), animation(Bool), animationThreshold(Float), animationDuration(Time), animationEasing(EasingFunction), animationDurationUpdate(Time), animationEasingUpdate(EasingFunction), animationDelay(Time), animationDelayUpdate(Time), label(FormattedLabel), itemStyle(ItemStyle), tooltip(Tooltip)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .value(value):
                self.value = value
            case let .symbol(symbol):
                self.symbol = symbol
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            case let .symbolPosition(symbolPosition):
                self.symbolPosition = symbolPosition
            case let .symbolOffset(symbolOffset):
                self.symbolOffset = symbolOffset
            case let .symbolRotate(symbolRotate):
                self.symbolRotate = symbolRotate
            case let .symbolRepeat(symbolRepeat):
                self.symbolRepeat = symbolRepeat
            case let .symbolRepeatDirection(symbolRepeatDirection):
                self.symbolRepeatDirection = symbolRepeatDirection
            case let .symbolMargin(symbolMargin):
                self.symbolMargin = symbolMargin
            case let .symbolClip(symbolClip):
                self.symbolClip = symbolClip
            case let .symbolBoundingData(symbolBoundingData):
                self.symbolBoundingData = symbolBoundingData
            case let .symbolPatterSize(symbolPatterSize):
                self.symbolPatterSize = symbolPatterSize
            case let .z(z):
                self.z = z
            case let .hoverAnimation(hoverAnimation):
                self.hoverAnimation = hoverAnimation
            case let .animation(animation):
                self.animation = animation
            case let .animationThreshold(animationThreshold):
                self.animationThreshold = animationThreshold
            case let .animationDuration(animationDuration):
                self.animationDuration = animationDuration
            case let .animationEasing(animationEasing):
                self.animationEasing = animationEasing
            case let .animationDurationUpdate(animationDurationUpdate):
                self.animationDurationUpdate = animationDurationUpdate
            case let .animationEasingUpdate(animationEasingUpdate):
                self.animationEasingUpdate = animationEasingUpdate
            case let .animationDelay(animationDelay):
                self.animationDelay = animationDelay
            case let .animationDelayUpdate(animationDelayUpdate):
                self.animationDelayUpdate = animationDelayUpdate
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .tooltip(tooltip):
                self.tooltip = tooltip
            }
        }
    }
}

extension PictorialBarSerie.Data : Mappable {
    public func mapping(_ map: Mapper) {
        map["name"] = name
        map["value"] = value
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["symbolPosition"] = symbolPosition
        map["symbolOffset"] = symbolOffset
        map["symbolRotate"] = symbolRotate
        map["symbolRepeat"] = symbolRepeat
        map["symbolRepeatDirection"] = symbolRepeatDirection
        map["symbolMargin"] = symbolMargin
        map["symbolClip"] = symbolClip
        map["symbolBoundingData"] = symbolBoundingData
        map["symbolPatterSize"] = symbolPatterSize
        map["z"] = z
        map["hoverAnimation"] = hoverAnimation
        map["animation"] = animation
        map["animationThreshold"] = animationThreshold
        map["animationDuration"] = animationDuration
        map["animationEasing"] = animationEasing
        map["animationDurationUpdate"] = animationDurationUpdate
        map["animationEasingUpdate"] = animationEasingUpdate
        map["animationDelay"] = animationDelay
        map["animationDelayUpdate"] = animationDelayUpdate
        map["label"] = label
        map["itemStyle"] = itemStyle
        map["tooltip"] = tooltip
    }
}

extension PictorialBarSerie : Enumable {
    public enum Enums {
        case name(String), legendHoverLine(Bool), coordinateSystem(CoordinateSystem), xAxisIndex(UInt8), yAxisIndex(UInt8), label(FormattedLabel), itemStyle(ItemStyle), barWidth(LengthValue), barMaxWidth(LengthValue), barMinHeight(LengthValue), barGap(LengthValue), barCategoryGap(LengthValue), symbol(Symbol), symbolSize(Float), symbolPosition(Position), symbolOffset(Point), symbolRotate(Float), symbolRepeat(String), symbolRepeatDirection(String), symbolMargin(String), symbolClip(Bool), symbolBoundingData(String), symbolPatternSize(Float), hoverAnimation(Bool), data([Jsonable]), markPoint(MarkPoint), markLine(MarkLine), markArea(MarkArea), zlevel(Float), z(Float), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(Time), animationEasing(EasingFunction), animationDurationUpdate(Time), animationDelayUpdate(Time), animationDelay(Time), animationEasingUpdate(EasingFunction), tooltip(Tooltip)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .legendHoverLine(legendHoverLine):
                self.legendHoverLine = legendHoverLine
            case let .coordinateSystem(coordinateSystem):
                self.coordinateSystem = coordinateSystem
            case let .xAxisIndex(xAxisIndex):
                self.xAxisIndex = xAxisIndex
            case let .yAxisIndex(yAxisIndex):
                self.yAxisIndex = yAxisIndex
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .barWidth(barWidth):
                self.barWidth = barWidth
            case let .barMaxWidth(barMaxWidth):
                self.barMaxWidth = barMaxWidth
            case let .barMinHeight(barMinHeight):
                self.barMinHeight = barMinHeight
            case let .barGap(barGap):
                self.barGap = barGap
            case let .barCategoryGap(barCategoryGap):
                self.barCategoryGap = barCategoryGap
            case let .symbol(symbol):
                self.symbol = symbol
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            case let .symbolPosition(symbolPosition):
                self.symbolPosition = symbolPosition
            case let .symbolOffset(symbolOffset):
                self.symbolOffset = symbolOffset
            case let .symbolRotate(symbolRotate):
                self.symbolRotate = symbolRotate
            case let .symbolRepeat(symbolRepeat):
                self.symbolRepeat = symbolRepeat
            case let .symbolRepeatDirection(symbolRepeatDirection):
                self.symbolRepeatDirection = symbolRepeatDirection
            case let .symbolMargin(symbolMargin):
                self.symbolMargin = symbolMargin
            case let .symbolClip(symbolClip):
                self.symbolClip = symbolClip
            case let .symbolBoundingData(symbolBoundingData):
                self.symbolBoundingData = symbolBoundingData
            case let .symbolPatternSize(symbolPatternSize):
                self.symbolPatternSize = symbolPatternSize
            case let .hoverAnimation(hoverAnimation):
                self.hoverAnimation = hoverAnimation
            case let .data(data):
                self.data = data
            case let .markPoint(markPoint):
                self.markPoint = markPoint
            case let .markLine(markLine):
                self.markLine = markLine
            case let .markArea(markArea):
                self.markArea = markArea
            case let .zlevel(zlevel):
                self.zlevel = zlevel
            case let .z(z):
                self.z = z
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
            case let .animationDurationUpdate(animationDurationUpdate):
                self.animationDurationUpdate = animationDurationUpdate
            case let .animationDelayUpdate(animationDelayUpdate):
                self.animationDelayUpdate = animationDelayUpdate
            case let .animationDelay(animationDelay):
                self.animationDelay = animationDelay
            case let .animationEasingUpdate(animationEasingUpdate):
                self.animationEasingUpdate = animationEasingUpdate
            case let .tooltip(tooltip):
                self.tooltip = tooltip
            }
        }
    }
}

extension PictorialBarSerie : Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["name"] = name
        map["legendHoverLine"] = legendHoverLine
        map["coordinateSystem"] = coordinateSystem
        map["xAxisIndex"] = xAxisIndex
        map["yAxisIndex"] = yAxisIndex
        map["label"] = label
        map["itemStyle"] = itemStyle
        map["barWidth"] = barWidth
        map["barMaxWidth"] = barMaxWidth
        map["barMinHeight"] = barMinHeight
        map["barGap"] = barGap
        map["barCategoryGap"] = barCategoryGap
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["symbolPosition"] = symbolPosition
        map["symbolOffset"] = symbolOffset
        map["symbolRotate"] = symbolRotate
        map["symbolRepeat"] = symbolRepeat
        map["symbolRepeatDirection"] = symbolRepeatDirection
        map["symbolMargin"] = symbolMargin
        map["symbolClip"] = symbolClip
        map["symbolBoundingData"] = symbolBoundingData
        map["symbolPatternSize"] = symbolPatternSize
        map["hoverAnimation"] = hoverAnimation
        map["data"] = data
        map["markPoint"] = markPoint
        map["markLine"] = markLine
        map["markArea"] = markArea
        map["zlevel"] = zlevel
        map["z"] = z
        map["silent"] = silent
        map["animation"] = animation
        map["animationThreshold"] = animationThreshold
        map["animationDuration"] = animationDuration
        map["animationEasing"] = animationEasing
        map["animationDurationUpdate"] = animationDurationUpdate
        map["animationDelayUpdate"] = animationDelayUpdate
        map["animationDelay"] = animationDelay
        map["animationEasingUpdate"] = animationEasingUpdate
        map["tooltip"] = tooltip
    }
}
