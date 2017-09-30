//
//  EchartsAction.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 30/09/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

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

public protocol EchartsAction: Jsonable, Enumable {
    var type: EchartsActionType { get }
}

public struct HighlightAction: EchartsAction {
    public var type: EchartsActionType {
        return .highlight
    }
    
    public var seriesIndex: OneOrMore<UInt8>?
    public var seriesName: OneOrMore<String>?
    public var dataIndex: UInt8?
    public var name: String?
    
    public init() { }
}

extension HighlightAction: Enumable {
    public enum Enums {
        case seriesIndex(UInt8), seriesIndexes([UInt8]), seriesName(String), seriesNames([String]), dataIndex(UInt8), name(String)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
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
    public func mapping(map: Mapper) {
        map["type"] = type
        map["seriesIndex"] = seriesIndex
        map["seriesName"] = seriesName
        map["dataIndex"] = seriesName
        map["name"] = name
    }
}
