//
//  SECMappable.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 04/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol SECMappable {
    var mapDic: [String: SECJsonable] { get set }
    func mapping()
}

extension SECMappable {
    public func mappingJson() -> String {
        return mapDic.toJson()
    }
}

public func > (value: Any?, inout dicValue: SECJsonable) {
    if let v = value where v is SECJsonable {
        dicValue = v as! SECJsonable
    }
}
