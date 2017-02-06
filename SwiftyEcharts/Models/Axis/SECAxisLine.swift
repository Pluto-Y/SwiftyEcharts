//
//  SECAxisLine.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 坐标轴轴线相关设置。
public struct SECAxisLine : SECDisplayable, SECLine {
    public var show: Bool?
    /// X 轴或者 Y 轴的轴线是否在另一个轴的 0 刻度上，只有在另一个轴为数值轴且包含 0 刻度时有效。
    public var onZero: Bool?
    public var lineStyle: SECLineStyle?
    
    public init() { }
    
}

extension SECAxisLine : SECEnumable {
    public enum Enums {
        case show(Bool), onZero(Bool), lineStyle(SECLineStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .onZero(onZero):
                self.onZero = onZero
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            }
        }
    }
}

extension SECAxisLine : SECMappable {
    public func mapping(map: SECMap) {
        map["show"] = show
        map["onZero"] = onZero
        map["lineStyle"] = lineStyle
    }
}
