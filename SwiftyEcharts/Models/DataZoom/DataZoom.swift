//
//  DataZoom.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 17/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// DataZoom 控件的接口，如果是 DataZoom控件需要实现这个接口
public protocol DataZoom {
    var xAxisIndex: OneOrMore<UInt8>? { get set }
    var yAxisIndex: OneOrMore<UInt8>? { get set }
}

// MARK: - Actions
/// 数据区域缩放组件相关的行为，必须引入数据区域缩放组件后才能使用。
public final class DataZoomAction: EchartsAction {
    public var type: EchartsActionType {
        return .dataZoom
    }
    
    /// 可选，dataZoom 组件的 index，多个 dataZoom 组件时有用，默认为 0
    public var dataZoomIndex: Int?
    /// 开始位置的百分比，0 - 100
    public var start: Float?
    /// 结束位置的百分比，0 - 100
    public var end: Float?
    /// 开始位置的数值
    public var startValue: Jsonable?
    /// 结束位置的数值
    public var endValue: Jsonable?
}

extension DataZoomAction: Enumable {
    public enum Enums {
        case dataZoomIndex(Int), start(Float), end(Float), startValue(Jsonable), endValue(Jsonable)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .dataZoomIndex(dataZoomIndex):
                self.dataZoomIndex = dataZoomIndex
            case let .start(start):
                self.start = start
            case let .end(end):
                self.end = end
            case let .startValue(startValue):
                self.startValue = startValue
            case let .endValue(endValue):
                self.endValue = endValue
            }
        }
    }
}

extension DataZoomAction: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["dataZoomIndex"] = dataZoomIndex
        map["start"] = start
        map["end"] = end
        map["startValue"] = startValue
        map["endValue"] = endValue
    }
}

/// dataZoom 的运行原理是通过 数据过滤 来达到 数据窗口缩放 的效果。数据过滤模式的设置不同，效果也不同。
/// 可选值为：
/// - filter: 当前数据窗口外的数据，被 过滤掉。即会影响其他轴的数据范围。
/// - empty: 当前数据窗口外的数据，被 设置为空。即不会影响其他轴的数据范围。
///
/// 如何设置，由用户根据场景和需求自己决定。经验来说：
///
///  - 当『只有 X 轴 或 只有 Y 轴受 dataZoom 组件控制』时，常使用 filterMode: 'filter'，这样能使另一个轴自适应过滤后的数值范围。
///  - 当『X 轴 Y 轴分别受 dataZoom 组件控制』时：
///     - 如果 X 轴和 Y 轴是『同等地位的、不应互相影响的』，比如在『双数值轴散点图』中，那么两个轴可都设为 fiterMode: 'empty'。
///     - 如果 X 轴为主，Y 轴为辅，比如在『柱状图』中，需要『拖动 dataZoomX 改变 X 轴过滤柱子时，Y 轴的范围也自适应剩余柱子的高度』，『拖动 dataZoomY 改变 Y 轴过滤柱子时，X 轴范围不受影响』，那么就 X轴设为 fiterMode: 'filter'，Y 轴设为 fiterMode: 'empty'，即主轴 'filter'，辅轴 'empty'。
///
/// 下面是个具体例子：
///
///     option = {
///         dataZoom: [
///         {
///         id: 'dataZoomX',
///         type: 'slider',
///         xAxisIndex: [0],
///         filterMode: 'filter'
///         },
///         {
///         id: 'dataZoomY',
///         type: 'slider',
///         yAxisIndex: [0],
///         filterMode: 'empty'
///         }
///         ],
///         xAxis: {type: 'value'},
///         yAxis: {type: 'value'},
///         series{
///             type: 'bar',
///             data: [
///             // 第一列对应 X 轴，第二列对应 Y 轴。
///             [12, 24, 36],
///             [90, 80, 70],
///             [3, 9, 27],
///             [1, 11, 111]
///             ]
///         }
///     }
///
/// 上例中，dataZoomX 的 filterMode 设置为 'filter'。于是，假设当用户拖拽 dataZoomX（不去动 dataZoomY）导致其 valueWindow 变为 [2, 50] 时，dataZoomX 对 series.data 的第一列进行遍历，窗口外的整项去掉，最终得到的 series.data 为：
///
///     [
///         // 第一列对应 X 轴，第二列对应 Y 轴。
///         [12, 24, 36],
///         // [90, 80, 70] 整项被过滤掉，因为 90 在 dataWindow 之外。
///         [3, 9, 27]
///         // [1, 11, 111] 整项被过滤掉，因为 1 在 dataWindow 之外。
///     ]
///
/// 过滤前，series.data 中对应 Y 轴的值有 24、80、9、11，过滤后，只剩下 24 和 9，那么 Y 轴的显示范围就会自动改变以适应剩下的这两个值的显示（如果 Y 轴没有被设置 min、max 固定其显示范围的话）。
/// 所以，filterMode: 'filter' 的效果是：过滤数据后使另外的轴也能自动适应当前数据的范围。
/// 再从头来，上例中 dataZoomY 的 filterMode 设置为 'empty'。于是，假设当用户拖拽 dataZoomY（不去动 dataZoomX）导致其 dataWindow 变为 [10, 60] 时，dataZoomY 对 series.data 的第二列进行遍历，窗口外的值被设置为 empty （即替换为 NaN，这样设置为空的项，其所对应柱形，在 X 轴还有占位，只是不显示出来）。最终得到的 series.data 为：
///     [
///         // 第一列对应 X 轴，第二列对应 Y 轴。
///         [12, 24, 36],
///         [90, NaN, 70], // 设置为 empty (NaN)
///         [3, NaN, 27],  // 设置为 empty (NaN)
///         [1, 11, 111]
///     ]
/// 这时，series.data 中对应于 X 轴的值仍然全部保留不受影响，为 12、90、3、1。那么用户对 dataZoomY 的拖拽操作不会影响到 X 轴的范围。这样的效果，对于离群点（outlier）过滤功能，比较清晰。
///
/// 如下面的例子：
///
/// http://echarts.baidu.com/gallery/editor.html?c=doc-example/bar-dataZoom-filterMode
public enum FilterMode: String, Jsonable{
    case filter = "filter"
    case empty = "empty"
    
    public var jsonString: String {
        return self.rawValue.jsonString
    }
}
