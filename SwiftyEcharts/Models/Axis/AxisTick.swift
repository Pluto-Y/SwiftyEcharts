//
//  AxisTick.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 坐标轴刻度相关设置。
public final class AxisTick: Line, Displayable {
    /// 是否显示坐标轴刻度。
    public var show: Bool?
    /// 类目轴中在 boundaryGap 为 true 的时候有效，可以保证刻度线和标签对齐。
    public var alignWithLabel: Bool?
    /// 坐标轴刻度的显示间隔，在类目轴中有效。默认同 axisLabel.interval 一样。
    /// 默认会采用标签不重叠的策略间隔显示标签。
    /// 可以设置成 0 强制显示所有标签。
    /// 如果设置为 1，表示『隔一个标签显示一个标签』，如果值为 2，表示隔两个标签显示一个标签，以此类推。
    ///
    /// 可以用数值表示间隔的数据，也可以通过回调函数控制。回调函数格式如下：
    ///
    ///         (index:number, value: string) => boolean
    /// 第一个参数是类目的 index，第二个值是类目名称，如果跳过则返回 false。
    public var interval: Int?
    /// 坐标轴刻度是否朝内，默认朝外。
    public var inside: Bool?
    /// 坐标轴刻度的长度。
    public var length: LengthValue?
    /// 刻度横线的样式
    public var lineStyle: LineStyle?
    
    /// 分隔线之间分割的刻度数。
    /// ## 目前只用于仪表盘图中
    public var splitNumber: UInt8?
    
    public init() { }
    
}

extension AxisTick: Enumable {
    public enum Enums {
        case show(Bool), alignWithLabel(Bool), interval(Int), inside(Bool), length(LengthValue), lineStyle(LineStyle), splitNumber(UInt8)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .alignWithLabel(alignWithLabel):
                self.alignWithLabel = alignWithLabel
            case let .interval(interval):
                self.interval = interval
            case let .inside(inside):
                self.inside = inside
            case let .length(length):
                self.length = length
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            case let .splitNumber(splitNumber):
                self.splitNumber = splitNumber
            }
        }
    }
}

extension AxisTick: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["alignWithLabel"] = alignWithLabel
        map["interval"] = interval
        map["inside"] = inside
        map["length"] = length
        map["lineStyle"] = lineStyle
        map["splitNumber"] = splitNumber
    }
}
