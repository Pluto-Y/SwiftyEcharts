//
//  PieSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 20/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public final class PieSerie: Serie, Zable {
    
    public final class Data {
        /// 数据项名称。
        public var name: String?
        /// 数据值。
        public var value: Float?
        /// 该数据项是否被选中。
        public var selected: Bool?
        /// 单个扇区的标签配置。
        public var label: EmphasisLabel?
        public var labelLine: LabelLine?
        /// 图形样式，有 normal 和 emphasis 两个状态。normal 是图形在默认状态下的样式；emphasis 是图形在高亮状态下的样式，比如在鼠标悬浮或者图例联动高亮时。
        public var itemStyle: ItemStyle?
        
        public init() { }
    }
    
    /// 是否展示成南丁格尔图，通过半径区分数据大小
    ///
    /// - enable: 显示为南丁格尔图
    /// - disable: 显示为普通饼图
    /// - radius: 面积展现数据的百分比，半径展现数据的大小
    /// - area: 所有扇区面积相同，仅通过半径展现数据大小
    public enum RoseType: String, Jsonable {
        case enable = "true"
        case disable = "false"
        case radius = "radius"
        case area = "area"
        
        public var jsonString: String {
            switch self {
            case .enable, .disable:
                return "\(self.rawValue)"
            default:
                return self.rawValue.jsonString
            }
        }
    }
    
    public final class LabelLineContent: Displayable {
        /// 是否显示视觉引导线。
        public var show: Bool?
        /// 视觉引导线第一段的长度。
        public var length: Float?
        /// 视觉引导项第二段的长度。
        public var length2: Float?
        /// 是否平滑视觉引导线，默认不平滑，可以设置成 true 平滑显示，也可以设置为 0 到 1 的值，表示平滑程度。
        public var smooth: Bool? // FIXME: 需要调整类型
        /// 视觉引导线样式
        public var lineStyle: LineStyle?
        
        public init() { }
    }
    
    public final class LabelLine: Emphasisable {
        public typealias Style = LabelLineContent
        
        public var normal: Style?
        public var emphasis: Style?
        
        public init() { }
    }
    
    /// 初始动画效果，可选
    ///
    /// - expansion: 默认研圆弧展开的效果。
    /// - scale:  缩放效果，配合设置 animationEasing='elasticOut' 可以做成 popup 的效果。
    public enum AnimationType: String, Jsonable {
        case expansion = "expansion"
        case scale = "scale"
        
        public var jsonString: String {
            return self.rawValue.jsonString
        }
    }
    
    /// 类型
    public var type: SerieType {
        return .pie
    }
    
    /// 系列名称，用于tooltip的显示，legend 的图例筛选，在 setOption 更新数据和配置项时用于指定对应的系列。
    public var name: String?
    /// 是否启用图例 hover 时的联动高亮。
    public var legendHoverLink: Bool?
    /// 是否开启 hover 在扇区上的放大动画效果。
    public var hoverAnimation: Bool?
    /// 选中模式，表示是否支持多个选中，默认关闭，支持布尔值和字符串，字符串取值可选'single'，'multiple'，分别表示单选还是多选。
    public var selectedMode: SelectedMode?
    /// 选中扇区的偏移距离。
    public var selectedOffset: Float?
    /// 饼图的扇区是否是顺时针排布。
    public var clockwise: Bool?
    /// 起始角度，支持范围[0, 360]。
    public var startAngle: Float?
    /// 最小的扇区角度（0 ~ 360），用于防止某个值过小导致扇区太小影响交互。
    public var minAngle: Float?
    /// 是否展示成南丁格尔图，通过半径区分数据大小。
    public var roseType: RoseType?
    /// 是否启用防止标签重叠策略，默认开启，在标签拥挤重叠的情况下会挪动各个标签的位置，防止标签间的重叠。
    /// 如果不需要开启该策略，例如圆环图这个例子中需要强制所有标签放在中心位置，可以将该值设为 false。
    public var avoidLabelOverlap: Bool?
    /// 是否在数据和为0（一般情况下所有数据为0） 的时候不显示扇区。
    public var stillShowZeroSum: Bool?
    /// 饼图图形上的文本标签，可用于说明图形的一些数据信息，比如值，名称等，label选项在 ECharts 2.x 中放置于itemStyle.normal下，在 ECharts 3 中为了让整个配置项结构更扁平合理，label 被拿出来跟 itemStyle 平级，并且跟 itemStyle 一样拥有 normal, emphasis 两个状态。
    public var label: EmphasisLabel?
    /// 标签的视觉引导线样式，在 label 位置 设置为'outside'的时候会显示视觉引导线。
    public var labelLine: LabelLine?
    /// 图形样式，有 normal 和 emphasis 两个状态。normal 是图形在默认状态下的样式；emphasis 是图形在高亮状态下的样式，比如在鼠标悬浮或者图例联动高亮时。
    public var itemStyle: ItemStyle?
    /// 所有图形的 zlevel 值。
    /// zlevel用于 Canvas 分层，不同zlevel值的图形会放置在不同的 Canvas 中，Canvas 分层是一种常见的优化手段。我们可以把一些图形变化频繁（例如有动画）的组件设置成一个单独的zlevel。需要注意的是过多的 Canvas 会引起内存开销的增大，在手机端上需要谨慎使用以防崩溃。
    /// zlevel 大的 Canvas 会放在 zlevel 小的 Canvas 的上面。
    public var zlevel: Float?
    /// 组件的所有图形的z值。控制图形的前后顺序。z值小的图形会被z值大的图形覆盖。
    /// z相比zlevel优先级更低，而且不会创建新的 Canvas。
    public var z: Float?
    /// 饼图的中心（圆心）坐标，数组的第一项是横坐标，第二项是纵坐标。
    /// 支持设置成百分比，设置成百分比时第一项是相对于容器宽度，第二项是相对于容器高度。
    /// 使用示例：
    ///
    ///     // 设置成绝对的像素值
    ///     center: [400, 300]
    ///     // 设置成相对的百分比
    ///     center: ['50%', '50%']
    public var center: Point?
    /// 饼图的半径，数组的第一项是内半径，第二项是外半径。
    /// 支持设置成百分比，相对于容器高宽中较小的一项的一半。
    /// 可以将内半径设大显示成圆环图（Donut chart）。
    public var radius: Range?
    /// 系列中的数据内容数组。数组项可以为单个数值，如：
    public var data: [Jsonable]?
    /// 图表标注。
    public var markPoint: MarkPoint?
    /// 图表标线。
    public var markLine: MarkLine?
    /// 图表标域，常用于标记图表中某个范围的数据，例如标出某段时间投放了广告。
    public var markArea: MarkArea?
    /// 图形是否不响应和触发鼠标事件，默认为 false，即响应和触发鼠标事件。
    public var silent: Bool?
    /// 初始动画效果
    public var animationType: AnimationType?
    
    // MARK: Animatable
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

