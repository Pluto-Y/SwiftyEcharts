//
//  SECAxisLabel.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 坐标轴刻度标签的相关设置。
public struct SECAxisLabel : SECTextful, SECDisplayable, SECFormatted {
    
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
    public var formatter: SECFormatter?
    /// 刻度标签文字样式
    public var textStyle: SECTextStyle?
    
    public init() { }
}

extension SECAxisLabel : SECEnumable {
    public enum Enums {
        case show(Bool), interval(UInt), inside(Bool), rotate(Float), margin(Float), formatter(SECFormatter), textStyle(SECTextStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
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
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            }
        }
    }
}

extension SECAxisLabel : SECMappable {
    public func mapping(map: SECMap) {
        map["show"] = show
        map["interval"] = interval
        map["inside"] = inside
        map["rotate"] = rotate
        map["margin"] = margin
        map["formatter"] = formatter
        map["textStyle"] = textStyle
    }
}
