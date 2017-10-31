//
//  GraphOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public final class GraphOptions {
    
    // MARK: Les Miserables
    /// 地址: http://echarts.baidu.com/demo.html#graph-circular-layout
    static func graphCircularLayoutOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 力引导布局
    /// 地址: http://echarts.baidu.com/demo.html#graph-force
    static func graphForceOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 力引导布局
    /// 地址: http://echarts.baidu.com/demo.html#graph-force2
    static func graphForce2Option() -> Option {
        let createNodes: (Int) -> [Jsonable] = { count in
            var nodes: [Jsonable] = []
            for i in 0..<count {
                nodes.append([["id": i]])
            }
            return nodes
        }
        
        let createEdges: (Int) -> [[Jsonable]] = { count in
            var edges: [[Jsonable]] = []
            if count == 2 {
                return [[0, 1]]
            }
            
            for i in 0..<count {
                edges.append([i, (i + 1) % count])
            }
            return edges
        }
        
        var datas: [[String: Jsonable]] = []
        for i in 0..<16 {
            datas.append([
                "nodes": createNodes(i+2),
                "edges": createEdges(i+2)
                ])
        }
        
        var series: [Serie] = []
        var idx = 0
        for item in datas {
            series.append(GraphSerie(
                .layout(.force),
                .animation(false),
                .data(item["nodes"] as! [Jsonable]),
                .left(.value(((idx % 4) * 25)%)),
                .top(.value((Int(idx / 4) * 25)%)),
                .width(25%),
                .height(25%),
                .force(GraphSerie.Force(
                    .repulsion(60),
                    .edgeLength(2)
                    )),
                .edges((item["edges"] as! [[Jsonable]]).map { e in
                        return GraphSerie.Link(
                            .source(e[0]),
                            .target(e[1])
                        )
                    })
                ))
            
            idx += 1
        }
        
        return Option(
            .series(series)
        )
    }
    
    // MARK: 笛卡尔坐标系上的 Graph
    /// 地址: http://echarts.baidu.com/demo.html#graph-grid
    static func graphGridOption() -> Option {
        let axisData = ["周一","周二","周三","很长很长的周四","周五","周六","周日"]
        var data: [Float] = []
        for i in 0..<axisData.count {
            data.append(Float(arc4random_uniform(1000)) * Float(i + 1))
        }
        var links: [GraphSerie.Link] = []
        for i in 0..<axisData.count {
            links.append(GraphSerie.Link(
                .source(i),
                .target(i+1)
                ))
        }
        links.removeLast()
        
        return Option(
            .title(Title(
                .text("笛卡尔坐标系上的 Graph")
                )),
            .tooltip(Tooltip()),
            .xAxis(Axis(
                .type(.category),
                .boundaryGap(false),
                .data(axisData.map { $0 as Jsonable })
                )),
            .yAxis(Axis(
                .type(.value)
                )),
            .series([
                GraphSerie(
                    .layout(.none),
                    .coordinateSystem(.cartesian2d),
                    .symbolSize(40),
                    .label(EmphasisLabel(
                        .normal(LabelStyle(
                            .show(true)
                            ))
                        )),
                    .edgeSymbols([.circle, .arrow]),
                    .edgeSymbolSize([4, 10]),
                    .data(data.map { $0 as Jsonable }),
                    .links(links),
                    .lineStyle(EmphasisLineStyle(
                        .normal(LineStyle(
                            .color(.hexColor("#2f4554"))
                            ))
                        ))
                )
                ])
        )
    }
    
    // MARK: Graph Life Expectancy
    /// 地址: http://echarts.baidu.com/demo.html#graph-life-expectancy
    static func graphLifeExpectancyOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: NPM Dependencies
    /// 地址: http://echarts.baidu.com/demo.html#graph-npm
    static func graphNpmOption() -> Option {
        guard let jsonUrl = Bundle.main.url(forResource: "npmdepgraph.min10", withExtension: "json"), let jsonData = try? Data(contentsOf: jsonUrl), let jsonObj = try? JSONSerialization.jsonObject(with: jsonData, options: []) else {
            return Option()
        }
        
        let json = jsonObj as! NSDictionary
        
        var data: [GraphSerie.Data] = []
        (json["nodes"] as! NSArray).enumerateObjects({ (nodeObj, _, _) in
            let nodeDic = nodeObj as! NSDictionary
            let d = GraphSerie.Data()
            if let x = nodeDic["x"] as? Float {
                d.x = x
            }
            if let y = nodeDic["y"] as? Float {
                d.y = y
            }
            if let name = nodeDic["label"] as? String {
                d.name = name
            }
            if let size = nodeDic["size"] as? Float {
                d.symbolSize = FunctionOrFloatOrPair.value(size/2.0)
            }
            if let color = nodeDic["color"] as? String {
                d.itemStyle = ItemStyle(
                    .normal(CommonItemStyleContent(
                        .color(Color.hexColor(color))
                        ))
                )
            }
            data.append(d)
        })
        var edges: [GraphSerie.Link] = []
        (json["edges"] as! NSArray).enumerateObjects({ (edgeObj, _, _) in
            let edgeDic = edgeObj as! NSDictionary
            let e = GraphSerie.Link()
            if let source = edgeDic["sourceID"] as? String {
                e.source = source
            }
            if let target = edgeDic["targetID"] as? String {
                e.target = target
            }
            edges.append(e)
        })
        
        return Option(
            .title(Title(
                .text("NPM Dependencies")
                )),
            .animationDurationUpdate(1500),
            .animationEasingUpdate(.quinticInOut),
            .series([
                GraphSerie(
                    .layout(.none),
                    .data(data.map { $0 as Jsonable }),
                    .edges(edges),
                    .label(EmphasisLabel(
                        .emphasis(LabelStyle(
                            .position(.right),
                            .show(true)
                            ))
                        )),
                    .roam(true),
                    .focusNodeAdjacency(true),
                    .lineStyle(EmphasisLineStyle(
                        .normal(LineStyle(
                            .width(0.5),
                            .curveness(0.3),
                            .opacity(0.7)
                            ))
                        ))
                )
                ])
        )
    }
    
    // MARK: Graph 简单示例
    /// 地址: http://echarts.baidu.com/demo.html#graph-simple
    static func graphSimpleOption() -> Option {
        return Option(
            .title(Title(
                .text("Graph 简单示例")
                )),
            .tooltip(Tooltip()),
            .animationDurationUpdate(1500),
            .animationEasingUpdate(.quinticInOut),
            .series([
                GraphSerie(
                    .layout(.none),
                    .symbolSize(50),
                    .roam(true),
                    .label(EmphasisLabel(
                        .normal(LabelStyle(
                            .show(true)
                            ))
                        )),
                    .edgeSymbols([.circle, .arrow]),
                    .edgeSymbolSize([4, 10]),
                    .edgeLabel(EmphasisLabel(
                        .normal(LabelStyle(
                            .fontSize(20)
                            ))
                        )),
                    .data([
                        GraphSerie.Data(
                            .name("节点1"),
                            .x(300),
                            .y(300)
                        ),
                        GraphSerie.Data(
                            .name("节点2"),
                            .x(800),
                            .y(300)
                        ),
                        GraphSerie.Data(
                            .name("节点3"),
                            .x(550),
                            .y(100)
                        ),
                        GraphSerie.Data(
                            .name("节点4"),
                            .x(550),
                            .y(500)
                        ),
                        ]),
                    .links([
                        GraphSerie.Link(
                            .source(0),
                            .target(1),
                            .symbolSize([5, 20]),
                            .label(EmphasisLabel(
                                .normal(LabelStyle(
                                    .show(true)
                                    ))
                                )),
                            .lineStyle(EmphasisLineStyle(
                                .normal(LineStyle(
                                    .width(5),
                                    .curveness(0.2)
                                    ))
                                ))
                        ),
                        GraphSerie.Link(
                            .source("节点2"),
                            .target("节点1"),
                            .label(EmphasisLabel(
                                .normal(LabelStyle(
                                    .show(true)
                                    ))
                                )),
                            .lineStyle(EmphasisLineStyle(
                                .normal(LineStyle(
                                    .curveness(0.2)
                                    ))
                                ))
                        ),
                        GraphSerie.Link(
                            .source("节点1"),
                            .target("节点3")
                        ),
                        GraphSerie.Link(
                            .source("节点2"),
                            .target("节点3")
                        ),
                        GraphSerie.Link(
                            .source("节点2"),
                            .target("节点4")
                        ),
                        GraphSerie.Link(
                            .source("节点1"),
                            .target("节点4")
                        )
                        ]),
                    .lineStyle(EmphasisLineStyle(
                        .normal(LineStyle(
                            .opacity(0.9),
                            .width(2),
                            .curveness(0)
                            ))
                        ))
                )
                ])
        )
    }
    
    // MARK: Graph Webkit Dep
    /// 地址: http://echarts.baidu.com/demo.html#graph-webkit-dep
    static func graphWebkitDepOption() -> Option {
        guard let jsonUrl = Bundle.main.url(forResource: "webkit-dep", withExtension: "json"), let jsonData = try? Data(contentsOf: jsonUrl), let jsonObj = try? JSONSerialization.jsonObject(with: jsonData, options: []) else {
            return Option()
        }
        
        let webkitDep = jsonObj as! NSDictionary
        
        var data: [Jsonable] = []
        (webkitDep["nodes"] as! NSArray).enumerateObjects({ (nodeObj, idx, _) in
            let nodeDic = NSMutableDictionary(dictionary: (nodeObj as! NSDictionary))
            nodeDic.setValue(idx, forKey: "id")
            data.append(nodeDic)
        })
        
        var categories: [GraphSerie.Category] = []
        (webkitDep["categories"] as! NSArray).enumerateObjects({ (categoryObj, _, _) in
            let categoryDic = categoryObj as! NSDictionary
            let category = GraphSerie.Category()
            if let name = categoryDic["name"] {
                category.name = (name as! String)
            }
            categories.append(category)
        })
        
        var edges: [GraphSerie.Link] = []
        (webkitDep["links"] as! NSArray).enumerateObjects({ (linkObj, _, _) in
            let linkDic = linkObj as! NSDictionary
            let link = GraphSerie.Link()
            link.target = (linkDic["target"] as! Jsonable)
            link.source = (linkDic["source"] as! Jsonable)
            edges.append(link)
        })
        
        return Option(
            .legend(Legend(
                .data(["HTMLElement", "WebGL", "SVG", "CSS", "Other"])
                )),
            .series([
                GraphSerie(
                    .layout(.force),
                    .animation(false),
                    .label(EmphasisLabel(
                        .normal(LabelStyle(
                            .position(.right),
                            .formatter(.string("{b}"))
                            ))
                        )),
                    .draggable(true),
                    .data(data),
                    .categories(categories),
                    .force(GraphSerie.Force(
                        .edgeLength(5),
                        .repulsion(20),
                        .gravity(0.2)
                        )),
                    .edges(edges)
                )
                ])
        )
    }
    
    // MARK: Les Miserables
    /// 地址: http://echarts.baidu.com/demo.html#graph
    static func graphOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Calendar Graph
    /// 地址: http://echarts.baidu.com/demo.html#calendar-graph
    static func calendarGraphOption() -> Option {
        let graphData: [Jsonable] = [
            [
                1485878400000,
                260
            ],
            [
                1486137600000,
                200
            ],
            [
                1486569600000,
                279
            ],
            [
                1486915200000,
                847
            ],
            [
                1487347200000,
                241
            ],
            [
                1487779200000 + 3600 * 24 * 1000 * 15,
                411
            ],
            [
                1488124800000 + 3600 * 24 * 1000 * 23,
                985
            ]
        ]
        
        var links: [GraphSerie.Link] = []
        for i in 0..<graphData.count {
            links.append(GraphSerie.Link(
                .source(i),
                .target(i+1)
                ))
        }
        links.removeLast()
        
        return Option(
            .tooltip(Tooltip()),
            .calendar(Calendar(
                .top(.middle),
                .left(.center),
                .cellSize(40),
                .yearLabel(YearLabel(
                    .margin(50),
                    .fontSize(30)
                    )),
                .dayLabel(DayLabel(
                    .firstDay(1),
                    .nameMap("cn")
                    )),
                .monthLabel(MonthLabel(
                    .nameMap("cn"),
                    .margin(15),
                    .fontSize(20),
                    .color("#999")
                    )),
                .range(["2017-02", "2017-03-31"])
                )),
            .visualMap(PiecewiseVisualMap(
                .min(0),
                .max(1000),
                .left(.center),
                .bottom(20),
                .inRange([
                    "color": ["#5291FF", "#C7DBFF"]
                    ]),
                .seriesIndex([1]),
                .orient(.horizontal)
                )),
            .series([
                GraphSerie(
                    .edgeSymbols([.none, .arrow]),
                    .coordinateSystem(.calendar),
                    .links(links),
                    .symbolSize(15),
                    .calendarIndex(0),
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
                            .color(.yellow),
                            .shadowBlur(9),
                            .shadowOffsetX(1.5),
                            .shadowOffsetY(3),
                            .shadowColor(.hexColor("#555"))
                            ))
                        )),
                    .lineStyle(EmphasisLineStyle(
                        .normal(LineStyle(
                            .color("#D10E00"),
                            .width(1),
                            .opacity(1)
                            ))
                        )),
                    .data(graphData),
                    .z(20)
                ),
                HeatmapSerie(
                    .coordinateSystem(.calendar),
                    .data(HeatmapOptions.getVirtualData(2017))
                )
                ])
        )
    }

}
