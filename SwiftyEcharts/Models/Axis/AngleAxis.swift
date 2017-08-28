//
//  AngleAxis.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 极坐标系的角度轴。
public final class AngleAxis: Zable {
    /// 类目数据，在类目轴（type: 'category'）中有效。
    ///
    /// 示例：
    ///
    ///     // 所有类目名称列表
    ///         data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
    ///         // 每一项也可以是具体的配置项，此时取配置项中的 `value` 为类目名
    ///         data: [{
    ///         value: '周一',
    ///         // 突出周一
    ///         textStyle: {
    ///             fontSize: 20,
    ///             color: 'red'
    ///         }
    ///     }, '周二', '周三', '周四', '周五', '周六', '周日']
    public final class Data {
        /// 单个类目名称。
        public var value: String?
        /// 类目标签的文字样式。
        public var textStyle: TextStyle?
        
        public init() {}
    }
    /// 角度轴所在的极坐标系的索引，默认使用第一个极坐标系。
    public var polarIndex: UInt8?
    /// 起始刻度的角度，默认为 90 度，即圆心的正上方。0 度为圆心的正右方。
    ///
    /// 如下示例是 startAngle 为 45 的效果：
    ///
    /// http://echarts.baidu.com/gallery/editor.html?c=doc-example/polar-start-angle
    public var startAngle: Float?
    /// 刻度增长是否按顺时针，默认顺时针。
    ///
    /// 如下示例是 clockwise 为 false （逆时针）的效果：
    ///
    /// http://echarts.baidu.com/gallery/editor.html?c=doc-example/polar-anticlockwise
    public var clockwise: Bool?
    /// 坐标轴类型。
    public var type: AxisType?
    /// 坐标轴两边留白策略，类目轴和非类目轴的设置和表现不一样。
    ///
    /// 类目轴中 boundaryGap 可以配置为 true 和 false。默认为 true，这时候刻度只是作为分隔线，标签和数据点都会在两个刻度之间的带(band)中间。
    ///
    /// 非类目轴，包括时间，数值，对数轴，boundaryGap是一个两个值的数组，分别表示数据最小值和最大值的延伸范围，可以直接设置数值或者相对的百分比，在设置 min 和 max 后无效。 示例：
    ///
    /// boundaryGap: ['20%', '20%']
    public var boundaryGap: BoundaryGap?
    /// 坐标轴刻度最大值。
    ///
    /// 可以设置成特殊值 'dataMax'，此时取数据在该轴上的最大值作为最大刻度。
    ///
    /// 不设置时会自动计算最大值保证坐标轴刻度的均匀分布。
    ///
    /// 在类目轴中，也可以设置为类目的序数（如类目轴 data: ['类A', '类B', '类C'] 中，序数 2 表示 '类C'。也可以设置为负数，如 -3）。
    public var min: Float?
    /// 坐标轴刻度最大值。
    ///
    /// 可以设置成特殊值 'dataMax'，此时取数据在该轴上的最大值作为最大刻度。
    ///
    /// 不设置时会自动计算最大值保证坐标轴刻度的均匀分布。
    ///
    /// 在类目轴中，也可以设置为类目的序数（如类目轴 data: ['类A', '类B', '类C'] 中，序数 2 表示 '类C'。也可以设置为负数，如 -3）。
    public var max: Float?
    /// /// 只在数值轴中（type: 'value'）有效。
    ///
    /// 是否是脱离 0 值比例。设置成 true 后坐标刻度不会强制包含零刻度。在双数值轴的散点图中比较有用。
    ///
    /// 在设置 min 和 max 之后该配置项无效。
    public var scale: Bool?
    /// 坐标轴的分割段数，需要注意的是这个分割段数只是个预估值，最后实际显示的段数会在这个基础上根据分割后坐标轴刻度显示的易读程度作调整。
    ///
    /// 在类目轴中无效。
    public var splitNumber: UInt8?
    /// 自动计算的坐标轴最小间隔大小。
    ///
    /// 例如可以设置成1保证坐标轴分割刻度显示成整数。
    ///
    ///     {
    ///         minInterval: 1
    ///     }
    ///
    /// 只在数值轴中（type: 'value'）有效。
    public var minInterval: UInt8?
    /// 强制设置坐标轴分割间隔。
    ///
    /// 因为 splitNumber 是预估的值，实际根据策略计算出来的刻度可能无法达到想要的效果，这时候可以使用 interval 配合 min、max 强制设定刻度划分，一般不建议使用。
    ///
    /// 无法在类目轴中使用。在时间轴（type: 'time'）中需要传时间戳，在对数轴（type: 'log'）中需要传指数值。
    public var interval: UInt?
    /// 对数轴的底数，只在对数轴中（type: 'log'）有效。
    public var logBase: Float?
    /// 坐标轴是否是静态无法交互。
    public var silent: Bool?
    /// 坐标轴的标签是否响应和触发鼠标事件，默认不响应。
    /// 事件参数如下：
    ///     {
    ///         // 组件类型，xAxis, yAxis, radiusAxis, angleAxis
    ///         // 对应组件类型都会有一个属性表示组件的 index，例如 xAxis 就是 xAxisIndex
    ///         componentType: string,
    ///         // 未格式化过的刻度值, 点击刻度标签有效
    ///         value: '',
    ///         // 坐标轴名称, 点击坐标轴名称有效
    ///         name: ''
    ///     }
    public var triggerEvent: Bool?
    /// 坐标轴轴线相关设置。
    public var axisLine: AxisLine?
    /// 坐标轴刻度相关设置。
    public var axisTick: AxisTick?
    /// 坐标轴刻度标签的相关设置。
    public var axisLabel: AxisLabel?
    /// 坐标轴在 grid 区域中的分隔线。
    public var splitLine: SplitLine?
    /// 坐标轴在 grid 区域中的分隔区域，默认不显示。
    public var splitArea: SplitArea?
    /// 数据
    public var data: [Jsonable]?
    /// 指示器
    public var axisPointer: AxisPointerForAxis?
    
