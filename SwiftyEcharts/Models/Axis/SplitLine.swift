//
//  SplitLine.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 分割线
public final class SplitLine: Displayable, Line {
    /// 是否显示分隔线。
    public var show: Bool?
    /// 分隔线的显示间隔
    public var interval: LengthValue?
    /// 分割线的样式
    public var lineStyle: LineStyle?
    
    public init() { }
}

extension SplitLine: Enumable {
    public enum Enums {
        case show(Bool), interval(LengthValue), lineStyle(LineStyle)
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
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            }
        }
    }
}

extension SplitLine: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["interval"] = interval
        map["lineStyle"] = lineStyle
    }
}
