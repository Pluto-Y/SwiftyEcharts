//
//  Mapper.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//


public final class Mapper {
    public static var ignoreNil: Bool = true
    public var mapDic: [String: Jsonable?] = {
        let dic = [String: Jsonable?]()
        return dic
    }()
    
    public subscript(key: String) -> Jsonable? {
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

extension Mapper: Jsonable {
    public var jsonString: String {
        if Mapper.ignoreNil {
            let tmpDic = mapDic
            for (key, val) in tmpDic {
                if val == nil {
                    mapDic.removeValue(forKey: key)
                }
            }
        }
        return mapDic.jsonString
    }
}
