//
//  AxisPointer.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 26/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public final class AxisPointerForAxis: Displayable {
    
    /// 提示框触发的条件
    ///
    /// - mousemove: 鼠标移动时触发
    /// - click: 鼠标点击时触发
    /// - none: 不触发，用户可以通过 action.tooltip.showTip 和 action.tooltip.hideTip 来手动触发和隐藏。
    /// - Note: 该属性为 ECharts 3.0 中新加。
    public enum TriggerOn: String, Jsonable {
        case mousemove = "mousemove"
        case click = "click"
        case none = "none"
        
        public var jsonString: String {
            return self.rawValue.jsonString
        }
    }
    
    /// 指示器类型。
    ///
    /// - line: 直线指示器
    /// - shadow: 阴影指示器
    public enum `Type`: String, Jsonable {
        case line = "line"
        case shadow = "shadow"
        
        public var jsonString: String {
            return self.rawValue.jsonString
        }
    }
    
    /// 拖拽手柄，适用于触屏的环境。参见: http://echarts.baidu.com/gallery/editor.html?c=line-tooltip-touch&edit=1&reset=1
    public final class Handle: Displayable, Shadowable {
        /// 当 show 设为 true 时开启，这时显示手柄，并且 axisPointer 会一直显示。
        public var show: Bool?
        /// 手柄的图标。
        ///
        /// 在 ECharts 3 里可以通过 'path://' 将图标设置为任意的矢量路径。这种方式相比于使用图片的方式，不用担心因为缩放而产生锯齿或模糊，而且可以设置为任意颜色。路径图形会自适应调整为合适（如果是 symbol 的话就是 symbolSize）的大小。路径的格式参见 SVG PathData。可以从 Adobe Illustrator 等工具编辑导出。
        ///
        /// 也可以通过 'image://url' 设置为图片，其中 url 为图片的链接。
        ///
        /// 参见 使用图片的例子: http://echarts.baidu.com/gallery/editor.html?c=doc-example/axisPointer-handle-image&edit=1&reset=1
        public var icon: String?
        /// 手柄的尺寸，可以设置单值，如 45，也可以设置为数组：[width, height]。
        public var size: Pair<Float>?
        /// 手柄与轴的距离。注意，这是手柄中心点和轴的距离。
        public var margin: Float?
        /// 手柄颜色。
        public var color: Color?
        /// 手柄拖拽时触发视图更新周期，单位毫秒，调大这个数值可以改善性能，但是降低体验。
        public var throttle: Float?
        /// 图形阴影的模糊大小。该属性配合 shadowColor,shadowOffsetX, shadowOffsetY 一起设置图形的阴影效果。
        ///
        /// 示例：
        ///
        ///     {
        ///         shadowColor: 'rgba(0, 0, 0, 0.5)',
        ///         shadowBlur: 10
        ///     }
        public var shadowBlur: Float?
        /// 阴影颜色。支持的格式同color。
        public var shadowColor: Color?
        /// 阴影水平方向上的偏移距离。
        public var shadowOffsetX: Float?
        /// 阴影垂直方向上的偏移距离。
        public var shadowOffsetY: Float?
        
        public  init() {}
    }
    
    /// 默认不显示。但是如果 tooltip.trigger 设置为 'axis' 或者 tooltip.axisPointer.type 设置为 'cross'，则自动显示 axisPointer。坐标系会自动选择显示显示哪个轴的 axisPointer，也可以使用 tooltip.axisPointer.axis 改变这种选择。
    public var show: Bool?
    /// 指示器类型。
    ///
    /// 可选
    ///
    /// - 'line' 直线指示器
    /// - 'shadow' 阴影指示器
    public var type: Type?
    /// 坐标轴指示器是否自动吸附到点上。默认自动判断。
    ///
    /// 这个功能在数值轴和时间轴上比较有意义，可以自动寻找细小的数值点。
    public var snap: Bool?
    /// 坐标轴指示器的 z 值。控制图形的前后顺序。z值小的图形会被z值大的图形覆盖。
    public var z: Float?
    /// 坐标轴指示器的文本标签。
    public var label: Label?
    /// axisPointer.type 为 'line' 时有效。
    public var lineStyle: LineStyle?
    /// axisPointer.type 为 'shadow' 时有效。
    public var shadowStyle: ShadowStyle?
    /// 是否触发 tooltip。如果不想触发 tooltip 可以关掉。
    public var triggerTooltip: Bool?
    /// 当前的 value。在使用 axisPointer.handle 时，可以设置此值进行初始值设定，从而决定 axisPointer 的初始位置。
    public var value: Float?
    /// 当前的状态
    public var state: Bool?
    /// 拖拽手柄，适用于触屏的环境。参见: http://echarts.baidu.com/gallery/editor.html?c=line-tooltip-touch&edit=1&reset=1
    public var handle: Handle?
    
    /// 不同轴的 axisPointer 可以进行联动，在这里设置。联动表示轴能同步一起活动。轴依据他们的 axisPointer 当前对应的值来联动。
    ///
    /// 联动的效果可以看这两个例子：例子A(http://www.echartsjs.com/gallery/view.html?c=candlestick-brush&edit=1&reset=1)，例子B(http://www.echartsjs.com/gallery/view.html?c=scatter-nutrients-matrix&edit=1&reset=1)。
    ///
    /// link 是一个数组，其中每一项表示一个 link group，一个 group 中的坐标轴互相联动。例如：
    ///
    ///     link: [
    ///         {
    ///             // 表示所有 xAxisIndex 为 0、3、4 和 yAxisName 为 'someName' 的坐标轴联动。
    ///             xAxisIndex: [0, 3, 4],
    ///             yAxisName: 'someName'
    ///         },
    ///         {
    ///             // 表示左右 xAxisId 为 'aa'、'cc' 以及所有的 angleAxis 联动。
    ///             xAxisId: ['aa', 'cc'],
    ///             angleAxis: 'all'
    ///         },
    ///         ...
    ///     ]
    ///
    /// 如上所示，每个 link group 中可以用这些方式引用坐标轴：
    ///
    ///     {
    ///         // 以下的 'some' 均表示轴的维度，也就是表示 'x', 'y', 'radius', 'angle', 'single'
    ///         someAxisIndex: [...], // 可以是一个数组或单值或 'all'
    ///         someAxisName: [...],  // 可以是一个数组或单值或 'all'
    ///         someAxisId: [...],    // 可以是一个数组或单值或 'all'
    ///     }
    ///
    /// 如何联动不同类型（axis.type）的轴？
    ///
    /// 如果 axis 的类型不同，比如 axisA type 为 'category'，axisB type 为 'time'，可以在每个 link group 中写转换函数（mapper）来进行值的转换，例如：
    ///
    ///     link: [{
    ///         xAxisIndex: [0, 1],
    ///         yAxisName: ['yy'],
    ///         mapper: function (sourceVal, sourceAxisInfo, targetAxisInfo) {
    ///             if (sourceAxisInfo.axisName === 'yy') {
    ///                 // from timestamp to '2012-02-05'
    ///                 return echarts.format.formatTime('yyyy-MM-dd', sourceVal);
    ///             }
    ///             else if (targetAxisInfo.axisName === 'yy') {
    ///                 // from '2012-02-05' to date
    ///                 return echarts.number.parseDate(dates[sourceVal]);
    ///             }
    ///             else {
    ///                 return sourceVal;
    ///             }
    ///         }
    ///     }]
    ///
    /// mapper 的输入参数：
    ///
    /// {number} sourceVal
    /// {Object} sourceAxisInfo 里面包含 {axisDim, axisId, axisName, axisIndex} 等信息
    /// {Object} targetAxisInfo 里面包含 {axisDim, axisId, axisName, axisIndex} 等信息
    ///
    /// mapper 的返回值：
    ///
    /// {number} 转换结果
    /// ## 该属性暂时只在Options中生效
    public var link: OneOrMore<[String: Jsonable]>?
    /// 提示框触发的条件
    /// ## 该属性暂时只在Option中生效
    public var triggerOn: TriggerOn?
}

