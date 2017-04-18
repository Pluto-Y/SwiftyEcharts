//
//  ParallelSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 04/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 平行坐标系的系列。
///
/// 平行坐标系介绍
///
/// 平行坐标系（Parallel Coordinates） 是一种常用的可视化高维数据的图表。
///
/// 例如 series-parallel.data 中有如下数据：
///
///     [
///         [1,  55,  9,   56,  0.46,  18,  6,  '良'],
///         [2,  25,  11,  21,  0.65,  34,  9,  '优'],
///         [3,  56,  7,   63,  0.3,   14,  5,  '良'],
///         [4,  33,  7,   29,  0.33,  16,  6,  '优'],
///         { // 数据项也可以是 Object，从而里面能含有对线条的特殊设置。
///         value: [5,  42,  24,  44,  0.76,  40,  16, '优']
///         lineStyle: {...},
///         }
///         ...
///     ]
///
/// 数据中，每一行是一个『数据项』，每一列属于一个『维度』。（例如上面数据每一列的含义分别是：『日期』,『AQI指数』, 『PM2.5』, 『PM10』, 『一氧化碳值』, 『二氧化氮值』, 『二氧化硫值』）。
///
/// 平行坐标系适用于对这种多维数据进行可视化分析。每一个维度（每一列）对应一个坐标轴，每一个『数据项』是一条线，贯穿多个坐标轴。在坐标轴上，可以进行数据选取等操作。如下：
/// 
/// http://echarts.baidu.com/gallery/editor.html?c=doc-example/parallel-all
///
/// 配置方式概要
///
/// 『平行坐标系』的 option 基本配置如下例：
///
///     option = {
///         parallelAxis: [                     // 这是一个个『坐标轴』的定义
///         {dim: 0, name: schema[0].text}, // 每个『坐标轴』有个 'dim' 属性，表示坐标轴的维度号。
///         {dim: 1, name: schema[1].text},
///         {dim: 2, name: schema[2].text},
///         {dim: 3, name: schema[3].text},
///         {dim: 4, name: schema[4].text},
///         {dim: 5, name: schema[5].text},
///         {dim: 6, name: schema[6].text},
///         {dim: 7, name: schema[7].text,
///         type: 'category',           // 坐标轴也可以支持类别型数据
///         data: ['优', '良', '轻度污染', '中度污染', '重度污染', '严重污染']
///         }
///         ],
///         parallel: {                         // 这是『坐标系』的定义
///             left: '5%',                     // 平行坐标系的位置设置
///             right: '13%',
///             bottom: '10%',
///             top: '20%',
///             parallelAxisDefault: {          // 『坐标轴』的公有属性可以配置在这里避免重复书写
///                 type: 'value',
///                 nameLocation: 'end',
///                 nameGap: 20
///             }
///         },
///         series: [                           // 这里三个系列共用一个平行坐标系
///         {
///         name: '北京',
///         type: 'parallel',           // 这个系列类型是 'parallel'
///         data: [
///         [1,  55,  9,   56,  0.46,  18,  6,  '良'],
///         [2,  25,  11,  21,  0.65,  34,  9,  '优'],
///         ...
///         ]
///         },
///         {
///         name: '上海',
///         type: 'parallel',
///         data: [
///         [3,  56,  7,   63,  0.3,   14,  5,  '良'],
///         [4,  33,  7,   29,  0.33,  16,  6,  '优'],
///         ...
///         ]
///         },
///         {
///         name: '广州',
///         type: 'parallel',
///         data: [
///         [4,  33,  7,   29,  0.33,  16,  6,  '优'],
///         [5,  42,  24,  44,  0.76,  40,  16, '优'],
///         ...
///         ]
///         }
///         ]
///     };
///
/// 需要涉及到三个组件：parallel、parallelAxis、series-parallel
///
/// - parallel 这个配置项是平行坐标系的『坐标系』本身。一个系列（series）或多个系列（如上图中的『北京』、『上海』、『广州』分别各是一个系列）可以共用这个『坐标系』。 和其他坐标系一样，坐标系也可以创建多个。 位置设置，也是放在这里进行。
/// - parallelAxis 这个是『坐标系』中的坐标轴的配置。自然，需要有多个坐标轴。 其中有 parallelAxis.parallelIndex 属性，指定这个『坐标轴』在哪个『坐标系』中。默认使用第一个『坐标系』。
/// - series-parallel 这个是『系列』的定义。系列被画到『坐标系』上。 其中有 series-parallel.parallelIndex 属性，指定使用哪个『坐标系』。默认使用第一个『坐标系』。
///
/// 配置注意和最佳实践
///
/// 配置多个 parallelAxis 时，有些值一样的属性，如果书写多遍则比较繁琐，那么可以放置在 parallel.parallelAxisDefault 里。在坐标轴初始化前，parallel.parallelAxisDefault 里的配置项，会分别融合进 parallelAxis，形成最终的坐标轴的配置。
///
/// 如果数据量很大并且发生卡顿
///
/// 建议把 series-parallel.lineStyle.normal.width 设为 0.5（或更小）， 可能显著改善性能。
/// 
/// 高维数据的显示
///
/// 维度比较多时，比如有 50+ 的维度，那么就会有 50+ 个轴。那么可能会页面显示不下。
///
/// 可以通过 parallel.axisExpandable 来改善显示效果，如下例子：
///
/// http://echarts.baidu.com/gallery/editor.html?c=map-parallel-prices
public final class ParallelSerie: Serie, Zable, Animatable {
    