public typealias PieSerieData = PieSerie.Data

extension PieSerie.RoseType: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        if value {
            self = .enable
        } else {
            self = .disable
        }
    }
}

extension PieSerie.LabelLineContent: Enumable {
    public enum Enums {
        case show(Bool), length(Float), length2(Float), smooth(Bool), lineStyle(LineStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .length(length):
                self.length = length
            case let .length2(length2):
                self.length2 = length2
            case let .smooth(smooth):
                self.smooth = smooth
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            }
        }
    }
}

extension PieSerie.LabelLineContent: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["length"] = length
        map["length2"] = length2
        map["smooth"] = smooth
        map["lineStyle"] = lineStyle
    }
}

extension PieSerie.LabelLine: Enumable {
    public enum Enums {
        case normal(Style), emphasis(Style)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
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

extension PieSerie.LabelLine: Mappable {
    public func mapping(_ map: Mapper) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}

extension PieSerie: Enumable {
    public enum Enums {
        case name(String), legendHoverLink(Bool), hoverAnimation(Bool), selectedMode(SelectedMode), selectedOffset(Float), clockwise(Bool), startAngle(Float), minAngle(Float), roseType(RoseType), avoidLabelOverlap(Bool), stillShowZeroSum(Bool), label(EmphasisLabel), labelLine(LabelLine), itemStyle(ItemStyle), zlevel(Float), z(Float), center(Point), radius(LengthValue), radiusRange(Range), data([Jsonable]), markPoint(MarkPoint), markLine(MarkLine), markArea(MarkArea), silent(Bool), animationType(AnimationType), animation(Bool), animationThreshold(Float), animationDuration(Time), animationEasing(EasingFunction), animationDelay(Time), animationDurationUpdate(Time), animationEasingUpdate(EasingFunction), animationDelayUpdate(Time)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .legendHoverLink(legendHoverLink):
                self.legendHoverLink = legendHoverLink
            case let .hoverAnimation(hoverAnimation):
                self.hoverAnimation = hoverAnimation
            case let .selectedMode(selectedMode):
                self.selectedMode = selectedMode
            case let .selectedOffset(selectedOffset):
                self.selectedOffset = selectedOffset
            case let .clockwise(clockwise):
                self.clockwise = clockwise
            case let .startAngle(startAngle):
                self.startAngle = startAngle
            case let .minAngle(minAngle):
                self.minAngle = minAngle
            case let .roseType(roseType):
                self.roseType = roseType
            case let .avoidLabelOverlap(avoidLabelOverlap):
                self.avoidLabelOverlap = avoidLabelOverlap
            case let .stillShowZeroSum(stillShowZeroSum):
                self.stillShowZeroSum = stillShowZeroSum
            case let .label(label):
                self.label = label
            case let .labelLine(labelLine):
                self.labelLine = labelLine
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .zlevel(zlevel):
                self.zlevel = zlevel
            case let .z(z):
                self.z = z
            case let .center(center):
                self.center = center
            case let .radius(radius):
                self.radius = [0, radius]
            case let .radiusRange(radiusRange):
                self.radius = radiusRange
            case let .data(data):
                self.data = data
            case let .markPoint(markPoint):
                self.markPoint = markPoint
            case let .markLine(markLine):
                self.markLine = markLine
            case let .markArea(markArea):
                self.markArea = markArea
            case let .silent(silent):
                self.silent = silent
            case let .animationType(animationType):
                self.animationType = animationType
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

extension PieSerieData: Enumable {
    
