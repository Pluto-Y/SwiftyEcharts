//
//  SECPiecewiseVisualMap.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 20/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECPiecewiseVisualMap : SECVisualMap, SECDisplayable, SECBorderable, SECColorful, SECTextful, SECFormatted {
    public var type: String {
        return "piecewise"
    }
    
    public var splitNumber: Int?
    public var pieces: [SECJsonable]?
    //    public var categories: []
    public var min: Float?
    public var max: Float?
    public var minOpen: Bool?
    public var maxOpen: Bool?
    public var selectedMode: SECSelectedMode?
    public var inverse: Bool?
    public var precision: UInt?
    public var itemWidth: Float?
    public var itemHeight: Float?
    public var align: SECAlign?
    public var text: [String]?
    public var textGap: Float?
    public var showLabel: Bool?
    public var itemGap: Float?
    public var itemSymbol: SECSymbol?
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

extension SECPiecewiseVisualMap : SECEnumable {
    public enum Enums {
        case splitNumber(Int), pieces([SECJsonable]), min(Float), max(Float), minOpen(Bool), maxOpen(Bool), selectedMode(SECSelectedMode), inverse(Bool), precision(UInt), itemWidth(Float), itemHeight(Float), align(SECAlign), text([String]), textGap(Float), showLabel(Bool), itemGap(Float), itemSymbol(SECSymbol), show(Bool), dimension(Float), seriesIndex([UInt8]), hoverLink(Bool), inRange([String: SECJsonable]), outRange([String: SECJsonable]), controller(SECVMController), zlevel(Float), z(Float), left(SECPosition), top(SECPosition), right(SECPosition), bottom(SECPosition), orient(SECOrient), padding(SECPadding), backgroundColor(SECColor), borderColor(SECColor), borderWidth(Float), color(SECColor), textStyle(SECTextStyle), formatter(SECFormatter)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .splitNumber(splitNumber):
                self.splitNumber = splitNumber
            case let .pieces(pieces):
                self.pieces = pieces
            case let .min(min):
                self.min = min
            case let .max(max):
                self.max = max
            case let .minOpen(minOpen):
                self.minOpen = minOpen
            case let .maxOpen(maxOpen):
                self.maxOpen = maxOpen
            case let .selectedMode(selectedMode):
                self.selectedMode = selectedMode
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
            case let .showLabel(showLabel):
                self.showLabel = showLabel
            case let .itemGap(itemGap):
                self.itemGap = itemGap
            case let .itemSymbol(itemSymbol):
                self.itemSymbol = itemSymbol
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

extension SECPiecewiseVisualMap : SECMappable {
    public func mapping(map: SECMap) {
        map["type"] = type
        map["splitNumber"] = splitNumber
        map["pieces"] = pieces
        map["min"] = min
        map["max"] = max
        map["minOpen"] = minOpen
        map["maxOpen"] = maxOpen
        map["selectedMode"] = selectedMode
        map["inverse"] = inverse
        map["precision"] = precision
        map["itemWidth"] = itemWidth
        map["itemHeight"] = itemHeight
        map["align"] = align
        map["text"] = text
        map["textGap"] = textGap
        map["showLabel"] = showLabel
        map["itemGap"] = itemGap
        map["itemSymbol"] = itemSymbol
        map["show"] = show
        map["dimension"] = dimension
        map["seriesIndex"] = seriesIndex
        map["hoverLink"] = hoverLink
        map["inRange"] = inRange
        map["outRange"] = outRange
        map["controller"] = controller
        map["zlevel"] = zlevel
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
    }
}
