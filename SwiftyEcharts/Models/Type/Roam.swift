//
//  Roam.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 是否开启拖拽漫游（移动和缩放）。可取值有：
///
/// - enable: 缩放和平移均可。
/// - disable: 关闭。
/// - scale: 只能够缩放。
/// - zoom: 只能够缩放。
/// - move: 只能够平移。
/// - pan: 只能够平移。
/// - null: 采用默认值，看具体使用的地方。
public enum Roam: String, Jsonable {
    case enable = "true"
    case disable = "false"
    case scale = "scale"
    case zoom = "zoom"
    case move = "move"
    case pan = "pan"
    case null = "null"
    
    public var jsonString: String {
        switch self {
        case .enable, .disable, .null:
            return "\(self.rawValue)"
        default:
            return self.rawValue.jsonString
        }
    }
}

// 通过 Bool 值能控制是否开启拖拽漫游
extension Roam: ExpressibleByBooleanLiteral {
    
    public init(booleanLiteral value: Bool) {
        if value {
            self = .enable
        } else {
            self = .disable
        }
    }
    
}
