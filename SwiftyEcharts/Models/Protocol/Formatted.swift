//
//  Formatted.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 01/12/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//

/// 内容格式化器：支持字符串模板和回调函数两种形式
///
/// ## string: 字符串模板。
/// - 模板变量有 {a}, {b}，{c}，{d}，{e}，分别表示系列名，数据名，数据值等。 在 trigger 为 'axis' 的时候，会有多个系列的数据，此时可以通过 {a0}, {a1}, {a2} 这种后面加索引的方式表示系列的索引。 不同图表类型下的 {a}，{b}，{c}，{d} 含义不一样。 其中变量{a}, {b}, {c}, {d}在不同图表类型下代表数据含义
/// - 折线（区域）图、柱状（条形）图、K线图 : {a}（系列名称），{b}（类目值），{c}（数值）, {d}（无）
/// - 散点图（气泡）图 : {a}（系列名称），{b}（数据名称），{c}（数值数组）, {d}（无）
/// - 地图 : {a}（系列名称），{b}（区域名称），{c}（合并数值）, {d}（无）
/// - 饼图、仪表盘、漏斗图: {a}（系列名称），{b}（数据项名称），{c}（数值）, {d}（百分比）
///
/// 更多其它图表模板变量的含义可以见相应的图表的 label.normal.formatter 配置项。
///
///     '{b0}: {c0}<br />{b1}: {c1}'
/// ## function:回调函数 支持js函数，只需通过字符串来指定声明函数即可
public typealias Formatter = FunctionOrString

public protocol Formatted {
    var formatter: Formatter? { get set }
}
