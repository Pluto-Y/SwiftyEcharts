//
//  SelectedMode.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 10/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 图例选择的模式，控制是否可以通过点击图例改变系列的显示状态。默认开启图例选择，可以设成 false 关闭。
///
/// 除此之外也可以设成 'single' 或者 'multiple' 使用单选或者多选模式。
public enum SelectedMode: String, Jsonable {
    case enable = "true"
    case disable = "false"
    case single = "single"
    case multiple = "multiple"
    
    public var jsonString: String {
        switch self {
        case .enable, .disable:
            return "\(self.rawValue)"
        case .single, .multiple:
            return self.rawValue.jsonString
        }
    }
    
}

extension SelectedMode: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        if value {
            self = .enable
        } else {
            self = .disable
        }
    }
}
