//
//  GraphSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 26/10/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 关系图
///
/// 用于展现节点以及节点之间的关系数据。
///
/// 注意： ECharts 2.x 中 force 类型的图表不再在 ECharts 3 中提供支持，转为统一使用 graph 去展现关系数据。如果要使用力引导布局，可以将 layout 配置项设为'force'。
///
/// 示例：http://www.echartsjs.com/gallery/editor.html?c=graph
public final class GraphSerie: Serie, Animatable, Symbolized, Zable {
    
    /// 图的布局。
    ///
    /// - none:  不采用任何布局，使用节点中提供的 x， y 作为节点的位置
    /// - circular:  采用环形布局，见示例 Les Miserables，布局相关的配置项见 graph.circula
    /// - force: 采用力引导布局，见示例 Force，布局相关的配置项见 graph.forc
    public enum Layout: String, Jsonable {
        case none = "none"
        case circular = "circular"
        case force = "force"
        
        public var jsonString: String {
            return self.rawValue.jsonString
        }
    }
    
    /// 环形布局相关配置
    public final class Circular {
        /// 是否旋转标签，默认不旋转
        public var rotateLabel: Bool?
    }
    
    /// 力引导布局相关的配置项，力引导布局是模拟弹簧电荷模型在每两个节点之间添加一个斥力，每条边的两个节点之间添加一个引力，每次迭代节点会在各个斥力和引力的作用下移动位置，多次迭代后节点会静止在一个受力平衡的位置，达到整个模型的能量最小化。
    ///
    /// 力引导布局的结果有良好的对称性和局部聚合性，也比较美观。
    public final class Force {
        /// 进行力引导布局前的初始化布局，初始化布局会影响到力引导的效果。
        ///
        /// 默认不进行任何布局，使用节点中提供的 x， y 作为节点的位置。如果不存在的话会随机生成一个位置。
        ///
        /// 也可以选择使用环形布局 'circular'。
        public var initLayout: String?
        /// 节点之间的斥力因子。
        ///
        /// 支持设置成数组表达斥力的范围，此时不同大小的值会线性映射到不同的斥力。值越大则斥力越大
        public var repulsion: Float?
        /// 节点受到的向中心的引力因子。该值越大节点越往中心点靠拢。
        public var gravity: Float?
        /// 边的两个节点之间的距离，这个距离也会受 repulsion。
        ///
        /// 支持设置成数组表达边长的范围，此时不同大小的值会线性映射到不同的长度。值越小则长度越长。如下示例
        ///
        ///     // 值最大的边长度会趋向于 10，值最小的边长度会趋向于 50
        ///     edgeLength: [10, 50]
        public var edgeLength: OneOrMore<Float>?
        /// 因为力引导布局会在多次迭代后才会稳定，这个参数决定是否显示布局的迭代动画，在浏览器端节点数据较多（>100）的时候不建议关闭，布局过程会造成浏览器假死。
        public var layoutAnimation: Bool?
    }
    
    /// 节点分类的类目，可选。
    ///
    /// 如果节点有分类的话可以通过 data[i].category 指定每个节点的类目，类目的样式会被应用到节点样式上。图例也可以基于categories名字展现和筛选。
    public final class Category: Symbolized {
        /// 类目名称，用于和 legend 对应以及格式化 tooltip 的内容。
        public var name: String?
        /// 关系图节点标记的图形。
        ///
        /// ECharts 提供的标记类型包括 'circle', 'rect', 'roundRect', 'triangle', 'diamond', 'pin', 'arrow'
        ///
        /// 也可以通过 'image://url' 设置为图片，其中 url 为图片的链接，或者 dataURI。
        ///
        /// 可以通过 'path://' 将图标设置为任意的矢量路径。这种方式相比于使用图片的方式，不用担心因为缩放而产生锯齿或模糊，而且可以设置为任意颜色。路径图形会自适应调整为合适的大小。路径的格式参见 SVG PathData。可以从 Adobe Illustrator 等工具编辑导出。
        public var symbol: OneOrMore<Symbol>?
        /// 关系图节点标记的大小，可以设置成诸如 10 这样单一的数字，也可以用数组分开表示宽和高，例如 [20, 10] 表示标记宽为20，高为10。
        ///
        /// 如果需要每个数据的图形大小不一样，可以设置为如下格式的回调函数：
        ///
        /// (value: Array|number, params: Object) => number|Array
        ///
        /// 其中第一个参数 value 为 data 中的数据值。第二个参数params 是其它的数据项参数。
        public var symbolSize: FunctionOrFloatOrPair?
        /// 关系图节点标记的旋转角度。注意在 markLine 中当 symbol 为 'arrow' 时会忽略 symbolRotate 强制设置为切线的角度。
        public var symbolRotate: Float?
        /// 关系图节点标记相对于原本位置的偏移。默认情况下，标记会居中置放在数据对应的位置，但是如果 symbol 是自定义的矢量路径或者图片，就有可能不希望 symbol 居中。这时候可以使用该配置项配置 symbol 相对于原本居中的偏移，可以是绝对的像素值，也可以是相对的百分比。
        ///
        /// 例如 [0, '50%'] 就是把自己向上移动了一半的位置，在 symbol 图形是气泡的时候可以让图形下端的箭头对准数据点。
        public var symbolOffset: Point?
        /// 该类目节点的样式。
        public var itemStyle: ItemStyle?
        /// 该类目节点标签的样式。
        public var label: EmphasisLabel?
    }
    
