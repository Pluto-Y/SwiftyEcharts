//
//  EchartsAction.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 30/09/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

// MARK: EchartsActionType
/// Echart 的 Action 的所有类型的枚举
public enum EchartsActionType: String, Jsonable {
    case highlight = "highlight"
    case downplay = "downplay"
    // legend
    case legendSelect = "legendSelect"
    case legendUnSelect = "legendUnSelect"
    case legendToggleSelect = "legendToggleSelect"
    case legendScroll = "legendScroll"
    // tooltip
    case showTip = "showTip"
    case hideTip = "hideTip"
    // dataZoom
    case dataZoom = "dataZoom"
    // visualMap
    case selectDataRange = "selectDataRange"
    // timeline
    case timelineChange = "timelineChange"
    case timelinePlayChange = "timelinePlayChange"
    // toolbox
    case restore = "restore"
    // pie
    case pieSelect = "pieSelect"
    case pieUnSelect = "pieUnSelect"
    case pieToggleSelect = "pieToggleSelect"
    // geo
    case geoSelect = "geoSelect"
    case geoUnSelect = "geoUnSelect"
    case geoToggleSelect = "geoToggleSelect"
    // map
    case mapSelect = "mapSelect"
    case mapUnSelect = "mapUnSelect"
    case mapToggleSelect = "mapToggleSelect"
    // graph
    case focusNodeAdjacency = "focusNodeAdjacency"
    case unfocusNodeAdjacency = "unfocusNodeAdjacency"
    // brush
    case brush = "brush"
    
    public var jsonString: String {
        return self.rawValue.jsonString
    }
}

// MARK: - EchartsAction
/// ECharts 中支持的图表行为，通过 EchartsView.dispatchAction(_:) 触发。
public protocol EchartsAction: Mappable, Enumable {
    var type: EchartsActionType { get }
}

// MARK: - HighlightAction
/// 高亮指定的数据图形。
///
/// 通过seriesName或者seriesIndex指定系列。如果要再指定某个数据可以再指定dataIndex或者name。
public final class HighlightAction: EchartsAction {
    public var type: EchartsActionType {
        return .highlight
    }
    
    /// 系列 index，可以是一个数组指定多个系列
    public var seriesIndex: OneOrMore<Int>?
    /// 系列名称，可以是一个数组指定多个系列
    public var seriesName: OneOrMore<String>?
    /// 数据的 index
    public var dataIndex: Int?
    /// 数据的 名称
    public var name: String?
    
    public init() { }
}

extension HighlightAction: Enumable {
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

extension HighlightAction: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["seriesIndex"] = seriesIndex
        map["seriesName"] = seriesName
        map["dataIndex"] = dataIndex
        map["name"] = name
    }
}

// MARK: - DownplayAction
/// 取消高亮指定的数据图形。
///
/// 通过seriesName或者seriesIndex指定系列。如果要指定某个数据可以再指定dataIndex或者name。
public final class DownplayAction: EchartsAction {
    public var type: EchartsActionType {
        return .downplay
    }
    
    /// 系列 index，可以是一个数组指定多个系列
    public var seriesIndex: OneOrMore<Int>?
    /// 系列名称，可以是一个数组指定多个系列
    public var seriesName: OneOrMore<String>?
    /// 数据的 index
    public var dataIndex: Int?
    /// 数据的 名称
    public var name: String?
    
    public init() { }
}

extension DownplayAction: Enumable {
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

extension DownplayAction: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["seriesIndex"] = seriesIndex
        map["seriesName"] = seriesName
        map["dataIndex"] = dataIndex
        map["name"] = name
    }
}
