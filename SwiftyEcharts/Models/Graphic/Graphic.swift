//
//  Graphic.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// setOption 时指定本次对该图形元素的操作行为
///
/// 参见例子：
///
/// http://echarts.baidu.com/gallery/editor.html?c=doc-example/graphic-bounding
///
/// - merge: 如果已有元素，则新的配置项和已有的设定进行 merge。如果没有则新建
/// - replace: 如果已有元素，删除之，新建元素替代之
/// - remove: 删除元素
public enum GraphicAction: String, Jsonable {
    case merge = "merge"
    case replace = "replace"
    case remove = "remove"
    
    public var jsonString: String {
        return self.rawValue.jsonString
    }
}

/// 决定此图形元素在定位时，对自身的包围盒计算方式
///
/// - all: （默认） 表示用自身以及子节点整体的经过 transform 后的包围盒进行定位。 这种方式易于使整体都限制在父元素范围中。
/// - raw: 表示仅仅用自身（不包括子节点）的没经过 tranform 的包围盒进行定位。 这种方式易于内容超出父元素范围的定位方式。
public enum GraphicBounding: String, Jsonable {
    case all = "all"
    case raw = "raw"
    
    public var jsonString: String {
        return self.rawValue.jsonString
    }
}

/// graphic 是原生图形元素组件。
///
/// 该接口定义了一些 `Graphic` 实体类所需的一些通用变量
///
/// 可以支持的图形元素包括：
///
/// image, text, circle, sector, ring, polygon, polyline, rect, line, bezierCurve, arc, group,
///
/// 下面示例中，使用图形元素做了水印，和文本块：
///
/// http://echarts.baidu.com/gallery/editor.html?c=line-graphic
///
/// 下面示例中，使用隐藏的图形元素实现了拖拽：
///
/// http://echarts.baidu.com/gallery/editor.html?c=line-draggable
///
/// graphic 设置介绍
///
/// 只配一个图形元素时的简写方法：
///
///     myChart.setOption({
///         ...,
///         graphic: {
///             type: 'image',
///             ...
///         }
///     });
///
/// 配多个图形元素：
///
///     myChart.setOption({
///         ...,
///         graphic: [
///         { // 一个图形元素，类型是 image。
///         type: 'image',
///         ...
///         },
///         { // 一个图形元素，类型是 text，指定了 id。
///         type: 'text',
///         id: 'text1',
///         ...
///         },
///         { // 一个图形元素，类型是 group，可以嵌套子节点。
///         type: 'group',
///         children: [
///         {
///         type: 'rect',
///         id: 'rect1',
///         ...
///         },
///         {
///         type: 'image',
///         ...
///         },
///         ...
///         ]
///         }
///         ...
///         ]
///     });
///
/// 使用 setOption 来删除或更换（替代）已有的图形元素：
///
///     myChart.setOption({
///         ...,
///         graphic: [
///         { // 删除上例中定义的 'text1' 元素。
///         id: 'text1',
///         $action: 'remove',
///         ...
///         },
///         { // 将上例中定义的 'rect1' 元素换成 circle。
///         // 注意尽管 'rect1' 在一个 group 中，但这里并不需要顾忌层级，用id指定就可以了。
///         id: 'rect1',
///         $action: 'replace',
///         type: 'circle',
///         ...
///         }
///         ]
///     });
///
/// 注意，如果没有指定 id，第二次 setOption 时会按照元素在 option 中出现的顺序和已有的图形元素进行匹配。这有时会产生不易理解的效果。 所以，一般来说，更新 elements 时推荐使用 id 进行准确的指定，而非省略 id。
/// 
/// 图形元素设置介绍
///
/// 介绍每个图形元素的配置。不同类型的图形元素的设置有这些共性：
///
///     {
///         // id 用于在更新图形元素时指定更新哪个图形元素，如果不需要用可以忽略。
///         id: 'xxx',
///         
///         // 这个字段在第一次设置时不能忽略，取值见上方『支持的图形元素』。
///         type: 'image',
///         
///         // 下面的各个属性如果不需要设置都可以忽略，忽略则取默认值。
///         
///         // 指定本次 setOption 对此图形元素进行的操作。默认是 'merge'，还可以 'replace' 或 'remove'。
///         $action: 'replace',
///         
///         // 这是四个相对于父元素的定位属性，每个属性可取『像素值』或者『百分比』或者 'center'/'middle'。
///         left: 10,
///         // right: 10,
///         top: 'center',
///         // bottom: '10%',
///         
///         shape: {
///             // 定位、形状相关的设置，如 x, y, cx, cy, width, height, r, points 等。
///             // 注意，如果设置了 left/right/top/bottom，这里的定位用的 x/y/cx/cy 会失效。
///         },
///         
///         style: {
///             // 样式相关的设置，如 fill, stroke, lineWidth, shadowBlur 等。
///         },
///         
///         // 表示 z 高度，从而指定了图形元素的覆盖关系。
///         z: 10,
///         // 表示不响应事件。
///         silent: true,
///         // 表示节点不显示
///         invisible: false,
///         // 设置是否整体限制在父节点范围内。可选值：'raw', 'all'。
///         bouding: 'raw',
///         // 是否可以被拖拽。
///         draggable: false,
///         // 事件的监听器，还可以是 onmousemove, ondrag 等。支持的事件参见下。
///         onclick: function () {...}
///     }
/// 
/// 图形元素的事件
///
/// 支持这些事件配置： onclick, onmouseover, onmouseout, onmousemove, onmousewheel, onmousedown, onmouseup, ondrag, ondragstart, ondragend, ondragenter, ondragleave, ondragover, ondrop。
/// 
/// 图形元素的层级关系
///
/// 只有 group 元素可以有子节点，从而以该 group 元素为根的元素树可以共同定位（共同移动）。
/// 
/// 图形元素的基本形状设置
///
/// 每个图形元素本身有自己的图形基本的位置和尺寸设置，例如：
///
///     {
///         type: 'rect',
///         shape: {
///             x: 10,
///             y: 10,
///             width: 100,
///             height: 200
///         }
///     },
///     {
///         type: 'circle',
///         shape: {
///             cx: 20,
///             cy: 30,
///             r: 100
///         }
///     },
///     {
///         type: 'image',
///         style: {
///             image: 'http://xxx.xxx.xxx/a.png',
///             x: 100,
///             y: 200,
///             width: 230,
///             height: 400
///         }
///     },
///     {
///         type: 'text',
///         style: {
///             text: 'This text',
///             x: 100,
///             y: 200
///         }
///         
///     }
/// 
/// 图形元素的定位和 transfrom
///
/// 除此以外，可以以 transform 的方式对图形进行平移、旋转、缩放，
///
///     {
///         type: 'rect',
///         position: [100, 200], // 平移，默认值为 [0, 0]。
///         scale: [2, 4], // 缩放，默认值为 [1, 1]。表示缩放的倍数。
///         rotation: Math.PI / 4, // 旋转，默认值为 0。表示旋转的弧度值。正值表示逆时针旋转。
///         origin: [10, 20], // 旋转和缩放的中心点，默认值为 [0, 0]。
///         shape: {
///             // ...
///         }
///     }
/// 每个图形元素在父节点的坐标系中进行 transform，也就是说父子节点的 transform 能『叠加』。
///
/// - 每个图形元素进行 transform 顺序是：
/// - 平移 [-el.origin[0], -el.origin[1]]。
///     - 根据 el.scale 缩放。
///     - 根据 el.rotation 旋转。
///     - 根据 el.origin 平移。
///     - 根据 el.position 平移。
/// - 也就是说先缩放旋转后平移，这样平移不会影响缩放旋转的 origin。
/// 
/// 图形元素相对定位
///
/// 以上两者是基本的绝对定位，除此之外，在实际应用中，容器尺寸常常是不确定甚至动态变化的，所以需要提供相对定位的机制。graphic 组件使用 left / right / top / bottom / width / height 提供了相对定位的机制。
///
/// 例如：
///
///     { // 将图片定位到最下方的中间：
///         type: 'image',
///         left: 'center', // 水平定位到中间
///         bottom: '10%',  // 定位到距离下边界 10% 处
///         style: {
///             image: 'http://xxx.xxx.xxx/a.png',
///             width: 45,
///             height: 45
///         }
///     },
///     { // 将旋转过的 group 整体定位右下角：
///         type: 'group',
///         right: 0,  // 定位到右下角
///         bottom: 0, // 定位到右下角
///         rotation: Math.PI / 4,
///         children: [
///             {
///                 type: 'rect',
///                 left: 'center', // 相对父元素居中
///                 top: 'middle',  // 相对父元素居中
///                 shape: {
///                     width: 190,
///                     height: 90
///                 },
///                 style: {
///                     fill: '#fff',
///                     stroke: '#999',
///                     lineWidth: 2,
///                     shadowBlur: 8,
///                     shadowOffsetX: 3,
///                     shadowOffsetY: 3,
///                     shadowColor: 'rgba(0,0,0,0.3)'
///                 }
///             },
///             {
///                 type: 'text',
///                 left: 'center', // 相对父元素居中
///                 top: 'middle',  // 相对父元素居中
///                 style: {
///                     fill: '#777',
///                     text: [
///                         'This is text',
///                         '这是一段文字',
///                         'Print some text'
///                     ].join('\n'),
///                     font: '14px Microsoft YaHei'
///                 }
///             }
///         ]
///     }
///
/// 注意，可以用 bounding 来设置是否整体限制在父节点范围内。
/// 
/// 下面是详细配置。
///
/// graphic.elements[i]
///
/// 里面是所有图形元素的集合。
///
/// 注意：graphic 的标准写法是：
///
///     {
///         graphic: {
///             elements: [
///             {type: 'rect', ...}, {type: 'circle', ...}, ...
///             ]
///         }
///     }
///
/// 但是我们常常可以用简写：
///
///     {
///         graphic: {
///             type: 'rect',
///             ...
///         }
/// }
///
/// 或者：
///
///     {
///         graphic: [
///         {type: 'rect', ...}, {type: 'circle', ...}, ...
///         ]
///     }
public protocol Graphic: Zable, Mappable {
    
