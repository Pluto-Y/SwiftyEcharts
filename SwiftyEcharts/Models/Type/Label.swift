//
//  Label.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 文本标签。
public final class Label: Displayable, Formatted, Shadowable, Textful, Borderable {
    /// 是否显示文本标签。
    public var show: Bool?
    /// 文本标签中数值的小数点精度。默认根据当前轴的值自动判断。也可以指定如 2 表示保留两位小数。
    public var precision: UInt8?
    /// 文本标签文字的格式化器。
    ///
    /// 如果为 string，可以是例如：formatter: 'some text {value} some text，其中 {value} 会被自动替换为轴的值。
    ///
    /// 如果为 function，可以是例如：
    ///
    /// 参数：
    ///
    /// {Object} params: 含有：
    ///
    /// {Object} params.value: 轴当前值，如果 axis.type 为 'category' 时，其值为 axis.data 里的数值。如果 axis.type 为 'time'，其值为时间戳。
    ///
    /// {Array.<Object>} params.seriesData: 一个数组，是当前 axisPointer 最近的点的信息，每项内容为
    ///
    ///     {
    ///         componentType: 'series',
    ///         // 系列类型
    ///         seriesType: string,
    ///         // 系列在传入的 option.series 中的 index
    ///         seriesIndex: number,
    ///         // 系列名称
    ///         seriesName: string,
    ///         // 数据名，类目名
    ///         name: string,
    ///         // 数据在传入的 data 数组中的 index
    ///         dataIndex: number,
    ///         // 传入的原始数据项
    ///         data: Object,
    ///         // 传入的数据值
    ///         value: number|Array,
    ///         // 数据图形的颜色
    ///         color: string,
    ///     }
    ///
    /// 每项内容还包括轴的信息：
    ///     
    ///     {
    ///         axisDim: 'x', // 'x', 'y', 'angle', 'radius', 'single'
    ///         axisId: 'xxx',
    ///         axisName: 'xxx',
    ///         axisIndex: 3,
    ///         axisValue: 121, // 当前 axisPointer 对应的 value。
    ///         axisValueLabel: '文本'
    ///     }
    ///     
    /// 返回值：
    ///     
    /// 显示的 string。
    ///     
    /// 例如：
    ///     formatter: function (params) {
    ///         // 假设此轴的 type 为 'time'。
    ///         return 'some text' + echarts.format.formatTime(params.value);
    ///     }
    public var formatter: Formatter?
    /// label 距离轴的距离。
    public var margin: Float?
    /// 文本的样式
    public var textStyle: TextStyle?
    /// axisPointer内边距，单位px，默认各方向内边距为5，接受数组分别设定上右下左边距。
    ///
    /// 使用示例：
    ///
    ///     // 设置内边距为 5
    ///     padding: 5
    ///     // 设置上下的内边距为 5，左右的内边距为 10
    ///     padding: [5, 10]
    ///     // 分别设置四个方向的内边距
    ///     padding: [
    ///         5,  // 上
    ///         10, // 右
    ///         5,  // 下
    ///         10, // 左
    ///     ]
    public var padding: Padding?
    /// 文本标签的背景颜色
    public var backgroundColor: Color?
    /// 文本标签的边框颜色。
    public var borderColor: Color?
    /// 文本标签的边框宽度。
    public var borderWidth: Float?
    /// 图形阴影的模糊大小。该属性配合 shadowColor,shadowOffsetX, shadowOffsetY 一起设置图形的阴影效果。
    ///
    /// 示例：
    ///
    ///     {
    ///         shadowColor: 'rgba(0, 0, 0, 0.5)',
    ///         shadowBlur: 10
    ///     }
    public var shadowBlur: Float?
    /// 阴影颜色。支持的格式同color。
    public var shadowColor: Color?
    /// 阴影水平方向上的偏移距离。
    public var shadowOffsetX: Float?
    /// 阴影垂直方向上的偏移距离。
    public var shadowOffsetY: Float?
}

extension Label: Enumable {
    public enum Enums {
        case show(Bool), precision(UInt8), formatter(Formatter), margin(Float), textStyle(TextStyle), padding(Padding), backgroundColor(Color), borderColor(Color), borderWidth(Float), shadowBlur(Float), shadowColor(Color), shadowOffsetX(Float), shadowOffsetY(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .precision(precision):
                self.precision = precision
            case let .formatter(formatter):
                self.formatter = formatter
            case let .margin(margin):
                self.margin = margin
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            case let .padding(padding):
                self.padding = padding
            case let .backgroundColor(backgroundColor):
                self.backgroundColor = backgroundColor
            case let .borderColor(borderColor):
                self.borderColor = borderColor
            case let .borderWidth(borderWidth):
                self.borderWidth = borderWidth
            case let .shadowBlur(shadowBlur):
                self.shadowBlur = shadowBlur
            case let .shadowColor(shadowColor):
                self.shadowColor = shadowColor
            case let .shadowOffsetX(shadowOffsetX):
                self.shadowOffsetX = shadowOffsetX
            case let .shadowOffsetY(shadowOffsetY):
                self.shadowOffsetY = shadowOffsetY
            }
        }
    }
}

extension Label: Mappable {
    public func mapping(map: Mapper) {
        map["show"] = show
        map["precision"] = precision
        map["formatter"] = formatter
        map["margin"] = margin
        map["textStyle"] = textStyle
        map["padding"] = padding
        map["backgroundColor"] = backgroundColor
        map["borderColor"] = borderColor
        map["borderWidth"] = borderWidth
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
    }
}

public protocol LabelStyle: Displayable, Textful{
    
    var position: Position? { get set }
}

public final class FormattedLabelStyle: LabelStyle, Formatted {
    
    public var show: Bool?
    public var position: Position?
    public var formatter: Formatter?
    public var offset: Point?
    public var textStyle: TextStyle?
    
    public init() { }
    
}

extension FormattedLabelStyle: Enumable {
    public enum Enums {
        case show(Bool), position(Position), formatter(Formatter), offset(Point), textStyle(TextStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .position(position):
                self.position = position
            case let .formatter(formatter):
                self.formatter = formatter
            case let .offset(offset):
                self.offset = offset
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            }
        }
    }
}

extension FormattedLabelStyle: Mappable {
    public func mapping(map: Mapper) {
        map["show"] = show
        map["position"] = position
        map["formatter"] = formatter
        map["offset"] = offset
        map["textStyle"] = textStyle
    }
}

public final class FormattedLabel: Emphasisable {
    public typealias Style = FormattedLabelStyle
    
    public var normal: Style?
    public var emphasis: Style?
    
    public init() {}
    
}

public typealias EmphasisFormattedLabel = FormattedLabel

extension FormattedLabel: Enumable {
    public enum Enums {
        case normal(Style), emphasis(Style)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
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

extension FormattedLabel: Mappable {
    public func mapping(map: Mapper) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}
