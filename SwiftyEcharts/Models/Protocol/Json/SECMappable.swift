//
//  SECMappable.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 04/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol SECMappable: SECJsonable {
    var mapDic: [String: SECJsonable] { get set }
    func mapping()
}

extension SECMappable {
    public var jsonString: String {
        mapping()
        return mapDic.jsonString
    }
}

public func > (value: Any?, inout dicValue: SECJsonable) {
    if let v = value where v is SECJsonable {
        dicValue = v as! SECJsonable
    }
}