    /// 类型
    public var type: SerieType {
        return .parallel
    }
    
    /// 该系列使用的坐标系, 目前只能用 parallel
    public var coordinateSystem: CoordinateSystem?
    /// 使用的平行坐标系的 index，在单个图表实例中存在多个平行坐标系的时候有用。
    public var parallelIndex: UInt8?
    /// 系列名称，用于tooltip的显示，legend 的图例筛选，在 setOption 更新数据和配置项时用于指定对应的系列。
    public var name: String?
    /// 线条样式。
    public var lineStyle: EmphasisLineStyle?
    /// 框选时，未被选中的条线会设置成这个『透明度』（从而可以达到变暗的效果）。
    public var inactiveOpacity: Float?
    /// 框选时，选中的条线会设置成这个『透明度』（从而可以达到高亮的效果）。
    public var activeOpacity: Float?
    /// 是否实时刷新。
    public var realtime: Bool?
    /// 例如 series-parallel.data 中有如下数据：
    ///
    ///     [
    ///         [1,  55,  9,   56,  0.46,  18,  6,  '良'],
    ///         [2,  25,  11,  21,  0.65,  34,  9,  '优'],
    ///         [3,  56,  7,   63,  0.3,   14,  5,  '良'],
    ///         [4,  33,  7,   29,  0.33,  16,  6,  '优'],
    ///         { // 数据项也可以是 Object，从而里面能含有对线条的特殊设置。
    ///             value: [5,  42,  24,  44,  0.76,  40,  16, '优']
    ///             lineStyle: {...},
    ///         }
    ///         ...
    ///     ]
    ///
    /// 数据中，每一行是一个『数据项』，每一列属于一个『维度』。（例如上面数据每一列的含义分别是：『日期』,『AQI指数』, 『PM2.5』, 『PM10』, 『一氧化碳值』, 『二氧化氮值』, 『二氧化硫值』）。
    public var data: [Jsonable]?
    
    /// MARK: Zable
    public var zlevel: Float?
    public var z: Float?
    
    /// 图形是否不响应和触发鼠标事件，默认为 false，即响应和触发鼠标事件。
    public var silent: Bool?
    
    /// MARK: Animatable
    public var animation: Bool?
    public var animationThreshold: Float?
    public var animationDuration: Time?
    public var animationEasing: EasingFunction?
    public var animationDelay: Time?
    public var animationDurationUpdate: Time?
    public var animationEasingUpdate: EasingFunction?
    public var animationDelayUpdate: Time?
    
    public init() { }
}

extension ParallelSerie: Enumable {
    public enum Enums {
        case coordinateSystem(CoordinateSystem), parallelIndex(UInt8), name(String), lineStyle(EmphasisLineStyle), inactiveOpacity(Float), activeOpacity(Float), realtime(Bool), data([Jsonable]), zlevel(Float), z(Float), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(Time), animationEasing(EasingFunction), animationDelay(Time), animationDurationUpdate(Time), animationEasingUpdate(EasingFunction), animationDelayUpdate(Time)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .coordinateSystem(coordinateSystem):
                self.coordinateSystem = coordinateSystem
            case let .parallelIndex(parallelIndex):
                self.parallelIndex = parallelIndex
            case let .name(name):
                self.name = name
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            case let .inactiveOpacity(inactiveOpacity):
                self.inactiveOpacity = inactiveOpacity
            case let .activeOpacity(activeOpacity):
                self.activeOpacity = activeOpacity
            case let .realtime(realtime):
                self.realtime = realtime
            case let .data(data):
                self.data = data
            case let .zlevel(zlevel):
                self.zlevel = zlevel
            case let .z(z):
                self.z = z
            case let .silent(silent):
                self.silent = silent
            case let .animation(animation):
                self.animation = animation
            case let .animationThreshold(animationThreshold):
                self.animationThreshold = animationThreshold
            case let .animationDuration(animationDuration):
                self.animationDuration = animationDuration
            case let .animationEasing(animationEasing):
                self.animationEasing = animationEasing
            case let .animationDelay(animationDelay):
                self.animationDelay = animationDelay
            case let .animationDurationUpdate(animationDurationUpdate):
                self.animationDurationUpdate = animationDurationUpdate
            case let .animationEasingUpdate(animationEasingUpdate):
                self.animationEasingUpdate = animationEasingUpdate
            case let .animationDelayUpdate(animationDelayUpdate):
                self.animationDelayUpdate = animationDelayUpdate
            }
        }
    }
}

extension ParallelSerie: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["coordinateSystem"] = coordinateSystem
        map["parallelIndex"] = parallelIndex
        map["name"] = name
        map["lineStyle"] = lineStyle
        map["inactiveOpacity"] = inactiveOpacity
        map["activeOpacity"] = activeOpacity
        map["realtime"] = realtime
        map["data"] = data
        map["zlevel"] = zlevel
        map["z"] = z
        map["silent"] = silent
        map["animation"] = animation
        map["animationThreshold"] = animationThreshold
        map["animationDuration"] = animationDuration
        map["animationEasing"] = animationEasing
        map["animationDelay"] = animationDelay
        map["animationDurationUpdate"] = animationDurationUpdate
        map["animationEasingUpdate"] = animationEasingUpdate
        map["animationDelayUpdate"] = animationDelayUpdate
    }
}
