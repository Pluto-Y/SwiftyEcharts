//
//  SECTreemapSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 13/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// Treemap 是一种常见的表达『层级数据』『树状数据』的可视化形式。它主要用面积的方式，便于突出展现出『树』的各层级中重要的节点。
///
/// 示例：
///
/// http://echarts.baidu.com/gallery/editor.html?c=treemap-obama
/// 视觉映射：
///
/// treemap 首先是把数值映射到『面积』这种视觉元素上。
///
/// 此外，也支持对数据的其他维度进行视觉映射，例如映射到颜色、颜色明暗度上。
///
/// 关于视觉设置，详见 series-treemap.levels。
/// 
/// 下钻（drill down）：
///
/// drill down 功能即点击后才展示子层级。 设置了 leafDepth 后，下钻（drill down）功能开启。
///
/// 如下是 drill down 的例子：
///
/// http://echarts.baidu.com/gallery/editor.html?c=treemap-drill-down
///
/// 注：treemap 的配置项 和 ECharts2 相比有一些变化，一些不太成熟的配置方式不再支持或不再兼容：
///
/// - center/size 方式的定位不再支持，而是统一使用 left/top/bottom/right/width/height 方式定位。
/// - breadcrumb 的配置被移动到了 itemStyle.normal/itemStyle.emphasis 外部，和 itemStyle 平级。
/// - root 的设置暂时不支持。目前可以使用 zoom 的方式来查看树更下层次的细节，或者使用 leafDepth 开启 "drill down" 功能。
/// - label 的配置被移动到了 itemStyle.normal/itemStyle.emphasis 外部，和 itemStyle 平级。
/// - itemStyle.normal.childBorderWidth、itemStyle.normal.childBorderColor不再支持（因为这个配置方式只能定义两层的treemap）。统一使用 series-treemap.levels 来进行各层级的定义。
public struct SECTreemapSerie : SECSeries, SECZable {
    
