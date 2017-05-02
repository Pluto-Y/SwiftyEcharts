//
//  Roam.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

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

extension Roam: BooleanLiteralConvertible {
    
    public init(booleanLiteral value: Bool) {
        if value {
            self = .enable
        } else {
            self = .disable
        }
    }
    
}
