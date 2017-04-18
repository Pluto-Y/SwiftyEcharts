//
//  MarkData.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public final class MarkData {
    /// 名称
    public var name: String?
    /// 标注类型
    public var type: MarkDataType?
    /// 在使用 type 时有效，用于指定在哪个维度上指定最大值最小值，可以是 0（xAxis, radiusAxis），1（yAxis, angleAxis），默认使用第一个数值轴所在的维度。
    public var valueIndex: UInt?
    /// 在使用 type 时有效，用于指定在哪个维度上指定最大值最小值。这可以是维度的直接名称，例如折线图时可以是x、angle等、candlestick 图时可以是open、close等维度名称。
    public var valueDim: String?
    /// 起点或终点的坐标。坐标格式视系列的坐标系而定，可以是直角坐标系上的 x, y，也可以是极坐标系上的 radius, angle。
    /// 注：对于 axis.type 为 'category' 类型的轴
    /// - 如果 coord 值为 number，则表示 axis.data 的 index。
    /// - 如果 coord 值为 string，则表示 axis.data 中具体的值。注意使用这种方式时，xAxis.data 不能写成 [number, number, ...]，而只能写成 [string, string, ...]，否则不能被 markPoint / markLine 用『具体值』索引到。
    ///
    /// 例如：
    ///         {
    ///             xAxis: {
    ///                 type: 'category',
    ///                 data: ['5', '6', '9', '13', '19', '33']
    ///                 // 注意这里不建议写成 [5, 6, 9, 13, 19, 33]，否则不能被 markPoint / markLine 用『具体值』索引到。
    ///             },
    ///             series: {
    ///                 type: 'line',
    ///                 data: [11, 22, 33, 44, 55, 66],
    ///                 markPoint: { // markLine 也是同理
    ///                     data: [{
    ///                         coord: [5, 33.4], // 其中 5 表示 xAxis.data[5]，即 '33' 这个元素。
    ///                         // coord: ['5', 33.4] // 其中 '5' 表示 xAxis.data中的 '5' 这个元素。
    ///                         // 注意，使用这种方式时，xAxis.data 不能写成 [number, number, ...]
    ///                         // 而只能写成 [string, string, ...]
    ///                     }]
    ///                 }
    ///             }
    ///         }
    public var coord: [Jsonable]?
    /// 相对容器的屏幕 x 坐标，单位像素。
    public var x: LengthValue?
    /// 相对容器的屏幕 y 坐标，单位像素。
    public var y: LengthValue?
    public var xAxis: String?
    public var yAxis: String?
    /// 标注值，可以不设。
    public var value: Float?
    /// 标记的图形
    /// - Note: 该属性只在 MarkArea 无效
    public var symbol: Symbol?
    /// 标记的大小
    /// - Note: 该属性只在 MarkArea 无效
    public var symbolSize: Jsonable?
    /// 标记的旋转角度。注意在 markLine 中当 symbol 为 'arrow' 时会忽略 symbolRotate 强制设置为切线的角度。
    /// - Note: 该属性只在 MarkArea 无效
    public var symbolRotate: Float?
    /// 标记相对于原本位置的偏移。默认情况下，标记会居中置放在数据对应的位置，但是如果 symbol 是自定义的矢量路径或者图片，就有可能不希望 symbol 居中。这时候可以使用该配置项配置 symbol 相对于原本居中的偏移，可以是绝对的像素值，也可以是相对的百分比。
    /// 例如 [0, '50%'] 就是把自己向上移动了一半的位置，在 symbol 图形是气泡的时候可以让图形下端的箭头对准数据点。
    /// - Note: 该属性只在 MarkArea 无效
    public var symbolOffset: Point?
    /// 该数据项线的样式，起点和终点项的 lineStyle会合并到一起。
    public var lineStyle: EmphasisLineStyle?
    /// 该数据项标签的样式，起点和终点项的 label会合并到一起。
    public var label: FormattedLabel?
    
    public init() { }
    
    
}

extension MarkData: Enumable {
    public enum Enums {
        case name(String), type(MarkDataType), valueIndex(UInt), valueDim(String), coord([Jsonable]), x(LengthValue), y(LengthValue), xAxis(String), yAxis(String), value(Float), symbol(Symbol), symbolSize(Jsonable), symbolRotate(Float), symbolOffset(Point), lineStyle(EmphasisLineStyle), label(FormattedLabel)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .type(type):
                self.type = type
            case let .valueIndex(valueIndex):
                self.valueIndex = valueIndex
            case let .valueDim(valueDim):
                self.valueDim = valueDim
            case let .coord(coord):
                self.coord = coord
            case let .x(x):
                self.x = x
            case let .y(y):
                self.y = y
            case let .xAxis(xAxis):
                self.xAxis = xAxis
            case let .yAxis(yAxis):
                self.yAxis = yAxis
            case let .value(value):
                self.value = value
            case let .symbol(symbol):
                self.symbol = symbol
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            case let .symbolRotate(symbolRotate):
                self.symbolRotate = symbolRotate
            case let .symbolOffset(symbolOffset):
                self.symbolOffset = symbolOffset
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            case let .label(label):
                self.label = label
            }
        }
    }
}

extension MarkData: Mappable {
    public func mapping(_ map: Mapper) {
        map["name"] = name
        map["type"] = type
        map["valueIndex"] = valueIndex
        map["valueDim"] = valueDim
        map["coord"] = coord
        map["x"] = x
        map["y"] = y
        map["xAxis"] = xAxis
        map["yAxis"] = yAxis
        map["value"] = value
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["symbolRotate"] = symbolRotate
        map["symbolOffset"] = symbolOffset
        map["lineStyle"] = lineStyle
        map["label"] = label
    }
}
