//
//  Percent.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 15/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 用来标示百分比的情况， 通常可以通过用 数值 + % 形式来初始化
/// 并且可以通过 Percent.precision 来进行全局定义
public final class Percent {
    public static var precision: Int = 2
    fileprivate let value: Double
    
    public init(_ value: Double) {
        self.value = value
    }
}

extension Percent: Jsonable {
    public var jsonString: String {
        let formatStr = String(format: "%%.%df", Percent.precision)
        return "\"\(String(format: formatStr, value))%\""
    }
}

extension Percent: LengthValue {
    
}

// 用自定义操作符 % 将 Int, Float 以及 Double 转换成 Percent 类型
postfix operator %

public postfix func %(value: Double) -> Percent {
    let percent: Percent = Percent(value)
    return percent
}

public postfix func %(value: Float) -> Percent {
    let percent: Percent = Percent(Double(value))
    return percent
}

public postfix func %(value: Int) -> Percent {
    let percent: Percent = Percent(Double(value))
    return percent
}
