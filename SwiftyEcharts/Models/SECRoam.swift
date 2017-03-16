//
//  SECRoam.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public enum SECRoam : String, Jsonable {
    case enable = "true"
    case disable = "false"
    case scale = "scale"
    case zoom = "zoom"
    case move = "move"
    case pan = "pan"
    
    public var jsonString: String {
        switch self {
        case .enable, .disable:
            return "\(self.rawValue)"
        default:
            return "\"\(self.rawValue)\""
        }
    }
}
