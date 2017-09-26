//
//  AxisLabel.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 坐标轴刻度标签的相关设置。
public final class AxisLabel: Displayable, Formatted, Shadowable {
    
    /// 是否显示刻度标签。
    public var show: Bool?
    /// 坐标轴刻度标签的显示间隔，在类目轴中有效。
    public var interval: UInt?
    /// 刻度标签是否朝内，默认朝外。
    public var inside: Bool?
    /// 刻度标签旋转的角度，在类目轴的类目标签显示不下的时候可以通过旋转防止标签之间重叠。
    /// 旋转的角度从 -90 度到 90 度。
    public var rotate: Float?
    /// 刻度标签与轴线之间的距离。
    public var margin: Float?
    /// 刻度标签的内容格式器，支持字符串模板和回调函数两种形式。
    public var formatter: Formatter?
    /// 是否显示最小 tick 的 label。可取值 true, false, null。默认自动判定（即如果标签重叠，不会显示最小 tick 的 label）。
    public var showMinLabel: Bool?
    /// 是否显示最大 tick 的 label。可取值 true, false, null。默认自动判定（即如果标签重叠，不会显示最大 tick 的 label）。
    public var showMaxLabel: Bool?
    /// 刻度标签文字的颜色，默认取 axisLine.lineStyle.color。支持回调函数，格式如下
    ///
    ///     (val: string) => Color
    ///
    /// 参数是标签的文本，返回颜色值，如下示例：
    ///
    ///     textStyle: {
    ///         color: function (value, index) {
    ///             return value >= 0 ? 'green' : 'red';
    ///         }
    ///     }
    public var color: Color?
    /// 文字字体的风格
    public var fontStyle: FontStyle?
    /// 文字字体的粗细
    public var fontWeight: FontWeight?
    /// 文字的字体系列
    public var fontFamily: String?
    /// 文字的字体大小
    public var fontSize: UInt8?
    /// 文字水平对齐方式，默认自动。
    public var align: Align?
    /// 文字垂直对齐方式，默认自动。
    public var verticalAlign: VerticalAlign?
    /// 行高。
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
    public var backgroundColor: Color?
    /// 文字块边框颜色。
    public var borderColor: Color?
    /// 文字块边框宽度。
    public var borderWidth: Float?
    /// 文字块的圆角。
    public var borderRadius: Float? /// FIXME: 支持array?
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
    
    /// 标签与刻度线的距离。
    /// ## 目前只用于仪表图
    public var distance: Float?
    
    public init() { }
}

extension AxisLabel: Enumable {
    public enum Enums {
        case show(Bool), interval(UInt), inside(Bool), rotate(Float), margin(Float), formatter(Formatter), showMinLabel(Bool), showMaxLabel(Bool), color(Color), fontStyle(FontStyle), fontWeight(FontWeight), fontFamily(String), fontSize(UInt8), align(Align), verticalAlign(VerticalAlign), lineHeight(Float), backgroundColor(Color), borderColor(Color), borderWidth(Float), borderRadius(Float), padding(Padding), shadowColor(Color), shadowBlur(Float), shadowOffsetX(Float), shadowOffsetY(Float), width(LengthValue), height(LengthValue), textBorderColor(Color), textBorderWidth(Float), textShadowColor(Color), textShadowBlur(Float), textShadowOffsetX(Float), textShadowOffsetY(Float), rich([String: Jsonable]), distance(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .interval(interval):
                self.interval = interval
            case let .inside(inside):
                self.inside = inside
            case let .rotate(rotate):
                self.rotate = rotate
            case let .margin(margin):
                self.margin = margin
            case let .formatter(formatter):
                self.formatter = formatter
            case let .showMinLabel(showMinLabel):
                self.showMinLabel = showMinLabel
            case let .showMaxLabel(showMaxLabel):
                self.showMaxLabel = showMaxLabel
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
            case let .distance(distance):
                self.distance = distance
            }
        }
    }
}

extension AxisLabel: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["interval"] = interval
        map["inside"] = inside
        map["rotate"] = rotate
        map["margin"] = margin
        map["formatter"] = formatter
        map["showMinLabel"] = showMinLabel
        map["showMaxLabel"] = showMaxLabel
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
        map["distance"] = distance
    }
}
