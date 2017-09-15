//
//  SliderDataZoomSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class SliderDataZoomSpec: QuickSpec {
    override func spec() {
        let lineStyleDataBackgroundValue = EmphasisLineStyle(
            .emphasis(LineStyle(
                .color(Color.hexColor("#9988ff")),
                .width(125),
                .type(LineType.solid),
                .shadowOffsetY(8758)
                )),
            .normal(LineStyle(
                .shadowBlur(0.0278),
                .shadowColor(rgba(128, 128, 128, 0.5))
                ))
        )
        let areaStyleDataBackgroundValue = AreaStyle(
            .color(Color.hexColor("#123456")),
            .opacity(0.5826),
            .shadowOffsetX(7461)
        )
        
        let dataBackground = SliderDataZoom.DataBackground()
        dataBackground.lineStyle = lineStyleDataBackgroundValue
        dataBackground.areaStyle = areaStyleDataBackgroundValue
        
        describe("For SliderDataZoom.DataBackground") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "lineStyle": lineStyleDataBackgroundValue,
                    "areaStyle": areaStyleDataBackgroundValue
                ]
                
                expect(dataBackground.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let dataBackgroundByEnums = SliderDataZoom.DataBackground(
                    .lineStyle(lineStyleDataBackgroundValue),
                    .areaStyle(areaStyleDataBackgroundValue)
                )
                
                expect(dataBackgroundByEnums.jsonString).to(equal(dataBackground.jsonString))
            }
        }
        
        let colorHandleStyleValue = rgba(128, 0, 255, 0.000001)
        let borderColorHandleStyleValue = Color.hexColor("#678901")
        let borderWidthHandleStyleValue: Float = 0.582376
        let borderTypeHandleStyleValue = LineType.dashed
        let shadowBlurHandleStyleValue: Float = 10
        let shadowColorHandleStyleValue = rgba(0, 0, 0, 0.5)
        let shadowOffsetXHandleStyleValue: Float = 0.59347
        let shadowOffsetYHandleStyleValue: Float = 73623.47
        let opacityHandleStyleValue: Float = 0.59237
        
        let handleStyle = SliderDataZoom.HandleStyle()
        handleStyle.color = colorHandleStyleValue
        handleStyle.borderColor = borderColorHandleStyleValue
        handleStyle.borderWidth = borderWidthHandleStyleValue
        handleStyle.borderType = borderTypeHandleStyleValue
        handleStyle.shadowBlur = shadowBlurHandleStyleValue
        handleStyle.shadowColor = shadowColorHandleStyleValue
        handleStyle.shadowOffsetX = shadowOffsetXHandleStyleValue
        handleStyle.shadowOffsetY = shadowOffsetYHandleStyleValue
        handleStyle.opacity = opacityHandleStyleValue
        
        describe("For SliderDataZoom.HandleStyle") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "color": colorHandleStyleValue,
                    "borderColor": borderColorHandleStyleValue,
                    "borderWidth": borderWidthHandleStyleValue,
                    "borderType": borderTypeHandleStyleValue,
                    "shadowBlur": shadowBlurHandleStyleValue,
                    "shadowColor": shadowColorHandleStyleValue,
                    "shadowOffsetX": shadowOffsetXHandleStyleValue,
                    "shadowOffsetY": shadowOffsetYHandleStyleValue,
                    "opacity": opacityHandleStyleValue
                ]
                
                expect(handleStyle.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let handleStyleByEnums = SliderDataZoom.HandleStyle(
                    .color(colorHandleStyleValue),
                    .borderColor(borderColorHandleStyleValue),
                    .borderWidth(borderWidthHandleStyleValue),
                    .borderType(borderTypeHandleStyleValue),
                    .shadowBlur(shadowBlurHandleStyleValue),
                    .shadowColor(shadowColorHandleStyleValue),
                    .shadowOffsetX(shadowOffsetXHandleStyleValue),
                    .shadowOffsetY(shadowOffsetYHandleStyleValue),
                    .opacity(opacityHandleStyleValue)
                )
                
                expect(handleStyleByEnums.jsonString).to(equal(handleStyle.jsonString))
            }
        }
        
        describe("For SliderDataZoom") {
            let typeValue = "slider"
            let showValue = false
            let backgroundColorValue = Color.hexColor("#aabbcc")
            let dataBackgroundValue = dataBackground
            let fillerColorValue = Color.auto
            let borderColorValue = Color.yellow
            let handleIconValue = "sliderDataZoom.handleIconValue"
            let handleSizeValue = 55%
            let handleStyleValue = handleStyle
            let labelPrecisionValue: Float = 5
            let labelFormatterValue = Formatter.string("labelFormatterOfSliderDataZoom")
            let showDetailValue = false
            let showDataShadowValue = "sliderDataZoomShadowShowable"
            let realtimeValue = true
            let textStyleValue = TextStyle(
                .color(Color.rgb(0, 0, 0)),
                .fontSize(14)
            )
            let xAxisIndexOriginValue: UInt8 = 255
            let xAxisIndexValue = OneOrMore<UInt8>(one: xAxisIndexOriginValue)
            let yAxisIndexOriginValues: [UInt8] = [0, 1, 2, 254, 255]
            let yAxisIndexValue = OneOrMore<UInt8>(more: yAxisIndexOriginValues)
            let radiusAxisIndexOriginValue: UInt8 = 0
            let radiusAxisIndexValue = OneOrMore(one: radiusAxisIndexOriginValue)
            let angleAxisIndexOriginValue: UInt8 = 128
            let angleAxisIndexValue = OneOrMore<UInt8>(one: angleAxisIndexOriginValue)
            let filterModeValue = FilterMode.empty
            let startValue: Float = 50
            let endValue: Float = 100
            let startValueValue: Jsonable = "sliderDataZoomStartValue"
            let endValueValue: Jsonable = 8.58237
            let orientValue = Orient.horizontal
            let zoomLockValue = false
            let zlevelValue: Float = 756723.823
            let zValue: Float = 48753
            let leftValue = Position.inside
            let topValue = Position.insideRight
            let rightValue = Position.top
            let bottomValue = Position.top
            let widthValue: LengthValue = 30
            let heightValue: LengthValue = 80%
            
            let sliderDataZoom = SliderDataZoom()
            sliderDataZoom.show = showValue
            sliderDataZoom.backgroundColor = backgroundColorValue
            sliderDataZoom.dataBackground = dataBackgroundValue
            sliderDataZoom.fillerColor = fillerColorValue
            sliderDataZoom.borderColor = borderColorValue
            sliderDataZoom.handleIcon = handleIconValue
            sliderDataZoom.handleSize = handleSizeValue
            sliderDataZoom.handleStyle = handleStyleValue
            sliderDataZoom.labelPrecision = labelPrecisionValue
            sliderDataZoom.labelFormatter = labelFormatterValue
            sliderDataZoom.showDetail = showDetailValue
            sliderDataZoom.showDataShadow = showDataShadowValue
            sliderDataZoom.realtime = realtimeValue
            sliderDataZoom.textStyle = textStyleValue
            sliderDataZoom.xAxisIndex = xAxisIndexValue
            sliderDataZoom.yAxisIndex = yAxisIndexValue
            sliderDataZoom.radiusAxisIndex = radiusAxisIndexValue
            sliderDataZoom.angleAxisIndex = angleAxisIndexValue
            sliderDataZoom.filterMode = filterModeValue
            sliderDataZoom.start = startValue
            sliderDataZoom.end = endValue
            sliderDataZoom.startValue = startValueValue
            sliderDataZoom.endValue = endValueValue
            sliderDataZoom.orient = orientValue
            sliderDataZoom.zoomLock = zoomLockValue
            sliderDataZoom.zlevel = zlevelValue
            sliderDataZoom.z = zValue
            sliderDataZoom.left = leftValue
            sliderDataZoom.top = topValue
            sliderDataZoom.right = rightValue
            sliderDataZoom.bottom = bottomValue
            sliderDataZoom.width = widthValue
            sliderDataZoom.height = heightValue
            
            it("needs to check the type value") {
                expect(sliderDataZoom.type.jsonString).to(equal(typeValue.jsonString))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": typeValue,
                    "show": showValue,
                    "backgroundColor": backgroundColorValue,
                    "dataBackground": dataBackgroundValue,
                    "fillerColor": fillerColorValue,
                    "borderColor": borderColorValue,
                    "handleIcon": handleIconValue,
                    "handleSize": handleSizeValue,
                    "handleStyle": handleStyleValue,
                    "labelPrecision": labelPrecisionValue,
                    "labelFormatter": labelFormatterValue,
                    "showDetail": showDetailValue,
                    "showDataShadow": showDataShadowValue,
                    "realtime": realtimeValue,
                    "textStyle": textStyleValue,
                    "xAxisIndex": xAxisIndexValue,
                    "yAxisIndex": yAxisIndexValue,
                    "radiusAxisIndex": radiusAxisIndexValue,
                    "angleAxisIndex": angleAxisIndexValue,
                    "filterMode": filterModeValue,
                    "start": startValue,
                    "end": endValue,
                    "startValue": startValueValue,
                    "endValue": endValueValue,
                    "orient": orientValue,
                    "zoomLock": zoomLockValue,
                    "zlevel": zlevelValue,
                    "z": zValue,
                    "left": leftValue,
                    "top": topValue,
                    "right": rightValue,
                    "bottom": bottomValue,
                    "width": widthValue,
                    "height": heightValue
                ]
                
                expect(sliderDataZoom.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let sliderDataZoomByEnums = SliderDataZoom(
                    .show(showValue),
                    .backgroundColor(backgroundColorValue),
                    .dataBackground(dataBackgroundValue),
                    .fillerColor(fillerColorValue),
                    .borderColor(borderColorValue),
                    .handleIcon(handleIconValue),
                    .handleSize(handleSizeValue),
                    .handleStyle(handleStyleValue),
                    .labelPrecision(labelPrecisionValue),
                    .labelFormatter(labelFormatterValue),
                    .showDetail(showDetailValue),
                    .showDataShadow(showDataShadowValue),
                    .realtime(realtimeValue),
                    .textStyle(textStyleValue),
                    .xAxisIndex(xAxisIndexOriginValue),
                    .yAxisIndexes(yAxisIndexOriginValues),
                    .radiusAxisIndex(radiusAxisIndexOriginValue),
                    .angleAxisIndex(angleAxisIndexOriginValue),
                    .filterMode(filterModeValue),
                    .start(startValue),
                    .end(endValue),
                    .startValue(startValueValue),
                    .endValue(endValueValue),
                    .orient(orientValue),
                    .zoomLock(zoomLockValue),
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .left(leftValue),
                    .top(topValue),
                    .right(rightValue),
                    .bottom(bottomValue),
                    .width(widthValue),
                    .height(heightValue)
                )
                
                expect(sliderDataZoomByEnums.jsonString).to(equal(sliderDataZoom.jsonString))
            }
            
            it("needs to check the x and y") {
                let sliderDataZoomByEnums = SliderDataZoom(
                    .show(showValue),
                    .backgroundColor(backgroundColorValue),
                    .dataBackground(dataBackgroundValue),
                    .fillerColor(fillerColorValue),
                    .borderColor(borderColorValue),
                    .handleIcon(handleIconValue),
                    .handleSize(handleSizeValue),
                    .handleStyle(handleStyleValue),
                    .labelPrecision(labelPrecisionValue),
                    .labelFormatter(labelFormatterValue),
                    .showDetail(showDetailValue),
                    .showDataShadow(showDataShadowValue),
                    .realtime(realtimeValue),
                    .textStyle(textStyleValue),
                    .xAxisIndex(xAxisIndexOriginValue),
                    .yAxisIndexes(yAxisIndexOriginValues),
                    .radiusAxisIndex(radiusAxisIndexOriginValue),
                    .angleAxisIndex(angleAxisIndexOriginValue),
                    .filterMode(filterModeValue),
                    .start(startValue),
                    .end(endValue),
                    .startValue(startValueValue),
                    .endValue(endValueValue),
                    .orient(orientValue),
                    .zoomLock(zoomLockValue),
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .x(leftValue),
                    .y(topValue),
                    .right(rightValue),
                    .bottom(bottomValue),
                    .width(widthValue),
                    .height(heightValue)
                )
                
                expect(sliderDataZoomByEnums.jsonString).to(equal(sliderDataZoom.jsonString))
            }
            
            it("needs to check the xAxisIndexes, yAxisIndex, radiusAxisIndexes, angleAxisIndexes") {
                let xAxisIndexOriginValues: [UInt8] = [127, 128, 129]
                let yAxisIndexOriginValue: UInt8 = 55
                let radiusAxisIndexOriginValues: [UInt8] = [55, 66, 77]
                let angleAxisIndexOriginValues: [UInt8] = [0, 255]
                sliderDataZoom.xAxisIndex = OneOrMore(more: xAxisIndexOriginValues)
                sliderDataZoom.yAxisIndex = OneOrMore(one: yAxisIndexOriginValue)
                sliderDataZoom.radiusAxisIndex = OneOrMore(more: radiusAxisIndexOriginValues)
                sliderDataZoom.angleAxisIndex = OneOrMore(more: angleAxisIndexOriginValues)
                
                let sliderDataZoomByEnums = SliderDataZoom(
                    .show(showValue),
                    .backgroundColor(backgroundColorValue),
                    .dataBackground(dataBackgroundValue),
                    .fillerColor(fillerColorValue),
                    .borderColor(borderColorValue),
                    .handleIcon(handleIconValue),
                    .handleSize(handleSizeValue),
                    .handleStyle(handleStyleValue),
                    .labelPrecision(labelPrecisionValue),
                    .labelFormatter(labelFormatterValue),
                    .showDetail(showDetailValue),
                    .showDataShadow(showDataShadowValue),
                    .realtime(realtimeValue),
                    .textStyle(textStyleValue),
                    .xAxisIndexes(xAxisIndexOriginValues),
                    .yAxisIndex(yAxisIndexOriginValue),
                    .radiusAxisIndexes(radiusAxisIndexOriginValues),
                    .angleAxisIndexes(angleAxisIndexOriginValues),
                    .filterMode(filterModeValue),
                    .start(startValue),
                    .end(endValue),
                    .startValue(startValueValue),
                    .endValue(endValueValue),
                    .orient(orientValue),
                    .zoomLock(zoomLockValue),
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .left(leftValue),
                    .top(topValue),
                    .right(rightValue),
                    .bottom(bottomValue),
                    .width(widthValue),
                    .height(heightValue)
                )
                
                expect(sliderDataZoom.jsonString).to(equal(sliderDataZoomByEnums.jsonString))
            }
        }
    }
}
