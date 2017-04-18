//
//  MarkDataType.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 16/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 特殊的标注类型，用于标注最大值最小值等。
///
/// - min: 最小值
/// - max: 最大值
/// - average: 平均值
public enum MarkDataType: String, Jsonable {
    case min = "min"
    case max = "max"
    case average = "average"
    
    public var jsonString: String {
        return self.rawValue.jsonString
    }
}