    /// 点击节点后的行为。可取值为：
    /// 
    /// - false：节点点击无反应。
    /// - 'zoomToNode'：点击节点后缩放到节点。
    /// - 'link'：如果节点数据中有 link 点击节点后会进行超链接跳转。
    public enum NodeClick : String, SECJsonable {
        case disable = "false"
        case zoomToNode = "zoomToNode"
        case link = "link"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
        }
    }
    
    public enum ColorMappingBy : String, SECJsonable {
        case value = "value"
        case index = "index"
        case id = "id"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
        }
    }
    
    public struct Level {
        public var visualDimension: Float?
        public var visualMin: Float?
        public var visualMax: Float?
        public var color: [SECColor]?
        public var colorAlpha: [Float]?
        public var colorSaturation: [Float]?
        public var colorMappingBy: ColorMappingBy?
        public var visibleMin: Float?
        public var childrenVisibleMin: Float?
        public var label: SECLabel?
        public var itemStyle: SECItemStyle?
        
        public init() {}
    }
    
    public struct Silent {
        public var link: String?
        public var target: SECTarget?
        public var children: [Any]?
        
        public init() {}
    }
    
    public struct Breadcrumb : SECDisplayable {
        public var show: Bool?
        public var left: SECPosition?
        public var top: SECPosition?
        public var right: SECPosition?
        public var bottom: SECPosition?
        public var height: Float?
        public var emptyItemWidth: Float?
        public var itemStyle: SECItemStyle?
        
        public init() {}
    }
    
    public struct Data {
        public var value: Float?
        public var id: String?
        public var name: String?
        public var visualDimension: Float?
        public var visualMin: Float?
        public var visualMax: Float?
        public var color: [SECColor]?
        public var colorAlpha: [Float]?
        public var colorSaturation: Float?
        public var colorMappingBy: ColorMappingBy?
        public var visibleMin: Float?
        public var childrenVisibleMin: Float?
        public var label: SECLabel?
        public var itemStyle: SECItemStyle?
        
        public init() {}
    }
    
    /// 类型
    public var type: SECSerieType {
        return .treemap
    }
    
    /// MARK: SECZable
    public var zlevel: Float?
    public var z: Float?
    
    /// treemap 组件离容器左侧的距离。
    ///
    /// left 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'left', 'center', 'right'。
    ///
    ///如果 left 的值为'left', 'center', 'right'，组件会根据相应的位置自动对齐。
    public var left: SECPosition?
    /// treemap 组件离容器上侧的距离。
    ///
    /// top 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'top', 'middle', 'bottom'。
    ///
    /// 如果 top 的值为'top', 'middle', 'bottom'，组件会根据相应的位置自动对齐。
    public var top: SECPosition?
    /// treemap 组件离容器右侧的距离。
    ///
    /// right 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    ///
    /// 默认自适应。
    public var right: SECPosition?
    /// treemap 组件离容器下侧的距离。
    ///
    /// bottom 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    ///
    /// 默认自适应。
    public var bottom: SECPosition?
    /// treemap 组件的宽度。
    public var width: SECLength?
    /// treemap 组件的高度。
    public var height: SECLength?
    /// 期望矩形长宽比率。布局计算时会尽量向这个比率靠近。
    ///
    /// 默认为黄金比：0.5 * (1 + Math.sqrt(5))。
    public var squareRotio: Float?
    /// 设置了 leafDepth 后，下钻（drill down）功能开启。drill down 功能即点击后才展示子层级。
    ///
    /// leafDepth 表示『展示几层』，层次更深的节点则被隐藏起来。点击则可下钻看到层次更深的节点。
    ///
    /// 例如，leafDepth 设置为 1，表示展示一层节点。
    ///
    /// 默认没有开启 drill down（即 leafDepth 为 null 或 undefined）。
    ///
    /// drill down 的例子：
    ///
    /// http://echarts.baidu.com/gallery/editor.html?c=treemap-drill-down
    public var leafDepth: Float?
    /// 是否开启拖拽漫游（移动和缩放）。
    public var roam: Bool?
    /// 点击节点后的行为。
    public var nodeClick: NodeClick?
    /// 点击某个节点，会自动放大那个节点到合适的比例（节点占可视区域的面积比例），这个配置项就是这个比例。
    public var zoomToNodeRatio: Float?
    /// 多层配置
    ///
    /// treemap 中采用『三级配置』：
    ///
    /// 『每个节点』->『每个层级』->『每个系列』。
    ///
    /// 即我们可以对每个节点进行配置，也可以对树的每个层级进行配置，也可以 series 上设置全局配置。节点上的设置，优先级最高。
    ///
    /// 最常用的是『每个层级进行配置』，levels 配置项就是每个层级的配置。例如：
    ///
    ///     // Notice that in fact the data structure is not "tree", but is "forest".
    ///     // 注意，这个数据结构实际不是『树』而是『森林』
    ///     data: [
    ///         {
    ///         name: 'nodeA',
    ///             children: [
    ///                 {name: 'nodeAA'},
    ///                 {name: 'nodeAB'},
    ///             ]
    ///         },
    ///         {
    ///             name: 'nodeB',
    ///             children: [
    ///                 {name: 'nodeBA'}
    ///             ]
    ///         }
    ///     ],
    ///     levels: [
    ///         {...}, // 『森林』的顶层配置。即含有 'nodeA', 'nodeB' 的这层。
    ///         {...}, // 下一层配置，即含有 'nodeAA', 'nodeAB', 'nodeBA' 的这层。
    ///         {...}, // 再下一层配置。
    ///         ...
    ///     ]
    /// 
    /// 视觉映射的规则
    ///
    /// treemap中首要关注的是如何在视觉上较好得区分『不同层级』、『同层级中不同类别』。这需要合理得设置不同层级的『矩形颜色』、『边界粗细』、『边界颜色』甚至『矩形颜色饱和度』等。
    ///
    /// 参见这个例子，最顶层级用颜色区分，分成了『红』『绿』『蓝』等大块。每个颜色块中是下一个层级，使用颜色的饱和度来区分（参见 colorSaturation）。最外层的矩形边界是『白色』，下层级的矩形边界是当前区块颜色加上饱和度处理（参见 borderColorSaturation）。
    ///
    /// treemap 是通过这样的规则来支持这种配置的：每个层级计算用户配置的 color、colorSaturation、borderColor、colorSaturation等视觉信息（在levels中配置）。如果子节点没有配置，则继承父的配置，否则使用自己的配置）。
    ///
    /// 这样，可以做到：父层级配置 color 列表，子层级配置 colorSaturation。父层级的每个节点会从 color 列表中得到一个颜色，子层级的节点会从 colorSaturation 中得到一个值，并且继承父节点得到的颜色，合成得到自己的最终颜色。
    ///
    /// 维度与『额外的视觉映射』
    ///
    /// 例子：每一个 value 字段是一个 Array，其中每个项对应一个维度（dimension）。
    ///
    ///     [
    ///         {
    ///             value: [434, 6969, 8382],
    ///             children: [
    ///                 {
    ///                     value: [1212, 4943, 5453],
    ///                     id: 'someid-1',
    ///                     name: 'description of this node',
    ///                     children: [...]
    ///                 },
    ///                 {
    ///                     value: [4545, 192, 439],
    ///                     id: 'someid-2',
    ///                     name: 'description of this node',
    ///                     children: [...]
    ///                 },
    ///                 ...
    ///                 ]
    ///         },
    ///         {
    ///             value: [23, 59, 12],
    ///             children: [...]
    ///         },
    ///         ...
    ///     ]
    ///
    /// treemap 默认把第一个维度（Array 第一项）映射到『面积』上。而如果想表达更多信息，用户可以把其他的某一个维度（series-treemap.visualDimension），映射到其他的『视觉元素』上，比如颜色明暗等。参见例子中，legend选择 Growth时的状态。
    ///
    /// 矩形边框（border）/缝隙（gap）设置如何避免混淆
    ///
    /// 如果统一用一种颜色设置矩形的缝隙（gap），那么当不同层级的矩形同时展示时可能会出现混淆。
    ///
    /// 参见 例子，注意其中红色的区块中的子矩形其实是更深层级，和其他用白色缝隙区分的矩形不是在一个层级。所以，红色区块中矩形的分割线的颜色，我们在 borderColorSaturation 中设置为『加了饱和度变化的红颜色』，以示区别。
    /// 
    /// borderWidth, gapWidth, borderColor 的解释： http://echarts.baidu.com/documents/asset/img/treemap-border-gap.png
    public var level: [Level]?
    /// 图形是否不响应和触发鼠标事件，默认为 false，即响应和触发鼠标事件。
    public var silent: Silent?
    /// treemap 中支持对数据其他维度进行视觉映射。
    ///
    /// 首先，treemap的数据格式（参见 series-treemap.data）中，每个节点的 value 都可以是数组。数组每项是一个『维度』（dimension）。visualDimension 指定了额外的『视觉映射』使用的是数组的哪一项。默认为第 0 项。
    ///
    /// 关于视觉设置，详见 series-treemap.levels。
    /// 
    ///     注：treemap中 visualDimension 属性可能在多处地方存在：
    ///     - 可以存在于 sereis-treemap 根下，表示本系列全局的统一设置。
    ///     - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
    ///     - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
    public var visualDimentsion: Float?
    /// 当前层级的最小 value 值。如果不设置则自动统计。
    /// 手动指定 visualMin、visualMax ，即手动控制了 visual mapping 的值域（当 colorMappingBy 为 'value' 时有意义）。
    public var visualMin: Float?
    /// 当前层级的最大 value 值。如果不设置则自动统计。
    /// 手动指定 visualMin、visualMax ，即手动控制了 visual mapping 的值域（当 colorMappingBy 为 'value' 时有意义）。
    public var visualMax: Float?
    /// 本系列默认的 颜色透明度 选取范围。数值范围 0 ~ 1。
    ///
    /// 例如, colorAlpha 可以是 [0.3, 1].
    ///
    /// 关于视觉设置，详见 series-treemap.levels。
    /// 
    ///     注：treemap中 colorAlpha 属性可能在多处地方存在：
    ///     - 可以存在于 sereis-treemap 根下，表示本系列全局的统一设置。
    ///     - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
    ///     - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
    public var colorAlpha: [Float]?
    /// 本系列默认的 颜色透明度 选取范围。数值范围 0 ~ 1。
    ///
    /// 例如, colorAlpha 可以是 [0.3, 1].
    ///
    /// 关于视觉设置，详见 series-treemap.levels。
    ///
    ///     注：treemap中 colorAlpha 属性可能在多处地方存在：
    ///     - 可以存在于 sereis-treemap 根下，表示本系列全局的统一设置。
    ///     - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
    ///     - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
    public var colorSaturation: [Float]?
    public var colorMappingBy: ColorMappingBy?
    public var visibleMin: Float?
    public var childrenVisibleMin: Float?
    public var label: SECLabel?
    public var itemStyle: SECItemStyle?
    public var breadcrumb: Breadcrumb?
    public var data: [Any]?
    public var animationDuration: Float?
    public var animationEasing: SECAnimation?
    public var animationDelay: SECTime?
    
    public init() {}
}

