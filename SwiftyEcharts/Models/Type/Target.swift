//
//  Target.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 12/04/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 指定窗口打开主标题超链接。
public enum Target: Jsonable, CustomStringConvertible {
    
    ///  当前窗口打开
    case tself
    /// 新窗口打开
    case tblank
    
    public var description: String {
        switch self {
        case .tself:
            return "self"
        case .tblank:
            return "blank"
        }
    }
}