    /// `Graphic` 的类型
    var type: GraphicType { get }
    /// id 用于在更新或删除图形元素时指定更新哪个图形元素，如果不需要用可以忽略。
    var id: String? { get set }
    /// setOption 时指定本次对该图形元素的操作行为
    var action: GraphicAction? { get set }
    /// 描述怎么根据父元素进行定位。
    ///
    ///『父元素』是指：如果是顶层元素，父元素是 echarts 图表容器。如果是 group 的子元素，父元素就是 group 元素。
    ///
    /// 值的类型可以是：
    ///
    /// - number：表示像素值。
    /// - 百分比值：如 '33%'，用父元素的高和此百分比计算出最终值。
    /// - 'center'：表示自动居中。
    ///
    /// left 和 right 只有一个可以生效。
    ///
    /// 如果指定 left 或 right，则 shape 里的 x、cx 等定位属性不再生效。
    var left: Position? { get set }
    /// 描述怎么根据父元素进行定位。
    ///
    ///『父元素』是指：如果是顶层元素，父元素是 echarts 图表容器。如果是 group 的子元素，父元素就是 group 元素。
    ///
    /// 值的类型可以是：
    ///
    /// - number：表示像素值。
    /// - 百分比值：如 '33%'，用父元素的高和此百分比计算出最终值。
    /// - 'center'：表示自动居中。
    ///
    /// left 和 right 只有一个可以生效。
    ///
    /// 如果指定 left 或 right，则 shape 里的 x、cx 等定位属性不再生效。
    var right: Position? { get set }
    /// 描述怎么根据父元素进行定位。
    ///
    /// 『父元素』是指：如果是顶层元素，父元素是 echarts 图表容器。如果是 group 的子元素，父元素就是 group 元素。
    ///
    /// 值的类型可以是：
    ///
    /// - number：表示像素值。
    /// - 百分比值：如 '33%'，用父元素的宽和此百分比计算出最终值。
    /// - 'middle'：表示自动居中。
    ///
    /// top 和 bottom 只有一个可以生效。
    ///
    /// 如果指定 top 或 bottom，则 shape 里的 y、cy 等定位属性不再生效。
    var top: Position? { get set }
    /// /// 描述怎么根据父元素进行定位。
    ///
    /// 『父元素』是指：如果是顶层元素，父元素是 echarts 图表容器。如果是 group 的子元素，父元素就是 group 元素。
    ///
    /// 值的类型可以是：
    ///
    /// - number：表示像素值。
    /// - 百分比值：如 '33%'，用父元素的宽和此百分比计算出最终值。
    /// - 'middle'：表示自动居中。
    ///
    /// top 和 bottom 只有一个可以生效。
    ///
    /// 如果指定 top 或 bottom，则 shape 里的 y、cy 等定位属性不再生效。
    var bottom: Position? { get set }
    /// 决定此图形元素在定位时，对自身的包围盒计算方式。
    /// 
    /// 参见例子：
    ///
    /// http://echarts.baidu.com/gallery/editor.html?c=doc-example/graphic-bounding
    var bounding: GraphicBounding? { get set }
    /// 是否不响应鼠标以及触摸事件。
    var silent: Bool? { get set }
    /// 鼠标悬浮时鼠标的样式是什么。同 CSS 的 cursor。
    var cursor: String? { get set }
    /// 节点是否可见。
    var invisible: Bool? { get set }
    /// 图形元素是否可以被拖拽。
    var draggable: Bool? { get set }
    /// 是否渐进式渲染。当图形元素过多时才使用。
    var progressive: Bool? { get set }
    // TODO: 添加14个方法， 暂时还没添加
}