    /// 关系图的节点数据列表。
    ///
    ///     data: [{
    ///         name: '1',
    ///         x: 10,
    ///         y: 10,
    ///         value: 10
    ///     }, {
    ///         name: '2',
    ///         x: 100,
    ///         y: 100,
    ///         value: 20,
    ///         symbolSize: 20,
    ///         itemStyle: {
    ///             normal: {
    ///                 color: 'red'
    ///             }
    ///         }
    ///     }]
    ///
    /// 注意: 节点的name不能重复。
    public final class Data: Symbolized {
        /// 数据项名称。
        public var name: String?
        /// 节点的初始 x 值。在不指定的时候需要指明layout属性选择布局方式。
        public var x: Float?
        /// 节点的初始 y 值。在不指定的时候需要指明layout属性选择布局方式。
        public var y: Float?
        /// 节点在力引导布局中是否固定。
        public var fixed: Bool?
        /// 数据项值。
        public var value: OneOrMore<Float>?
        /// 数据项所在类目的 index。
        public var category: Float?
        /// 关系图节点标记的图形。
        ///
        /// ECharts 提供的标记类型包括 'circle', 'rect', 'roundRect', 'triangle', 'diamond', 'pin', 'arrow'
        ///
        /// 也可以通过 'image://url' 设置为图片，其中 url 为图片的链接，或者 dataURI。
        ///
        /// 可以通过 'path://' 将图标设置为任意的矢量路径。这种方式相比于使用图片的方式，不用担心因为缩放而产生锯齿或模糊，而且可以设置为任意颜色。路径图形会自适应调整为合适的大小。路径的格式参见 SVG PathData。可以从 Adobe Illustrator 等工具编辑导出。
        public var symbol: OneOrMore<Symbol>?
        /// 关系图节点标记的大小，可以设置成诸如 10 这样单一的数字，也可以用数组分开表示宽和高，例如 [20, 10] 表示标记宽为20，高为10。
        ///
        /// 如果需要每个数据的图形大小不一样，可以设置为如下格式的回调函数：
        ///
        /// (value: Array|number, params: Object) => number|Array
        ///
        /// 其中第一个参数 value 为 data 中的数据值。第二个参数params 是其它的数据项参数。
        public var symbolSize: FunctionOrFloatOrPair?
        /// 关系图节点标记的旋转角度。注意在 markLine 中当 symbol 为 'arrow' 时会忽略 symbolRotate 强制设置为切线的角度。
        public var symbolRotate: Float?
        /// 关系图节点标记相对于原本位置的偏移。默认情况下，标记会居中置放在数据对应的位置，但是如果 symbol 是自定义的矢量路径或者图片，就有可能不希望 symbol 居中。这时候可以使用该配置项配置 symbol 相对于原本居中的偏移，可以是绝对的像素值，也可以是相对的百分比。
        ///
        /// 例如 [0, '50%'] 就是把自己向上移动了一半的位置，在 symbol 图形是气泡的时候可以让图形下端的箭头对准数据点。
        public var symbolOffset: Point?
        /// 该节点的样式。
        public var itemStyle: ItemStyle?
        /// 该节点标签的样式。
        public var label: EmphasisLabel?
        /// 本系列每个数据项中特定的 tooltip 设定。
        public var tooltip: Tooltip?
    }
    