public typealias AxisPointerForOption = AxisPointerForAxis

extension AxisPointerForAxis.Handle: Enumable {
    public enum Enums {
        case show(Bool), icon(String), size(Pair<Float>), margin(Float), color(Color), throttle(Float), shadowBlur(Float), shadowColor(Color), shadowOffsetX(Float), shadowOffsetY(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .icon(icon):
                self.icon = icon
            case let .size(size):
                self.size = size
            case let .margin(margin):
                self.margin = margin
            case let .color(color):
                self.color = color
            case let .throttle(throttle):
                self.throttle = throttle
            case let .shadowBlur(shadowBlur):
                self.shadowBlur = shadowBlur
            case let .shadowColor(shadowColor):
                self.shadowColor = shadowColor
            case let .shadowOffsetX(shadowOffsetX):
                self.shadowOffsetX = shadowOffsetX
            case let .shadowOffsetY(shadowOffsetY):
                self.shadowOffsetY = shadowOffsetY
            }
        }
    }
}

extension AxisPointerForAxis.Handle: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["icon"] = icon
        map["size"] = size
        map["margin"] = margin
        map["color"] = color
        map["throttle"] = throttle
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
    }
}

extension AxisPointerForAxis: Enumable {
    public enum Enums {
        case show(Bool), type(Type), snap(Bool), z(Float), label(Label), lineStyle(LineStyle), shadowStyle(ShadowStyle), triggerTooltip(Bool), value(Float), state(Bool), handle(Handle), link([String: Jsonable]), links([[String: Jsonable]]), triggerOn(TriggerOn)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .type(type):
                self.type = type
            case let .snap(snap):
                self.snap = snap
            case let .z(z):
                self.z = z
            case let .label(label):
                self.label = label
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            case let .shadowStyle(shadowStyle):
                self.shadowStyle = shadowStyle
            case let .triggerTooltip(triggerTooltip):
                self.triggerTooltip = triggerTooltip
            case let .value(value):
                self.value = value
            case let .state(state):
                self.state = state
            case let .handle(handle):
                self.handle = handle
            case let .link(link):
                self.link = OneOrMore(one: link)
            case let .links(links):
                self.link = OneOrMore(more: links)
            case let .triggerOn(triggerOn):
                self.triggerOn = triggerOn
            }
        }
    }
}

