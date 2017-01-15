//
//  SECEnumable.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 15/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol SECEnumable {
    associatedtype SECContentEnum
    init(_ elements: [Self.SECContentEnum])
}