    /// 节点间的关系数据。示例：
    ///
    ///     links: [{
    ///         source: 'n1',
    ///         target: 'n2'
    ///     }, {
    ///         source: 'n2',
    ///         target: 'n3'
    ///     }]
    public final class Link {
        /// 边的源节点名称的字符串，也支持使用数字表示源节点的索引。
        public var source: Jsonable?
        /// 边的目标节点名称的字符串，也支持使用数字表示源节点的索引。
        public var target: Jsonable?
        /// 边的数值，可以在力引导布局中用于映射到边的长度。
        public var value: Float?
        /// 关系边的线条样式。
        public var lineStyle: EmphasisLineStyle?
        /// 关系边的标签的样式。
        public var label: EmphasisLabel?
        /// 边两端的标记类型，可以是一个数组分别指定两端，也可以是单个统一指定。
        public var symbol: OneOrMore<Symbol>?
        /// 边两端的标记大小，可以是一个数组分别指定两端，也可以是单个统一指定。
        public var symbolSize: FunctionOrFloatOrPair?
    }
    
    public var type: SerieType {
        return .graph
    }
    /// 系列名称，用于tooltip的显示，legend 的图例筛选，在 setOption 更新数据和配置项时用于指定对应的系列。
    public var name: String?
    /// 是否启用图例 hover 时的联动高亮。
    public var legendHoverLinek: Bool?
    /// 该系列使用的坐标系
    ///
    /// - cartesian2d: 使用二维的直角坐标系（也称笛卡尔坐标系），通过 xAxisIndex, yAxisIndex指定相应的坐标轴组件。
    /// - polar: 使用极坐标系，通过 polarIndex 指定相应的极坐标组件
    /// - geo: 使用地理坐标系，通过 geoIndex 指定相应的地理坐标系组件。
    /// - none: 不使用坐标系。
    public var coordinateSystem: CoordinateSystem?
    /// 使用的 x 轴的 index，在单个图表实例中存在多个 x 轴的时候有用。
    public var xAxisIndex: UInt8?
    /// 使用的 y 轴的 index，在单个图表实例中存在多个 y轴的时候有用。
    public var yAxisIndex: UInt8?
    /// 使用的极坐标系的 index，在单个图表实例中存在多个极坐标系的时候有用。
    public var polarIndex: UInt8?
    /// 使用的地理坐标系的 index，在单个图表实例中存在多个地理坐标系的时候有用。
    public var geoIndex: UInt8?
    /// 使用的日历坐标系的 index，在单个图表实例中存在多个日历坐标系的时候有用。
    public var calendarIndex: UInt8?
    /// 是否开启鼠标 hover 节点的提示动画效果。
    public var hoverAnimation: Bool?
    /// 图的布局。
    ///
    /// 可选：
    ///
    /// - none: 不采用任何布局，使用节点中提供的 x， y 作为节点的位置。
    /// - circular: 采用环形布局，见示例 Les Miserables，布局相关的配置项见 graph.circular
    /// - force: 采用力引导布局，见示例 Force，布局相关的配置项见 graph.force
    public var layout: Layout?
    /// 环形布局相关配置
    public var circular: Circular?
    /// 力引导布局相关的配置项，力引导布局是模拟弹簧电荷模型在每两个节点之间添加一个斥力，每条边的两个节点之间添加一个引力，每次迭代节点会在各个斥力和引力的作用下移动位置，多次迭代后节点会静止在一个受力平衡的位置，达到整个模型的能量最小化。
    
