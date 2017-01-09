//
//  SECMap.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//


public final class SECMap {
    public static var ignoreNil: Bool = false
    public var mapDic: [String: SECJsonable?] = {
        let dic = [String: SECJsonable?]()
        return dic
    }()
    
    public subscript(key: String) -> SECJsonable? {
        get {
            if let value = mapDic[key] {
                return value
            }
            return nil
        }
        set {
            mapDic[key] = newValue
        }
    }
}

extension SECMap: SECJsonable {
    public var jsonString: String {
        if SECMap.ignoreNil {
            let tmpDic = mapDic
            for (key, val) in tmpDic {
                if val == nil {
                    mapDic.removeValueForKey(key)
                }
            }
        }
        return mapDic.jsonString
    }
}
