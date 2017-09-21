//
//  Calendar.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 21/09/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public final class Calendar: Zable {
    public final class BaseLabel: Displayable, Shadowable, Colorful, Borderable, Formatted {
        public var show: Bool?
        public var firstDay: UInt8?
        public var margin: Float?
        public var position: Position?
        public var nameMap: OneOrMore<String>?
        public var color: Color?
        public var formatter: Formatter?
        public var fontStyle: FontStyle?
        public var fontWeight: FontWeight?
        public var fontFamily: String?
        public var fontSize: UInt?
        public var align: Align?
        public var verticalAlign: VerticalAlign?
        public var lineHeight: Float?
        public var backgroundColor: Color?
        public var borderColor: Color?
        public var borderWidth: Float?
        public var borderRadius: Float?
        public var padding: Padding?
        public var shadowColor: Color?
        public var shadowBlur: Float?
        public var shadowOffsetX: Float?
        public var shadowOffsetY: Float?
        public var width: LengthValue?
        public var height: LengthValue?
        public var textBorderColor: Color?
        public var textBorderWidth: Float?
        public var textShadowColor: Color?
        public var textShdaowBlur: Float?
        public var textShadowOffsetX: Float?
        public var textShadowOffsetY: Float?
        public var rich: [String: Jsonable]?
    }
    
    public typealias DayLabel = BaseLabel
    public typealias MonthLabel = BaseLabel
    public typealias YearLabel = BaseLabel
    
    public var zlevel: Float?
    public var z: Float?
    public var left: Position?
    public var top: Position?
    public var right: Position?
    public var bottom: Position?
    public var width: LengthValue?
    public var heigth: LengthValue?
    public var range: Jsonable?
    public var cellSize: OneOrMore<Float>?
    public var orient: Orient?
    public var splitLine: SplitLine?
    public var itemStyle: ItemStyle?
    public var dayLabel: DayLabel?
    public var monthLabel: MonthLabel?
    public var yearLabel: YearLabel?
    public var silent: Bool?
}

extension Calendar.BaseLabel: Enumable {
    public enum Enums {
        case show(Bool), firstDay(UInt8), margin(Float), position(Position), nameMap(OneOrMore<String>), color(Color), formatter(Formatter), fontStyle(FontStyle), fontWeight(FontWeight), fontFamily(String), fontSize(UInt), align(Align), verticalAlign(VerticalAlign), lineHeight(Float), backgroundColor(Color), borderColor(Color), borderWidth(Float), borderRadius(Float), padding(Padding), shadowColor(Color), shadowBlur(Float), shadowOffsetX(Float), shadowOffsetY(Float), width(LengthValue), height(LengthValue), textBorderColor(Color), textBorderWidth(Float), textShadowColor(Color), textShdaowBlur(Float), textShadowOffsetX(Float), textShadowOffsetY(Float), rich([String: Jsonable])
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .firstDay(firstDay):
                self.firstDay = firstDay
            case let .margin(margin):
                self.margin = margin
            case let .position(position):
                self.position = position
            case let .nameMap(nameMap):
                self.nameMap = nameMap
            case let .color(color):
                self.color = color
            case let .formatter(formatter):
                self.formatter = formatter
            case let .fontStyle(fontStyle):
                self.fontStyle = fontStyle
            case let .fontWeight(fontWeight):
                self.fontWeight = fontWeight
            case let .fontFamily(fontFamily):
                self.fontFamily = fontFamily
            case let .fontSize(fontSize):
                self.fontSize = fontSize
            case let .align(align):
                self.align = align
            case let .verticalAlign(verticalAlign):
                self.verticalAlign = verticalAlign
            case let .lineHeight(lineHeight):
                self.lineHeight = lineHeight
            case let .backgroundColor(backgroundColor):
                self.backgroundColor = backgroundColor
            case let .borderColor(borderColor):
                self.borderColor = borderColor
            case let .borderWidth(borderWidth):
                self.borderWidth = borderWidth
            case let .borderRadius(borderRadius):
                self.borderRadius = borderRadius
            case let .padding(padding):
                self.padding = padding
            case let .shadowColor(shadowColor):
                self.shadowColor = shadowColor
            case let .shadowBlur(shadowBlur):
                self.shadowBlur = shadowBlur
            case let .shadowOffsetX(shadowOffsetX):
                self.shadowOffsetX = shadowOffsetX
            case let .shadowOffsetY(shadowOffsetY):
                self.shadowOffsetY = shadowOffsetY
            case let .width(width):
                self.width = width
            case let .height(height):
                self.height = height
            case let .textBorderColor(textBorderColor):
                self.textBorderColor = textBorderColor
            case let .textBorderWidth(textBorderWidth):
                self.textBorderWidth = textBorderWidth
            case let .textShadowColor(textShadowColor):
                self.textShadowColor = textShadowColor
            case let .textShdaowBlur(textShdaowBlur):
                self.textShdaowBlur = textShdaowBlur
            case let .textShadowOffsetX(textShadowOffsetX):
                self.textShadowOffsetX = textShadowOffsetX
            case let .textShadowOffsetY(textShadowOffsetY):
                self.textShadowOffsetY = textShadowOffsetY
            case let .rich(rich):
                self.rich = rich
            }
        }
    }
}

