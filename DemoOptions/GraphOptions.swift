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
        // TODO: 添加实现
        return Option(
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
        // TODO: 添加实现
        return Option(
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
        guard let jsonUrl = NSBundle.mainBundle().URLForResource("webkit-dep", withExtension: "json"), let jsonData = NSData(contentsOfURL: jsonUrl), let jsonObj = try? NSJSONSerialization.JSONObjectWithData(jsonData, options: []) else {
            return Option()
        }
        
        let webkitDep = jsonObj as! NSDictionary
        
        var data: [Jsonable] = []
        (webkitDep["nodes"] as! NSArray).enumerateObjectsUsingBlock { (nodeObj, idx, _) in
            let nodeDic = NSMutableDictionary(dictionary: (nodeObj as! NSDictionary))
            nodeDic.setValue(idx, forKey: "id")
            data.append(nodeDic)
        }
        
        var categories: [GraphSerie.Category] = []
        (webkitDep["categories"] as! NSArray).enumerateObjectsUsingBlock { (categoryObj, _, _) in
            let categoryDic = categoryObj as! NSDictionary
            let category = GraphSerie.Category()
            if let name = categoryDic["name"] {
                category.name = (name as! String)
            }
            categories.append(category)
        }
        
        var edges: [GraphSerie.Link] = []
        (webkitDep["links"] as! NSArray).enumerateObjectsUsingBlock { (linkObj, _, _) in
            let linkDic = linkObj as! NSDictionary
            let link = GraphSerie.Link()
            link.target = (linkDic["target"] as! Jsonable)
            link.source = (linkDic["source"] as! Jsonable)
            edges.append(link)
        }
        
        
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

}