    /// 力引导布局的结果有良好的对称性和局部聚合性，也比较美观。
    public var force: Force?
    /// 是否开启鼠标缩放和平移漫游。默认不开启。如果只想要开启缩放或者平移，可以设置成 'scale' 或者 'move'。设置成 true 为都开启
    public var roam: Roam?
    /// 鼠标漫游缩放时节点的相应缩放比例，当设为0时节点不随着鼠标的缩放而缩放
    public var nodeScaleRatio: Float?
    /// 节点是否可拖拽，只在使用力引导布局的时候有用。
    public var draggable: Bool?
    /// 是否在鼠标移到节点上的时候突出显示节点以及节点的边和邻接节点。
    public var focusNodeAdjacency: Bool?
    /// 关系图节点标记的图形。
    ///
    /// ECharts 提供的标记类型包括 'circle', 'rect', 'roundRect', 'triangle', 'diamond', 'pin', 'arrow'
    ///
    /// 也可以通过 'image://url' 设置为图片，其中 url 为图片的链接，或者 dataURI。
    ///
    /// 可以通过 'path://' 将图标设置为任意的矢量路径。这种方式相比于使用图片的方式，不用担心因为缩放而产生锯齿或模糊，而且可以设置为任意颜色。路径图形会自适应调整为合适的大小。路径的格式参见 SVG PathData。可以从 Adobe Illustrator 等工具编辑导出。
    public var symbol: OneOrMore<Symbol>?
    /// 关系图节点标记的大小，可以设置成诸如 10 这样单一的数字，也可以用数组分开表示宽和高，例如 [20, 10] 表示标记宽为20，高为10。
    ///
    /// 如果需要每个数据的图形大小不一样，可以设置为如下格式的回调函数：
    ///
    /// (value: Array|number, params: Object) => number|Array
    ///
    /// 其中第一个参数 value 为 data 中的数据值。第二个参数params 是其它的数据项参数。
    public var symbolSize: FunctionOrFloatOrPair?
    /// 关系图节点标记的旋转角度。注意在 markLine 中当 symbol 为 'arrow' 时会忽略 symbolRotate 强制设置为切线的角度。
    public var symbolRotate: Float?
    /// 关系图节点标记相对于原本位置的偏移。默认情况下，标记会居中置放在数据对应的位置，但是如果 symbol 是自定义的矢量路径或者图片，就有可能不希望 symbol 居中。这时候可以使用该配置项配置 symbol 相对于原本居中的偏移，可以是绝对的像素值，也可以是相对的百分比。
    ///
    /// 例如 [0, '50%'] 就是把自己向上移动了一半的位置，在 symbol 图形是气泡的时候可以让图形下端的箭头对准数据点。
    public var symbolOffset: Point?
    /// 边两端的标记类型，可以是一个数组分别指定两端，也可以是单个统一指定。默认不显示标记，常见的可以设置为箭头，如下：
    ///
    /// edgeSymbol: ['circle', 'arrow']
    public var edgeSymbol: OneOrMore<Symbol>?
    /// 边两端的标记大小，可以是一个数组分别指定两端，也可以是单个统一指定。
    public var edgeSymbolSize: FunctionOrFloatOrPair?
    /// 鼠标悬浮时在图形元素上时鼠标的样式是什么。同 CSS 的 cursor。
    public var cursor: String?
    /// 图形样式，有 normal 和 emphasis 两个状态。normal 是图形在默认状态下的样式；emphasis 是图形在高亮状态下的样式，比如在鼠标悬浮或者图例联动高亮时。
    public var itemStyle: ItemStyle?
    /// 关系边的公用线条样式。其中 lineStyle.normal.color 支持设置为'source'或者'target'特殊值，此时边会自动取源节点或目标节点的颜色作为自己的颜色。
    public var lineStyle: EmphasisLineStyle?
    /// 图形上的文本标签，可用于说明图形的一些数据信息，比如值，名称等，label选项在 ECharts 2.x 中放置于itemStyle.normal下，在 ECharts 3 中为了让整个配置项结构更扁平合理，label 被拿出来跟 itemStyle 平级，并且跟 itemStyle 一样拥有 normal, emphasis 两个状态。
    public var label: EmphasisLabel?
    public var edgeLabel: EmphasisLabel?
    /// 节点分类的类目，可选。
    ///
    /// 如果节点有分类的话可以通过 data[i].category 指定每个节点的类目，类目的样式会被应用到节点样式上。图例也可以基于categories名字展现和筛选。
    public var categories: [Category]?
    /// 关系图的节点数据列表。
    ///
    ///     data: [{
    ///         name: '1',
    ///         x: 10,
    ///         y: 10,
    ///         value: 10
    ///     }, {
    ///         name: '2',
    ///         x: 100,
    ///         y: 100,
    ///         value: 20,
    ///         symbolSize: 20,
    ///         itemStyle: {
    ///             normal: {
    ///                 color: 'red'
    ///             }
    ///         }
    ///     }]
    ///
    /// 注意: 节点的name不能重复。
    public var data: [Jsonable]?
    /// 别名，同 data
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
    public var links: [Link]?
    /// 别名，同 links
    public var edges: [Link]?
    /// 图表标注。
    public var markPoint: MarkPoint?
    /// 图表标线。
    public var markLine: MarkLine?
    /// 图表标域，常用于标记图表中某个范围的数据，例如标出某段时间投放了广告。
    public var markArea: MarkArea?
    /// 所有图形的 zlevel 值。
    ///
    /// zlevel用于 Canvas 分层，不同zlevel值的图形会放置在不同的 Canvas 中，Canvas 分层是一种常见的优化手段。我们可以把一些图形变化频繁（例如有动画）的组件设置成一个单独的zlevel。需要注意的是过多的 Canvas 会引起内存开销的增大，在手机端上需要谨慎使用以防崩溃。
    ///
    /// zlevel 大的 Canvas 会放在 zlevel 小的 Canvas 的上面。
    public var zlevel: Float?
    /// 组件的所有图形的z值。控制图形的前后顺序。z值小的图形会被z值大的图形覆盖。
    ///
    /// z相比zlevel优先级更低，而且不会创建新的 Canvas。
    public var z: Float?
    /// 组件离容器左侧的距离。
    ///
    /// left 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'left', 'center', 'right'。
    ///
    /// 如果 left 的值为'left', 'center', 'right'，组件会根据相应的位置自动对齐。
    public var left: Position?
    /// 组件离容器上侧的距离。
    ///
    /// top 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'top', 'middle', 'bottom'。
    ///
    /// 如果 top 的值为'top', 'middle', 'bottom'，组件会根据相应的位置自动对齐。
    public var top: Position?
    /// 组件离容器右侧的距离。
    ///
    /// right 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    ///
    /// 默认自适应。
    public var right: Position?
    /// 组件离容器下侧的距离。
    ///
    /// bottom 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    ///
    /// 默认自适应。
    public var bottom: Position?
    /// 组件的宽度。
    public var width: LengthValue?
    /// 组件的高度。
    public var height: LengthValue?
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
    public var animationDuration: Time?
    /// 初始动画的缓动效果。不同的缓动效果可以参考
    public var animationEasing: EasingFunction?
    /// 初始动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的初始动画效果。
    ///
    /// 如下示例：
    ///
    ///     animationDuration: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDelay: Time?
    /// 数据更新动画的时长。
    /// 支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的更新动画效果：
    ///     animationDurationUpdate: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDurationUpdate: Time?
    /// 数据更新动画的缓动效果。
    public var animationEasingUpdate: EasingFunction?
    /// 数据更新动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的更新动画效果。
    /// 如下示例：
    ///
    ///     animationDelayUpdate: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDelayUpdate: Time?
}

