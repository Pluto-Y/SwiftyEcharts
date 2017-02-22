//
//  SECPosition.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 15/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 位置
///
/// - auto: 自动
/// - left: 水平：左
/// - center: 水平：中间
/// - right: 水平：右
/// - top: 垂直：顶部
/// - middle: 垂直：中间
/// - bottom: 垂直：底部
/// - value: 绝对位置
/// - percent: 相对位置
public enum SECPosition : SECJsonable {
    case auto, left, center, right, top, middle, bottom,start,end,inside
    case value(SECLength)
    
    public var jsonString: String {
        switch self {
        case .auto:
            return "\"auto\""
        case .left:
            return "\"left\""
        case .right:
            return "\"right\""
        case .center:
            return "\"center\""
        case .top:
            return "\"top\""
        case .bottom:
            return "\"bottom\""
        case .middle:
            return "\"middle\""
        case .start:
            return "\"start\""
        case .end:
            return "\"end\""
        case .inside:
            return "\"inside\""
        case let .value(val):
            return val.jsonString
        }
    }
}

public enum SECLocation : String, SECJsonable {
    case start = "start"
    case middle = "middle"
    case end = "end"
    
    public var jsonString: String {
        return "\"\(self.rawValue)\""
    }
}
