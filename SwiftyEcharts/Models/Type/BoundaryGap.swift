//
//  BoundaryGap.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 15/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 坐标轴两边留白策略，类目轴和非类目轴的设置和表现不一样。
///
/// - category: 类目轴中 boundaryGap 可以配置为 true 和 false。默认为 true，这时候刻度只是作为分隔线，标签和数据点都会在两个刻度之间的带(band)中间。
/// - notCategory: 非类目轴，包括时间，数值，对数轴，boundaryGap是一个两个值的数组，分别表示数据最小值和最大值的延伸范围，可以直接设置数值或者相对的百分比，在设置 min 和 max 后无效。
///
/// 示例:
///
///         boundaryGap: ['20%', '20%']
public enum BoundaryGap: Jsonable {
    case category(Bool)
    case notCategory(Range)
    
    public var jsonString: String {
        switch self {
        case let .category(enable):
            return "\(enable)"
        case let .notCategory(range):
            return "\(range.jsonString)"
        }
    }
}

/// 保证该类可以通过 Bool 的类型进行创建
extension BoundaryGap: ExpressibleByBooleanLiteral {
    public typealias BooleanLiteralType = Bool
    public init(booleanLiteral value: Bool) {
        self = BoundaryGap.category(value)
    }
}

/// 保证该类可以通过常量数组进行创建
extension BoundaryGap: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: LengthValue...) {
        let range: Range = Range(elements)
        self = BoundaryGap.notCategory(range)
    }
}