extension GraphSerie.Circular: Enumable {
    public enum Enums {
        case rotateLabel(Bool)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .rotateLabel(rotateLabel):
                self.rotateLabel = rotateLabel
            }
        }
    }
}

extension GraphSerie.Circular: Mappable {
    public func mapping(_ map: Mapper) {
        map["rotateLabel"] = rotateLabel
    }
}

extension GraphSerie.Force: Enumable {
    public enum Enums {
        case initLayout(String), repulsion(Float), gravity(Float), edgeLength(Float), edgeLengths([Float]), layoutAnimation(Bool)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .initLayout(initLayout):
                self.initLayout = initLayout
            case let .repulsion(repulsion):
                self.repulsion = repulsion
            case let .gravity(gravity):
                self.gravity = gravity
            case let .edgeLength(edgeLength):
                self.edgeLength = OneOrMore(one: edgeLength)
            case let .edgeLengths(edgeLengths):
                self.edgeLength = OneOrMore(more: edgeLengths)
            case let .layoutAnimation(layoutAnimation):
                self.layoutAnimation = layoutAnimation
            }
        }
    }
}

extension GraphSerie.Force: Mappable {
    public func mapping(_ map: Mapper) {
        map["initLayout"] = initLayout
        map["repulsion"] = repulsion
        map["gravity"] = gravity
        map["edgeLength"] = edgeLength
        map["layoutAnimation"] = layoutAnimation
    }
}

