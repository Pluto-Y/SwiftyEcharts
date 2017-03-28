//
//  Font.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 30/11/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//

import Foundation

/// 文字字体的风格
public enum FontStyle: String, Jsonable, CustomStringConvertible{
    case normal = "normal"
    case italic = "italic"
    case oblique = "oblique"
    
    public var description: String {
        return "\(self.rawValue)"
    }
}


/// 文字字体的粗细
public enum FontWeight: Jsonable, CustomStringConvertible {
    case normal
    case bold
    case bolder
    case lighter
    case weight(Int)
    
    public var description: String {
        switch self {
        case .normal:
            return "normal"
        case .bold:
            return "bold"
        case .bolder:
            return "bolder"
        case .lighter:
            return "lighter"
        case let .weight(weight):
            return "\(weight)"
        }
    }
}

// 通过整数创建 `FontWeight`
extension FontWeight: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .weight(value)
    }
}
