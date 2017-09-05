//
//  ThemeRiverSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 13/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 主题河流
///
/// 是一种特殊的流图, 它主要用来表示事件或主题等在一段时间内的变化。
///
/// 示例：http://echarts.baidu.com/gallery/editor.html?c=themeRiver-lastfm
///
/// 可视编码：
///
/// 主题河流中不同颜色的条带状河流分支编码了不同的事件或主题，河流分支的宽度编码了原数据集中的value值。
///
/// 此外，原数据集中的时间属性，映射到单个时间轴上。
public final class ThemeRiverSerie: Serie, Zable {
    
    /// 类型
    public var type: SerieType {
        return .themeRiver
    }
    
    /// MARK: Zable
    public var zlevel: Float?
    public var z: Float?
    
    /// thmemRiver组件离容器左侧的距离。
    ///
    /// left 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'left', 'center', 'right'。
    ///
    /// 如果 left 的值为'left', 'center', 'right'，组件会根据相应的位置自动对齐。
    public var left: Position?
    /// thmemRiver组件离容器上侧的距离。
    ///
    /// top 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'top', 'middle', 'bottom'。
    ///
    /// 如果 top 的值为'top', 'middle', 'bottom'，组件会根据相应的位置自动对齐。
    public var top: Position?
    /// thmemRiver组件离容器右侧的距离。
    ///
    /// right 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    public var right: Position?
    /// thmemRiver组件离容器下侧的距离。
    ///
    /// bottom 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    public var bottom: Position?
    /// thmemRiver组件的宽度。
    public var width: LengthValue?
    /// thmemRiver组件的高度。
    ///
    /// 注意： 整个主题河流view的位置信息复用了单个时间轴的位置信息，即left，top，right，bottom。
    public var height: LengthValue?
    /// 坐标系统，主题河流用的是单个的时间轴。
    public var coordinateSystem: CoordinateSystem?
    /// 图中与坐标轴正交的方向的边界间隙，设置该值是为了调整图的位置，使其尽量处于屏幕的正中间，避免处于屏幕的上方或下方。
    public var boundaryGap: BoundaryGap?
    /// 单个时间轴的index，默认值为0，因为只有单个轴。
    public var singleAxisIndex: UInt8?
    /// label 描述了主题河流中每个带状河流分支对应的文本标签的样式。
    public var label: EmphasisLabel?
    /// 主题河流中每个带状河流分支的样式。
    public var itemStyle: ItemStyle?
    /// 主题河流中图例的样式。
    public var legend: Legend?
    /// 主题河流中tooltip的样式。
    public var tooltip: Tooltip?
    /// 数据
    public var data: [Jsonable]?
    
    public init() { }
}

extension ThemeRiverSerie: Enumable {
    public enum Enums {
        case zlevel(Float), z(Float), left(Position), top(Position), right(Position), bottom(Position), width(LengthValue), height(LengthValue), coordinateSystem(CoordinateSystem), boundaryGap(BoundaryGap), singleAxisIndex(UInt8), label(EmphasisLabel), itemStyle(ItemStyle), legend(Legend), tooltip(Tooltip), data([Jsonable])
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
            case let .coordinateSystem(coordinateSystem):
                self.coordinateSystem = coordinateSystem
            case let .boundaryGap(boundaryGap):
                self.boundaryGap = boundaryGap
            case let .singleAxisIndex(singleAxisIndex):
                self.singleAxisIndex = singleAxisIndex
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .legend(legend):
                self.legend = legend
            case let .tooltip(tooltip):
                self.tooltip = tooltip
            case let .data(data):
                self.data = data
            }
        }
    }
}

extension ThemeRiverSerie: Mappable {
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
        map["coordinateSystem"] = coordinateSystem
        map["boundaryGap"] = boundaryGap
        map["singleAxisIndex"] = singleAxisIndex
        map["label"] = label
        map["itemStyle"] = itemStyle
        map["legend"] = legend
        map["tooltip"] = tooltip
        map["data"] = data
    }
}
