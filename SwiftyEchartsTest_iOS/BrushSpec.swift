//
//  BrushSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 05/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class BrushSpec: QuickSpec {
    override func spec() {
        let rectToolbox = Brush.Toolbox.rect
        let polygonToolbox = Brush.Toolbox.polygon
        let lineXToolbox = Brush.Toolbox.lineX
        let lineYToolbox = Brush.Toolbox.lineY
        let keepToolbox = Brush.Toolbox.keep
        let clearToolbox = Brush.Toolbox.clear
        
        describe("For Brush.Toolbox") {
            let rectString = "rect"
            let polygonString = "polygon"
            let lineXString = "lineX"
            let lineYString = "lineY"
            let keepString = "keep"
            let clearString = "clear"
            
            it("needs to check the jsonString") {
                expect(rectToolbox.jsonString).to(equal(rectString.jsonString))
                expect(polygonToolbox.jsonString).to(equal(polygonString.jsonString))
                expect(lineXToolbox.jsonString).to(equal(lineXString.jsonString))
                expect(lineYToolbox.jsonString).to(equal(lineYString.jsonString))
                expect(keepToolbox.jsonString).to(equal(keepString.jsonString))
                expect(clearToolbox.jsonString).to(equal(clearString.jsonString))
            }
        }
        
        let indexIndexes = Brush.Indexes.indexes([0, 4, 2])
        let allIndexes = Brush.Indexes.all
        let noneIndexes = Brush.Indexes.none
        
        describe("For Brush.Indexes") {
            let indexArray = [0, 4, 2]
            let allString = "all"
            let noneString = "none"
            
            it("needs to check the jsonString") {
                expect(indexIndexes.jsonString).to(equal(indexArray.jsonString))
                expect(allIndexes.jsonString).to(equal(allString.jsonString))
                expect(noneIndexes.jsonString).to(equal(noneString.jsonString))
            }
        }
        
        let rectType = SwiftyEcharts.Brush.Type.rect
        let polygonType = SwiftyEcharts.Brush.Type.polygon
        let lineXType = SwiftyEcharts.Brush.Type.lineX
        let lineYType = SwiftyEcharts.Brush.Type.lineY
        
        describe("For Brush.Type") {
            let rectString = "rect"
            let polygonString = "polygon"
            let lineXString = "lineX"
            let lineYString = "lineY"
            
            expect(rectType.jsonString).to(equal(rectString.jsonString))
            expect(polygonType.jsonString).to(equal(polygonString.jsonString))
            expect(lineXType.jsonString).to(equal(lineXString.jsonString))
            expect(lineYType.jsonString).to(equal(lineYString.jsonString))
        }
        
        let singleMode = Brush.Mode.single
        let multipleMode = Brush.Mode.multiple
        
        describe("For Brush.Mode") { 
            let singleString = "single"
            let multipleString = "multiple"
            
            expect(singleMode.jsonString).to(equal(singleString.jsonString))
            expect(multipleMode.jsonString).to(equal(multipleString.jsonString))
        }
        
        let debounceThrottleType = Brush.ThrottleType.debounce
        let fixRateThrottleType = Brush.ThrottleType.fixRate
        
        describe("For Brush.ThrottleType") {
            let debounceString = "debounce"
            let fixRateString = "fixRate"
            
            expect(debounceThrottleType.jsonString).to(equal(debounceString.jsonString))
            expect(fixRateThrottleType.jsonString).to(equal(fixRateString.jsonString))
        }
        
        let borderWidthValue: Float = 3.8295
        let colorValue = Color.hexColor("#ff9924")
        let borderColorValue = Color.red
        let widthValue: Float = 7.284
        
        let brushStyle = Brush.Style()
        brushStyle.borderWidth = borderWidthValue
        brushStyle.color = colorValue
        brushStyle.borderColor = borderColorValue
        brushStyle.width = widthValue
        
        describe("For Brush.Style") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "borderWidth": borderWidthValue,
                    "color": colorValue,
                    "borderColor": borderColorValue,
                    "width": widthValue
                ]
                
                expect(brushStyle.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let brushStyleByEnums = Brush.Style(
                    .borderWidth(borderWidthValue),
                    .color(colorValue),
                    .borderColor(borderColorValue),
                    .width(widthValue)
                )
                
                expect(brushStyleByEnums.jsonString).to(equal(brushStyle.jsonString))
            }
        }
        
        describe("For Brush") {
            let toolboxValue = [rectToolbox, polygonToolbox, lineXToolbox, lineYToolbox, keepToolbox, clearToolbox]
            let brushLinkValue = Brush.Indexes.indexes([0, 1])
            let seriesIndexValue = allIndexes
            let geoIndexValue = noneIndexes
            let xAxisIndexValue = Brush.Indexes.indexes([0])
            let yAxisIndexValue = Brush.Indexes.indexes([1])
            let brushTypeValue = polygonType
            let brushModeValue = multipleMode
            let transformableValue = false
            let brushStyleValue = brushStyle
            let throttleTypeValue = debounceThrottleType
            let throttleDelayValue: Float = 0.5
            let removeOnClickValue: Float = 0.0
            let inBrushValue = "inBrushValue"
            let outBrushValue = "outOfBrushValue"
            let zValue: Float = 8472.237462378
            
            let brush = Brush()
            brush.toolbox = toolboxValue
            brush.brushLink = brushLinkValue
            brush.seriesIndex = seriesIndexValue
            brush.geoIndex = geoIndexValue
            brush.xAxisIndex = xAxisIndexValue
            brush.yAxisIndex = yAxisIndexValue
            brush.brushType = brushTypeValue
            brush.brushMode = brushModeValue
            brush.transformable = transformableValue
            brush.brushStyle = brushStyleValue
            brush.throttleType = throttleTypeValue
            brush.throttleDelay = throttleDelayValue
            brush.removeOnClick = removeOnClickValue
            brush.inBrush = inBrushValue
            brush.outOfBrush = outBrushValue
            brush.z = zValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "toolbox": toolboxValue,
                    "brushLink": brushLinkValue,
                    "seriesIndex": seriesIndexValue,
                    "geoIndex": geoIndexValue,
                    "xAxisIndex": xAxisIndexValue,
                    "yAxisIndex": yAxisIndexValue,
                    "brushType": brushTypeValue,
                    "brushMode": brushModeValue,
                    "transformable": transformableValue,
                    "brushStyle": brushStyleValue,
                    "throttleType": throttleTypeValue,
                    "throttleDelay": throttleDelayValue,
                    "removeOnClick": removeOnClickValue,
                    "inBrush": inBrushValue,
                    "outOfBrush": outBrushValue,
                    "z": zValue
                ]

                expect(brush.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let brushByEnums = Brush(
                    .toolbox(toolboxValue),
                    .brushLink(brushLinkValue),
                    .seriesIndex(seriesIndexValue),
                    .geoIndex(geoIndexValue),
                    .xAxisIndex(xAxisIndexValue),
                    .yAxisIndex(yAxisIndexValue),
                    .brushType(brushTypeValue),
                    .brushMode(brushModeValue),
                    .transformable(transformableValue),
                    .brushStyle(brushStyleValue),
                    .throttleType(throttleTypeValue),
                    .throttleDelay(throttleDelayValue),
                    .removeOnClick(removeOnClickValue),
                    .inBrush(inBrushValue),
                    .outOfBrush(outBrushValue),
                    .z(zValue)
                )
                
                expect(brushByEnums.jsonString).to(equal(brush.jsonString))
            }
        }
        
        context("For the actions of Brush") {
            let geoIndexValue = 82347
            let brushTypeValue: SwiftyEcharts.Brush.`Type` = .lineX
            let rangeValue: [Jsonable] = [[10, 20], [50, 100]]
            let coordRangeValue: [Jsonable] = [10, 100]
            
            let area = BrushAction.Area()
            area.geoIndex = geoIndexValue
            area.brushType = brushTypeValue
            area.range = rangeValue
            area.coordRange = coordRangeValue
            
            describe("For the BrushAction.Area") {
                it("needs to check the jsonString") {
                    let resultDic: [String: Jsonable] = [
                        "geoIndex": geoIndexValue,
                        "brushType": brushTypeValue,
                        "range": rangeValue,
                        "coordRange": coordRangeValue
                    ]
                    
                    expect(area.jsonString).to(equal(resultDic.jsonString))
                }
                
                it("needs to check the Enumable") {
                    let areaByEnums = BrushAction.Area(
                        .geoIndex(geoIndexValue),
                        .brushType(brushTypeValue),
                        .range(rangeValue),
                        .coordRange(coordRangeValue)
                    )
                    
                    expect(areaByEnums.jsonString).to(equal(area.jsonString))
                }
            }
            
            describe("For the BrushAction") {
                let typeValue = EchartsActionType.brush
                let areaValue = [area]
                
                let brushAction = BrushAction()
                brushAction.areas = areaValue
                
                it("needs to check the type value") {
                    expect(brushAction.type.jsonString).to(equal(typeValue.jsonString))
                }
                
                it("needs to check the jsonString") {
                    let resultDic: [String: Jsonable] = [
                        "type": typeValue,
                        "areas": areaValue
                    ]
                    
                    expect(brushAction.jsonString).to(equal(resultDic.jsonString))
                }
                
                it("needs to check the Enumable") {
                    let brushActionByEnums = BrushAction(
                        .areas(areaValue)
                    )
                    
                    expect(brushActionByEnums.jsonString).to(equal(brushAction.jsonString))
                }
            }
        }
    }
}
