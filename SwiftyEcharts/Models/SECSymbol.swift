//
//  SECSymbol.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/12/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//

// FIXME: 添加注释
public enum SECSymbol: CustomStringConvertible {
    case circle
    case rect
    case roundRect
    case triangle
    case diamond
    case pin
    case arrow
    case image(String)
    case path(String)
    
    public var description: String {
        switch self {
        case .circle:
            return "circle"
        case .rect:
            return "rect"
        case .roundRect:
            return "roundRect"
        case .triangle:
            return "triangle"
        case .diamond:
            return "diamond"
        case .pin:
            return "pin"
        case .arrow:
            return "arrow"
        case let .image(url):
            return url
        case let .path(path):
            return path
        }
    }
}