// MARK: - Action
/// 将指定的节点以及其所有邻接节点高亮。
public final class GraphFocusNodeAdjacencyAction: EchartsAction {
    public var type: EchartsActionType {
        return .focusNodeAdjacency
    }
    
    /// 使用 seriesId 或 seriesIndex 或 seriesName 来定位 series.
    public var seriesId: String?
    public var seriesIndex: Int?
    public var seriesName: String?
    /// 使用 dataIndex 来定位节点。
    public var dataIndex: Int?
}

extension GraphFocusNodeAdjacencyAction: Enumable {
    public enum Enums {
        case seriesId(String), seriesIndex(Int), seriesName(String), dataIndex(Int)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .seriesId(seriesId):
                self.seriesId = seriesId
            case let .seriesIndex(seriesIndex):
                self.seriesIndex = seriesIndex
            case let .seriesName(seriesName):
                self.seriesName = seriesName
            case let .dataIndex(dataIndex):
                self.dataIndex = dataIndex
            }
        }
    }
}

extension GraphFocusNodeAdjacencyAction: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["seriesId"] = seriesId
        map["seriesIndex"] = seriesIndex
        map["seriesName"] = seriesName
        map["dataIndex"] = dataIndex
    }
}

/// 取消指定的节点以及其所有邻接节点高亮。
public final class GraphUnfocusNodeAdjacencyAction: EchartsAction {
    public var type: EchartsActionType {
        return .unfocusNodeAdjacency
    }
    
    /// 使用 seriesId 或 seriesIndex 或 seriesName 来定位 series.
    public var seriesId: String?
    public var seriesIndex: Int?
    public var seriesName: String?
}

extension GraphUnfocusNodeAdjacencyAction: Enumable {
    public enum Enums {
        case seriesId(String), seriesIndex(Int), seriesName(String)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .seriesId(seriesId):
                self.seriesId = seriesId
            case let .seriesIndex(seriesIndex):
                self.seriesIndex = seriesIndex
            case let .seriesName(seriesName):
                self.seriesName = seriesName
            }
        }
    }
}

extension GraphUnfocusNodeAdjacencyAction: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["seriesId"] = seriesId
        map["seriesIndex"] = seriesIndex
        map["seriesName"] = seriesName
    }
}
