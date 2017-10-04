//
//  Animatable.swift
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
public enum Time: Jsonable {
    case number(Float)
    case function(Function)
    
    public var jsonString: String {
        switch self {
        case let .number(time):
            return time.jsonString
        case let .function(f):
            return f.jsonString
        }
    }
}

extension Time: ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
    
    public init(floatLiteral value: Float) {
        self = Time.number(value)
    }
    
    public init(integerLiteral value: Int) {
        self = .number(Float(value))
    }
    
}

extension Time: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self = .function(Function(value))
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self = .function(Function(value))
    }
    
    public init(unicodeScalarLiteral value: String) {
        self = .function(Function(value))
    }

}

/// 默认支持的动画执行类型
/// 具体详情可以查看一下地址进行对比
/// http://echarts.baidu.com/gallery/editor.html?c=line-easing
public enum EasingFunction: String, Jsonable {
    case linear = "linear"
    case quadraticIn = "quadraticIn"
    case quadraticOut = "quadraticOut"
    case quadraticInOut = "quadraticInOut"
    case cubicIn = "cubicIn"
    case cubicOut = "cubicOut"
    case cubicInOut = "cubicInOut"
    case quarticIn = "quarticIn"
    case quarticOut = "quarticOut"
    case quarticInOut = "quarticInOut"
    case quinticIn = "quinticIn"
    case quinticOut = "quinticOut"
    case quinticInOut =  "quinticInOut"
    case sinusoidalIn = "sinusoidalIn"
    case sinusoidalOut = "sinusoidalOut"
    case sinusoidalInOut = "sinusoidalInOut"
    case exponentialIn = "exponentialIn"
    case exponentialOut = "exponentialOut"
    case exponentialInOut = "exponentialInOut"
    case circularIn = "circularIn"
    case circularOut = "circularOut"
    case circularInOut = "circularInOut"
    case elasticIn = "elasticIn"
    case elasticOut = "elasticOut"
    case elasticInOut = "elasticInOut"
    case backIn = "backIn"
    case backOut = "backOut"
    case backInOut = "backInOut"
    case bounceIn = "bounceIn"
    case bounceOut = "bounceOut"
    case bounceInOut = "bounceInOut"
    
    public var jsonString: String {
        return self.rawValue.jsonString
    }
}

/// 动画的接口，针对那些需要动画的组件而封装的接口
public protocol Animatable {
    
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
    var animationDuration: Time? { get set }
    /// 初始动画的缓动效果。不同的缓动效果可以参考
    var animationEasing: EasingFunction? { get set }
    /// 初始动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的初始动画效果。
    /// 
    /// 如下示例：
    ///
    ///     animationDuration: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    var animationDelay: Time? { get set }
    /// 数据更新动画的时长。
    /// 支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的更新动画效果：
    ///     animationDurationUpdate: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    var animationDurationUpdate: Time? { get set }
    /// 数据更新动画的缓动效果。
    var animationEasingUpdate: EasingFunction? { get set }
    /// 数据更新动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的更新动画效果。
    /// 如下示例：
    ///
    ///     animationDelayUpdate: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    var animationDelayUpdate: Time? { get set }
}