extension AxisPointerForAxis: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["type"] = type
        map["snap"] = snap
        map["z"] = z
        map["label"] = label
        map["lineStyle"] = lineStyle
        map["shadowStyle"] = shadowStyle
        map["triggerTooltip"] = triggerTooltip
        map["value"] = value
        map["state"] = state
        map["handle"] = handle
        map["link"] = link
        map["triggerOn"] = triggerOn
    }
}

/// 坐标轴指示器配置项
public final class AxisPointerForTooltip: Line, Animatable {
    
    /// 十字准星指示器样式
    public final class CrossStyle: Shadowable, Colorful{
        /// 线的颜色
        public var color: Color?
        /// 线宽
        public var width: Float?
        /// 线的类型
        public var type: LineType?
        
        public var shadowBlur: Float?
        public var shadowColor: Color?
        public var shadowOffsetX: Float?
        public var shadowOffsetY: Float?
        
        public var textStyle: TextStyle?
        
        public init() { }
    }
    
    /// 指示器类型
    ///
    /// - line: 直线指示器
    /// - cross: 十字准星指示器
    /// - shadow: 阴影指示器
    public enum `Type`: String, Jsonable {
        case line = "line", cross = "cross", shadow = "shadow", none = "none"
        
        public var jsonString: String {
            return self.rawValue.jsonString
        }
    }
    
    /// 指示器的坐标轴
    public enum Axis: String, Jsonable {
        case x = "x"
        case y = "y"
        case radius = "radius"
        case angle = "angle"
        case auto = "auto"
        