    public enum Enums {
        case name(String), value(Float), selected(Bool), label(EmphasisLabel), labelLine(PieSerie.LabelLine), itemStyle(ItemStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .value(value):
                self.value = value
            case let .selected(selected):
                self.selected = selected
            case let .label(label):
                self.label = label
            case let .labelLine(labelLine):
                self.labelLine = labelLine
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            }
        }
    }
    
}

extension PieSerieData: Mappable {
    public func mapping(_ map: Mapper) {
        map["name"] = name
        map["value"] = value
        map["selected"] = selected
        map["label"] = label
        map["labelLine"] = labelLine
        map["itemStyle"] = itemStyle
    }
}

extension PieSerie: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["name"] = name
        map["legendHoverLink"] = legendHoverLink
        map["hoverAnimation"] = hoverAnimation
        map["selectedMode"] = selectedMode
        map["selectedOffset"] = selectedOffset
        map["clockwise"] = clockwise
        map["startAngle"] = startAngle
        map["minAngle"] = minAngle
        map["roseType"] = roseType
        map["avoidLabelOverlap"] = avoidLabelOverlap
        map["stillShowZeroSum"] = stillShowZeroSum
        map["label"] = label
        map["labelLine"] = labelLine
        map["itemStyle"] = itemStyle
        map["zlevel"] = zlevel
        map["z"] = z
        map["center"] = center
        map["radius"] = radius
        map["data"] = data
        map["markPoint"] = markPoint
        map["markLine"] = markLine
        map["markArea"] = markArea
        map["silent"] = silent
        map["animationType"] = animationType
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

// MARK: - Actions
/// 饼图相关的行为，必须引入饼图后才能使用。
/// 选中指定的饼图扇形。
public final class PieSelectAction: EchartsAction {
    public var type: EchartsActionType {
        return .pieSelect
    }
    
