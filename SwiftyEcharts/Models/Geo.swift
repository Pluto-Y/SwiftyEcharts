//
//  Geo.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 地理坐标系组件。
///
/// 地理坐标系组件用于地图的绘制，支持在地理坐标系上绘制散点图，线集。
///
/// 在地理坐标系中使用散点图的示例:
///
/// http://echarts.baidu.com/gallery/editor.html?c=scatter-map
///
/// 3.1.10 开始 geo 组件也支持鼠标事件。事件参数为
///
///     {
///         componentType: 'geo',
///         // Geo 组件在 option 中的 index
///         geoIndex: number,
///         // 点击区域的名称，比如"上海"
///         name: string,
///         // 传入的点击区域的 region 对象，见 geo.regions
///         region: Object
///     }
///
/// - Note: geo 区域的颜色也可以被 map series 所控制，参见 series-map.geoIndex。
public final class Geo: Displayable, Zable {
    
    /// 滚轮缩放的极限控制，通过min, max最小和最大的缩放值，默认的缩放为1。
    public final class ScaleLimit {
        /// 最小的缩放值
        public var min: Float?
        /// 最大的缩放值
        public var max: Float?
    }
    
    /// 在地图中对特定的区域配置样式。
    ///
    /// 例如：
    ///     regions: [{
    ///         name: '广东',
    ///         itemStyle: {
    ///             normal: {
    ///                 areaColor: 'red',
    ///                 color: 'red'
    ///             }
    ///         }
    ///     }]
    ///
    /// geo 区域的颜色也可以被 map series 所控制，参见 series-map.geoIndex。
    public final class Region {
        /// 地图区域的名称，例如 '广东'，'浙江'。
        public var name: String?
        /// 该区域是否选中。
        public var selected: Bool?
        /// 该区域的多边形样式设置
        public var itemStyle: ItemStyle?
        /// 该区域的标签样式设置
        public var label: EmphasisLabel?
    }
    
    /// 是否显示地理坐标系组件。
    public var show: Bool?
    /// 地图类型。
    ///
    /// ECharts 3 中因为地图精度的提高，不再内置地图数据增大代码体积，你可以在地图下载界面下载到需要的地图文件引入并注册到 ECharts 中。
    ///
    /// ECharts 中提供了两种格式的地图数据，一种是可以直接 script 标签引入的 js 文件，引入后会自动注册地图名字和数据。还有一种是 JSON 文件，需要通过 AJAX 异步加载后手动注册。
    ///
    /// 下面是两种类型的使用示例：
    ///
    /// JavaScript 引入示例
    ///
    ///     <script src="echarts.js"></script>
    ///     <script src="map/js/china.js"></script>
    ///     <script>
    ///     var chart = echarts.init(document.getElementById('main'));
    ///     chart.setOption({
    ///         series: [{
    ///             type: 'map',
    ///             map: 'china'
    ///         }]
    ///     });
    ///     </script>
    ///
    /// JSON 引入示例
    ///     $.get('map/json/china.json', function (chinaJson) {
    ///         echarts.registerMap('china', chinaJson);
    ///         var chart = echarts.init(document.getElementById('main'));
    ///         chart.setOption({
    ///         series: [{
    ///         type: 'map',
    ///         map: 'china'
    ///         }]
    ///         });
    ///     });
    ///
    /// ECharts 使用 geoJSON 格式的数据作为地图的轮廓，除了上述数据，你也可以通过其它手段获取地图的 geoJSON 数据注册到 ECharts 中。参见示例 USA Population Estimates
    public var map: String?
    /// 是否开启鼠标缩放和平移漫游。默认不开启。如果只想要开启缩放或者平移，可以设置成 'scale' 或者 'move'。设置成 true 为都开启
    public var roam: Bool?
    /// 当前视角的中心点，用经纬度表示
    public var center: Point?
    /// 这个参数用于 scale 地图的长宽比。
    ///
    /// 最终的 aspect 的计算方式是：geoBoundingRect.width / geoBoundingRect.height * aspectScale
    public var aspectScale: Float?
    /// 当前视角的缩放比例。
    public var zoom: Float?
    /// 滚轮缩放的极限控制，通过min, max最小和最大的缩放值，默认的缩放为1。
    public var scaleLimit: ScaleLimit?
    /// 自定义地区的名称映射，如：
    ///
    ///    {
    ///        'China' : '中国'
    ///    }
    public var nameMap: String? // FIXME: 有待研究
    /// 选中模式，表示是否支持多个选中，默认关闭，支持布尔值和字符串，字符串取值可选'single'表示单选，或者'multiple'表示多选。
    public var selectedMode: SelectedMode?
    /// 图形上的文本标签，可用于说明图形的一些数据信息，比如值，名称等，label选项在 ECharts 2.x 中放置于itemStyle.normal下，在 ECharts 3 中为了让整个配置项结构更扁平合理，label 被拿出来跟 itemStyle 平级，并且跟 itemStyle 一样拥有 normal, emphasis 两个状态。
    public var label: EmphasisLabel?
    /// 地图区域的多边形 图形样式，有 normal 和 emphasis 两个状态。normal 是图形在默认状态下的样式；emphasis 是图形在高亮状态下的样式，比如在鼠标悬浮或者图例联动高亮时。
    public var itemStyle: ItemStyle?
    /// MARK: Zable
    public var zlevel: Float?
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
    /// layoutCenter 和 layoutSize 提供了除了 left/right/top/bottom/width/height 之外的布局手段。
    /// 在使用 left/right/top/bottom/width/height 的时候，可能很难在保持地图高宽比的情况下把地图放在某个盒形区域的正中间，并且保证不超出盒形的范围。此时可以通过 layoutCenter 属性定义地图中心在屏幕中的位置，layoutSize 定义地图的大小。如下示例
    /// layoutCenter: ['30%', '30%'],
    /// // 如果宽高比大于 1 则宽度为 100，如果小于 1 则高度为 100，保证了不超过 100x100 的区域
    /// layoutSize: 100
    /// 设置这两个值后 left/right/top/bottom/width/height 无效。
    public var layoutCenter: String?
    /// 地图的大小，见 layoutCenter。支持相对于屏幕宽高的百分比或者绝对的像素大小。
    public var layoutSize: String?
    /// 在地图中对特定的区域配置样式。
    public var regions: [Region]?
    /// 图形是否不响应和触发鼠标事件，默认为 false，即响应和触发鼠标事件。
    public var silent: Bool?
}