extension GraphSerie.Category: Enumable {
    public enum Enums {
        case name(String), symbol(Symbol), symbols([Symbol]), symbolSize(FunctionOrFloatOrPair), symbolRotate(Float), symbolOffset(Point), itemStyle(ItemStyle), label(EmphasisLabel)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .symbol(symbol):
                self.symbol = OneOrMore(one: symbol)
            case let .symbols(symbols):
                self.symbol = OneOrMore(more: symbols)
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            case let .symbolRotate(symbolRotate):
                self.symbolRotate = symbolRotate
            case let .symbolOffset(symbolOffset):
                self.symbolOffset = symbolOffset
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .label(label):
                self.label = label
            }
        }
    }
}

extension GraphSerie.Category: Mappable {
    public func mapping(_ map: Mapper) {
        map["name"] = name
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["symbolRotate"] = symbolRotate
        map["symbolOffset"] = symbolOffset
        map["itemStyle"] = itemStyle
        map["label"] = label
    }
}

extension GraphSerie.Data: Enumable {
    public enum Enums {
        case name(String), x(Float), y(Float), fixed(Bool), value(Float), values([Float]), category(Float), symbol(Symbol), symbols([Symbol]), symbolSize(FunctionOrFloatOrPair), symbolRotate(Float), symbolOffset(Point), itemStyle(ItemStyle), label(EmphasisLabel), tooltip(Tooltip)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .x(x):
                self.x = x
            case let .y(y):
                self.y = y
            case let .fixed(fixed):
                self.fixed = fixed
            case let .value(value):
                self.value = OneOrMore(one: value)
            case let .values(values):
                self.value = OneOrMore(more: values)
            case let .category(category):
                self.category = category
            case let .symbol(symbol):
                self.symbol = OneOrMore(one: symbol)
            case let .symbols(symbols):
                self.symbol = OneOrMore(more: symbols)
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            case let .symbolRotate(symbolRotate):
                self.symbolRotate = symbolRotate
            case let .symbolOffset(symbolOffset):
                self.symbolOffset = symbolOffset
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .label(label):
                self.label = label
            case let .tooltip(tooltip):
                self.tooltip = tooltip
            }
        }
    }
}

extension GraphSerie.Data: Mappable {
    public func mapping(_ map: Mapper) {
        map["name"] = name
        map["x"] = x
        map["y"] = y
        map["fixed"] = fixed
        map["value"] = value
        map["category"] = category
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["symbolRotate"] = symbolRotate
        map["symbolOffset"] = symbolOffset
        map["itemStyle"] = itemStyle
        map["label"] = label
        map["tooltip"] = tooltip
    }
}

extension GraphSerie.Link: Enumable {
    public enum Enums {
        case source(Jsonable), target(Jsonable), value(Float), lineStyle(EmphasisLineStyle), label(EmphasisLabel), symbol(Symbol), symbols([Symbol]), symbolSize(FunctionOrFloatOrPair)
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
            case let .label(label):
                self.label = label
            case let .symbol(symbol):
                self.symbol = OneOrMore(one: symbol)
            case let .symbols(symbols):
                self.symbol = OneOrMore(more: symbols)
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            }
        }
    }
}

extension GraphSerie.Link: Mappable {
    public func mapping(_ map: Mapper) {
        map["source"] = source
        map["target"] = target
        map["value"] = value
        map["lineStyle"] = lineStyle
        map["label"] = label
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
    }
}

