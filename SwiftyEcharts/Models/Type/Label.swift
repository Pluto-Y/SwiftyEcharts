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
    public func mapping(_ map: Mapper) {
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

public final class LabelStyle: Displayable, Formatted, Colorful, Borderable, Shadowable {
    /// 是否显示 label。
    public var show: Bool?
    /// 可选的配置方式：
    ///
    /// - auto： 完全自动决定。
    /// - left： 贴左边界放置。 当 timline.orient 为 'vertical' 时有效。
    /// - right：当 timline.orient 为 'vertical' 时有效。 贴右边界放置。
    /// - top： 贴上边界放置。 当 timline.orient 为 'horizontal' 时有效。
    /// - bottom： 贴下边界放置。 当 timline.orient 为 'horizontal' 时有效。
    /// - number： 指定某个数值时，表示 label 和轴的距离。为 0 时则和坐标轴重合，可以为正负值，决定 label 在坐标轴的哪一边。
    public var position: Position?
    /// label 的间隔。当指定为数值时，例如指定为 2，则每隔两个显示一个 label。
    public var interval: UInt8?
    /// label 的旋转角度。正值表示逆时针旋转。
    public var rotate: Float?
    /// 刻度标签的内容格式器，支持字符串模板和回调函数两种形式。
    ///
    /// 示例:
    ///
    ///     // 使用字符串模板，模板变量为刻度默认标签 {value}
    ///     formatter: '{value} kg'
    ///
    ///     // 使用函数模板，函数参数分别为刻度数值（类目），刻度的索引
    ///     formatter: function (value, index) {
    ///         // 格式化成月/日，只在第一个刻度显示年份
    ///         var date = new Date(value);
    ///         var texts = [(date.getMonth() + 1), date.getDate()];
    ///         if (index === 0) {
    ///             texts.unshift(date.getYear());
    ///         }
    ///         return texts.join('/');
    ///     }
    public var formatter: Formatter?
    /// 文字的颜色。
    public var color: Color?
    /// 文字字体的风格
    public var fontStyle: FontStyle?
    /// 文字字体的粗细
    public var fontWeight: FontWeight?
    /// 文字的字体系列
    ///
    /// 还可以是 'serif' , 'monospace', 'Arial', 'Courier New', 'Microsoft YaHei', ...
    public var fontFamily: String?
    /// 文字的字体大小
    public var fontSize: UInt?
    /// 文字水平对齐方式，默认自动。
    ///
    /// 可选：
    ///
    /// 'left'
    /// 'center'
    /// 'right'
    ///
    /// rich 中如果没有设置 align，则会取父层级的 align。例如：
    ///
    ///     {
    ///         align: right,
    ///         rich: {
    ///             a: {
    ///                 // 没有设置 `align`，则 `align` 为 right
    ///             }
    ///         }
    ///     }
    public var align: Align?
    /// 文字垂直对齐方式，默认自动。
    ///
    /// 可选：
    ///
    /// 'top'
    /// 'middle'
    /// 'bottom'
    ///
    /// rich 中如果没有设置 verticalAlign，则会取父层级的 verticalAlign。例如：
    ///
    ///     {
    ///         verticalAlign: bottom,
    ///         rich: {
    ///             a: {
    ///                 // 没有设置 `verticalAlign`，则 `verticalAlign` 为 bottom
    ///             }
    ///         }
    ///     }
    public var verticalAlign: VerticalAlign?
    /// 行高。
    ///
    /// rich 中如果没有设置 lineHeight，则会取父层级的 lineHeight。例如：
    ///
    ///     {
    ///         lineHeight: 56,
    ///         rich: {
    ///             a: {
    ///                 // 没有设置 `lineHeight`，则 `lineHeight` 为 56
    ///             }
    ///         }
    ///     }
    public var lineHeight: Float?
    /// 文字块背景色。
    ///
    /// 可以是直接的颜色值，例如：'#123234', 'red', rgba(0,23,11,0.3)'。
    ///
    /// 可以支持使用图片，例如：
    ///
    ///     backgroundColor: {
    ///         image: 'xxx/xxx.png'
    ///         // 这里可以是图片的 URL，
    ///         // 或者图片的 dataURI，
    ///         // 或者 HTMLImageElement 对象，
    ///         // 或者 HTMLCanvasElement 对象。
    ///     }
    ///
    /// 当使用图片的时候，可以使用 width 或 height 指定高宽，也可以不指定自适应。
    public var backgroundColor: Color? /// FIXME: 看下怎么处理
    /// 文字块边框颜色。
    public var borderColor: Color?
    /// 文字块边框宽度。
    public var borderWidth: Float?
    /// 文字块的圆角。
    public var borderRadius: Float?
    /// 文字块的内边距。例如：
    ///
    /// - padding: [3, 4, 5, 6]：表示 [上, 右, 下, 左] 的边距。
    /// - padding: 4：表示 padding: [4, 4, 4, 4]。
    /// - padding: [3, 4]：表示 padding: [3, 4, 3, 4]。
    ///
    /// 注意，文字块的 width 和 height 指定的是内容高宽，不包含 padding。
    public var padding: Padding?
    /// 文字块的背景阴影颜色。
    public var shadowColor: Color?
    /// 文字块的背景阴影长度。
    public var shadowBlur: Float?
    /// 文字块的背景阴影 X 偏移。
    public var shadowOffsetX: Float?
    /// 文字块的背景阴影 Y 偏移。
    public var shadowOffsetY: Float?
    /// 文字块的宽度。一般不用指定，不指定则自动是文字的宽度。在想做表格项或者使用图片（参见 backgroundColor）时，可能会使用它。
    ///
    /// 注意，文字块的 width 和 height 指定的是内容高宽，不包含 padding。
    ///
    /// width 也可以是百分比字符串，如 '100%'。表示的是所在文本块的 contentWidth（即不包含文本块的 padding）的百分之多少。之所以以 contentWidth 做基数，因为每个文本片段只能基于 content box 布局。如果以 outerWidth 做基数，则百分比的计算在实用中不具有意义，可能会超出。
    ///
    /// 注意，如果不定义 rich 属性，则不能指定 width 和 height。
    public var width: LengthValue?
    /// 文字块的高度。一般不用指定，不指定则自动是文字的高度。在使用图片（参见 backgroundColor）时，可能会使用它。
    ///
    /// 注意，文字块的 width 和 height 指定的是内容高宽，不包含 padding。
    ///
    /// 注意，如果不定义 rich 属性，则不能指定 width 和 height。
    public var height: LengthValue?
    /// 文字本身的描边颜色。
    public var textBorderColor: Color?
    /// 文字本身的描边宽度。
    public var textBorderWidth: Float?
    /// 文字本身的阴影颜色。
    public var textShadowColor: Color?
    /// 文字本身的阴影长度。
    public var textShadowBlur: Float?
    /// 文字本身的阴影 X 偏移。
    public var textShadowOffsetX: Float?
    /// 文字本身的阴影 Y 偏移。
    public var textShadowOffsetY: Float?
    /// 在 rich 里面，可以自定义富文本样式。利用富文本样式，可以在标签中做出非常丰富的效果。
    ///
    /// 例如：
    ///
    ///     label: {
    ///         normal: {
    ///
    ///             // 在文本中，可以对部分文本采用 rich 中定义样式。
    ///             // 这里需要在文本中使用标记符号：
    ///             // `{styleName|text content text content}` 标记样式名。
    ///             // 注意，换行仍是使用 '\n'。
    ///             formatter: [
    ///                 '{a|这段文本采用样式a}',
    ///                 '{b|这段文本采用样式b}这段用默认样式{x|这段用样式x}'
    ///             ].join('\n'),
    ///
    ///             rich: {
    ///                 a: {
    ///                     color: 'red',
    ///                     lineHeight: 10
    ///                 },
    ///                 b: {
    ///                     backgroundColor: {
    ///                         image: 'xxx/xxx.jpg'
    ///                     },
    ///                     height: 40
    ///                 },
    ///                 x: {
    ///                     fontSize: 18,
    ///                     fontFamily: 'Microsoft YaHei',
    ///                     borderColor: '#449933',
    ///                     borderRadius: 4
    ///                 },
    ///                 ...
    ///             }
    ///         }
    ///     }
    /// 详情参见教程：富文本标签
    public var rich: [String: Jsonable]?
}

extension LabelStyle: Enumable {
    public enum Enums {
        case position(Position), show(Bool), interval(UInt8), rotate(Float), formatter(Formatter), color(Color), fontStyle(FontStyle), fontWeight(FontWeight), fontFamily(String), fontSize(UInt), align(Align), verticalAlign(VerticalAlign), lineHeight(Float), backgroundColor(Color), borderColor(Color), borderWidth(Float), borderRadius(Float), padding(Padding), shadowColor(Color), shadowBlur(Float), shadowOffsetX(Float), shadowOffsetY(Float), width(LengthValue), height(LengthValue), textBorderColor(Color), textBorderWidth(Float), textShadowColor(Color), textShadowBlur(Float), textShadowOffsetX(Float), textShadowOffsetY(Float), rich([String: Jsonable])
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .position(position):
                self.position = position
            case let .show(show):
                self.show = show
            case let .interval(interval):
                self.interval = interval
            case let .rotate(rotate):
                self.rotate = rotate
            case let .formatter(formatter):
                self.formatter = formatter
            case let .color(color):
                self.color = color
            case let .fontStyle(fontStyle):
                self.fontStyle = fontStyle
            case let .fontWeight(fontWeight):
                self.fontWeight = fontWeight
            case let .fontFamily(fontFamily):
                self.fontFamily = fontFamily
            case let .fontSize(fontSize):
                self.fontSize = fontSize
            case let .align(align):
                self.align = align
            case let .verticalAlign(verticalAlign):
                self.verticalAlign = verticalAlign
            case let .lineHeight(lineHeight):
                self.lineHeight = lineHeight
            case let .backgroundColor(backgroundColor):
                self.backgroundColor = backgroundColor
            case let .borderColor(borderColor):
                self.borderColor = borderColor
            case let .borderWidth(borderWidth):
                self.borderWidth = borderWidth
            case let .borderRadius(borderRadius):
                self.borderRadius = borderRadius
            case let .padding(padding):
                self.padding = padding
            case let .shadowColor(shadowColor):
                self.shadowColor = shadowColor
            case let .shadowBlur(shadowBlur):
                self.shadowBlur = shadowBlur
            case let .shadowOffsetX(shadowOffsetX):
                self.shadowOffsetX = shadowOffsetX
            case let .shadowOffsetY(shadowOffsetY):
                self.shadowOffsetY = shadowOffsetY
            case let .width(width):
                self.width = width
            case let .height(height):
                self.height = height
            case let .textBorderColor(textBorderColor):
                self.textBorderColor = textBorderColor
            case let .textBorderWidth(textBorderWidth):
                self.textBorderWidth = textBorderWidth
            case let .textShadowColor(textShadowColor):
                self.textShadowColor = textShadowColor
            case let .textShadowBlur(textShadowBlur):
                self.textShadowBlur = textShadowBlur
            case let .textShadowOffsetX(textShadowOffsetX):
                self.textShadowOffsetX = textShadowOffsetX
            case let .textShadowOffsetY(textShadowOffsetY):
                self.textShadowOffsetY = textShadowOffsetY
            case let .rich(rich):
                self.rich = rich
            }
        }
    }
}

