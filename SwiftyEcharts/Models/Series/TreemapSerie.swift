//
//  TreemapSerie.swift
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
public final class TreemapSerie: Serie, Zable {
    
    /// 点击节点后的行为。可取值为：
    /// 
    /// - false：节点点击无反应。
    /// - 'zoomToNode'：点击节点后缩放到节点。
    /// - 'link'：如果节点数据中有 link 点击节点后会进行超链接跳转。
    public enum NodeClick: String, Jsonable {
        case disable = "false"
        case zoomToNode = "zoomToNode"
        case link = "link"
        
        public var jsonString: String {
            return self.rawValue.jsonString
        }
    }
    
    /// 表示同一层级节点，在颜色列表中（参见 color 属性）选择时，按照什么来选择。可选值：
    ///
    /// - 'value'：将节点的值（即 series-treemap.data.value）映射到颜色列表中。这样得到的颜色，反应了节点值的大小。可以使用 visualDimension 属性来设置，用 data 中哪个纬度的值来映射。
    /// - 'index'：将节点的 index（序号）映射到颜色列表中。即同一层级中，第一个节点取颜色列表中第一个颜色，第二个节点取第二个。这样得到的颜色，便于区分相邻节点。
    /// - 'id'：将节点的 id（即 series-treemap.data.id）映射到颜色列表中。id 是用户指定的，这样能够使得，在treemap 通过 setOption 变化数值时，同一 id 映射到同一颜色，保持一致性。参见 例子。关于视觉设置，详见 series-treemap.levels。
    ///
    ///     注：treemap中 colorMappingBy 属性可能在多处地方存在：
    ///
    ///     - 可以存在于 sereis-treemap 根下，表示本系列全局的统一设置。
    ///     - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
    ///     - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
    public enum ColorMappingBy: String, Jsonable {
        case value = "value"
        case index = "index"
        case id = "id"
        
        public var jsonString: String {
            return self.rawValue.jsonString
        }
    }
    