extension SECTreemapSerie.Level : SECEnumable {
    public enum Enums {
        case visualDimension(Float), visualMin(Float), visualMax(Float), color([SECColor]), colorAlpha([Float]), colorSaturation([Float]), colorMappingBy(SECTreemapSerie.ColorMappingBy), visibleMin(Float), childrenVisibleMin(Float), label(SECLabel), itemStyle(SECItemStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .visualDimension(visualDimension):
                self.visualDimension = visualDimension
            case let .visualMin(visualMin):
                self.visualMin = visualMin
            case let .visualMax(visualMax):
                self.visualMax = visualMax
            case let .color(color):
                self.color = color
            case let .colorAlpha(colorAlpha):
                self.colorAlpha = colorAlpha
            case let .colorSaturation(colorSaturation):
                self.colorSaturation = colorSaturation
            case let .colorMappingBy(colorMappingBy):
                self.colorMappingBy = colorMappingBy
            case let .visibleMin(visibleMin):
                self.visibleMin = visibleMin
            case let .childrenVisibleMin(childrenVisibleMin):
                self.childrenVisibleMin = childrenVisibleMin
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            }
        }
    }
}

extension SECTreemapSerie.Level : SECMappable {
    public func mapping(map: SECMap) {
        map["visualDimension"] = visualDimension
        map["visualMin"] = visualMin
        map["visualMax"] = visualMax
        map["color"] = color
        map["colorAlpha"] = colorAlpha
        map["colorSaturation"] = colorSaturation
        map["colorMappingBy"] = colorMappingBy
        map["visibleMin"] = visibleMin
        map["childrenVisibleMin"] = childrenVisibleMin
        map["label"] = label
        map["itemStyle"] = itemStyle
    }
}

