//
//  SECBarSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 18/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 柱状/条形图 通过 柱形的高度/条形的宽度 来表现数据的大小，用于有至少一个类目轴或时间轴的直角坐标系上。
public struct SECBarSerie : SECSeries, SECAnimatable {
    /// 类型
    public var type: SECSerieType {
        return .bar
    }
    
    /// 系列名称，用于tooltip的显示，legend 的图例筛选，在 setOption 更新数据和配置项时用于指定对应的系列。
    public var name: String?
    /// 是否启用图例 hover 时的联动高亮。
    public var legendHoverLine: Bool?
    /// 该系列使用的坐标系
    /// 目前可选为： cartesian2d
    /// 使用二维的直角坐标系（也称笛卡尔坐标系），通过 xAxisIndex, yAxisIndex指定相应的坐标轴组件。
    public var coordinateSystem: SECCoordinateSystem?
    /// 使用的 x 轴的 index，在单个图表实例中存在多个 x 轴的时候有用。
    public var xAxisIndex: UInt8?
    /// 使用的 y 轴的 index，在单个图表实例中存在多个 y轴的时候有用。
    public var yAxisIndex: UInt8?
    /// 图形上的文本标签，可用于说明图形的一些数据信息，比如值，名称等，label选项在 ECharts 2.x 中放置于itemStyle.normal下，在 ECharts 3 中为了让整个配置项结构更扁平合理，label 被拿出来跟 itemStyle 平级，并且跟 itemStyle 一样拥有 normal, emphasis 两个状态。
    public var label: Label?
    /// 图形样式，有 normal 和 emphasis 两个状态。normal 是图形在默认状态下的样式；emphasis 是图形在高亮状态下的样式，比如在鼠标悬浮或者图例联动高亮时。
    public var itemStyle: ItemStyle?
    /// 数据堆叠，同个类目轴上系列配置相同的stack值可以堆叠放置。
    public var stack: String?
    /// 柱条的宽度，不设时自适应。支持设置成相对于类目宽度的百分比。
    /// 在同一坐标系上，此属性会被多个 'bar' 系列共享。此属性应设置于此坐标系中最后一个 'bar' 系列上才会生效，并且是对此坐标系中所有 'bar' 系列生效。
    public var barWidth: Float?
    /// 柱条的最大宽度，不设时自适应。支持设置成相对于类目宽度的百分比。
    /// 在同一坐标系上，此属性会被多个 'bar' 系列共享。此属性应设置于此坐标系中最后一个 'bar' 系列上才会生效，并且是对此坐标系中所有 'bar' 系列生效。
    public var barMaxWidth: Float?
    /// 柱条最小高度，可用于防止某数据项的值过小而影响交互。
    public var barMinHeight: Float?
    /// 柱间距离，可设固定值（如 20）或者百分比（如 '30%'，表示柱子宽度的 30%）。
    /// 如果想要两个系列的柱子重叠，可以设置 barGap 为 '-100%'。这在用柱子做背景的时候有用。
    /// 在同一坐标系上，此属性会被多个 'bar' 系列共享。此属性应设置于此坐标系中最后一个 'bar' 系列上才会生效，并且是对此坐标系中所有 'bar' 系列生效。
    /// - Note: 目前只支持数值
    /// - See Also: http://echarts.baidu.com/gallery/editor.html?c=doc-example/barGrid-barGap
    public var barGap: String? // FIXME: ??是否需要新类型
    /// 类目间柱形距离，默认为类目间距的20%，可设固定值
    /// 在同一坐标系上，此属性会被多个 'bar' 系列共享。此属性应设置于此坐标系中最后一个 'bar' 系列上才会生效，并且是对此坐标系中所有 'bar' 系列生效。
    public var barCategoryGap: String? // FIXME: ??是否需要新类型
    /// 数据
    public var data: [Any]?
    /// 图表标注。
    public var markPoint: SECMarkPoint?
    /// 图表标线。
    public var markLine: SECMarkLine?
    /// 图表标域，常用于标记图表中某个范围的数据，例如标出某段时间投放了广告。
    public var markArea: SECMarkArea?
    /// 柱状图所有图形的 zlevel 值。
    /// zlevel用于 Canvas 分层，不同zlevel值的图形会放置在不同的 Canvas 中，Canvas 分层是一种常见的优化手段。我们可以把一些图形变化频繁（例如有动画）的组件设置成一个单独的zlevel。需要注意的是过多的 Canvas 会引起内存开销的增大，在手机端上需要谨慎使用以防崩溃。
    /// zlevel 大的 Canvas 会放在 zlevel 小的 Canvas 的上面。
    public var zlevel: Float?
    /// 柱状图组件的所有图形的z值。控制图形的前后顺序。z值小的图形会被z值大的图形覆盖。
    /// z相比zlevel优先级更低，而且不会创建新的 Canvas。
    public var z: Float?
    /// 图形是否不响应和触发鼠标事件，默认为 false，即响应和触发鼠标事件。
    public var silent: Bool?
    /// 是否开启动画。
    public var animation: Bool?
    /// 是否开启动画的阈值，当单个系列显示的图形数量大于这个阈值时会关闭动画。
    public var animationThreshold: Float?
    /// 初始动画的时长，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的初始动画效果：
    ///
    ///     animationDuration: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDuration: SECTime?
    /// 初始动画的缓动效果。不同的缓动效果可以参考
    public var animationEasing: SECAnimation?
    /// 初始动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的初始动画效果。
    ///
    /// 如下示例：
    ///
    ///     animationDuration: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDelay: SECTime?
    /// 数据更新动画的时长。
    /// 支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的更新动画效果：
    ///     animationDurationUpdate: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDurationUpdate: SECTime?
    /// 数据更新动画的缓动效果。
    public var animationEasingUpdate: SECAnimation?
    /// 数据更新动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的更新动画效果。
    /// 如下示例：
    ///
    ///     animationDelayUpdate: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDelayUpdate: SECTime?
}

