//
//  Orient.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 12/04/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 布局朝向
///
/// - horizontal: 水平
/// - vertical: 垂直
public enum Orient: String, Jsonable {
    case horizontal = "horizontal", vertical = "vertical"
    
    public var jsonString: String {
        return self.rawValue.jsonString
    }
}
