//
//  InsideDataZoom.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 17/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 内置型数据区域缩放组件（dataZoomInside）
///
/// 所谓『内置』，即内置在坐标系中。
///
/// - 平移：在坐标系中滑动拖拽进行数据区域平移。
/// - 缩放：
///    - PC端：鼠标在坐标系范围内滚轮滚动（MAC触控板类同）
///    - 移动端：在移动端触屏上，支持两指滑动缩放。
public final class InsideDataZoom: DataZoom {
    
    /// 类型
    public var type: String {
        return "inside"
    }
    /// 是否停止组件的功能。
    public var disabled: Bool?
    /// 设置 dataZoom-inside 组件控制的 x轴（即xAxis，是直角坐标系中的概念，参见 grid）。
    /// 不指定时，当 dataZoom-inside.orient 为 'horizontal'时，默认控制和 dataZoom 平行的第一个 xAxis。但是不建议使用默认值，建议显式指定。
    /// 如果是 number 表示控制一个轴，如果是 Array 表示控制多个轴。
    /// 例如有如下 ECharts option：
    ///
    ///         option: {
    ///             xAxis: [
    ///                 {...}, // 第一个 xAxis
    ///                 {...}, // 第二个 xAxis
    ///                 {...}, // 第三个 xAxis
    ///                 {...}  // 第四个 xAxis
    ///             ],
    ///             dataZoom: [
    ///                 { // 第一个 dataZoom 组件
    ///                     xAxisIndex: [0, 2] // 表示这个 dataZoom 组件控制 第一个 和 第三个 xAxis
    ///                 },
    ///                 { // 第二个 dataZoom 组件
    ///                     xAxisIndex: 3      // 表示这个 dataZoom 组件控制 第四个 xAxis
    ///                 }
    ////            ]
    ///         }
    public var xAxisIndex: OneOrMore<UInt8>?
    /// 设置 dataZoom-inside 组件控制的 x轴（即yAxis，是直角坐标系中的概念，参见 grid）。
    /// 不指定时，当 dataZoom-inside.orient 为 'vertical'时，默认控制和 dataZoom 平行的第一个 yAxis。但是不建议使用默认值，建议显式指定。
    /// 如果是 number 表示控制一个轴，如果是 Array 表示控制多个轴。
    /// 例如有如下 ECharts option：
    ///
    ///         option: {
    ///             yAxis: [
    ///                 {...}, // 第一个 yAxis
    ///                 {...}, // 第二个 yAxis
    ///                 {...}, // 第三个 yAxis
    ///                 {...}  // 第四个 yAxis
    ///             ],
    ///             dataZoom: [
    ///                 { // 第一个 dataZoom 组件
    ///                     yAxisIndex: [0, 2] // 表示这个 dataZoom 组件控制 第一个 和 第三个 yAxis
    ///                 },
    ///                 { // 第二个 dataZoom 组件
    ///                     yAxisIndex: 3      // 表示这个 dataZoom 组件控制 第四个 yAxis
    ///                 }
    ////            ]
    ///         }
    public var yAxisIndex: OneOrMore<UInt8>?
    /// 设置 dataZoom-inside 组件控制的 radius 轴（即radiusAxis，是直角坐标系中的概念，参见 polar）。
    /// 如果是 number 表示控制一个轴，如果是 Array 表示控制多个轴。
    /// 例如有如下 ECharts option：
    ///
    ///         option: {
    ///             radiusAxis: [
    ///                 {...}, // 第一个 radiusAxis
    ///                 {...}, // 第二个 radiusAxis
    ///                 {...}, // 第三个 radiusAxis
    ///                 {...}  // 第四个 radiusAxis
    ///             ],
    ///             dataZoom: [
    ///                 { // 第一个 dataZoom 组件
    ///                     radiusAxisIndex: [0, 2] // 表示这个 dataZoom 组件控制 第一个 和 第三个 radiusAxis
    ///                 },
    ///                 { // 第二个 dataZoom 组件
    ///                     radiusAxisIndex: 3      // 表示这个 dataZoom 组件控制 第四个 radiusAxis
    ///                 }
    ///             ]
    ///         }
    public var radiusAxisIndex: OneOrMore<UInt8>?
    /// 设置 dataZoom-inside 组件控制的 angle 轴（即angleAxis，是直角坐标系中的概念，参见 polar）。
    /// 如果是 number 表示控制一个轴，如果是 Array 表示控制多个轴。
    /// 例如有如下 ECharts option：
    ///
    ///         option: {
    ///             angleAxis: [
    ///                 {...}, // 第一个 angleAxis
    ///                 {...}, // 第二个 angleAxis
    ///                 {...}, // 第三个 angleAxis
    ///                 {...}  // 第四个 angleAxis
    ///             ],
    ///             dataZoom: [
    ///                 { // 第一个 dataZoom 组件
    ///                     angleAxisIndex: [0, 2] // 表示这个 dataZoom 组件控制 第一个 和 第三个 angleAxis
    ///                 },
    ///                 { // 第二个 dataZoom 组件
    ///                     angleAxisIndex: 3      // 表示这个 dataZoom 组件控制 第四个 angleAxis
    ///                 }
    ///             ]
    ///         }
    public var angleAxisIndex: OneOrMore<UInt8>?
    /// dataZoom 的运行原理是通过 数据过滤 来达到 数据窗口缩放 的效果。数据过滤模式的设置不同，效果也不同。
    /// 可选值为：
    /// - 'filter'：当前数据窗口外的数据，被 过滤掉。即会影响其他轴的数据范围。
    /// - 'empty'：当前数据窗口外的数据，被 设置为空。即不会影响其他轴的数据范围。
    /// 如何设置，由用户根据场景和需求自己决定。经验来说：
    /// - 当『只有 X 轴 或 只有 Y 轴受 dataZoom 组件控制』时，常使用 filterMode: 'filter'，这样能使另一个轴自适应过滤后的数值范围。
    /// - 当『X 轴 Y 轴分别受 dataZoom 组件控制』时：
    ///     - 如果 X 轴和 Y 轴是『同等地位的、不应互相影响的』，比如在『双数值轴散点图』中，那么两个轴可都设为 fiterMode: 'empty'。
    ///     - 如果 X 轴为主，Y 轴为辅，比如在『柱状图』中，需要『拖动 dataZoomX 改变 X 轴过滤柱子时，Y 轴的范围也自适应剩余柱子的高度』，『拖动 dataZoomY 改变 Y 轴过滤柱子时，X 轴范围不受影响』，那么就 X轴设为 fiterMode: 'filter'，Y 轴设为 fiterMode: 'empty'，即主轴 'filter'，辅轴 'empty'。
    /// 下面是个具体例子：
    ///
    ///         option = {
    ///             dataZoom: [
    ///                 {
    ///                     id: 'dataZoomX',
    ///                     type: 'slider',
    ///                     xAxisIndex: [0],
    ///                     filterMode: 'filter'
    ///                 },
    ///                 {
    ///                     id: 'dataZoomY',
    ///                     type: 'slider',
    ///                     yAxisIndex: [0],
    ///                     filterMode: 'empty'
    ///                 }
    ///             ],
    ///             xAxis: {type: 'value'},
    ///             yAxis: {type: 'value'},
    ///             series{
    ///                 type: 'bar',
    ///                 data: [
    ///                 // 第一列对应 X 轴，第二列对应 Y 轴。
    ///                     [12, 24, 36],
    ///                     [90, 80, 70],
    ///                     [3, 9, 27],
    ///                     [1, 11, 111]
    ///                 ]
    ///             }
    ///         }
    ///
    /// 上例中，dataZoomX 的 filterMode 设置为 'filter'。于是，假设当用户拖拽 dataZoomX（不去动 dataZoomY）导致其 valueWindow 变为 [2, 50] 时，dataZoomX 对 series.data 的第一列进行遍历，窗口外的整项去掉，最终得到的 series.data 为：
    ///
    ///         [
    ///             // 第一列对应 X 轴，第二列对应 Y 轴。
    ///             [12, 24, 36],
    ///             // [90, 80, 70] 整项被过滤掉，因为 90 在 dataWindow 之外。
    ///             [3, 9, 27]
    ///             // [1, 11, 111] 整项被过滤掉，因为 1 在 dataWindow 之外。
    ///         ]
    ///
    /// 过滤前，series.data 中对应 Y 轴的值有 24、80、9、11，过滤后，只剩下 24 和 9，那么 Y 轴的显示范围就会自动改变以适应剩下的这两个值的显示（如果 Y 轴没有被设置 min、max 固定其显示范围的话）。
    /// 所以，filterMode: 'filter' 的效果是：过滤数据后使另外的轴也能自动适应当前数据的范围。
    /// 再从头来，上例中 dataZoomY 的 filterMode 设置为 'empty'。于是，假设当用户拖拽 dataZoomY（不去动 dataZoomX）导致其 dataWindow 变为 [10, 60] 时，dataZoomY 对 series.data 的第二列进行遍历，窗口外的值被设置为 empty （即替换为 NaN，这样设置为空的项，其所对应柱形，在 X 轴还有占位，只是不显示出来）。最终得到的 series.data 为：
    ///
    ///         [
    ///             // 第一列对应 X 轴，第二列对应 Y 轴。
    ///             [12, 24, 36],
    ///             [90, NaN, 70], // 设置为 empty (NaN)
    ///             [3, NaN, 27],  // 设置为 empty (NaN)
    ///             [1, 11, 111]
    ///         ]
    ///
    /// 这时，series.data 中对应于 X 轴的值仍然全部保留不受影响，为 12、90、3、1。那么用户对 dataZoomY 的拖拽操作不会影响到 X 轴的范围。这样的效果，对于离群点（outlier）过滤功能，比较清晰。
    /// 如地址的例子：
    public var filterMode: FilterMode?
    /// 数据窗口范围的起始百分比。范围是：0 ~ 100。表示 0% ~ 100%。
    public var start: Float?
    /// 数据窗口范围的结束百分比。范围是：0 ~ 100。
    public var end: Float?
    /// 数据窗口范围的起始数值。如果设置了 dataZoom-inside.start 则 startValue 失效。
    /// dataZoom-inside.startValue 和 dataZoom-inside.endValue 共同用 绝对数值 的形式定义了数据窗口范围。
    /// 注意，如果轴的类型为 category，则 startValue 既可以设置为 axis.data 数组的 index，也可以设置为数组值本身。 但是如果设置为数组值本身，会在内部自动转化为数组的 index。
    public var startValue: Float?
    /// 数据窗口范围的结束数值。如果设置了 dataZoom-inside.end 则 endValue 失效。
    /// dataZoom-inside.startValue 和 dataZoom-inside.endValue 共同用 绝对数值 的形式定义了数据窗口范围。
    /// 注意，如果轴的类型为 category，则 endValue 即可以设置为 axis.data 数组的 index，也可以设置为数组值本身。 但是如果设置为数组值本身，会在内部自动转化为数组的 index。
    public var endValue: Float?
    /// 布局方式是横还是竖。不仅是布局方式，对于直角坐标系而言，也决定了，缺省情况控制横向数轴还是纵向数轴。
    public var orient: Orient?
    /// 是否锁定选择区域（或叫做数据窗口）的大小。
    /// 如果设置为 true 则锁定选择区域的大小，也就是说，只能平移，不能缩放。
    public var zoomLock: Bool?
    /// 设置触发视图刷新的频率。单位为毫秒（ms）。
    /// 如果 animation 设为 true 且 animationDurationUpdate 大于 0，可以保持 throttle 为默认值 100（或者设置为大于 0 的值），否则拖拽时有可能画面感觉卡顿。
    /// 如果 animation 设为 false 或者 animationDurationUpdate 设为 0，且在数据量不大时，拖拽时画面感觉卡顿，可以把尝试把 throttle 设为 0 来改善。
    public var throttle: Float?
    
