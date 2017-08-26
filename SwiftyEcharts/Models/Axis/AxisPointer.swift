//
//  AxisPointer.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 26/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 坐标轴指示器配置项
public final class AxisPointer: Line, Animatable {
    
    /// 十字准星指示器样式
    public final class CrossStyle: Shadowable, Colorful{
        /// 线的颜色
        public var color: Color?
        /// 线宽
        public var width: Float?
        /// 线的类型
        public var type: LineType?
        
        public var shadowBlur: Float?
        public var shadowColor: Color?
        public var shadowOffsetX: Float?
        public var shadowOffsetY: Float?
        
        public var textStyle: TextStyle?
        
        public init() { }
    }
    
    /// 指示器类型
    ///
    /// - line: 直线指示器
    /// - cross: 十字准星指示器
    /// - shadow: 阴影指示器
    public enum `Type`: String, Jsonable {
        case line = "line", cross = "cross", shadow = "shadow", none = "none"
        
        public var jsonString: String {
            return self.rawValue.jsonString
        }
    }
    
    /// 指示器的坐标轴
    public enum Axis: String, Jsonable {
        case x = "x"
        case y = "y"
        case radius = "radius"
        case angle = "angle"
        case auto = "auto"
        
        public var jsonString: String {
            return self.rawValue.jsonString
        }
    }
    
    /// 指示器类型
    public var type: Type?
    /// 指示器的坐标轴。
    ///
    /// 默认情况，坐标系会自动选择显示哪个轴的 axisPointer（默认取类目轴或者时间轴）。
    ///
    /// 可以是 'x', 'y', 'radius', 'angle'。默认取类目轴或者时间轴。
    public var axis: Axis?
    /// 是否开启动画，默认开启。
    public var animation: Bool?
    /// 是否开启动画的阈值，当单个系列显示的图形数量大于这个阈值时会关闭动画。
    public var animationThreshold: Float?
    /// 初始动画的时长。
    public var animationDuration: Time?
    /// 初始动画的缓动效果。
    public var animationEasing: EasingFunction?
    /// 初始动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的初始动画效果。
    /// 如下示例：
    ///
    ///     animationDelayUpdate: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDelay: Time?
    /// 数据更新动画的时长。
    public var animationDurationUpdate: Time?
    /// 数据更新动画的缓动效果。
    public var animationEasingUpdate: EasingFunction?
    /// 数据更新动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的更新动画效果。
    /// 如下示例：
    ///
    ///         animationDelayUpdate: function (idx) {
    ///             // 越往后的数据延迟越大
    ///             return idx * 100;
    ///         }
    public var animationDelayUpdate: Time?
    /// axisPointer.type 为 'line' 时有效。
    public var lineStyle: LineStyle?
    /// axisPointer.type 为 'cross' 时有效。
    public var crossStyle: CrossStyle?
    /// axisPointer.type 为 'shadow' 时有效。
    public var shadowStyle: ShadowStyle?
    
    public init() { }
}

extension AxisPointer.CrossStyle: Enumable {
    public enum Enums {
        case color(Color), width(Float), type(LineType), shadowBlur(Float), shadowColor(Color), shadowOffsetX(Float), shadowOffsetY(Float), textStyle(TextStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .color(color):
                self.color = color
            case let .width(width):
                self.width = width
            case let .type(type):
                self.type = type
            case let .shadowBlur(blur):
                self.shadowBlur = blur
            case let .shadowColor(color):
                self.shadowColor = color
            case let .shadowOffsetX(x):
                self.shadowOffsetX = x
            case let .shadowOffsetY(y):
                self.shadowOffsetY = y
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            }
        }
    }
}

extension AxisPointer.CrossStyle: Mappable {
    public func mapping(map: Mapper) {
        map["color"] = color
        map["width"] = width
        map["type"] = type
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["textStyle"] = textStyle
    }
}

extension AxisPointer: Enumable {
    public enum Enums {
        case type(Type), axis(Axis), animation(Bool), animationThreshold(Float), animationDuration(Time), animationEasing(EasingFunction), animationDelay(Time), animationDurationUpdate(Time), animationEasingUpdate(EasingFunction), animationDelayUpdate(Time), lineStyle(LineStyle), crossStyle(CrossStyle), shadowStyle(ShadowStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .type(type):
                self.type = type
            case let .axis(axis):
                self.axis = axis
            case let .animation(animation):
                self.animation = animation
            case let .animationThreshold(animationThreshold):
                self.animationThreshold = animationThreshold
            case let .animationDuration(animationDuration):
                self.animationDuration = animationDuration
            case let .animationEasing(animationEasing):
                self.animationEasing = animationEasing
            case let .animationDelay(animationDelay):
                self.animationDelay = animationDelay
            case let .animationDurationUpdate(animationDurationUpdate):
                self.animationDurationUpdate = animationDurationUpdate
            case let .animationEasingUpdate(animationEasingUpdate):
                self.animationEasingUpdate = animationEasingUpdate
            case let .animationDelayUpdate(animationDelayUpdate):
                self.animationDelayUpdate = animationDelayUpdate
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            case let .crossStyle(crossStyle):
                self.crossStyle = crossStyle
            case let .shadowStyle(shadowStyle):
                self.shadowStyle = shadowStyle
            }
        }
    }
}

extension AxisPointer: Mappable {
    public func mapping(map: Mapper) {
        map["type"] = type
        map["axis"] = axis
        map["animation"] = animation
        map["animationThreshold"] = animationThreshold
        map["animationDuration"] = animationDuration
        map["animationEasing"] = animationEasing
        map["animationDelay"] = animationDelay
        map["animationDurationUpdate"] = animationDurationUpdate
        map["animationEasingUpdate"] = animationEasingUpdate
        map["animationDelayUpdate"] = animationDelayUpdate
        map["lineStyle"] = lineStyle
        map["crossStyle"] = crossStyle
        map["shadowStyle"] = shadowStyle
    }
}
