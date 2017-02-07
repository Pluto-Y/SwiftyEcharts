//
//  SECContinuousVisualMap.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 20/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECContinuousVisualMap : SECVisualMap, SECDisplayable, SECBorderable, SECColorful, SECTextful, SECFormatted, SECZable {
    
    public var type: String {
        return "continuous"
    }
    public var min: Float?
    public var max: Float?
    public var range: [Float]?
    public var calculable: Bool?
    public var realtime: Bool?
    public var inverse: Bool?
    public var precision: Float?
    public var itemWidth: Float?
    public var itemHeight: Float?
    public var align: SECAlign?
    public var text: [String]?
    public var textGap: Float?
    public var show: Bool?
    public var dimension: Float?
    public var seriesIndex: [UInt8]?
    public var hoverLink: Bool?
    public var inRange: [String: SECJsonable]?
    public var outRange: [String: SECJsonable]?
    public var controller: SECVMController?
    public var zlevel: Float?
    public var z: Float?
    public var left: SECPosition?
    public var top: SECPosition?
    public var right: SECPosition?
    public var bottom: SECPosition?
    public var orient: SECOrient?
    public var padding: SECPadding?
    public var backgroundColor: SECColor?
    public var borderColor: SECColor?
    public var borderWidth: Float?
    public var color: SECColor?
    public var textStyle: SECTextStyle?
    public var formatter: SECFormatter?
}

extension SECContinuousVisualMap : SECEnumable {
    public enum Enums {
        case min(Float), max(Float), range([Float]), calculable(Bool), realtime(Bool), inverse(Bool), precision(Float), itemWidth(Float), itemHeight(Float), align(SECAlign), text([String]), textGap(Float), show(Bool), dimension(Float), seriesIndex([UInt8]), hoverLink(Bool), inRange([String: SECJsonable]), outRange([String: SECJsonable]), controller(SECVMController), zlevel(Float), z(Float), left(SECPosition), top(SECPosition), right(SECPosition), bottom(SECPosition), orient(SECOrient), padding(SECPadding), backgroundColor(SECColor), borderColor(SECColor), borderWidth(Float), color(SECColor), textStyle(SECTextStyle), formatter(SECFormatter)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .min(min):
                self.min = min
            case let .max(max):
                self.max = max
            case let .range(range):
                self.range = range
            case let .calculable(calculable):
                self.calculable = calculable
            case let .realtime(realtime):
                self.realtime = realtime
            case let .inverse(inverse):
                self.inverse = inverse
            case let .precision(precision):
                self.precision = precision
            case let .itemWidth(itemWidth):
                self.itemWidth = itemWidth
            case let .itemHeight(itemHeight):
                self.itemHeight = itemHeight
            case let .align(align):
                self.align = align
            case let .text(text):
                self.text = text
            case let .textGap(textGap):
                self.textGap = textGap
            case let .show(show):
                self.show = show
            case let .dimension(dimension):
                self.dimension = dimension
            case let .seriesIndex(seriesIndex):
                self.seriesIndex = seriesIndex
            case let .hoverLink(hoverLink):
                self.hoverLink = hoverLink
            case let .inRange(inRange):
                self.inRange = inRange
            case let .outRange(outRange):
                self.outRange = outRange
            case let .controller(controller):
                self.controller = controller
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
            case let .orient(orient):
                self.orient = orient
            case let .padding(padding):
                self.padding = padding
            case let .backgroundColor(backgroundColor):
                self.backgroundColor = backgroundColor
            case let .borderColor(borderColor):
                self.borderColor = borderColor
            case let .borderWidth(borderWidth):
                self.borderWidth = borderWidth
            case let .color(color):
                self.color = color
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            case let .formatter(formatter):
                self.formatter = formatter
            }
        }
    }
}

extension SECContinuousVisualMap : SECMappable {
    public func mapping(map: SECMap) {
        map["type"] = type
        map["min"] = min
        map["max"] = max
        map["range"] = range
        map["calculable"] = calculable
        map["realtime"] = realtime
        map["inverse"] = inverse
        map["precision"] = precision
        map["itemWidth"] = itemWidth
        map["itemHeight"] = itemHeight
        map["align"] = align
        map["text"] = text
        map["textGap"] = textGap
        map["show"] = show
        map["dimension"] = dimension
        map["seriesIndex"] = seriesIndex
        map["hoverLink"] = hoverLink
        map["inRange"] = inRange
        map["outRange"] = outRange
        map["controller"] = controller
        map["zlevel"] = type
        map["z"] = z
        map["left"] = left
        map["top"] = top
        map["right"] = right
        map["bottom"] = bottom
        map["orient"] = orient
        map["padding"] = padding
        map["backgroundColor"] = backgroundColor
        map["borderColor"] = borderColor
        map["borderWidth"] = borderWidth
        map["color"] = color
        map["textStyle"] = textStyle
        map["formatter"] = formatter
        map["type"] = type
        map["type"] = type
        map["type"] = type
        map["type"] = type
        map["type"] = type
    }
}