    /// MARK: - Zable
    public var zlevel: Float?
    public var z: Float?
    
    public init() {}
}

extension AngleAxis.Data: Enumable {
    public enum Enums {
        case value(String), textStyle(TextStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .value(value):
                self.value = value
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            }
        }
    }
}

extension AngleAxis.Data: Mappable {
    public func mapping(_ map: Mapper) {
        map["value"] = value
        map["textStyle"] = textStyle
    }
}

extension AngleAxis: Enumable {
    public enum Enums {
        case polarIndex(UInt8), startAngle(Float), clockwise(Bool), type(AxisType), boundaryGap(BoundaryGap), min(Float), max(Float), scale(Bool), splitNumber(UInt8), minInterval(UInt8), interval(UInt), logBase(Float), silent(Bool), triggerEvent(Bool), axisLine(AxisLine), axisTick(AxisTick), axisLabel(AxisLabel), splitLine(SplitLine), splitArea(SplitArea), data([Jsonable]), axisPointer(AxisPointerForAxis), zlevel(Float), z(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .polarIndex(polarIndex):
                self.polarIndex = polarIndex
            case let .startAngle(startAngle):
                self.startAngle = startAngle
            case let .clockwise(clockwise):
                self.clockwise = clockwise
            case let .type(type):
                self.type = type
            case let .boundaryGap(boundaryGap):
                self.boundaryGap = boundaryGap
            case let .min(min):
                self.min = min
            case let .max(max):
                self.max = max
            case let .scale(scale):
                self.scale = scale
            case let .splitNumber(splitNumber):
                self.splitNumber = splitNumber
            case let .minInterval(minInterval):
                self.minInterval = minInterval
            case let .interval(interval):
                self.interval = interval
            case let .logBase(logBase):
                self.logBase = logBase
            case let .silent(silent):
                self.silent = silent
            case let .triggerEvent(triggerEvent):
                self.triggerEvent = triggerEvent
            case let .axisLine(axisLine):
                self.axisLine = axisLine
            case let .axisTick(axisTick):
                self.axisTick = axisTick
            case let .axisLabel(axisLabel):
                self.axisLabel = axisLabel
            case let .splitLine(splitLine):
                self.splitLine = splitLine
            case let .splitArea(splitArea):
                self.splitArea = splitArea
            case let .data(data):
                self.data = data
            case let .axisPointer(axisPointer):
                self.axisPointer = axisPointer
            case let .zlevel(zlevel):
                self.zlevel = zlevel
            case let .z(z):
                self.z = z
            }
        }
    }
}

extension AngleAxis: Mappable {
    public func mapping(_ map: Mapper) {
        map["polarIndex"] = polarIndex
        map["startAngle"] = startAngle
        map["clockwise"] = clockwise
        map["type"] = type
        map["boundaryGap"] = boundaryGap
        map["min"] = min
        map["max"] = max
        map["scale"] = scale
        map["splitNumber"] = splitNumber
        map["minInterval"] = minInterval
        map["interval"] = interval
        map["logBase"] = logBase
        map["silent"] = silent
        map["triggerEvent"] = triggerEvent
        map["axisLine"] = axisLine
        map["axisTick"] = axisTick
        map["axisLabel"] = axisLabel
        map["splitLine"] = splitLine
        map["splitArea"] = splitArea
        map["data"] = data
        map["zlevel"] = zlevel
        map["z"] = z
    }
}
