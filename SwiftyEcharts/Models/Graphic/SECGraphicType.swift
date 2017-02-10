//
//  SECGraphicType.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 10/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// <#Description#>
///
/// - group: <#group description#>
/// - image: <#image description#>
/// - text: <#text description#>
/// - rect: <#rect description#>
/// - circle: <#circle description#>
/// - ring: <#ring description#>
/// - sector: <#sector description#>
/// - arc: <#arc description#>
/// - polygon: <#polygon description#>
/// - polyline: <#polyline description#>
/// - line: <#line description#>
/// - bezierCurve: <#bezierCurve description#>
public enum SECGraphicType : String, SECJsonable {
    case group = "group"
    case image = "image"
    case text = "text"
    case rect = "rect"
    case circle = "circle"
    case ring = "ring"
    case sector = "sector"
    case arc = "arc"
    case polygon = "polygon"
    case polyline = "polyline"
    case line = "line"
    case bezierCurve = "bezierCurve"
    
    public var jsonString: String {
        return "\"\(self.rawValue)\""
    }
}
