//
//  Radar.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 雷达图坐标系组件，只适用于雷达图。该组件等同 ECharts 2 中的 polar 组件。因为 3 中的 polar 被重构为标准的极坐标组件，为避免混淆，雷达图使用 radar 组件作为其坐标系。
///
/// 雷达图坐标系与极坐标系不同的是它的每一个轴（indicator 指示器）都是一个单独的维度，可以通过 name、axisLine、axisTick、axisLabel、splitLine、 splitArea 几个配置项配置指示器坐标轴线的样式。
///
/// 下面是一个 radar 组件的一个自定义例子。
///
/// http://echarts.baidu.com/gallery/editor.html?c=doc-example/radar
public final class Radar: Zable {
    /// 雷达图每个指示器名称的配置项。
    public final class Name: Displayable, Formatted, Textful {
        public var show: Bool?
        public var formatter: Formatter?
        public var textStyle: TextStyle?
        
        public init() {}
    }
    
    /// 雷达图绘制类型
    ///
    /// - polygon:
    /// - circle:
    public enum Shape: String, Jsonable {
        case polygon = "polygon"
        case circle = "circle"
        
        public var jsonString: String {
            return self.rawValue.jsonString
        }
    }
    
    /// 雷达图的指示器，用来指定雷达图中的多个变量（维度），如下示例。
    ///
    ///     indicator: [
    ///         { name: '销售（sales）', max: 6500},
    ///         { name: '管理（Administration）', max: 16000},
    ///         { name: '信息技术（Information Techology）', max: 30000},
    ///         { name: '客服（Customer Support）', max: 38000},
    ///         { name: '研发（Development）', max: 52000},
    ///         { name: '市场（Marketing）', max: 25000}
    ///     ]
    public final class Indicator {
        /// 指示器名称。
        public var name: String?
        /// 指示器的最大值，可选，建议设置
        public var max: Float?
        /// 指示器的最小值，可选，默认为 0。
        public var min: Float?
        
        public init() {}
    }
    // MARK: - Zable
    public var zlevel: Float?
    public var z: Float?
    
    /// 坐标系的中心（圆心）坐标，数组的第一项是横坐标，第二项是纵坐标。
    ///
    /// 支持设置成百分比，设置成百分比时第一项是相对于容器宽度，第二项是相对于容器高度。
    ///
    /// 使用示例：
    ///
    ///     // 设置成绝对的像素值
    ///     center: [400, 300]
    ///     // 设置成相对的百分比
    ///     center: [50%, 50%]
    public var center: Point?
    /// 坐标系的半径，数组的第一项是内半径，第二项是外半径。
    /// 支持设置成百分比，相对于容器高宽中较小的一项的一半。
    public var radius: LengthValue?
    /// 坐标系起始角度，也就是第一个指示器轴的角度。
    public var startAngle: Float?
    /// 雷达图每个指示器名称的配置项。
    public var name: Name?
    /// 指示器名称和指示器轴的距离。
    public var nameGap: Float?
    /// 指示器轴的分割段数。
    public var splitNumber: Int?
    /// 雷达图绘制类型，支持 'polygon' 和 'circle'。
    public var shape: Shape?
    /// 是否是脱离 0 值比例。设置成 true 后坐标刻度不会强制包含零刻度。在双数值轴的散点图中比较有用。
    public var scale: Bool?
    /// 坐标轴是否是静态无法交互。
    public var silent: Bool?
    /// 坐标轴的标签是否响应和触发鼠标事件，默认不响应。
    ///
    /// 事件参数如下：
    ///
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
    /// 雷达图的指示器，用来指定雷达图中的多个变量（维度），如下示例。
    ///
    ///     indicator: [
    ///         { name: '销售（sales）', max: 6500},
    ///         { name: '管理（Administration）', max: 16000},
    ///         { name: '信息技术（Information Techology）', max: 30000},
    ///         { name: '客服（Customer Support）', max: 38000},
    ///         { name: '研发（Development）', max: 52000},
    ///         { name: '市场（Marketing）', max: 25000}
    ///     ]
    public var indicator: [Indicator]?
    
    public init() {}
}

public typealias RadarIndicator = Radar.Indicator


extension Radar.Name: Enumable {
    public enum Enums {
        case show(Bool), formatter(Formatter), textStyle(TextStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .formatter(formatter):
                self.formatter = formatter
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            }
        }
    }
}

extension Radar.Name: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["formatter"] = formatter
        map["textStyle"] = textStyle
    }
}

extension RadarIndicator: Enumable {
    public enum Enums {
        case text(String), name(String), max(Float), min(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .text(name):
                self.name = name
            case let .name(name):
                self.name = name
            case let .max(max):
                self.max = max
            case let .min(min):
                self.min = min
            }
        }
    }
}

extension RadarIndicator: Mappable {
    public func mapping(_ map: Mapper) {
        map["name"] = name
        map["max"] = max
        map["min"] = min
    }
}

extension Radar: Enumable {
    public enum Enums {
        case zlevel(Float), z(Float), center(Point), radius(LengthValue), startAngle(Float), name(Name), nameGap(Float), splitNumber(Int), shape(Shape), scale(Bool), silent(Bool), triggerEvent(Bool), axisLine(AxisLine), axisTick(AxisTick), axisLabel(AxisLabel), splitLine(SplitLine), splitArea(SplitArea), indicator([Indicator])
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .zlevel(zlevel):
                self.zlevel = zlevel
            case let .z(z):
                self.z = z
            case let .center(center):
                self.center = center
            case let .radius(radius):
                self.radius = radius
            case let .startAngle(startAngle):
                self.startAngle = startAngle
            case let .name(name):
                self.name = name
            case let .nameGap(nameGap):
                self.nameGap = nameGap
            case let .splitNumber(splitNumber):
                self.splitNumber = splitNumber
            case let .shape(shape):
                self.shape = shape
            case let .scale(scale):
                self.scale = scale
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
            case let .indicator(indicator):
                self.indicator = indicator
            }
        }
    }
}

extension Radar: Mappable {
    public func mapping(_ map: Mapper) {
        map["zlevel"] = zlevel
        map["z"] = z
        map["center"] = center
        map["radius"] = radius
        map["startAngle"] = startAngle
        map["name"] = name
        map["nameGap"] = nameGap
        map["splitNumber"] = splitNumber
        map["shape"] = shape
        map["scale"] = scale
        map["silent"] = silent
        map["triggerEvent"] = triggerEvent
        map["axisLine"] = axisLine
        map["axisTick"] = axisTick
        map["axisLabel"] = axisLabel
        map["splitLine"] = splitLine
        map["splitArea"] = splitArea
        map["indicator"] = indicator
    }
}