    public final class Level {
        /// treemap 中支持对数据其他维度进行视觉映射。
        ///
        /// 首先，treemap的数据格式（参见 series-treemap.data）中，每个节点的 value 都可以是数组。数组每项是一个『维度』（dimension）。visualDimension 指定了额外的『视觉映射』使用的是数组的哪一项。默认为第 0 项。
        ///
        /// 关于视觉设置，详见 series-treemap.levels。
        /// 
        ///     注：treemap中 visualDimension 属性可能在多处地方存在：
        ///
        ///     - 可以存在于 sereis-treemap 根下，表示本系列全局的统一设置。
        ///     - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
        ///     - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
        public var visualDimension: Float?
        /// 当前层级的最小 value 值。如果不设置则自动统计。
        /// 手动指定 visualMin、visualMax ，即手动控制了 visual mapping 的值域（当 colorMappingBy 为 'value' 时有意义）。
        public var visualMin: Float?
        /// 当前层级的最大 value 值。如果不设置则自动统计。
        /// 手动指定 visualMin、visualMax ，即手动控制了 visual mapping 的值域（当 colorMappingBy 为 'value' 时有意义）。
        public var visualMax: Float?
        /// 表示同一层级的节点的 颜色 选取列表（选择规则见 colorMappingBy）。默认为空时，选取系统color列表。
        ///
        /// 关于视觉设置，详见 series-treemap.levels。
        /// 
        /// 注：treemap中 color 属性可能在多处地方存在：
        ///
        /// - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
        /// - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
        public var color: [Color]?
        /// 表示同一层级的节点的 颜色透明度 选取范围。数值范围 0 ~ 1。
        ///
        /// 例如, colorAlpha 可以是 [0.3, 1].
        ///
        /// 关于视觉设置，详见 series-treemap.levels。
        /// 
        ///     注：treemap中 colorAlpha 属性可能在多处地方存在：
        ///
        ///     - 可以存在于 sereis-treemap 根下，表示本系列全局的统一设置。
        ///     - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
        ///     - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
        public var colorAlpha: Range?
        /// 表示同一层级的节点的 颜色饱和度 选取范围。数值范围 0 ~ 1。
        ///
        /// 例如, colorSaturation 可以是 [0.3, 1].
        ///
        /// 关于视觉设置，详见 series-treemap.levels。
        /// 
        ///     注：treemap中 colorSaturation 属性可能在多处地方存在：
        ///
        ///     - 可以存在于 sereis-treemap 根下，表示本系列全局的统一设置。
        ///     - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
        ///     - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
        public var colorSaturation: Range?
        /// 表示同一层级节点，在颜色列表中（参见 color 属性）选择时，按照什么来选择。可选值：
        ///
        /// - 'value'：将节点的值（即 series-treemap.data.value）映射到颜色列表中。这样得到的颜色，反应了节点值的大小。可以使用 visualDimension 属性来设置，用 data 中哪个纬度的值来映射。
        /// - 'index'：将节点的 index（序号）映射到颜色列表中。即同一层级中，第一个节点取颜色列表中第一个颜色，第二个节点取第二个。这样得到的颜色，便于区分相邻节点。
        /// - 'id'：将节点的 id（即 series-treemap.data.id）映射到颜色列表中。id 是用户指定的，这样能够使得，在treemap 通过 setOption 变化数值时，同一 id 映射到同一颜色，保持一致性。参见 例子。关于视觉设置，详见 series-treemap.levels。
        ///
        ///     注：treemap中 colorMappingBy 属性可能在多处地方存在：
        ///
        ///     - 可以存在于 sereis-treemap 根下，表示本系列全局的统一设置。
        ///     - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
        ///     - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
        public var colorMappingBy: ColorMappingBy?
        /// 如果某个节点的矩形的面积，小于这个数值（单位：px平方），这个节点就不显示。
        ///
        /// 如果不加这个限制，很小的节点会影响显示效果。
        ///
        /// 关于视觉设置，详见 series-treemap.levels。
        ///
        ///     注：treemap中 visibleMin 属性可能在多处地方存在：
        ///
        ///     - 可以存在于 sereis-treemap 根下，表示本系列全局的统一设置。
        ///     - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
        ///     - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
        public var visibleMin: Float?
        /// 如果某个节点的矩形面积，小于这个数值（单位：px平方），则不显示这个节点的子节点。
        ///
        /// 这能够在矩形面积不足够大时候，隐藏节点的细节。当用户用鼠标缩放节点时，如果面积大于此阈值，又会显示子节点。
        ///
        /// 关于视觉设置，详见 series-treemap.levels。
        ///
        ///     注：treemap中 childrenVisibleMin 属性可能在多处地方存在：
        ///
        ///     - 可以存在于 sereis-treemap 根下，表示本系列全局的统一设置。
        ///     - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
        ///     - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
        public var childrenVisibleMin: Float?
        /// label 描述了每个矩形中，文本标签的样式。
        ///
        ///     注：treemap中 label 属性可能在多处地方存在：
        ///
        ///     - 可以存在于 sereis-treemap 根下，表示本系列全局的统一设置。
        ///     - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
        ///     - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
        public var label: EmphasisLabel?
        ///     注：treemap中 itemStyle 属性可能在多处地方存在：
        ///
        ///     - 可以存在于 sereis-treemap 根下，表示本系列全局的统一设置。
        ///     - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
        ///     - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
        public var itemStyle: ItemStyle?
        
        public init() {}
    }
    
    public final class Silent {
        /// 点击此节点可跳转的超链接。须 series-treemap.nodeClick 值为 'link' 时才生效。
        /// 参见 series-treemap.data.target。
        public var link: String?
        /// 意义同 html <a> 标签中的 target，参见 series-treemap.data.link。可选值为：'blank' 或 'self'。
        public var target: Target?
        /// 子节点，递归定义，格式同 series-treemap.data。
        public var children: [Jsonable]?
        
