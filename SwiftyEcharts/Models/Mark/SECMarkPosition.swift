//
//  SECMarkPosition.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 标签的位置的可选类型
public enum SECMarkPosition : Jsonable {
    case xy(Float, Float)
    case xyPercent(Float, Float)
    case top, left, right, bottom, inside, insideLeft, insideTop, insideRight, insideBottom, insideTopLeft, insideBottomLeft, insideTopRight, insideBottomRight
    
    public var jsonString: String {
        switch self {
        case let .xy(x, y):
            return "[\(x), \(y)]"
        case let .xyPercent(x, y):
            return "['\(x)%', '\(y)%']"
        case .top:
            return "\"top\""
        case .left:
            return "\"left\""
        case .right:
            return "\"right\""
        case .bottom:
            return "\"bottom\""
        case .inside:
            return "\"inside\""
        case .insideLeft:
            return "\"insideLeft\""
        case .insideRight:
            return "\"insideRight\""
        case .insideTop:
            return "\"insideTop\""
        case .insideBottom:
            return "\"insideBottom\""
        case .insideTopLeft:
            return "\"insideTopLeft\""
        case .insideBottomLeft:
            return "\"insideBottomLeft\""
        case .insideTopRight:
            return "\"insideTopRight\""
        case .insideBottomRight:
            return "\"insideBottomRight\""
        }
    }
}
