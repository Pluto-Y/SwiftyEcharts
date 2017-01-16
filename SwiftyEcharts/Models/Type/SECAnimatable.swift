//
//  SECAnimatable.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 04/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 动画的时间类型
///
/// - number: 时长，直接传递
/// - function: 通过函数返回
/// 
/// 其中回调函数，例如 animationDelay 可以通过每个数据返回不同的 delay 时间实现更戏剧的更新动画效果：
///     
///     animationDelay: function (idx) {
///         // 越往后的数据延迟越大
///         return idx * 100;
///     }
public enum SECTime: SECJsonable {
    case number(Float)
    case function(String)
    
    public var jsonString: String {
        switch self {
        case let .number(time):
            return "\(time)"
        case let .function(f):
            if let endIndex = f.rangeOfString("(")?.startIndex, let starIndex = f.rangeOfString("function")?.endIndex {
                let functionName = f.substringToIndex(endIndex).substringFromIndex(starIndex).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
                SECJsMap.add(f)
                return "\"\(functionName)\""
            }
            return "null"
        }
    }
}

public protocol SECAnimatable {
    
    /// 是否开启动画。
    var animation: Bool? { get set }
    /// 是否开启动画的阈值，当单个系列显示的图形数量大于这个阈值时会关闭动画。
    var animationThreshold: Float?  { get set }
    /// 初始动画的时长，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的初始动画效果：
    ///
    ///     animationDuration: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    var animationDuration: Float? { get set }
//    var animationEasing: // FIXME: 具体如何实现？
    var animationDelay: Float? { get set }
    var animationDurationUpdate: Float? { get set }
//    var animationEasingUpdate: Float// FIXME: 具体如何实现？
    var animationDelayUpdate: Float? { get set }
}

extension SECAnimatable {
    
}