    public init() {}
}

extension InsideDataZoom: Enumable {
    public enum Enums {
        case disabled(Bool), xAxisIndex(UInt8), xAxisIndexes([UInt8]), yAxisIndex(UInt8), yAxisIndexes([UInt8]), radiusAxisIndex(UInt8), radiusAxisIndexes([UInt8]), angleAxisIndex(UInt8), angleAxisIndexes([UInt8]), filterMode(FilterMode), start(Float), end(Float), startValue(Float), endValue(Float), orient(Orient), zoomLock(Bool), throttle(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .disabled(disabled):
                self.disabled = disabled
            case let .xAxisIndex(xAxisIndex):
                self.xAxisIndex = OneOrMore(one: xAxisIndex)
            case let .xAxisIndexes(xAxisIndexes):
                self.xAxisIndex = OneOrMore(more: xAxisIndexes)
            case let .yAxisIndex(yAxisIndex):
                self.yAxisIndex = OneOrMore(one: yAxisIndex)
            case let .yAxisIndexes(yAxisIndexes):
                self.yAxisIndex = OneOrMore(more: yAxisIndexes)
            case let .radiusAxisIndex(radiusAxisIndex):
                self.radiusAxisIndex = OneOrMore(one: radiusAxisIndex)
            case let .radiusAxisIndexes(radiusAxisIndexes):
                self.radiusAxisIndex = OneOrMore(more: radiusAxisIndexes)
            case let .angleAxisIndex(angleAxisIndex):
                self.angleAxisIndex = OneOrMore(one: angleAxisIndex)
            case let .angleAxisIndexes(angleAxisIndexes):
                self.angleAxisIndex = OneOrMore(more: angleAxisIndexes)
            case let .filterMode(filterMode):
                self.filterMode = filterMode
            case let .start(start):
                self.start = start
            case let .end(end):
                self.end = end
            case let .startValue(startValue):
                self.startValue = startValue
            case let .endValue(endValue):
                self.endValue = endValue
            case let .orient(orient):
                self.orient = orient
            case let .zoomLock(zoomLock):
                self.zoomLock = zoomLock
            case let .throttle(throttle):
                self.throttle = throttle
            }
        }
    }
}

extension InsideDataZoom: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["disabled"] = disabled
        map["xAxisIndex"] = xAxisIndex
        map["yAxisIndex"] = yAxisIndex
        map["radiusAxisIndex"] = radiusAxisIndex
        map["angleAxisIndex"] = angleAxisIndex
        map["filterMode"] = filterMode
        map["start"] = start
        map["end"] = end
        map["startValue"] = startValue
        map["endValue"] = endValue
        map["orient"] = orient
        map["zoomLock"] = zoomLock
        map["throttle"] = throttle
    }
}