        public var jsonString: String {
            return self.rawValue.jsonString
        }
    }
    
    /// 指示器类型
    public var type: Type?
    /// 指示器的坐标轴。
    ///
    /// 默认情况，坐标系会自动选择显示哪个轴的 axisPointer（默认取类目轴或者时间轴）。
    ///
    /// 可以是 'x', 'y', 'radius', 'angle'。默认取类目轴或者时间轴。
    public var axis: Axis?
    /// 是否开启动画，默认开启。
    public var animation: Bool?
    /// 是否开启动画的阈值，当单个系列显示的图形数量大于这个阈值时会关闭动画。
    public var animationThreshold: Float?
    /// 初始动画的时长。
    public var animationDuration: Time?
    /// 初始动画的缓动效果。
    public var animationEasing: EasingFunction?
    /// 初始动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的初始动画效果。
    /// 如下示例：
    ///
    ///     animationDelayUpdate: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDelay: Time?
    /// 数据更新动画的时长。
    public var animationDurationUpdate: Time?
    /// 数据更新动画的缓动效果。
    public var animationEasingUpdate: EasingFunction?
    /// 数据更新动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的更新动画效果。
    /// 如下示例：
    ///
    ///         animationDelayUpdate: function (idx) {
    ///             // 越往后的数据延迟越大
    ///             return idx * 100;
    ///         }
    public var animationDelayUpdate: Time?
    /// axisPointer.type 为 'line' 时有效。
    public var lineStyle: LineStyle?
    /// axisPointer.type 为 'cross' 时有效。
    public var crossStyle: CrossStyle?
    /// axisPointer.type 为 'shadow' 时有效。
    public var shadowStyle: ShadowStyle?
    
    public init() { }
}

extension AxisPointerForTooltip.CrossStyle: Enumable {
    public enum Enums {
        case color(Color), width(Float), type(LineType), shadowBlur(Float), shadowColor(Color), shadowOffsetX(Float), shadowOffsetY(Float), textStyle(TextStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .color(color):
                self.color = color
            case let .width(width):
                self.width = width
            case let .type(type):
                self.type = type
            case let .shadowBlur(blur):
                self.shadowBlur = blur
            case let .shadowColor(color):
                self.shadowColor = color
            case let .shadowOffsetX(x):
                self.shadowOffsetX = x
            case let .shadowOffsetY(y):
                self.shadowOffsetY = y
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            }
        }
    }
}

extension AxisPointerForTooltip.CrossStyle: Mappable {
    public func mapping(_ map: Mapper) {
        map["color"] = color
        map["width"] = width
        map["type"] = type
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["textStyle"] = textStyle
    }
}

extension AxisPointerForTooltip: Enumable {
    public enum Enums {
        case type(Type), axis(Axis), animation(Bool), animationThreshold(Float), animationDuration(Time), animationEasing(EasingFunction), animationDelay(Time), animationDurationUpdate(Time), animationEasingUpdate(EasingFunction), animationDelayUpdate(Time), lineStyle(LineStyle), crossStyle(CrossStyle), shadowStyle(ShadowStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .type(type):
                self.type = type
            case let .axis(axis):
                self.axis = axis
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
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            case let .crossStyle(crossStyle):
                self.crossStyle = crossStyle
            case let .shadowStyle(shadowStyle):
                self.shadowStyle = shadowStyle
            }
        }
    }
}

extension AxisPointerForTooltip: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["axis"] = axis
        map["animation"] = animation
        map["animationThreshold"] = animationThreshold
        map["animationDuration"] = animationDuration
        map["animationEasing"] = animationEasing
        map["animationDelay"] = animationDelay
        map["animationDurationUpdate"] = animationDurationUpdate
        map["animationEasingUpdate"] = animationEasingUpdate
        map["animationDelayUpdate"] = animationDelayUpdate
        map["lineStyle"] = lineStyle
        map["crossStyle"] = crossStyle
        map["shadowStyle"] = shadowStyle
    }
}
