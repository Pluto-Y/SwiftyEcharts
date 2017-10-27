//
//  CoordinateSystem.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 18/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 坐标系枚举
///
/// - cartesian2d: 二维的直角坐标系（也称笛卡尔坐标系），通过 xAxisIndex, yAxisIndex指定相应的坐标轴组件
/// - polar: 极坐标系，通过 polarIndex 指定相应的极坐标组件
/// - geo: 使用地理坐标系，通过 geoIndex 指定相应的地理坐标系组件
public enum CoordinateSystem: String, Jsonable {
    case cartesian2d = "cartesian2d"
    case polar = "polar"
    case geo = "geo"
    case parallel = "parallel"
    case calendar = "calendar"
    case none = "none"
    
    public var jsonString: String {
        return self.rawValue.jsonString
    }
}
