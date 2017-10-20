//
//  VisualMap.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 23/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// visualMap 是视觉映射组件，用于进行『视觉编码』，也就是将数据映射到视觉元素（视觉通道）。
///
/// 视觉元素可以是：
///
/// - symbol: 图元的图形类别。
/// - symbolSize: 图元的大小。
/// - color: 图元的颜色。
/// - colorAlpha: 图元的颜色的透明度。
/// - opacity: 图元以及其附属物（如文字标签）的透明度。
/// - colorLightness: 颜色的明暗度，参见 HSL。
/// - colorSaturation: 颜色的饱和度，参见 HSL。
/// - colorHue: 颜色的色调，参见 HSL。
/// - visualMap 组件可以定义多个，从而可以同时对数据中的多个维度进行视觉映射。
/// - visualMap 组件可以定义为 分段型（visualMapPiecewise） 或 连续型（visualMapContinuous），通过 type 来区分。例如：
///
///
///     option = {
///         visualMap: [
///             { // 第一个 visualMap 组件
///                 type: 'continuous', // 定义为连续型 viusalMap
///                 ...
///             },
///             { // 第二个 visualMap 组件
///                 type: 'piecewise', // 定义为分段型 visualMap
///                 ...
///             }
///         ],
///         ...
///     };
/// ✦ 视觉映射方式的配置 ✦
///
/// 既然是『数据』到『视觉元素』的映射，visualMap 中可以指定数据的『哪个维度』（参见visualMap.dimension）映射到哪些『视觉元素』（参见visualMap.inRange 和 visualMap.outOfRange）中。
/// 
/// 在 visualMap 组件所控制的 series 中，如果 series 中某个数据项需要避开 visualMap 映射，可以这么配置：
///
///
/// series : [
///     {name: 'Shanghai', value: 251},
///     {name: 'Haikou', value: 21},
///     // 设置 `visualMap: false` 则 visualMap 不对此项进行控制，此时系列
///     // 可使用自身的视觉参数（color/symbol/ ...控制此项的显示。
///     {name: 'Beijing', value: 821, visualMap: false},
///     ...
/// ]
/// 
/// ✦ 与 ECharts2 中 dataRange 的关系 ✦
///
/// visualMap 是由 ECharts2 中的 dataRange 组件改名以及扩展而来。ECharts3里 option 中的 dataRange 配置项仍然被兼容，会自动转换成 visualMap 配置项。在option中推荐写 visualMap 而非 dataRange。
public protocol VisualMap: Mappable {
    var type: String { get }
}

public final class VisualMapController {
    public var inRange: [String: Jsonable]?
    public var outRange: [String: Jsonable]?
}

extension VisualMapController: Enumable {
    public enum Enums {
        case inRange([String: Jsonable]), outRange([String: Jsonable])
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .inRange(inRange):
                self.inRange = inRange
            case let .outRange(outRange):
                self.outRange = outRange
            }
        }
    }
}

extension VisualMapController: Mappable {
    public func mapping(_ map: Mapper) {
        map["inRange"] = inRange
        map["outRange"] = outRange
    }
}

// MARK: - Actions
/// 视觉映射组件相关的行为，必须引入视觉映射组件后才能使用。

/// 选取映射的数值范围。
/// 
/// 示例:
///
/// EchartsView.dispatchAction({
///     type: 'selectDataRange',
///     // 选取 20 到 40 的值范围
///     selected: [20, 40],
///     // 取消选中第二段
///     selected: { 1: false },
///     // 取消选中类目 `优`
///     selected: { '优': false }
/// });
public final class VisualMapSelectDataRangeAction: EchartsAction {
    public var type: EchartsActionType {
        return .selectDataRange
    }
    
    /// 可选，visualMap 组件的 index，多个 visualMap 组件时有用，默认为 0
    public var visualMapIndex: Int?
    /// 连续型 visualMap 和 离散型 visualMap 不一样
    /// 连续型的是一个表示数值范围的数组。
    /// 离散型的是一个对象，键值是类目或者分段的索引。值是 `true`, `false`
    public var selected: Jsonable?
}

extension VisualMapSelectDataRangeAction: Enumable {
    public enum Enums {
        case visualMapIndex(Int), selected(Jsonable)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .visualMapIndex(visualMapIndex):
                self.visualMapIndex = visualMapIndex
            case let .selected(selected):
                self.selected = selected
            }
        }
    }
}

extension VisualMapSelectDataRangeAction: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["visualMapIndex"] = visualMapIndex
        map["selected"] = selected
    }
}
