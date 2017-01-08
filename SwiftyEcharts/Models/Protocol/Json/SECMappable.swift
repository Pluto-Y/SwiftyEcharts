//
//  SECMappable.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 04/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

private var mapDicKey: Void?
public protocol SECMappable: SECJsonable {
    func mapping(inout map: [String: SECJsonable])
}

extension SECMappable {

    public var jsonString: String {
        var mapDic = [String: SECJsonable]()
        mapping(&mapDic)
        return mapDic.jsonString
    }
    
}