extension LabelStyle: Mappable {
    public func mapping(_ map: Mapper) {
        map["position"] = position
        map["show"] = show
        map["interval"] = interval
        map["rotate"] = rotate
        map["formatter"] = formatter
        map["color"] = color
        map["fontStyle"] = fontStyle
        map["fontWeight"] = fontWeight
        map["fontFamily"] = fontFamily
        map["fontSize"] = fontSize
        map["align"] = align
        map["verticalAlign"] = verticalAlign
        map["lineHeight"] = lineHeight
        map["backgroundColor"] = backgroundColor
        map["borderColor"] = borderColor
        map["borderWidth"] = borderWidth
        map["borderRadius"] = borderRadius
        map["padding"] = padding
        map["shadowColor"] = shadowColor
        map["shadowBlur"] = shadowBlur
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["width"] = width
        map["height"] = height
        map["textBorderColor"] = textBorderColor
        map["textBorderWidth"] = textBorderWidth
        map["textShadowColor"] = textShadowColor
        map["textShadowBlur"] = textShadowBlur
        map["textShadowOffsetX"] = textShadowOffsetX
        map["textShadowOffsetY"] = textShadowOffsetY
        map["rich"] = rich
    }
}

/// 文本标签。有 normal 和 emphasis 两个状态，normal 是文本正常的样式，emphasis 是文本高亮的样式，比如鼠标悬浮或者图例联动高亮的时候会使用 emphasis 作为文本的样式。
public final class EmphasisLabel: Emphasisable {
    public typealias Style = LabelStyle
    
    public var normal: Style?
    public var emphasis: Style?
}

extension EmphasisLabel: Enumable {
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

extension EmphasisLabel: Mappable {
    public func mapping(_ map: Mapper) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}

public final class FormattedLabelStyle: Formatted {
    
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
    public func mapping(_ map: Mapper) {
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
    public func mapping(_ map: Mapper) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}