extension SECTreemapSerie.Silent : SECEnumable {
    public enum Enums {
        case link(String), target(SECTarget), children([Any])
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .link(link):
                self.link = link
            case let .target(target):
                self.target = target
            case let .children(children):
                self.children = children
            }
        }
    }
}

extension SECTreemapSerie.Silent : SECMappable {
    public func mapping(map: SECMap) {
        map["link"] = link
        map["target"] = target
        map["children"] = children
    }
}

extension SECTreemapSerie.Breadcrumb : SECEnumable {
    public enum Enums {
        case show(Bool), left(SECPosition), top(SECPosition), right(SECPosition), bottom(SECPosition), height(Float), emptyItemWidth(Float), itemStyle(SECItemStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .left(left):
                self.left = left
            case let .top(top):
                self.top = top
            case let .right(right):
                self.right = right
            case let .bottom(bottom):
                self.bottom = bottom
            case let .height(height):
                self.height = height
            case let .emptyItemWidth(emptyItemWidth):
                self.emptyItemWidth = emptyItemWidth
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            }
        }
    }
}

extension SECTreemapSerie.Breadcrumb : SECMappable {
    public func mapping(map: SECMap) {
        map["show"] = show
        map["left"] = left
        map["top"] = top
        map["right"] = right
        map["bottom"] = bottom
        map["height"] = height
        map["emptyItemWidth"] = emptyItemWidth
        map["itemStyle"] = itemStyle
    }
}

extension SECTreemapSerie.Data : SECEnumable {
    public enum Enums {
        case value(Float), id(String), name(String), visualDimension(Float), visualMin(Float), visualMax(Float), color([SECColor]), colorAlpha([Float]), colorSaturation(Float), colorMappingBy(SECTreemapSerie.ColorMappingBy), visibleMin(Float), childrenVisibleMin(Float), label(SECLabel), itemStyle(SECItemStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .value(value):
                self.value = value
            case let .id(id):
                self.id = id
            case let .name(name):
                self.name = name
            case let .visualDimension(visualDimension):
                self.visualDimension = visualDimension
            case let .visualMin(visualMin):
                self.visualMin = visualMin
            case let .visualMax(visualMax):
                self.visualMax = visualMax
            case let .color(color):
                self.color = color
            case let .colorAlpha(colorAlpha):
                self.colorAlpha = colorAlpha
            case let .colorSaturation(colorSaturation):
                self.colorSaturation = colorSaturation
            case let .colorMappingBy(colorMappingBy):
                self.colorMappingBy = colorMappingBy
            case let .visibleMin(visibleMin):
                self.visibleMin = visibleMin
            case let .childrenVisibleMin(childrenVisibleMin):
                self.childrenVisibleMin = childrenVisibleMin
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            }
        }
    }
}

