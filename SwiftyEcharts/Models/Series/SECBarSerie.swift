//
//  SECBarSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 18/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECBarSerie : SECSeries, SECAnimatable {
    
    public var type: SECSerieType {
        return .bar
    }
    
    public var name: String?
    public var legendHoverLine: Bool?
    public var coordinateSystem: SECCoordinateSystem?
    public var xAxisIndex: UInt8?
    public var yAxisIndex: UInt8?
    public var label: Label?
    public var itemStyle: ItemStyle?
    public var stack: String?
    public var barWidth: Float?
    public var barMaxWidth: Float?
    public var barMinHeight: Float?
    public var barGap: String? // FIXME: ??是否需要新类型
    public var barCategoryGap: String? // FIXME: ??是否需要新类型
    public var data: [Any]?
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
}

extension SECBarSerie : SECEnumable {
    public enum Enums {
        case name(String), legendHoverLine(Bool), coordinateSystem(SECCoordinateSystem), xAxisIndex(UInt8), yAxisIndex(UInt8), label(Label), itemStyle(ItemStyle), stack(String), barWidth(Float), barMaxWidth(Float), barMinHeight(Float), barGap(String), barCategoryGap(String), data([Any]), markPoint(SECMarkPoint), markLine(SECMarkLine), markArea(SECMarkArea), zlevel(Float), z(Float), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(SECTime), animationEasing(SECAnimation), animationDelay(SECTime), animationDurationUpdate(SECTime), animationEasingUpdate(SECAnimation), animationDelayUpdate(SECTime)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
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
            case let .stack(stack):
                self.stack = stack
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

extension SECBarSerie : SECMappable {
    public func mapping(map: SECMap) {
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

extension SECBarSerie {
    public struct LabelContent {
        public var show: Bool?
        public var position: SECPosition?
        public var offset: [Float]?
        public var formatter: SECFormatter?
        public var textStyle: SECTextStyle?
    }
    
    public struct Label : SECEmphasisable {
        
        public typealias Style = LabelContent
        public var normal: Style?
        public var emphasis: Style?
        
    }
}

extension SECBarSerie.LabelContent : SECEnumable {
    public enum Enums {
        case show(Bool), position(SECPosition), offset([Float]), formatter(SECFormatter), textStyle(SECTextStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
             case let .position(position):
                self.position = position
            case let .offset(offset):
                self.offset = offset
            case let .formatter(formatter):
                self.formatter = formatter
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            }
        }
    }
}

extension SECBarSerie.LabelContent : SECMappable {
    public func mapping(map: SECMap) {
        map["show"] = show
        map["position"] = position
        map["offset"] = offset
        map["formatter"] = formatter
        map["textStyle"] = textStyle
    }
}


extension SECBarSerie.Label : SECEnumable {
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

extension SECBarSerie.Label : SECMappable {
    public func mapping(map: SECMap) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}

extension SECBarSerie {
    public struct ItemStyleContent: SECColorful, SECBorderable, SECShadowable, SECOpacitable {
        public var color: SECColor?
        public var borderColor: SECColor?
        public var borderWidth: Float?
        public var borderType: SECLineType?
        public var barBorderRadius: Float?
        public var shadowBlur: Float?
        public var shadowColor: SECColor?
        public var shadowOffsetX: Float?
        public var shadowOffsetY: Float?
        public var opacity: Float?
    }
    
    public struct ItemStyle : SECEmphasisable {
        public typealias Style = ItemStyleContent
        
        public var normal: Style?
        public var emphasis: Style?
    }
}

extension SECBarSerie.ItemStyleContent : SECEnumable {
    public enum Enums {
        case color(SECColor), borderColor(SECColor), borderWidth(Float), borderType(SECLineType), barBorderRadius(Float), shadowBlur(Float), shadowColor(SECColor), shadowOffsetX(Float), shadowOffsetY(Float), opacity(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .color(color):
                self.color = color
            case let .borderColor(color):
                self.borderColor = color
            case let .borderWidth(width):
                self.borderWidth = width
            case let .borderType(borderType):
                self.borderType = borderType
           case let .barBorderRadius(barBorderRadius):
                self.barBorderRadius = barBorderRadius
            case let .shadowBlur(blur):
                self.shadowBlur = blur
            case let .shadowColor(color):
                self.shadowColor = color
            case let .shadowOffsetX(x):
                self.shadowOffsetX = x
            case let .shadowOffsetY(y):
                self.shadowOffsetY = y
            case let .opacity(opacity):
                self.opacity = opacity
            }
        }
    }
}

extension SECBarSerie.ItemStyleContent : SECMappable {
    public func mapping(map: SECMap) {
        map["color"] = color
        map["borderColor"] = borderColor
        map["borderWidth"] = borderWidth
        map["borderType"] = borderType
        map["barBorderRadius"] = barBorderRadius
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["opacity"] = opacity
        
    }
}

extension SECBarSerie.ItemStyle : SECEnumable {
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

extension SECBarSerie.ItemStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}
