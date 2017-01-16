//
//  SECMarkPoint.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECMarkPoint : SECSymbolized, SECAnimatable {
    
    /// 标记的图形。
    public var symbol: SECSymbol?
    /// 标记的大小
    public var symbolSize: Float?
    /// 标记的旋转角度。注意在 markLine 中当 symbol 为 'arrow' 时会忽略 symbolRotate 强制设置为切线的角度。
    public var symbolRotate: Float?
    /// 标记相对于原本位置的偏移。默认情况下，标记会居中置放在数据对应的位置，但是如果 symbol 是自定义的矢量路径或者图片，就有可能不希望 symbol 居中。这时候可以使用该配置项配置 symbol 相对于原本居中的偏移，可以是绝对的像素值，也可以是相对的百分比。
    /// 例如 [0, '50%'] 就是把自己向上移动了一半的位置，在 symbol 图形是气泡的时候可以让图形下端的箭头对准数据点。
    public var symbolOffset: [Float]?
    /// 图形是否不响应和触发鼠标事件，默认为 false，即响应和触发鼠标事件。
    public var silent: Bool?
    /// 标注的文本。
    public var label: Label?
    /// 标注的样式。
    public var itemStyle: SECItemStyle?
    /// 标注的数据数组
    public var data: [Any]?
    /// 是否开启动画。
    public var animation: Bool?
    /// 是否开启动画的阈值，当单个系列显示的图形数量大于这个阈值时会关闭动画。
    public var animationThreshold: Float?
    /// 初始动画的时长，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的初始动画效果：
    ///
    ///     animationDuration: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDuration: SECTime?
    /// 初始动画的缓动效果。不同的缓动效果可以参考
    public var animationEasing: SECAnimation?
    /// 初始动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的初始动画效果。
    ///
    /// 如下示例：
    ///
    ///     animationDuration: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDelay: SECTime?
    /// 数据更新动画的时长。
    /// 支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的更新动画效果：
    ///     animationDurationUpdate: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDurationUpdate: SECTime?
    /// 数据更新动画的缓动效果。
    public var animationEasingUpdate: SECAnimation?
    /// 数据更新动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的更新动画效果。
    /// 如下示例：
    ///
    ///     animationDelayUpdate: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDelayUpdate: SECTime?
    
}

extension SECMarkPoint : SECEnumable {
    public enum Enums {
        case symbol(SECSymbol), symbolSize(Float), symbolRotate(Float), symbolOffset([Float]), silent(Bool), label(Label), itemStyle(SECItemStyle),  data([Any]), animation(Bool), animationThreshold(Float), animationDuration(SECTime), animationEasing(SECAnimation), animationDelay(SECTime), animationDurationUpdate(SECTime), animationEasingUpdate(SECAnimation), animationDelayUpdate(SECTime)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .symbol(symbol):
                self.symbol = symbol
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            case let .symbolRotate(symbolRotate):
                self.symbolRotate = symbolRotate
            case let .symbolOffset(symbolOffset):
                self.symbolOffset = symbolOffset
            case let .silent(silent):
                self.silent = silent
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .data(data):
                self.data = data
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
            }
        }
    }
}

extension SECMarkPoint : SECMappable {
    public func mapping(map: SECMap) {
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["symbolRotate"] = symbolRotate
        map["symbolOffset"] = symbolOffset
        map["silent"] = silent
        map["label"] = label
        map["itemStyle"] = itemStyle
        map["data"] = data
        map["animation"] = animation
        map["animationThreshold"] = animationThreshold
        map["animationDuration"] = animationDuration
        map["animationEasing"] = animationEasing
        map["animationDelay"] = animationDelay
        map["animationDurationUpdate"] = animationDurationUpdate
        map["animationEasingUpdate"] = animationEasingUpdate
        map["animationDelayUpdate"] = animationDelayUpdate
    }
}

extension SECMarkPoint {
    public struct LabelContent : SECDisplayable, SECFormatted, SECTextful {
        
        /// 标签的位置的可选类型
        public enum Position : SECJsonable {
            case xy(Float, Float)
            case xyPercent(Float, Float)
            case top, left, right, bottom, inside, insideLeft, insideTop, insideRight, insideBottom, insideTopLeft, insideBottomLeft, insideTopRight, insideBottomRight
            
            public var jsonString: String {
                switch self {
                case let .xy(x, y):
                    return "[\(x), \(y)]"
                case let .xyPercent(x, y):
                    return "['\(x)%', '\(y)%']"
                case .top:
                    return "\"top\""
                case .left:
                    return "\"left\""
                case .right:
                    return "\"right\""
                case .bottom:
                    return "\"bottom\""
                case .inside:
                    return "\"inside\""
                case .insideLeft:
                    return "\"insideLeft\""
                case .insideRight:
                    return "\"insideRight\""
                case .insideTop:
                    return "\"insideTop\""
                case .insideBottom:
                    return "\"insideBottom\""
                case .insideTopLeft:
                    return "\"insideTopLeft\""
                case .insideBottomLeft:
                    return "\"insideBottomLeft\""
                case .insideTopRight:
                    return "\"insideTopRight\""
                case .insideBottomRight:
                    return "\"insideBottomRight\""
                }
            }
        }
        
        /// 是否显示标签。
        public var show: Bool?
        /// 标签的位置。
        public var position: Position?
        /// 是否对文字进行偏移。默认不偏移。例如：[30, 40] 表示文字在横向上偏移 30，纵向上偏移 40。
        public var offset: [Float]?
        /// 标签内容格式器，支持字符串模板和回调函数两种形式
        public var formatter: SECFormatter?
        /// 标签的字体样式。
        public var textStyle: SECTextStyle?
    }
    
    public struct Label : SECEmphasisable {
        public typealias Style = LabelContent
        public var normal: Style?
        public var emphasis: Style?
    }
}

extension SECMarkPoint.LabelContent : SECEnumable {
    public enum Enums {
        case show(Bool), position(Position), offset([Float]), formatter(SECFormatter), textStyle(SECTextStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .position(position):
                self.position = position
            case let .offset(offset):
                self.offset = offset
            case let .formatter(formatter):
                self.formatter = formatter
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            }
        }
    }
}

extension SECMarkPoint.LabelContent : SECMappable {
    public func mapping(map: SECMap) {
        map["show"] = show
        map["position"] = position
        map["offset"] = offset
        map["formatter"] = formatter
        map["textStyle"] = textStyle
    }
}

extension SECMarkPoint.Label : SECEnumable {
    public enum Enums {
        case normal(Style), emphasis(Style)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .normal(normal):
                self.normal = normal
            case let .emphasis(emphasis):
                self.emphasis = emphasis
            }
        }
    }
}

extension SECMarkPoint.Label : SECMappable {
    public func mapping(map: SECMap) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}
