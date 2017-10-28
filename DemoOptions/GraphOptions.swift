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
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Graph Webkit Dep
    /// 地址: http://echarts.baidu.com/demo.html#graph-webkit-dep
    static func graphWebkitDepOption() -> Option {
        // TODO: 添加实现
        return Option(
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
