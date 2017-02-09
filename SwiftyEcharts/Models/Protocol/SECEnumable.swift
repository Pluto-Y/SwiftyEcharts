//
//  SECEnumable.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 15/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol SECEnumable {
    associatedtype ContentEnum
    init(_ elements: Self.ContentEnum...)
}

extension SECEnumable {
    public init(_ element: Self.ContentEnum) {
        /// 兼容只有一个参数的情况
        self.init(element, element)
    }
}
