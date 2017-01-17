//
//  SECSliderDataZoom.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 17/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECSliderDataZoom : SECDataZoom, SECDisplayable {
    
    public struct Background {
        public var lineStyle: SECCommonLineStyle?
        public var areaStyle: SECAreaStyle?
    }
    
    public struct HandleStyle : SECColorful, SECBorderable, SECShadowable, SECOpacitable {
        public var color: SECColor?
        public var borderColor: SECColor?
        public var borderWidth: Float?
        public var borderType: SECLineType?
        public var shadowBlur: Float?
        public var shadowColor: SECColor?
        public var shadowOffsetX: Float?
        public var shadowOffsetY: Float?
        public var opacity: Float?
    }
    
    public var type: String {
        return "slider"
    }
    
    public var show: Bool?
    public var backgroundColor: SECColor?
    public var background: Background?
    public var fillerColor: SECColor?
    public var borderColor: SECColor?
    public var handleIcon: String?
    public var handleSize: Float?
    public var handleStyle: HandleStyle?
    public var labelPrecision: Float?
    public var labelFormatter: SECFormatter?
    public var showDetail: Bool?
    public var showDataShadow: String? // FIXME: ??
    public var realtime: Bool?
    public var textStyle: SECTextStyle?
    public var xAxisIndex: UInt8?
    public var yAxisIndex: UInt8?
    public var radiusAxisIndex: UInt8?
    public var angleAxisIndex: UInt8?
    public var filterMode: SECFilterMode?
    public var start: Float?
    public var end: Float?
    public var startValue: Float?
    public var endValue: Float?
    public var orient: SECOrient?
    public var zoomLock: Bool?
    public var zlevel: Float?
    public var z: Float?
    public var left: SECPosition?
    public var top: SECPosition?
    public var right: SECPosition?
    public var bottom: SECPosition?
}

extension SECSliderDataZoom.Background : SECEnumable {
    public enum Enums {
        case lineStyle(SECCommonLineStyle), areaStyle(SECAreaStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            case let .areaStyle(areaStyle):
                self.areaStyle = areaStyle
            }
        }
    }
}

extension SECSliderDataZoom.Background : SECMappable {
    public func mapping(map: SECMap) {
        map["lineStyle"] = lineStyle
        map["areaStyle"] = areaStyle
    }
}

extension SECSliderDataZoom.HandleStyle : SECEnumable {
    public enum Enums {
        case color(SECColor), borderColor(SECColor), borderWidth(Float), borderType(SECLineType), shadowBlur(Float), shadowColor(SECColor), shadowOffsetX(Float), shadowOffsetY(Float), opacity(Float)
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

extension SECSliderDataZoom.HandleStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["color"] = color
        map["borderColor"] = borderColor
        map["borderWidth"] = borderWidth
        map["borderType"] = borderType
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["opacity"] = opacity
    }
}

extension SECSliderDataZoom : SECEnumable {
    public enum Enums {
        case show(Bool), backgroundColor(SECColor), background(Background), fillerColor(SECColor), borderColor(SECColor), handleIcon(String), handleSize(Float), handleStyle(HandleStyle), labelPrecision(Float), labelFormatter(SECFormatter), showDetail(Bool), showDataShadow(String), realtime(Bool), textStyle(SECTextStyle), xAxisIndex(UInt8), yAxisIndex(UInt8), radiusAxisIndex(UInt8), angleAxisIndex(UInt8), filterMode(SECFilterMode), start(Float), end(Float), startValue(Float), endValue(Float), orient(SECOrient), zoomLock(Bool), zlevel(Float), z(Float), left(SECPosition), top(SECPosition), right(SECPosition), bottom(SECPosition)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .backgroundColor(backgroundColor):
                self.backgroundColor = backgroundColor
            case let .background(background):
                self.background = background
            case let .fillerColor(fillerColor):
                self.fillerColor = fillerColor
            case let .borderColor(borderColor):
                self.borderColor = borderColor
            case let .handleIcon(handleIcon):
                self.handleIcon = handleIcon
            case let .handleSize(handleSize):
                self.handleSize = handleSize
            case let .handleStyle(handleStyle):
                self.handleStyle = handleStyle
            case let .labelPrecision(labelPrecision):
                self.labelPrecision = labelPrecision
            case let .labelFormatter(labelFormatter):
                self.labelFormatter = labelFormatter
            case let .showDetail(showDetail):
                self.showDetail = showDetail
            case let .showDataShadow(showDataShadow):
                self.showDataShadow = showDataShadow
            case let .realtime(realtime):
                self.realtime = realtime
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            case let .xAxisIndex(xAxisIndex):
                self.xAxisIndex = xAxisIndex
            case let .yAxisIndex(yAxisIndex):
                self.yAxisIndex = yAxisIndex
            case let .radiusAxisIndex(radiusAxisIndex):
                self.radiusAxisIndex = radiusAxisIndex
            case let .angleAxisIndex(angleAxisIndex):
                self.angleAxisIndex = angleAxisIndex
            case let .filterMode(filterMode):
                self.filterMode = filterMode
            case let .start(start):
                self.start = start
            case let .end(end):
                self.end = end
            case let .startValue(startValue):
                self.startValue = startValue
            case let .endValue(endValue):
                self.endValue = endValue
            case let .orient(orient):
                self.orient = orient
            case let .zoomLock(zoomLock):
                self.zoomLock = zoomLock
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
            }
        }
    }
}
