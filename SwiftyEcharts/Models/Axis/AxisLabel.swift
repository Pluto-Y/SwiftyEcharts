//
//  AxisLabel.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 坐标轴刻度标签的相关设置。
public final class AxisLabel: Displayable, Formatted, Shadowable {
    
    /// 是否显示刻度标签。
    public var show: Bool?
    /// 坐标轴刻度标签的显示间隔，在类目轴中有效。
    public var interval: UInt?
    /// 刻度标签是否朝内，默认朝外。
    public var inside: Bool?
    /// 刻度标签旋转的角度，在类目轴的类目标签显示不下的时候可以通过旋转防止标签之间重叠。
    /// 旋转的角度从 -90 度到 90 度。
    public var rotate: Float?
    /// 刻度标签与轴线之间的距离。
    public var margin: Float?
    /// 刻度标签的内容格式器，支持字符串模板和回调函数两种形式。
    public var formatter: Formatter?
    public var showMinLabel: Bool?
    public var showMaxLabel: Bool?
    public var color: Color?
    public var fontStyle: FontStyle?
    public var fontWeight: FontWeight?
    public var fontFamily: String?
    public var fontSize: UInt8?
    public var align: Align?
    public var verticalAlign: VerticalAlign?
    public var lineHeight: Float?
    public var backgroundColor: Color?
    public var borderColor: Color?
    public var borderWidth: Float?
    public var borderRadius: Float? /// FIXME: 支持array?
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
    public var textShadowBlur: Float?
    public var textShadowOffsetX: Float?
    public var textShadowOffsetY: Float?
    public var rich: [String: Jsonable]?
    
    public init() { }
}

extension AxisLabel: Enumable {
    public enum Enums {
        case show(Bool), interval(UInt), inside(Bool), rotate(Float), margin(Float), formatter(Formatter), showMinLabel(Bool), showMaxLabel(Bool), color(Color), fontStyle(FontStyle), fontWeight(FontWeight), fontFamily(String), fontSize(UInt8), align(Align), verticalAlign(VerticalAlign), lineHeight(Float), backgroundColor(Color), borderColor(Color), borderWidth(Float), borderRadius(Float), padding(Padding), shadowColor(Color), shadowBlur(Float), shadowOffsetX(Float), shadowOffsetY(Float), width(LengthValue), height(LengthValue), textBorderColor(Color), textBorderWidth(Float), textShadowColor(Color), textShadowBlur(Float), textShadowOffsetX(Float), textShadowOffsetY(Float), rich([String: Jsonable])
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .interval(interval):
                self.interval = interval
            case let .inside(inside):
                self.inside = inside
            case let .rotate(rotate):
                self.rotate = rotate
            case let .margin(margin):
                self.margin = margin
            case let .formatter(formatter):
                self.formatter = formatter
            case let .showMinLabel(showMinLabel):
                self.showMinLabel = showMinLabel
            case let .showMaxLabel(showMaxLabel):
                self.showMaxLabel = showMaxLabel
            case let .color(color):
                self.color = color
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
            case let .textShadowBlur(textShadowBlur):
                self.textShadowBlur = textShadowBlur
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

extension AxisLabel: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["interval"] = interval
        map["inside"] = inside
        map["rotate"] = rotate
        map["margin"] = margin
        map["formatter"] = formatter
        map["showMinLabel"] = showMinLabel
        map["showMaxLabel"] = showMaxLabel
        map["color"] = color
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
        map["textShadowBlur"] = textShadowBlur
        map["textShadowOffsetX"] = textShadowOffsetX
        map["textShadowOffsetY"] = textShadowOffsetY
        map["rich"] = rich
    }
}