        public init() {}
    }
    
    public final class Breadcrumb: Displayable {
        /// 是否显示面包屑。
        public var show: Bool?
        /// asdf 组件离容器左侧的距离。
        ///
        /// left 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'left', 'center', 'right'。
        ///
        /// 如果 left 的值为'left', 'center', 'right'，组件会根据相应的位置自动对齐。
        public var left: Position?
        /// asdf 组件离容器上侧的距离。
        ///
        /// top 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'top', 'middle', 'bottom'。
        ///
        /// 如果 top 的值为'top', 'middle', 'bottom'，组件会根据相应的位置自动对齐。
        public var top: Position?
        /// asdf 组件离容器右侧的距离。
        ///
        /// right 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
        ///
        /// 默认自适应。
        public var right: Position?
        /// asdf 组件离容器下侧的距离。
        ///
        /// bottom 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
        ///
        /// 默认自适应。
        public var bottom: Position?
        /// 面包屑的高度。
        public var height: Float?
        /// 当面包屑没有内容时候，设个最小宽度。
        public var emptyItemWidth: Float?
        /// 图形样式，有 normal 和 emphasis 两个状态。normal 是图形在默认状态下的样式；emphasis 是图形在高亮状态下的样式，比如在鼠标悬浮或者图例联动高亮时。
        public var itemStyle: ItemStyle?
        
        public init() {}
    }
    
    public final class Data {
        /// 每个树节点的值，对应到面积大小。可以是number，也可以是数组，如 [2323, 43, 55]，则数组第一项对应到面积大小。
        public var value: Jsonable?
        /// 每个树节点的id。id 不是必须设置的。但是如果想使用 API 来改变某个节点，需要用 id 来定位。
        public var id: String?
        /// 显示在矩形中的描述文字。
        public var name: String?
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
        public var visualDimension: Float?
        /// 当前层级的最小 value 值。如果不设置则自动统计。
        /// 手动指定 visualMin、visualMax ，即手动控制了 visual mapping 的值域（当 colorMappingBy 为 'value' 时有意义）。
        public var visualMin: Float?
        /// 当前层级的最大 value 值。如果不设置则自动统计。
        /// 手动指定 visualMin、visualMax ，即手动控制了 visual mapping 的值域（当 colorMappingBy 为 'value' 时有意义）。
        public var visualMax: Float?
        /// 表示同一层级的节点的 颜色 选取列表（选择规则见 colorMappingBy）。默认为空时，选取系统color列表。
        ///
        /// 关于视觉设置，详见 series-treemap.levels。
        ///
        /// 注：treemap中 color 属性可能在多处地方存在：
        ///
        /// - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
        /// - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
        public var color: [Color]?
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
        public var colorAlpha: Range?
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
        public var colorSaturation: Range?
        /// 表示同一层级节点，在颜色列表中（参见 color 属性）选择时，按照什么来选择。可选值：
        ///
        /// - 'value'：将节点的值（即 series-treemap.data.value）映射到颜色列表中。这样得到的颜色，反应了节点值的大小。可以使用 visualDimension 属性来设置，用 data 中哪个纬度的值来映射。
        /// - 'index'：将节点的 index（序号）映射到颜色列表中。即同一层级中，第一个节点取颜色列表中第一个颜色，第二个节点取第二个。这样得到的颜色，便于区分相邻节点。
        /// - 'id'：将节点的 id（即 series-treemap.data.id）映射到颜色列表中。id 是用户指定的，这样能够使得，在treemap 通过 setOption 变化数值时，同一 id 映射到同一颜色，保持一致性。参见 例子。关于视觉设置，详见 series-treemap.levels。
        ///
        ///     注：treemap中 colorMappingBy 属性可能在多处地方存在：
        ///
        ///     - 可以存在于 sereis-treemap 根下，表示本系列全局的统一设置。
        ///     - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
        ///     - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
        public var colorMappingBy: ColorMappingBy?
        /// 如果某个节点的矩形的面积，小于这个数值（单位：px平方），这个节点就不显示。
        ///
        /// 如果不加这个限制，很小的节点会影响显示效果。
        ///
        /// 关于视觉设置，详见 series-treemap.levels。
        ///
        ///     注：treemap中 visibleMin 属性可能在多处地方存在：
        ///
        ///     - 可以存在于 sereis-treemap 根下，表示本系列全局的统一设置。
        ///     - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
        ///     - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
        public var visibleMin: Float?
        /// 如果某个节点的矩形面积，小于这个数值（单位：px平方），则不显示这个节点的子节点。
        ///
        /// 这能够在矩形面积不足够大时候，隐藏节点的细节。当用户用鼠标缩放节点时，如果面积大于此阈值，又会显示子节点。
        ///
        /// 关于视觉设置，详见 series-treemap.levels。
        ///
        ///     注：treemap中 childrenVisibleMin 属性可能在多处地方存在：
        ///
        ///     - 可以存在于 sereis-treemap 根下，表示本系列全局的统一设置。
        ///     - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
        ///     - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
        public var childrenVisibleMin: Float?
        /// label 描述了每个矩形中，文本标签的样式。
        ///
        ///     注：treemap中 label 属性可能在多处地方存在：
        ///
        ///     - 可以存在于 sereis-treemap 根下，表示本系列全局的统一设置。
        ///     - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
        ///     - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
        public var label: EmphasisLabel?
        ///     注：treemap中 itemStyle 属性可能在多处地方存在：
        ///
        ///     - 可以存在于 sereis-treemap 根下，表示本系列全局的统一设置。
        ///     - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
        ///     - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
        public var itemStyle: ItemStyle?
        
