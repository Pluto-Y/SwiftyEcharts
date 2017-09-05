//
//  SankeySerie.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 15/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 桑基图
///
/// 是一种特殊的流图, 它主要用来表示原材料、能量等如何从初始形式经过中间过程的加工、转化到达最终形式。
///
/// 示例：http://echarts.baidu.com/gallery/editor.html?c=sankey-energy
///
/// 可视编码：
///
/// 桑基图将原数据中的每个node编码成一个小矩形，不同的节点尽量用不同的颜色展示，小矩形旁边的label编码的是节点的名称。
///
/// 此外，图中每两个小矩形之间的边编码的是原数据中的link，边的粗细编码的是link中的value。
/// 
/// 排序： 如果想指定结果的纵向顺序，那么可以把 layoutIterations 设为 0，此时纵向的顺序依照数据在 links 中出现的顺序。
public final class SankeySerie: Serie, Zable, Animatable {
    
    public final class Data {
        /// 数据项名称。
        public var name: String?
        /// 数据项值。
        public var value: Float?
        /// 该节点的样式。
        public var itemStyle: ItemStyle?
        /// 该节点标签的样式。
        public var label: EmphasisLabel?
        
        public init() { }
    }
    
    public final class Link {
        /// 边的源节点名称
        public var source: String?
        /// 边的目标节点名称
        public var target: String?
        /// 边的数值，决定边的宽度。
        public var value: Float?
        /// 关系边的线条样式。
        public var lineStyle: EmphasisLineStyle?
        
        public init() { }
    }
    
    /// 类型
    public var type: SerieType {
        return .sankey
    }
    
    // MARK: Zable
    public var zlevel: Float?
    public var z: Float?
    
    /// sankey组件离容器左侧的距离。
    ///
    /// left 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'left', 'center', 'right'。
    ///
    /// 如果 left 的值为'left', 'center', 'right'，组件会根据相应的位置自动对齐。
    public var left: Position?
    /// sankey组件离容器上侧的距离。
    ///
    /// top 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'top', 'middle', 'bottom'。
    ///
    /// 如果 top 的值为'top', 'middle', 'bottom'，组件会根据相应的位置自动对齐。
    public var top: Position?
    /// sankey组件离容器右侧的距离。
    ///
    /// right 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    public var right: Position?
    /// sankey组件离容器下侧的距离。
    /// bottom 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    public var bottom: Position?
    /// sankey组件的宽度。
    public var width: LengthValue?
    /// sankey组件的高度。
    public var height: LengthValue?
    /// 图中每个矩形节点的宽度。
    public var nodeWidth: Float?
    /// 图中每一列任意两个矩形节点之间的间隔。
    public var nodeGap: Float?
    /// 布局的迭代次数，用来不断优化图中节点的位置，以减少节点和边之间的相互遮盖。
    ///
    /// 默认布局迭代次数：32。
    ///
    /// 经测试，布局迭代次数不要低于默认值。
    public var layoutIterations: Float?
    /// label 描述了每个矩形节点中文本标签的样式。
    public var label: EmphasisLabel?
    /// 桑基图节点矩形的样式。
    public var itemStyle: ItemStyle?
    /// 桑基图边的样式，其中 lineStyle.normal.color 支持设置为'source'或者'target'特殊值，此时边会自动取源节点或目标节点的颜色作为自己的颜色。
    public var lineStyle: EmphasisLineStyle?
    /// 系列中的数据内容数组。数组项可以为单个数值，如：
    ///
    /// [12, 34, 56, 10, 23]
    ///
    /// 如果需要在数据中加入其它维度给 visualMap 组件用来映射到颜色等其它图形属性。每个数据项也可以是数组，如：
    ///
    /// [[12, 14], [34, 50], [56, 30], [10, 15], [23, 10]]
    ///
    /// 这时候可以将每项数组中的第二个值指定给 visualMap 组件。
    ///
    /// 更多时候我们需要指定每个数据项的名称，这时候需要每个项为一个对象：
    ///
    ///     [{
    ///         // 数据项的名称
    ///         name: '数据1',
    ///         // 数据项值8
    ///         value: 10
    ///     }, {
    ///         name: '数据2',
    ///         value: 20
    ///     }]
    ///
    /// 需要对个别内容指定进行个性化定义时：
    ///
    ///     [{
    ///         name: '数据1',
    ///         value: 10
    ///     }, {
    ///         // 数据项名称
    ///         name: '数据2',
    ///         value : 56,
    ///         //自定义特殊 tooltip，仅对该数据项有效
    ///         tooltip:{},
    ///         //自定义特殊itemStyle，仅对该item有效
    ///         itemStyle:{}
    ///     }]
    public var data: [Jsonable]?
    /// 同 data
    public var nodes: [Jsonable]?
    /// 节点间的关系数据。示例：
    ///
    ///     links: [{
    ///         source: 'n1',
    ///         target: 'n2'
    ///     }, {
    ///         source: 'n2',
    ///         target: 'n3'
    ///     }]
    public var links: [Jsonable]?
    /// 同 links
    public var edges: [Jsonable]?
    /// 图形是否不响应和触发鼠标事件，默认为 false，即响应和触发鼠标事件。
    public var silent: Bool?
    
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

extension SankeySerie.Data: Enumable {
    public enum Enums {
        case name(String), value(Float), itemStyle(ItemStyle), label(EmphasisLabel)
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
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .label(label):
                self.label = label
            }
        }
    }
}