    /// 可选，系列 index，可以是一个数组指定多个系列
    public var seriesIndex: OneOrMore<Int>?
    /// 可选，系列名称，可以是一个数组指定多个系列
    public var seriesName: OneOrMore<String>?
    /// 数据的 index，如果不指定也可以通过 name 属性根据名称指定数据
    public var dataIndex: Int?
    /// 可选，数据名称，在有 dataIndex 的时候忽略
    public var name: String?
}

extension PieSelectAction: Enumable {
    public enum Enums {
        case seriesIndex(Int), seriesIndexes([Int]), seriesName(String), seriesNames([String]), dataIndex(Int), name(String)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .seriesIndex(seriesIndex):
                self.seriesIndex = OneOrMore(one: seriesIndex)
            case let .seriesIndexes(seriesIndexes):
                self.seriesIndex = OneOrMore(more: seriesIndexes)
            case let .seriesName(seriesName):
                self.seriesName = OneOrMore(one: seriesName)
            case let .seriesNames(seriesNames):
                self.seriesName = OneOrMore(more: seriesNames)
            case let .dataIndex(dataIndex):
                self.dataIndex = dataIndex
            case let .name(name):
                self.name = name
            }
        }
    }
}

extension PieSelectAction: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["seriesIndex"] = seriesIndex
        map["seriesName"] = seriesName
        map["dataIndex"] = dataIndex
        map["name"] = name
    }
}

/// 取消选中指定的饼图扇形。
public final class PieUnSelectAction: EchartsAction {
    public var type: EchartsActionType {
        return .pieUnSelect
    }
    
    /// 可选，系列 index，可以是一个数组指定多个系列
    public var seriesIndex: OneOrMore<Int>?
    /// 可选，系列名称，可以是一个数组指定多个系列
    public var seriesName: OneOrMore<String>?
    /// 数据的 index，如果不指定也可以通过 name 属性根据名称指定数据
    public var dataIndex: Int?
    /// 可选，数据名称，在有 dataIndex 的时候忽略
    public var name: String?
}

extension PieUnSelectAction: Enumable {
    public enum Enums {
        case seriesIndex(Int), seriesIndexes([Int]), seriesName(String), seriesNames([String]), dataIndex(Int), name(String)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .seriesIndex(seriesIndex):
                self.seriesIndex = OneOrMore(one: seriesIndex)
            case let .seriesIndexes(seriesIndexes):
                self.seriesIndex = OneOrMore(more: seriesIndexes)
            case let .seriesName(seriesName):
                self.seriesName = OneOrMore(one: seriesName)
            case let .seriesNames(seriesNames):
                self.seriesName = OneOrMore(more: seriesNames)
            case let .dataIndex(dataIndex):
                self.dataIndex = dataIndex
            case let .name(name):
                self.name = name
            }
        }
    }
}

extension PieUnSelectAction: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["seriesIndex"] = seriesIndex
        map["seriesName"] = seriesName
        map["dataIndex"] = dataIndex
        map["name"] = name
    }
}

/// 切换指定的饼图扇形选中状态。
public final class PieToggleSelectAction: EchartsAction {
    public var type: EchartsActionType {
        return .pieToggleSelect
    }
    
    /// 可选，系列 index，可以是一个数组指定多个系列
    public var seriesIndex: OneOrMore<Int>?
    /// 可选，系列名称，可以是一个数组指定多个系列
    public var seriesName: OneOrMore<String>?
    /// 数据的 index，如果不指定也可以通过 name 属性根据名称指定数据
    public var dataIndex: Int?
    /// 可选，数据名称，在有 dataIndex 的时候忽略
    public var name: String?
}

extension PieToggleSelectAction: Enumable {
    public enum Enums {
        case seriesIndex(Int), seriesIndexes([Int]), seriesName(String), seriesNames([String]), dataIndex(Int), name(String)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .seriesIndex(seriesIndex):
                self.seriesIndex = OneOrMore(one: seriesIndex)
            case let .seriesIndexes(seriesIndexes):
                self.seriesIndex = OneOrMore(more: seriesIndexes)
            case let .seriesName(seriesName):
                self.seriesName = OneOrMore(one: seriesName)
            case let .seriesNames(seriesNames):
                self.seriesName = OneOrMore(more: seriesNames)
            case let .dataIndex(dataIndex):
                self.dataIndex = dataIndex
            case let .name(name):
                self.name = name
            }
        }
    }
}

extension PieToggleSelectAction: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["seriesIndex"] = seriesIndex
        map["seriesName"] = seriesName
        map["dataIndex"] = dataIndex
        map["name"] = name
    }
}