        public init() {}
    }
    
    /// 类型
    public var type: SerieType {
        return .treemap
    }
    
    /// MARK: Zable
    public var zlevel: Float?
    public var z: Float?
    
    /// treemap 组件离容器左侧的距离。
    ///
    /// left 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'left', 'center', 'right'。
    ///
    ///如果 left 的值为'left', 'center', 'right'，组件会根据相应的位置自动对齐。
    public var left: Position?
    /// treemap 组件离容器上侧的距离。
    ///
    /// top 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'top', 'middle', 'bottom'。
    ///
    /// 如果 top 的值为'top', 'middle', 'bottom'，组件会根据相应的位置自动对齐。
    public var top: Position?
    /// treemap 组件离容器右侧的距离。
    ///
    /// right 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    ///
    /// 默认自适应。
    public var right: Position?
    /// treemap 组件离容器下侧的距离。
    ///
    /// bottom 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    ///
    /// 默认自适应。
    public var bottom: Position?
    /// treemap 组件的宽度。
    public var width: LengthValue?
    /// treemap 组件的高度。
    public var height: LengthValue?
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
    public var roam: Roam?
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
    public var visualDimension: Float?
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
    public var colorAlpha: Range?
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
    public var colorSaturation: Range?
    /// 表示同一层级节点，在颜色列表中（参见 color 属性）选择时，按照什么来选择。可选值：
    ///
    /// - 'value'：将节点的值（即 series-treemap.data.value）映射到颜色列表中。这样得到的颜色，反应了节点值的大小。可以使用 visualDimension 属性来设置，用 data 中哪个纬度的值来映射。
    /// - 'index'：将节点的 index（序号）映射到颜色列表中。即同一层级中，第一个节点取颜色列表中第一个颜色，第二个节点取第二个。这样得到的颜色，便于区分相邻节点。
    /// - 'id'：将节点的 id（即 series-treemap.data.id）映射到颜色列表中。id 是用户指定的，这样能够使得，在treemap 通过 setOption 变化数值时，同一 id 映射到同一颜色，保持一致性。参见 例子。关于视觉设置，详见 series-treemap.levels。
    /// 
    ///     注：treemap中 colorMappingBy 属性可能在多处地方存在：
    ///
    ///     - 可以存在于 sereis-treemap 根下，表示本系列全局的统一设置。
    ///     - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
    ///     - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
    public var colorMappingBy: ColorMappingBy?
    /// 如果某个节点的矩形的面积，小于这个数值（单位：px平方），这个节点就不显示。
    ///
    /// 如果不加这个限制，很小的节点会影响显示效果。
    ///
    /// 关于视觉设置，详见 series-treemap.levels。
    /// 
    ///     注：treemap中 visibleMin 属性可能在多处地方存在：
    ///
    ///     - 可以存在于 sereis-treemap 根下，表示本系列全局的统一设置。
    ///     - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
    ///     - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
    public var visibleMin: Float?
    /// 如果某个节点的矩形面积，小于这个数值（单位：px平方），则不显示这个节点的子节点。
    ///
    /// 这能够在矩形面积不足够大时候，隐藏节点的细节。当用户用鼠标缩放节点时，如果面积大于此阈值，又会显示子节点。
    ///
    /// 关于视觉设置，详见 series-treemap.levels。
    ///
    ///     注：treemap中 childrenVisibleMin 属性可能在多处地方存在：
    /// 
    ///     - 可以存在于 sereis-treemap 根下，表示本系列全局的统一设置。
    ///     - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
    ///     - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
    public var childrenVisibleMin: Float?
    /// label 描述了每个矩形中，文本标签的样式。
    ///
    ///     注：treemap中 label 属性可能在多处地方存在：
    ///
    ///     - 可以存在于 sereis-treemap 根下，表示本系列全局的统一设置。
    ///     - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
    ///     - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
    public var label: EmphasisLabel?
    ///     注：treemap中 itemStyle 属性可能在多处地方存在：
    ///
    ///     - 可以存在于 sereis-treemap 根下，表示本系列全局的统一设置。
    ///     - 可以存在于 series-treemap.levels 的每个数组元素中，表示树每个层级的统一设置。
    ///     - 存在于 series-treemap.data 的每个节点中，表示每个节点的特定设置。
    public var itemStyle: ItemStyle?
    /// 面包屑，能够显示当前节点的路径。
    public var breadcrumb: Breadcrumb?
    /// series-treemap.data 的数据格式是树状的，例如：
    ///
    ///     [ // 注意，最外层是一个数组，而非从某个根节点开始。
    ///         {
    ///             value: 1212,
    ///             children: [
    ///                 {
    ///                     value: 2323,    // value字段的值，对应到面积大小。
    ///                                     // 也可以是数组，如 [2323, 43, 55]，则数组第一项对应到面积大小。
    ///                                     // 数组其他项可以用于额外的视觉映射，详情参见 series-treemp.levels。
    ///                     id: 'someid-1', // id 不是必须设置的。
    ///                                     // 但是如果想使用 API 来改变某个节点，需要用 id 来定位。
    ///                     name: 'description of this node', // 显示在矩形中的描述文字。
    ///                     children: [...],
    ///                     label: {        // 此节点特殊的 label 定义（如果需要的话）。
    ///                         ...         // label的格式参见 series-treemap.label。
    ///                     },
    ///                     itemStyle: {    // 此节点特殊的 itemStyle 定义（如果需要的话）。
    ///                         ...         // label的格式参见 series-treemap.itemStyle。
    ///                     }
    ///                 },
    ///                 {
    ///                     value: 4545,
    ///                     id: 'someid-2',
    ///                     name: 'description of this node',
    ///                     children: [
    ///                         {
    ///                             value: 5656,
    ///                             id: 'someid-3',
    ///                             name: 'description of this node',
    ///                             children: [...]
    ///                         },
    ///                         ...
    ///                     ]
    ///                 }
    ///             ]
    ///         },
    ///         {
    ///             value: [23, 59, 12]
    ///             // 如果没有children，可以不写
    ///         },
    ///         ...
    ///     ]
    public var data: [Jsonable]?
    /// 初始动画的时长，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的初始动画效果：
    ///
    ///     animationDuration: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDuration: Time?
    /// 初始动画的缓动效果。不同的缓动效果可以参考 缓动示例。http://echarts.baidu.com/gallery/editor.html?c=line-easing
    public var animationEasing: EasingFunction?
    /// 初始动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的初始动画效果。
    ///
    /// 如下示例：
    ///
    ///     animationDelay: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    ///
    /// 也可以看该示例: http://echarts.baidu.com/gallery/editor.html?c=bar-animation-delay
    public var animationDelay: Time?
    
