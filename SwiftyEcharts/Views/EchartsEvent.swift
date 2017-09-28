//
//  EchartsEvent.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 28/09/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public enum EchartsEvent: String {
    // 鼠标事件
    case click = "click"
    case dbClick = "dbclick"
    case mouseDown = "mousedown"
    case mouseUp = "mouseup"
    case mouseOver = "mouseover"
    case mouseOut = "mouseout"
    case globalOut = "globalout"
    case contextMenu = "contextmenu"
    // legend
    case legendSelectChanged = "legendselectchanged"
    case legendSelected = "legendselected"
    case legendUnselected = "legendunselected"
    case legendScroll = "legendscroll"
    // datazoom
    case dataZoom = "datazoom"
    case dataRangeSelected = "datarangeselected"
    // timeline
    case timelineChanged = "timelinechanged"
    case timelinePlayChanged = "timelineplaychanged"
    // toolbox
    case restore = "restore"
    case dataViewChanged = "dataviewchanged"
    case magicTypeChanged = "magictypechanged"
    // geo
    case geoSelectChanged = "geoselectchanged"
    case geoSelected = "geoselected"
    case geoUnselected = "geounselected"
    // pie
    case pieSelectChanged = "pieselectchanged"
    case pieSelected = "pieselected"
    case pieUnselected = "pieunselected"
    // map 
    case mapSelectChanged = "mapselectchanged"
    case mapSelected = "mapselected"
    case mapUnselected = "mapunselected"
    // axis
    case axisAreaSelected = "axisareaselected"
    // graph
    case focusNodeAdjacency = "focusnodeadjacency"
    case unfocusNodeAdjacency = "unfocusnodeadjacency"
    // brush
    case brush = "brush"
    case brushselected = "brushselected"
}
