//
//  Enumable.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 15/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 针对那种只有只读属性或者没有属性的类型
public enum EmptyEnum { }

public protocol Enumable {
    associatedtype ContentEnum
    init(_ elements: Self.ContentEnum...)
}

extension Enumable {
    public init(_ element: Self.ContentEnum) {
        /// 兼容只有一个参数的情况
        self.init(element, element)
    }
}