extension SECBarSerie : SECEnumable {
    public enum Enums {
        case name(String), legendHoverLine(Bool), coordinateSystem(SECCoordinateSystem), xAxisIndex(UInt8), yAxisIndex(UInt8), label(Label), itemStyle(ItemStyle), stack(String), barWidth(Float), barMaxWidth(Float), barMinHeight(Float), barGap(String), barCategoryGap(String), data([Any]), markPoint(SECMarkPoint), markLine(SECMarkLine), markArea(SECMarkArea), zlevel(Float), z(Float), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(SECTime), animationEasing(SECAnimation), animationDelay(SECTime), animationDurationUpdate(SECTime), animationEasingUpdate(SECAnimation), animationDelayUpdate(SECTime)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .legendHoverLine(legendHoverLine):
                self.legendHoverLine = legendHoverLine
            case let .coordinateSystem(coordinateSystem):
                self.coordinateSystem = coordinateSystem
            case let .xAxisIndex(xAxisIndex):
                self.xAxisIndex = xAxisIndex
            case let .yAxisIndex(yAxisIndex):
                self.yAxisIndex = yAxisIndex
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .stack(stack):
                self.stack = stack
            case let .barWidth(barWidth):
                self.barWidth = barWidth
            case let .barMaxWidth(barMaxWidth):
                self.barMaxWidth = barMaxWidth
            case let .barMinHeight(barMinHeight):
                self.barMinHeight = barMinHeight
            case let .barGap(barGap):
                self.barGap = barGap
            case let .barCategoryGap(barCategoryGap):
                self.barCategoryGap = barCategoryGap
            case let .data(data):
                self.data = data
            case let .markPoint(markPoint):
                self.markPoint = markPoint
            case let .markLine(markLine):
                self.markLine = markLine
            case let .markArea(markArea):
                self.markArea = markArea
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

extension SECBarSerie : SECMappable {
    public func mapping(map: SECMap) {
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

extension SECBarSerie {
    public struct LabelContent {
        /// 是否显示标签。
        public var show: Bool?
        /// 标签的位置。
        public var position: SECPosition?
        /// 是否对文字进行偏移。默认不偏移。例如：[30, 40] 表示文字在横向上偏移 30，纵向上偏移 40。
        public var offset: [Float]?
        /// 标签内容格式器，支持字符串模板和回调函数两种形式，字符串模板与回调函数返回的字符串均支持用 \n 换行。
        public var formatter: SECFormatter?
        /// 标签的字体样式。
        public var textStyle: SECTextStyle?
    }
    
    public struct Label : SECEmphasisable {
        
        public typealias Style = LabelContent
        public var normal: Style?
        public var emphasis: Style?
        
    }
}

extension SECBarSerie.LabelContent : SECEnumable {
    public enum Enums {
        case show(Bool), position(SECPosition), offset([Float]), formatter(SECFormatter), textStyle(SECTextStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
             case let .position(position):
                self.position = position
            case let .offset(offset):
                self.offset = offset
            case let .formatter(formatter):
                self.formatter = formatter
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            }
        }
    }
}

extension SECBarSerie.LabelContent : SECMappable {
    public func mapping(map: SECMap) {
        map["show"] = show
        map["position"] = position
        map["offset"] = offset
        map["formatter"] = formatter
        map["textStyle"] = textStyle
    }
}


extension SECBarSerie.Label : SECEnumable {
    public enum Enums {
        case normal(Style), emphasis(Style)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .normal(normal):
                self.normal = normal
            case let .emphasis(emphasis):
                self.emphasis = emphasis
            }
        }
    }
}

extension SECBarSerie.Label : SECMappable {
    public func mapping(map: SECMap) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}

extension SECBarSerie {
    public struct ItemStyleContent: SECColorful, SECBorderable, SECShadowable, SECOpacitable {
        /// 柱条的颜色。 默认从全局调色盘 option.color 获取颜色
        public var color: SECColor?
        /// 柱条的描边颜色。
        public var borderColor: SECColor?
        /// 柱条的描边宽度，默认不描边。
        public var borderWidth: Float?
        /// 柱条的描边类型，默认为实线，支持 'dashed', 'dotted'。
        public var borderType: SECLineType?
        /// 柱形边框圆角半径，单位px，支持传入数组分别指定柱形4个圆角半径。 如:
        ///
        ///     barBorderRadius: 5, // 统一设置四个角的圆角大小
        ///     barBorderRadius: [5, 5, 0, 0] //（顺时针左上，右上，右下，左下）
        public var barBorderRadius: Float?
        /// 图形阴影的模糊大小。该属性配合 shadowColor,shadowOffsetX, shadowOffsetY 一起设置图形的阴影效果。
        /// 示例：
        ///
        ///     {
        ///         shadowColor: 'rgba(0, 0, 0, 0.5)',
        ///         shadowBlur: 10
        ///     }
        public var shadowBlur: Float?
        /// 阴影颜色。支持的格式同color。
        public var shadowColor: SECColor?
        /// 阴影水平方向上的偏移距离。
        public var shadowOffsetX: Float?
        /// 阴影垂直方向上的偏移距离。
        public var shadowOffsetY: Float?
        /// 图形透明度。支持从 0 到 1 的数字，为 0 时不绘制该图形。
        public var opacity: Float?
    }
    