extension SECTreemapSerie.Data : SECMappable {
    public func mapping(map: SECMap) {
        map["value"] = value
        map["id"] = id
        map["name"] = name
        map["visualDimension"] = visualDimension
        map["visualMin"] = visualMin
        map["visualMax"] = visualMax
        map["color"] = color
        map["colorAlpha"] = colorAlpha
        map["colorSaturation"] = colorSaturation
        map["colorMappingBy"] = colorMappingBy
        map["visibleMin"] = visibleMin
        map["childrenVisibleMin"] = childrenVisibleMin
        map["label"] = label
        map["itemStyle"] = itemStyle
    }
}

extension SECTreemapSerie : SECEnumable {
    public enum Enums {
        case zlevel(Float), z(Float), left(SECPosition), top(SECPosition), right(SECPosition), bottom(SECPosition), width(Float), height(Float), squareRotio(Float), leafDepth(Float), roam(Bool), nodeClick(NodeClick), zoomToNodeRatio(Float), level([Level]), silent(Silent), visualDimentsion(Float), visualMin(Float), visualMax(Float), colorAlpha([Float]), colorSaturation([Float]), colorMappingBy(ColorMappingBy), visibleMin(Float), childrenVisibleMin(Float), label(SECLabel), itemStyle(SECItemStyle), breadcrumb(Breadcrumb), data([Any]), animationDuration(Float), animationEasing(SECAnimation), animationDelay(SECTime)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
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
            case let .squareRotio(squareRotio):
                self.squareRotio = squareRotio
            case let .leafDepth(leafDepth):
                self.leafDepth = leafDepth
            case let .roam(roam):
                self.roam = roam
            case let .nodeClick(nodeClick):
                self.nodeClick = nodeClick
            case let .zoomToNodeRatio(zoomToNodeRatio):
                self.zoomToNodeRatio = zoomToNodeRatio
            case let .level(level):
                self.level = level
            case let .silent(silent):
                self.silent = silent
            case let .visualDimentsion(visualDimentsion):
                self.visualDimentsion = visualDimentsion
            case let .visualMin(visualMin):
                self.visualMin = visualMin
            case let .visualMax(visualMax):
                self.visualMax = visualMax
            case let .colorAlpha(colorAlpha):
                self.colorAlpha = colorAlpha
            case let .colorSaturation(colorSaturation):
                self.colorSaturation = colorSaturation
            case let .colorMappingBy(colorMappingBy):
                self.colorMappingBy = colorMappingBy
            case let .visibleMin(visibleMin):
                self.visibleMin = visibleMin
            case let .childrenVisibleMin(childrenVisibleMin):
                self.childrenVisibleMin = childrenVisibleMin
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .breadcrumb(breadcrumb):
                self.breadcrumb = breadcrumb
            case let .data(data):
                self.data = data
            case let .animationDuration(animationDuration):
                self.animationDuration = animationDuration
            case let .animationEasing(animationEasing):
                self.animationEasing = animationEasing
            case let .animationDelay(animationDelay):
                self.animationDelay = animationDelay
            }
        }
    }
}

extension SECTreemapSerie : SECMappable {
    public func mapping(map: SECMap) {
        map["type"] = type
        map["zlevel"] = zlevel
        map["z"] = z
        map["left"] = left
        map["top"] = top
        map["right"] = right
        map["bottom"] = bottom
        map["width"] = width
        map["height"] = height
        map["squareRotio"] = squareRotio
        map["leafDepth"] = leafDepth
        map["roam"] = roam
        map["nodeClick"] = nodeClick
        map["zoomToNodeRatio"] = zoomToNodeRatio
        map["level"] = level
        map["silent"] = silent
        map["visualDimentsion"] = visualDimentsion
        map["visualMin"] = visualMin
        map["visualMax"] = visualMax
        map["colorAlpha"] = colorAlpha
        map["colorSaturation"] = colorSaturation
        map["colorMappingBy"] = colorMappingBy
        map["visibleMin"] = visibleMin
        map["childrenVisibleMin"] = childrenVisibleMin
        map["label"] = label
        map["itemStyle"] = itemStyle
        map["breadcrumb"] = breadcrumb
        map["data"] = data
        map["animationDuration"] = animationDuration
        map["animationEasing"] = animationEasing
        map["animationDelay"] = animationDelay
    }
}
