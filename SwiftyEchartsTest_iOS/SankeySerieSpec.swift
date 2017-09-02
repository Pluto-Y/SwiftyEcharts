//
//  SankeySerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 07/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class SankeySerieSpec: QuickSpec {
    override func spec() {
        let nameDataValue = "dataNameValue"
        let valueDataValue: Float = 200.0
        let itemStyleDataValue = ItemStyle(
            .emphasis(CommonItemStyleContent(
                .borderColor(Color.red),
                .shadowBlur(200.0285),
                .shadowOffsetX(0.526)
                )),
            .normal(CommonItemStyleContent(
                .opacity(0.500000)
                ))
        )
        let labelDataValue = EmphasisLabel(
            .normal(LabelStyle(
                .show(false),
                .position(Position.inside)
                ))
        )
        
        let data = SankeySerie.Data()
        data.name = nameDataValue
        data.value = valueDataValue
        data.itemStyle = itemStyleDataValue
        data.label = labelDataValue
        
        describe("For SankeySerie.Data") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameDataValue,
                    "value": valueDataValue,
                    "itemStyle": itemStyleDataValue,
                    "label": labelDataValue
                ]
                
                expect(data.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let dataByEnums = SankeySerie.Data(
                    .name(nameDataValue),
                    .value(valueDataValue),
                    .itemStyle(itemStyleDataValue),
                    .label(labelDataValue)
                )
                
                expect(dataByEnums.jsonString).to(equal(data.jsonString))
            }
        }
        
        let sourceLinkValue = "linkeSourceValue"
        let targetLinkValue = "targetSourceValue"
        let valueLinkValue: Float = 0.5736
        let lineStyleLinkValue = EmphasisLineStyle(
            .emphasis(LineStyle(
                .color(Color.yellow),
                .width(20.58397),
                .opacity(0.5736)
                ))
        )
        
        let link = SankeySerie.Link()
        link.source = sourceLinkValue
        link.target = targetLinkValue
        link.value = valueLinkValue
        link.lineStyle = lineStyleLinkValue
        
        describe("For SankeySerie.Link") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "source": sourceLinkValue,
                    "target": targetLinkValue,
                    "value": valueLinkValue,
                    "lineStyle": lineStyleLinkValue
                ]
                
                expect(link.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let linkByEnums = SankeySerie.Link(
                    .source(sourceLinkValue),
                    .target(targetLinkValue),
                    .value(valueLinkValue),
                    .lineStyle(lineStyleLinkValue)
                )
                
                expect(linkByEnums.jsonString).to(equal(linkByEnums.jsonString))
            }
        }
        
        describe("For SankeySerie") {
            let typeValue = SerieType.sankey
            let zlevelValue: Float = 94.8265
            let zValue: Float = 37573467
            let leftValue = Position.left
            let rightValue = Position.right
            let topValue = Position.top
            let bottomValue = Position.bottom
            let widthValue: LengthValue = 20%
            let heightValue: LengthValue = 80%
            let nodeWidthValue: Float = 85.2764
            let nodeGapValue: Float = 8.5837
            let layoutIterationsValue: Float = 32
            let labelValue = EmphasisLabel(
                .normal(LabelStyle(
                    .show(true),
                    .formatter(.string("{value} $")),
                    .verticalAlign(VerticalAlign.bottom)
                    ))
            )
            let itemStyleValue = ItemStyle(
                .emphasis(CommonItemStyleContent(
                    .shadowOffsetY(0.0)
                    ))
            )
            let lineStyleValue = EmphasisLineStyle(
                .emphasis(LineStyle(
                    .type(.dotted),
                    .width(0.59237),
                    .shadowBlur(0.88578347)
                    ))
            )
            let dataValue: [Jsonable] = [
                data,
                ["name":"Agricultural \\'waste\\'"],
                ["name":"Bio-conversion"],
                ["name":"Liquid"],
                ["name":"Losses"],
                ["name":"Solid"],
                ["name":"Gas"],
                ["name":"Biofuel imports"],
                ["name":"Biomass imports"],
                ["name":"Coal imports"],
                ["name":"Coal"],
                ["name":"Coal reserves"],
                ["name":"District heating"],
                ["name":"Industry"],
                ["name":"Heating and cooling - commercial"],
                ["name":"Heating and cooling - homes"],
                ["name":"Electricity grid"],
                ["name":"Over generation / exports"],
                ["name":"H2 conversion"],
                ["name":"Road transport"],
                ["name":"Agriculture"],
                ["name":"Rail transport"],
                ["name":"Lighting & appliances - commercial"],
                ["name":"Lighting & appliances - homes"],
                ["name":"Gas imports"],
                ["name":"Ngas"],
                ["name":"Gas reserves"],
                ["name":"Thermal generation"],
                ["name":"Geothermal"],
                ["name":"H2"],
                ["name":"Hydro"],
                ["name":"International shipping"],
                ["name":"Domestic aviation"],
                ["name":"International aviation"],
                ["name":"National navigation"],
                ["name":"Marine algae"],
                ["name":"Nuclear"],
                ["name":"Oil imports"],
                ["name":"Oil"],
                ["name":"Oil reserves"],
                ["name":"Other waste"],
                ["name":"Pumped heat"],
                ["name":"Solar PV"],
                ["name":"Solar Thermal"],
                ["name":"Solar"],
                ["name":"Tidal"],
                ["name":"UK land based bioenergy"],
                ["name":"Wave"],
                ["name":"Wind"]
            ]
            let linksValue: [Jsonable] = [
                ["source": "Agricultural \\'waste\\'", "target": "Bio-conversion",  "value": 124.729],
                ["source": "Bio-conversion", "target": "Liquid",  "value": 0.597],
                ["source": "Bio-conversion",  "target": "Losses",  "value": 26.862],
                ["source": "Bio-conversion",  "target": "Solid",  "value": 280.322],
                ["source": "Bio-conversion", "target": "Gas",  "value": 81.144],
                ["source": "Biofuel imports", "target": "Liquid",  "value": 35],
                ["source": "Biomass imports", "target": "Solid",  "value": 35],
                ["source": "Coal imports", "target": "Coal", "value": 11.606],
                ["source": "Coal reserves","target": "Coal", "value": 63.965],
                ["source": "Coal", "target": "Solid", "value": 75.571],
                ["source": "District heating", "target": "Industry", "value": 10.639],
                ["source": "District heating", "target": "Heating and cooling - commercial", "value": 22.505],
                ["source": "District heating", "target": "Heating and cooling - homes", "value": 46.184],
                ["source": "Electricity grid", "target": "Over generation / exports", "value": 104.453],
                ["source": "Electricity grid", "target": "Heating and cooling - homes", "value": 113.726],
                ["source": "Electricity grid", "target": "H2 conversion", "value": 27.14],
                ["source": "Electricity grid", "target": "Industry", "value": 342.165],
                ["source": "Electricity grid", "target": "Road transport", "value": 37.797],
                ["source": "Electricity grid", "target": "Agriculture", "value": 4.412],
                ["source": "Electricity grid", "target": "Heating and cooling - commercial", "value": 40.858],
                ["source": "Electricity grid", "target": "Losses", "value": 56.691],
                ["source": "Electricity grid", "target": "Rail transport", "value": 7.863],
                ["source": "Electricity grid", "target": "Lighting & appliances - commercial", "value": 90.008],
                ["source": "Electricity grid", "target": "Lighting & appliances - homes", "value": 93.494],
                ["source": "Gas imports", "target": "Ngas", "value": 40.719],
                ["source": "Gas reserves", "target": "Ngas", "value": 82.233],
                ["source": "Gas", "target": "Heating and cooling - commercial", "value": 0.129],
                ["source": "Gas", "target": "Losses", "value": 1.401],
                ["source": "Gas", "target": "Thermal generation", "value": 151.891],
                ["source": "Gas", "target": "Agriculture", "value": 2.096],
                ["source": "Gas", "target": "Industry", "value": 48.58],
                ["source": "Geothermal", "target": "Electricity grid", "value": 7.013],
                ["source": "H2 conversion", "target": "H2", "value": 20.897],
                ["source": "H2 conversion", "target": "Losses", "value": 6.242],
                ["source": "H2", "target": "Road transport", "value": 20.897],
                ["source": "Hydro", "target": "Electricity grid", "value": 6.995],
                ["source": "Liquid", "target": "Industry", "value": 121.066],
                ["source": "Liquid", "target": "International shipping", "value": 128.69],
                ["source": "Liquid", "target": "Road transport", "value": 135.835],
                ["source": "Liquid", "target": "Domestic aviation", "value": 14.458],
                ["source": "Liquid", "target": "International aviation", "value": 206.267],
                ["source": "Liquid", "target": "Agriculture", "value": 3.64],
                ["source": "Liquid", "target": "National navigation", "value": 33.218],
                ["source": "Liquid", "target": "Rail transport", "value": 4.413],
                ["source": "Marine algae", "target": "Bio-conversion", "value": 4.375],
                ["source": "Ngas", "target": "Gas", "value": 122.952],
                ["source": "Nuclear", "target": "Thermal generation", "value": 839.978],
                ["source": "Oil imports", "target": "Oil", "value": 504.287],
                ["source": "Oil reserves", "target": "Oil", "value": 107.703],
                ["source": "Oil", "target": "Liquid", "value": 611.99],
                ["source": "Other waste", "target": "Solid", "value": 56.587],
                ["source": "Other waste", "target": "Bio-conversion", "value": 77.81],
                ["source": "Pumped heat", "target": "Heating and cooling - homes", "value": 193.026],
                ["source": "Pumped heat", "target": "Heating and cooling - commercial", "value": 70.672],
                ["source": "Solar PV", "target": "Electricity grid", "value": 59.901],
                ["source": "Solar Thermal", "target": "Heating and cooling - homes", "value": 19.263],
                ["source": "Solar", "target": "Solar Thermal", "value": 19.263],
                ["source": "Solar", "target": "Solar PV", "value": 59.901],
                ["source": "Solid", "target": "Agriculture", "value": 0.882],
                ["source": "Solid", "target": "Thermal generation", "value": 400.12],
                ["source": "Solid", "target": "Industry", "value": 46.477],
                ["source": "Thermal generation", "target": "Electricity grid", "value": 525.531],
                ["source": "Thermal generation", "target": "Losses", "value": 787.129],
                ["source": "Thermal generation", "target": "District heating", "value": 79.329],
                ["source": "Tidal", "target": "Electricity grid", "value": 9.452],
                ["source": "UK land based bioenergy", "target": "Bio-conversion", "value": 182.01],
                ["source": "Wave", "target": "Electricity grid", "value": 19.013],
                ["source": "Wind", "target": "Electricity grid", "value": 289.366]
            ]
            let nodesValue: [Jsonable] = [
                true, false, "hello", "world", 0.576
            ]
            let edgesValue: [Jsonable] = [
                Int.min, Int.max, 0, -5.0238, 999999
            ]
            
            let silentValue = true
            let animationValue = false
            let animationThresholdValue: Float = 77.777
            let animationDurationValue: Time = 999999999.01
            let animationEasingValue: EasingFunction = .circularIn
            let animationDelayValue: Time = 0.58267
            let animationDurationUpdateValue: Time = Time.init(integerLiteral: Int.min)
            let animationEasingUpdateValue: EasingFunction = EasingFunction.sinusoidalInOut
            let animationDelayUpdateValue = Time.number(47.23623)
            
            
            let sankeySerie = SankeySerie()
            sankeySerie.zlevel = zlevelValue
            sankeySerie.z = zValue
            sankeySerie.left = leftValue
            sankeySerie.top = topValue
            sankeySerie.right = rightValue
            sankeySerie.bottom = bottomValue
            sankeySerie.width = widthValue
            sankeySerie.height = heightValue
            sankeySerie.nodeWidth = nodeWidthValue
            sankeySerie.nodeGap = nodeGapValue
            sankeySerie.layoutIterations = layoutIterationsValue
            sankeySerie.label = labelValue
            sankeySerie.itemStyle = itemStyleValue
            sankeySerie.lineStyle = lineStyleValue
            sankeySerie.data = dataValue
            sankeySerie.nodes = nodesValue
            sankeySerie.links = linksValue
            sankeySerie.edges = edgesValue
            sankeySerie.silent = silentValue
            sankeySerie.animation = animationValue
            sankeySerie.animationThreshold = animationThresholdValue
            sankeySerie.animationDuration = animationDurationValue
            sankeySerie.animationEasing = animationEasingValue
            sankeySerie.animationDelay = animationDelayValue
            sankeySerie.animationDurationUpdate = animationDurationUpdateValue
            sankeySerie.animationEasingUpdate = animationEasingUpdateValue
            sankeySerie.animationDelayUpdate = animationDelayUpdateValue
            
            it("needs to check the type value") {
                expect(sankeySerie.type.jsonString).to(equal(typeValue.jsonString))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": typeValue,
                    "zlevel": zlevelValue,
                    "z": zValue,
                    "left": leftValue,
                    "top": topValue,
                    "right": rightValue,
                    "bottom": bottomValue,
                    "width": widthValue,
                    "height": heightValue,
                    "nodeWidth": nodeWidthValue,
                    "nodeGap": nodeGapValue,
                    "layoutIterations": layoutIterationsValue,
                    "label": labelValue,
                    "itemStyle": itemStyleValue,
                    "lineStyle": lineStyleValue,
                    "data": dataValue,
                    "nodes": nodesValue,
                    "links": linksValue,
                    "edges": edgesValue,
                    "silent": silentValue,
                    "animation": animationValue,
                    "animationThreshold": animationThresholdValue,
                    "animationDuration": animationDurationValue,
                    "animationEasing": animationEasingValue,
                    "animationDelay": animationDelayValue,
                    "animationDurationUpdate": animationDurationUpdateValue,
                    "animationEasingUpdate": animationEasingUpdateValue,
                    "animationDelayUpdate": animationDelayUpdateValue
                ]
                
                expect(sankeySerie.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let sankeySerieByEnums = SankeySerie(
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .left(leftValue),
                    .top(topValue),
                    .right(rightValue),
                    .bottom(bottomValue),
                    .width(widthValue),
                    .height(heightValue),
                    .nodeWidth(nodeWidthValue),
                    .nodeGap(nodeGapValue),
                    .layoutIterations(layoutIterationsValue),
                    .label(labelValue),
                    .itemStyle(itemStyleValue),
                    .lineStyle(lineStyleValue),
                    .data(dataValue),
                    .nodes(nodesValue),
                    .links(linksValue),
                    .edges(edgesValue),
                    .silent(silentValue),
                    .animation(animationValue),
                    .animationThreshold(animationThresholdValue),
                    .animationDuration(animationDurationValue),
                    .animationEasing(animationEasingValue),
                    .animationDelay(animationDelayValue),
                    .animationDurationUpdate(animationDurationUpdateValue),
                    .animationEasingUpdate(animationEasingUpdateValue),
                    .animationDelayUpdate(animationDelayUpdateValue)
                )
                
                expect(sankeySerieByEnums.jsonString).to(equal(sankeySerie.jsonString))
            }
        }
    }
}