    public struct ItemStyle : SECEmphasisable {
        public typealias Style = ItemStyleContent
        
        public var normal: Style?
        public var emphasis: Style?
    }
}

extension SECBarSerie.ItemStyleContent : SECEnumable {
    public enum Enums {
        case color(SECColor), borderColor(SECColor), borderWidth(Float), borderType(SECLineType), barBorderRadius(Float), shadowBlur(Float), shadowColor(SECColor), shadowOffsetX(Float), shadowOffsetY(Float), opacity(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .color(color):
                self.color = color
            case let .borderColor(color):
                self.borderColor = color
            case let .borderWidth(width):
                self.borderWidth = width
            case let .borderType(borderType):
                self.borderType = borderType
           case let .barBorderRadius(barBorderRadius):
                self.barBorderRadius = barBorderRadius
            case let .shadowBlur(blur):
                self.shadowBlur = blur
            case let .shadowColor(color):
                self.shadowColor = color
            case let .shadowOffsetX(x):
                self.shadowOffsetX = x
            case let .shadowOffsetY(y):
                self.shadowOffsetY = y
            case let .opacity(opacity):
                self.opacity = opacity
            }
        }
    }
}

extension SECBarSerie.ItemStyleContent : SECMappable {
    public func mapping(map: SECMap) {
        map["color"] = color
        map["borderColor"] = borderColor
        map["borderWidth"] = borderWidth
        map["borderType"] = borderType
        map["barBorderRadius"] = barBorderRadius
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["opacity"] = opacity
        
    }
}

extension SECBarSerie.ItemStyle : SECEnumable {
    public enum Enums {
        case normal(Style), emphasis(Style)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .normal(normal):
                self.normal = normal
            case let .emphasis(emphasis):
                self.emphasis = emphasis
            }
        }
    }
}

extension SECBarSerie.ItemStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}
