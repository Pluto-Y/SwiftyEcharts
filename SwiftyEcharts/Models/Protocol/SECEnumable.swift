//
//  SECEnumable.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 15/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol SECEnumable {
    associatedtype ContentEnum
    init(_ elements: [Self.ContentEnum])
}