extension Geo.ScaleLimit: Enumable {
    public enum Enums {
        case min(Float), max(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .min(min):
                self.min = min
            case let .max(max):
                self.max = max
            }
        }
    }
}

extension Geo.ScaleLimit: Mappable {
    public func mapping(_ map: Mapper) {
        map["min"] = min
        map["max"] = max
    }
}

extension Geo.Region: Enumable {
    public enum Enums {
        case name(String), selected(Bool), itemStyle(ItemStyle), label(EmphasisLabel)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .selected(selected):
                self.selected = selected
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .label(label):
                self.label = label
            }
        }
    }
}

extension Geo.Region: Mappable {
    public func mapping(_ map: Mapper) {
        map["name"] = name
        map["selected"] = selected
        map["itemStyle"] = itemStyle
        map["label"] = label
    }
}

extension Geo: Enumable {
    public enum Enums {
        case show(Bool), map(String), roam(Bool), center(Point), aspectScale(Float), zoom(Float), scaleLimit(ScaleLimit), nameMap(String), selectedMode(SelectedMode), label(EmphasisLabel), itemStyle(ItemStyle), zlevel(Float), z(Float), left(Position), top(Position), right(Position), bottom(Position), layoutCenter(String), layoutSize(String), regions([Region]), silent(Bool)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .map(map):
                self.map = map
            case let .roam(roam):
                self.roam = roam
            case let .center(center):
                self.center = center
            case let .aspectScale(aspectScale):
                self.aspectScale = aspectScale
            case let .zoom(zoom):
                self.zoom = zoom
            case let .scaleLimit(scaleLimit):
                self.scaleLimit = scaleLimit
            case let .nameMap(nameMap):
                self.nameMap = nameMap
            case let .selectedMode(selectedMode):
                self.selectedMode = selectedMode
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
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
            case let .layoutCenter(layoutCenter):
                self.layoutCenter = layoutCenter
            case let .layoutSize(layoutSize):
                self.layoutSize = layoutSize
            case let .regions(regions):
                self.regions = regions
            case let .silent(silent):
                self.silent = silent
            }
        }
    }
}

extension Geo: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["map"] = self.map
        map["roam"] = roam
        map["center"] = center
        map["aspectScale"] = aspectScale
        map["zoom"] = zoom
        map["scaleLimit"] = scaleLimit
        map["nameMap"] = nameMap
        map["selectedMode"] = selectedMode
        map["label"] = label
        map["itemStyle"] = itemStyle
        map["zlevel"] = zlevel
        map["z"] = z
        map["left"] = left
        map["top"] = top
        map["right"] = right
        map["bottom"] = bottom
        map["layoutCenter"] = layoutCenter
        map["layoutSize"] = layoutSize
        map["regions"] = regions
        map["silent"] = silent
    }
}

// MARK: - Actions
/// 选中指定的地图区域。
public final class GeoSelectAction: EchartsAction {
    public var type: EchartsActionType {
        return .geoSelect
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

extension GeoSelectAction: Enumable {
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

extension GeoSelectAction: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["seriesIndex"] = seriesIndex
        map["seriesName"] = seriesName
        map["dataIndex"] = dataIndex
        map["name"] = name
    }
}

/// 取消选中指定的地图区域。
public final class GeoUnSelectAction: EchartsAction {
    public var type: EchartsActionType {
        return .geoUnSelect
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

extension GeoUnSelectAction: Enumable {
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

extension GeoUnSelectAction: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["seriesIndex"] = seriesIndex
        map["seriesName"] = seriesName
        map["dataIndex"] = dataIndex
        map["name"] = name
    }
}

/// 切换指定的地图区域选中状态。
public final class GeoToggleSelectAction: EchartsAction {
    public var type: EchartsActionType {
        return .geoToggleSelect
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

extension GeoToggleSelectAction: Enumable {
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

extension GeoToggleSelectAction: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["seriesIndex"] = seriesIndex
        map["seriesName"] = seriesName
        map["dataIndex"] = dataIndex
        map["name"] = name
    }
}