    public init() {}
}

public typealias TreemapSerieLevel = TreemapSerie.Level
public typealias TreemapSerieSilent = TreemapSerie.Silent
public typealias TreemapSerieBreadcrumb = TreemapSerie.Breadcrumb
public typealias TreemapSerieData = TreemapSerie.Data

extension TreemapSerieLevel: Enumable {
    public enum Enums {
        case visualDimension(Float), visualMin(Float), visualMax(Float), color([Color]), colorAlpha(Range), colorSaturation(Range), colorMappingBy(TreemapSerie.ColorMappingBy), visibleMin(Float), childrenVisibleMin(Float), label(EmphasisLabel), itemStyle(ItemStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
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

extension TreemapSerieLevel: Mappable {
    public func mapping(_ map: Mapper) {
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

extension TreemapSerieSilent: Enumable {
    public enum Enums {
        case link(String), target(Target), children([Jsonable])
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
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

extension TreemapSerieSilent: Mappable {
    public func mapping(_ map: Mapper) {
        map["link"] = link
        map["target"] = target
        map["children"] = children
    }
}

extension TreemapSerieBreadcrumb: Enumable {
    public enum Enums {
        case show(Bool), left(Position), top(Position), right(Position), bottom(Position), height(Float), emptyItemWidth(Float), itemStyle(ItemStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
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

extension TreemapSerieBreadcrumb: Mappable {
    public func mapping(_ map: Mapper) {
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

extension TreemapSerieData: Enumable {
    public enum Enums {
        case value(Jsonable), id(String), name(String), visualDimension(Float), visualMin(Float), visualMax(Float), color([Color]), colorAlpha(Range), colorSaturation(Range), colorMappingBy(TreemapSerie.ColorMappingBy), visibleMin(Float), childrenVisibleMin(Float), label(EmphasisLabel), itemStyle(ItemStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
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

extension TreemapSerieData: Mappable {
    public func mapping(_ map: Mapper) {
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

extension TreemapSerie: Enumable {
    public enum Enums {
        case zlevel(Float), z(Float), left(Position), top(Position), right(Position), bottom(Position), width(LengthValue), height(LengthValue), squareRotio(Float), leafDepth(Float), roam(Roam), nodeClick(NodeClick), zoomToNodeRatio(Float), level([Level]), silent(Silent), visualDimension(Float), visualMin(Float), visualMax(Float), colorAlpha(Range), colorSaturation(Range), colorMappingBy(ColorMappingBy), visibleMin(Float), childrenVisibleMin(Float), label(EmphasisLabel), itemStyle(ItemStyle), breadcrumb(Breadcrumb), data([Jsonable]), animationDuration(Time), animationEasing(EasingFunction), animationDelay(Time)
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
            case let .visualDimension(visualDimension):
                self.visualDimension = visualDimension
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

extension TreemapSerie: Mappable {
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
        map["squareRotio"] = squareRotio
        map["leafDepth"] = leafDepth
        map["roam"] = roam
        map["nodeClick"] = nodeClick
        map["zoomToNodeRatio"] = zoomToNodeRatio
        map["level"] = level
        map["silent"] = silent
        map["visualDimension"] = visualDimension
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
