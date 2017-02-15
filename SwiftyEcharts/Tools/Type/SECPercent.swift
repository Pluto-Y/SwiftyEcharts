//
//  SECPercent.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 15/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 用来标示百分比的情况， 通常可以通过用 数值 + % 形式来初始化
/// 并且可以通过 Percent.precision 来进行全局定义
public struct SECPercent {
    public static var precision: Int = 2
    private let value: Double
    
    public init(_ value: Double) {
        self.value = value
    }
}

extension SECPercent : SECJsonable {
    public var jsonString: String {
        let formatStr = String(format: "%%.%df", SECPercent.precision)
        return "\"\(String(format: formatStr, value))%\""
    }
}

extension SECPercent : SECLength {
    
}

// 用自定义操作符 % 将 Int, Float 以及 Double 转换成 Percent 类型
postfix operator % { }

public postfix func %(value: Double) -> SECPercent {
    let percent: SECPercent = SECPercent(value)
    return percent
}

public postfix func %(value: Float) -> SECPercent {
    let percent: SECPercent = SECPercent(Double(value))
    return percent
}

public postfix func %(value: Int) -> SECPercent {
    let percent: SECPercent = SECPercent(Double(value))
    return percent
}