extension Calendar.BaseLabel: Mappable {
    public func mapping(map: Mapper) {
        map["show"] = show
        map["firstDay"] = firstDay
        map["margin"] = margin
        map["position"] = position
        map["nameMap"] = nameMap
        map["color"] = color
        map["formatter"] = formatter
        map["fontStyle"] = fontStyle
        map["fontWeight"] = fontWeight
        map["fontFamily"] = fontFamily
        map["fontSize"] = fontSize
        map["align"] = align
        map["verticalAlign"] = verticalAlign
        map["lineHeight"] = lineHeight
        map["backgroundColor"] = backgroundColor
        map["borderColor"] = borderColor
        map["borderWidth"] = borderWidth
        map["borderRadius"] = borderRadius
        map["padding"] = padding
        map["shadowColor"] = shadowColor
        map["shadowBlur"] = shadowBlur
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["width"] = width
        map["height"] = height
        map["textBorderColor"] = textBorderColor
        map["textBorderWidth"] = textBorderWidth
        map["textShadowColor"] = textShadowColor
        map["textShdaowBlur"] = textShdaowBlur
        map["textShadowOffsetX"] = textShadowOffsetX
        map["textShadowOffsetY"] = textShadowOffsetY
        map["rich"] = rich
    }
}

extension Calendar: Enumable {
    public enum Enums {
        case zlevel(Float), z(Float), left(Position), top(Position), right(Position), bottom(Position), width(LengthValue), heigth(LengthValue), range(Jsonable), cellSize(OneOrMore<Float>), orient(Orient), splitLine(SplitLine), itemStyle(ItemStyle), dayLabel(DayLabel), monthLabel(MonthLabel), yearLabel(YearLabel), silent(Bool)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .zlevel(zlevel):
                self.zlevel = zlevel
            case let .z(z):
                self.z = z
            case let .left(left):
                self.left = left
            case let .top(top):
                self.top = top
            case let .right(right):
                self.right = right
            case let .bottom(bottom):
                self.bottom = bottom
            case let .width(width):
                self.width = width
            case let .heigth(heigth):
                self.heigth = heigth
            case let .range(range):
                self.range = range
            case let .cellSize(cellSize):
                self.cellSize = cellSize
            case let .orient(orient):
                self.orient = orient
            case let .splitLine(splitLine):
                self.splitLine = splitLine
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .dayLabel(dayLabel):
                self.dayLabel = dayLabel
            case let .monthLabel(monthLabel):
                self.monthLabel = monthLabel
            case let .yearLabel(yearLabel):
                self.yearLabel = yearLabel
            case let .silent(silent):
                self.silent = silent
            }
        }
    }
}

extension Calendar: Mappable {
    public func mapping(map: Mapper) {
        map["zlevel"] = zlevel
        map["z"] = z
        map["left"] = left
        map["top"] = top
        map["right"] = right
        map["bottom"] = bottom
        map["width"] = width
        map["heigth"] = heigth
        map["range"] = range
        map["cellSize"] = cellSize
        map["orient"] = orient
        map["splitLine"] = splitLine
        map["itemStyle"] = itemStyle
        map["dayLabel"] = dayLabel
        map["monthLabel"] = monthLabel
        map["yearLabel"] = yearLabel
        map["silent"] = silent
    }
}
