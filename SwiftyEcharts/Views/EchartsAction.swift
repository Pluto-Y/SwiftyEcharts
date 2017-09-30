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