extension SankeySerie.Data: Mappable {
    public func mapping(_ map: Mapper) {
        map["name"] = name
        map["value"] = value
        map["itemStyle"] = itemStyle
        map["label"] = label
    }
}

extension SankeySerie.Link: Enumable {
    public enum Enums {
        case source(String), target(String), value(Float), lineStyle(EmphasisLineStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .source(source):
                self.source = source
            case let .target(target):
                self.target = target
            case let .value(value):
                self.value = value
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            }
        }
    }
}

extension SankeySerie.Link: Mappable {
    public func mapping(_ map: Mapper) {
        map["source"] = source
        map["target"] = target
        map["value"] = value
        map["lineStyle"] = lineStyle
    }
}

extension SankeySerie: Enumable {
    public enum Enums {
        case zlevel(Float), z(Float), left(Position), top(Position), right(Position), bottom(Position), width(LengthValue), height(LengthValue), nodeWidth(Float), nodeGap(Float), layoutIterations(Float), label(EmphasisLabel), itemStyle(ItemStyle), lineStyle(EmphasisLineStyle), data([Jsonable]), nodes([Jsonable]), links([Jsonable]), edges([Jsonable]), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(Time), animationEasing(EasingFunction), animationDelay(Time), animationDurationUpdate(Time), animationEasingUpdate(EasingFunction), animationDelayUpdate(Time)
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
            case let .left(left):
                self.left = left
            case let .top(top):
                self.top = top
            case let .right(right):
                self.right = right
            case let .bottom(bottom):
                self.bottom = bottom
            case let .width(width):
                self.width = width
            case let .height(height):
                self.height = height
            case let .nodeWidth(nodeWidth):
                self.nodeWidth = nodeWidth
            case let .nodeGap(nodeGap):
                self.nodeGap = nodeGap
            case let .layoutIterations(layoutIterations):
                self.layoutIterations = layoutIterations
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            case let .data(data):
                self.data = data
            case let .nodes(nodes):
                self.nodes = nodes
            case let .links(links):
                self.links = links
            case let .edges(edges):
                self.edges = edges
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

extension SankeySerie: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["zlevel"] = zlevel
        map["z"] = z
        map["left"] = left
        map["top"] = top
        map["right"] = right
        map["bottom"] = bottom
        map["width"] = width
        map["height"] = height
        map["nodeWidth"] = nodeWidth
        map["nodeGap"] = nodeGap
        map["layoutIterations"] = layoutIterations
        map["label"] = label
        map["itemStyle"] = itemStyle
        map["lineStyle"] = lineStyle
        map["data"] = data
        map["nodes"] = nodes
        map["links"] = links
        map["edges"] = edges
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