extension GraphSerie: Enumable {
    public enum Enums {
        case name(String), legendHoverLinek(Bool), coordinateSystem(CoordinateSystem), xAxisIndex(UInt8), yAxisIndex(UInt8), polarIndex(UInt8), geoIndex(UInt8), calendarIndex(UInt8), hoverAnimation(Bool), layout(Layout), circular(Circular), force(Force), roam(Roam), nodeScaleRatio(Float), draggable(Bool), focusNodeAdjacency(Bool), symbol(Symbol), symbols([Symbol]), symbolSize(FunctionOrFloatOrPair), symbolRotate(Float), symbolOffset(Point), edgeSymbol(Symbol), edgeSymbols([Symbol]), edgeSymbolSize(FunctionOrFloatOrPair), cursor(String), itemStyle(ItemStyle), lineStyle(EmphasisLineStyle), label(EmphasisLabel), edgeLabel(EmphasisLabel), categories([Category]), data([Jsonable]), nodes([Jsonable]), links([Link]), edges([Link]), markPoint(MarkPoint), markLine(MarkLine), markArea(MarkArea), zlevel(Float), z(Float), left(Position), top(Position), right(Position), bottom(Position), width(LengthValue), height(LengthValue), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(Time), animationEasing(EasingFunction), animationDelay(Time), animationDurationUpdate(Time), animationEasingUpdate(EasingFunction), animationDelayUpdate(Time)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .legendHoverLinek(legendHoverLinek):
                self.legendHoverLinek = legendHoverLinek
            case let .coordinateSystem(coordinateSystem):
                self.coordinateSystem = coordinateSystem
            case let .xAxisIndex(xAxisIndex):
                self.xAxisIndex = xAxisIndex
            case let .yAxisIndex(yAxisIndex):
                self.yAxisIndex = yAxisIndex
            case let .polarIndex(polarIndex):
                self.polarIndex = polarIndex
            case let .geoIndex(geoIndex):
                self.geoIndex = geoIndex
            case let .calendarIndex(calendarIndex):
                self.calendarIndex = calendarIndex
            case let .hoverAnimation(hoverAnimation):
                self.hoverAnimation = hoverAnimation
            case let .layout(layout):
                self.layout = layout
            case let .circular(circular):
                self.circular = circular
            case let .force(force):
                self.force = force
            case let .roam(roam):
                self.roam = roam
            case let .nodeScaleRatio(nodeScaleRatio):
                self.nodeScaleRatio = nodeScaleRatio
            case let .draggable(draggable):
                self.draggable = draggable
            case let .focusNodeAdjacency(focusNodeAdjacency):
                self.focusNodeAdjacency = focusNodeAdjacency
            case let .symbol(symbol):
                self.symbol = OneOrMore(one: symbol)
            case let .symbols(symbols):
                self.symbol = OneOrMore(more: symbols)
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            case let .symbolRotate(symbolRotate):
                self.symbolRotate = symbolRotate
            case let .symbolOffset(symbolOffset):
                self.symbolOffset = symbolOffset
            case let .edgeSymbol(edgeSymbol):
                self.edgeSymbol = OneOrMore(one: edgeSymbol)
            case let .edgeSymbols(edgeSymbols):
                self.edgeSymbol = OneOrMore(more: edgeSymbols)
            case let .edgeSymbolSize(edgeSymbolSize):
                self.edgeSymbolSize = edgeSymbolSize
            case let .cursor(cursor):
                self.cursor = cursor
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            case let .label(label):
                self.label = label
            case let .edgeLabel(edgeLabel):
                self.edgeLabel = edgeLabel
            case let .categories(categories):
                self.categories = categories
            case let .data(data):
                self.data = data
            case let .nodes(nodes):
                self.nodes = nodes
            case let .links(links):
                self.links = links
            case let .edges(edges):
                self.edges = edges
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

extension GraphSerie: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["name"] = name
        map["legendHoverLinek"] = legendHoverLinek
        map["coordinateSystem"] = coordinateSystem
        map["xAxisIndex"] = xAxisIndex
        map["yAxisIndex"] = yAxisIndex
        map["polarIndex"] = polarIndex
        map["geoIndex"] = geoIndex
        map["calendarIndex"] = calendarIndex
        map["hoverAnimation"] = hoverAnimation
        map["layout"] = layout
        map["circular"] = circular
        map["force"] = force
        map["roam"] = roam
        map["nodeScaleRatio"] = nodeScaleRatio
        map["draggable"] = draggable
        map["focusNodeAdjacency"] = focusNodeAdjacency
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["symbolRotate"] = symbolRotate
        map["symbolOffset"] = symbolOffset
        map["edgeSymbol"] = edgeSymbol
        map["edgeSymbolSize"] = edgeSymbolSize
        map["cursor"] = cursor
        map["itemStyle"] = itemStyle
        map["lineStyle"] = lineStyle
        map["label"] = label
        map["edgeLabel"] = edgeLabel
        map["categories"] = categories
        map["data"] = data
        map["nodes"] = nodes
        map["links"] = links
        map["edges"] = edges
        map["markPoint"] = markPoint
        map["markLine"] = markLine
        map["markArea"] = markArea
        map["zlevel"] = zlevel
        map["z"] = z
        map["left"] = left
        map["top"] = top
        map["right"] = right
        map["bottom"] = bottom
        map["width"] = width
        map["height"] = height
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
