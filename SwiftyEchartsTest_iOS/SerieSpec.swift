//
//  SerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 22/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class SerieSpec: QuickSpec {
    override func spec() {
        describe("For SerieType") {
            it(" needs to check the jsonString") {
                let lineString = "line"
                let barString = "bar"
                let pieString = "pie"
                let scatterString = "scatter"
                let effectScatterString = "effectScatter"
                let radarString = "radar"
                let treemapString = "treemap"
                let boxplotString = "boxplot"
                let candlestickString = "candlestick"
                let heatmapString = "heatmap"
                let mapString = "map"
                let parallelString = "parallel"
                let linesString = "lines"
                let graphString = "graph"
                let sankeyString = "sankey"
                let funnelString = "funnel"
                let gaugeString = "gauge"
                let pictorialBarString = "pictorialBar"
                let themeRiverString = "themeRiver"
                let customString = "custom"
                
                let lineSerieType = SerieType.line
                let barSerieType = SerieType.bar
                let pieSerieType = SerieType.pie
                let scatterSerieType = SerieType.scatter
                let effectScatterSerieType = SerieType.effectScatter
                let radarSerieType = SerieType.radar
                let treemapSerieType = SerieType.treemap
                let boxplotSerieType = SerieType.boxplot
                let candlestickSerieType = SerieType.candlestick
                let heatmapSerieType = SerieType.heatmap
                let mapSerieType = SerieType.map
                let parallelSerieType = SerieType.parallel
                let linesSerieType = SerieType.lines
                let graphSerieType = SerieType.graph
                let sankeySerieType = SerieType.sankey
                let funnelSerieType = SerieType.funnel
                let gaugeSerieType = SerieType.gauge
                let pictorialBarSerieType = SerieType.pictorialBar
                let themeRiverSerieType = SerieType.themeRiver
                let customSerieType = SerieType.custom
                
                expect(lineSerieType.jsonString).to(equal(lineString.jsonString))
                expect(barSerieType.jsonString).to(equal(barString.jsonString))
                expect(pieSerieType.jsonString).to(equal(pieString.jsonString))
                expect(scatterSerieType.jsonString).to(equal(scatterString.jsonString))
                expect(effectScatterSerieType.jsonString).to(equal(effectScatterString.jsonString))
                expect(radarSerieType.jsonString).to(equal(radarString.jsonString))
                expect(treemapSerieType.jsonString).to(equal(treemapString.jsonString))
                expect(boxplotSerieType.jsonString).to(equal(boxplotString.jsonString))
                expect(candlestickSerieType.jsonString).to(equal(candlestickString.jsonString))
                expect(heatmapSerieType.jsonString).to(equal(heatmapString.jsonString))
                expect(mapSerieType.jsonString).to(equal(mapString.jsonString))
                expect(parallelSerieType.jsonString).to(equal(parallelString.jsonString))
                expect(linesSerieType.jsonString).to(equal(linesString.jsonString))
                expect(graphSerieType.jsonString).to(equal(graphString.jsonString))
                expect(sankeySerieType.jsonString).to(equal(sankeyString.jsonString))
                expect(funnelSerieType.jsonString).to(equal(funnelString.jsonString))
                expect(gaugeSerieType.jsonString).to(equal(gaugeString.jsonString))
                expect(pictorialBarSerieType.jsonString).to(equal(pictorialBarString.jsonString))
                expect(themeRiverSerieType.jsonString).to(equal(themeRiverString.jsonString))
                expect(customSerieType.jsonString).to(equal(customString.jsonString))
            }
        }
    }
}
