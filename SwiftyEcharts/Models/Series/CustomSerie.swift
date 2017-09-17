//
//  CustomSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 16/09/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import UIKit

public final class CustomSerie: Serie {
    
    public var type: SerieType {
        return .custom
    }
    
    public var name: String?
    public var legendHoverLink: Bool?
    public var coordinateSystem: CoordinateSystem?
    public var xAxisIndex: UInt?
    public var yAxisIndex: UInt?
    public var cursor: String?
    public var draggable: Bool?
    public var progressive: Bool?
    public var width: LengthValue?
    public var height: LengthValue?
    public var children: [Jsonable]?
    public var onclick: String?
    public var onmouseover: String?
    public var onmouseout: String?
    public var onmousemove: String?
    public var onmousewheel: String?
    public var onmousedown: String?
    public var onmouseup: String?
    public var ondrag: String?
    public var ondragstart: String?
    public var ondragend: String?
    public var ondragenter: String?
    public var ondragleave: String?
    public var ondragover: String?
    public var ondrop: String?
}

extension CustomSerie: Enumable {
    public enum Enums {
        case name(String), legendHoverLink(Bool), coordinateSystem(CoordinateSystem), xAxisIndex(UInt), yAxisIndex(UInt), cursor(String), draggable(Bool), progressive(Bool), width(LengthValue), height(LengthValue), children([Jsonable]), onclick(String), onmouseover(String), onmouseout(String), onmousemove(String), onmousewheel(String), onmousedown(String), onmouseup(String), ondrag(String), ondragstart(String), ondragend(String), ondragenter(String), ondragleave(String), ondragover(String), ondrop(String)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .legendHoverLink(legendHoverLink):
                self.legendHoverLink = legendHoverLink
            case let .coordinateSystem(coordinateSystem):
                self.coordinateSystem = coordinateSystem
            case let .xAxisIndex(xAxisIndex):
                self.xAxisIndex = xAxisIndex
            case let .yAxisIndex(yAxisIndex):
                self.yAxisIndex = yAxisIndex
            case let .cursor(cursor):
                self.cursor = cursor
            case let .draggable(draggable):
                self.draggable = draggable
            case let .progressive(progressive):
                self.progressive = progressive
            case let .width(width):
                self.width = width
            case let .height(height):
                self.height = height
            case let .children(children):
                self.children = children
            case let .onclick(onclick):
                self.onclick = onclick
            case let .onmouseover(onmouseover):
                self.onmouseover = onmouseover
            case let .onmouseout(onmouseout):
                self.onmouseout = onmouseout
            case let .onmousemove(onmousemove):
                self.onmousemove = onmousemove
            case let .onmousewheel(onmousewheel):
                self.onmousewheel = onmousewheel
            case let .onmousedown(onmousedown):
                self.onmousedown = onmousedown
            case let .onmouseup(onmouseup):
                self.onmouseup = onmouseup
            case let .ondrag(ondrag):
                self.ondrag = ondrag
            case let .ondragstart(ondragstart):
                self.ondragstart = ondragstart
            case let .ondragend(ondragend):
                self.ondragend = ondragend
            case let .ondragenter(ondragenter):
                self.ondragenter = ondragenter
            case let .ondragleave(ondragleave):
                self.ondragleave = ondragleave
            case let .ondragover(ondragover):
                self.ondragover = ondragover
            case let .ondrop(ondrop):
                self.ondrop = ondrop
            }
        }
    }
}

extension CustomSerie: Mappable {
    public func mapping(map: Mapper) {
        map["type"] = type
        map["name"] = name
        map["legendHoverLink"] = legendHoverLink
        map["coordinateSystem"] = coordinateSystem
        map["xAxisIndex"] = xAxisIndex
        map["yAxisIndex"] = yAxisIndex
        map["cursor"] = cursor
        map["draggable"] = draggable
        map["progressive"] = progressive
        map["width"] = width
        map["height"] = height
        map["children"] = children
        map["onclick"] = onclick
        map["onmouseover"] = onmouseover
        map["onmouseout"] = onmouseout
        map["onmousemove"] = onmousemove
        map["onmousewheel"] = onmousewheel
        map["onmousedown"] = onmousedown
        map["onmouseup"] = onmouseup
        map["ondrag"] = ondrag
        map["ondragstart"] = ondragstart
        map["ondragend"] = ondragend
        map["ondragenter"] = ondragenter
        map["ondragleave"] = ondragleave
        map["ondragover"] = ondragover
        map["ondrop"] = ondrop
    }
}
