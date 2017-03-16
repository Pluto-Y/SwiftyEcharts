//
//  SECSplitLine.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 分割线
public struct SECSplitLine: SECDisplayable, SECLine {
    /// 是否显示分隔线。
    public var show: Bool?
    /// 分隔线的显示间隔
    public var interval: UInt?
    /// 分割线的样式
    public var lineStyle: SECLineStyle?
    
    public init() { }
}

extension SECSplitLine : SECEnumable {
    public enum Enums {
        case show(Bool), interval(UInt), lineStyle(SECLineStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .interval(interval):
                self.interval = interval
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            }
        }
    }
}

extension SECSplitLine : Mappable {
    public func mapping(map: Mapper) {
        map["show"] = show
        map["interval"] = interval
        map["lineStyle"] = lineStyle
    }
}
