//
//  ToolboxSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 13/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class ToolboxSpec: QuickSpec {
    override func spec() {
        describe("For Toolbox.Feature.SaveAsImage.Type") {
            let pngString = "png"
            let jpegString = "jpeg"
            
            let pngType = Toolbox.Feature.SaveAsImage.Type.png
            let jpegType = Toolbox.Feature.SaveAsImage.Type.jpeg
            
            it("needs to check the enum case jsonString") {
                expect(pngType.jsonString).to(equal(pngString.jsonString))
                expect(jpegType.jsonString).to(equal(jpegString.jsonString))
            }
        }
        
        let colorIconStyleContentValue = Color.rgba(128, 128, 128, 0.3)
        let borderColorIconStyleContentValue = Color.hexColor("#abcdef")
        let borderWidthIconStyleContentValue: Float = 8.427
        let borderTypeIconStyleContentValue = LineType.solid
        let shadowBlurIconStyleContentValue: Float = 87234.23872
        let shadowColorIconStyleContentValue = Color.array([Color.red, Color.hexColor("#2746ff"), Color.rgba(0, 0, 128, 0.77)])
        let shadowOffsetXIconStyleContentValue: Float = 85.34874
        let shadowOffsetYIconStyleContentValue: Float = 0.88873
        let opacityIconStyleContentValue: Float = 0.74623
        let textPositionIconStyleContentValue = Position.top
        let textAlignIconStyleContentValue = Align.right
        
        let iconStyleContent = Toolbox.IconStyleContent()
        iconStyleContent.color = colorIconStyleContentValue
        iconStyleContent.borderColor = borderColorIconStyleContentValue
        iconStyleContent.borderWidth = borderWidthIconStyleContentValue
        iconStyleContent.borderType = borderTypeIconStyleContentValue
        iconStyleContent.shadowBlur = shadowBlurIconStyleContentValue
        iconStyleContent.shadowColor = shadowColorIconStyleContentValue
        iconStyleContent.shadowOffsetX = shadowOffsetXIconStyleContentValue
        iconStyleContent.shadowOffsetY = shadowOffsetYIconStyleContentValue
        iconStyleContent.opacity = opacityIconStyleContentValue
        iconStyleContent.textPosition = textPositionIconStyleContentValue
        iconStyleContent.textAlign = textAlignIconStyleContentValue
        
        describe("For Toolbox.IconStyleContent") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "color": colorIconStyleContentValue,
                    "borderColor": borderColorIconStyleContentValue,
                    "borderWidth": borderWidthIconStyleContentValue,
                    "borderType": borderTypeIconStyleContentValue,
                    "shadowBlur": shadowBlurIconStyleContentValue,
                    "shadowColor": shadowColorIconStyleContentValue,
                    "shadowOffsetX": shadowOffsetXIconStyleContentValue,
                    "shadowOffsetY": shadowOffsetYIconStyleContentValue,
                    "opacity": opacityIconStyleContentValue,
                    "textPosition": textPositionIconStyleContentValue,
                    "textAlign": textAlignIconStyleContentValue
                ]
                
                expect(iconStyleContent.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let iconStyleContentByEnums = Toolbox.IconStyleContent(
                    .color(colorIconStyleContentValue),
                    .borderColor(borderColorIconStyleContentValue),
                    .borderWidth(borderWidthIconStyleContentValue),
                    .borderType(borderTypeIconStyleContentValue),
                    .shadowBlur(shadowBlurIconStyleContentValue),
                    .shadowColor(shadowColorIconStyleContentValue),
                    .shadowOffsetX(shadowOffsetXIconStyleContentValue),
                    .shadowOffsetY(shadowOffsetYIconStyleContentValue),
                    .opacity(opacityIconStyleContentValue),
                    .textPosition(textPositionIconStyleContentValue),
                    .textAlign(textAlignIconStyleContentValue)
                )
                
                expect(iconStyleContentByEnums.jsonString).to(equal(iconStyleContentByEnums.jsonString))
            }
        }
        
        let normalIconStyleValue = iconStyleContent
        let emphasisIconStyleValue = Toolbox.IconStyleContent(
            .opacity(0.47623),
            .color(Color.yellow),
            .borderWidth(8745.28374),
            .textAlign(Align.left),
            .textPosition(Position.left)
        )
        
        let iconStyle = Toolbox.IconStyle()
        iconStyle.normal = normalIconStyleValue
        iconStyle.emphasis = emphasisIconStyleValue
        
        describe("For IconStyle") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "normal": normalIconStyleValue,
                    "emphasis": emphasisIconStyleValue
                ]
                
                expect(iconStyle.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let iconStyleByEnums = Toolbox.IconStyle(
                    .normal(normalIconStyleValue),
                    .emphasis(emphasisIconStyleValue)
                )
                
                expect(iconStyleByEnums.jsonString).to(equal(iconStyle.jsonString))
            }
        }
        
        let typeSaveAsImageValue = Toolbox.Feature.SaveAsImage.Type.jpeg
        let nameSaveAsImageValue = "saveAsImageNameValue"
        let backgroundColorSaveAsImageValue = Color.hexColor("#873abc")
        let excludeComponentsSaveAsImageValue: [String] = ["excludeComponent1", "excludeComponent2"]
        let showSaveAsImageValue = false
        let titleSaveAsImageValue = "saveAsImageTitleValue"
        let iconSaveAsImageValue = "saveAsImageIconValue"
        let iconStyleSaveAsImageValue = iconStyle
        let pixelRatioSaveAsImageValue: Float = 2
        
        let saveAsImage = Toolbox.Feature.SaveAsImage()
        saveAsImage.type = typeSaveAsImageValue
        saveAsImage.name = nameSaveAsImageValue
        saveAsImage.backgroundColor = backgroundColorSaveAsImageValue
        saveAsImage.excludeComponents = excludeComponentsSaveAsImageValue
        saveAsImage.show = showSaveAsImageValue
        saveAsImage.title = titleSaveAsImageValue
        saveAsImage.icon = iconSaveAsImageValue
        saveAsImage.iconStyle = iconStyleSaveAsImageValue
        saveAsImage.pixelRatio = pixelRatioSaveAsImageValue
        
        describe("For Toolbox.Feature.SaveAsImage") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": typeSaveAsImageValue,
                    "name": nameSaveAsImageValue,
                    "backgroundColor": backgroundColorSaveAsImageValue,
                    "excludeComponents": excludeComponentsSaveAsImageValue,
                    "show": showSaveAsImageValue,
                    "title": titleSaveAsImageValue,
                    "icon": iconSaveAsImageValue,
                    "iconStyle": iconStyleSaveAsImageValue,
                    "pixelRatio": pixelRatioSaveAsImageValue
                ]
                
                expect(saveAsImage.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let saveAsImageByEnums = Toolbox.Feature.SaveAsImage(
                    .type(typeSaveAsImageValue),
                    .name(nameSaveAsImageValue),
                    .backgroundColor(backgroundColorSaveAsImageValue),
                    .excludeComponents(excludeComponentsSaveAsImageValue),
                    .show(showSaveAsImageValue),
                    .title(titleSaveAsImageValue),
                    .icon(iconSaveAsImageValue),
                    .iconStyle(iconStyleSaveAsImageValue),
                    .pixelRatio(pixelRatioSaveAsImageValue)
                )
                
                expect(saveAsImageByEnums.jsonString).to(equal(saveAsImage.jsonString))
            }
        }
        
        
        let showRestoreValue = false
        let titleRestoreValue = "restoreTitleValue"
        let iconRestoreValue = "restoreIconValue"
        let iconStyleRestoreValue = Toolbox.IconStyle(
            .emphasis(Toolbox.IconStyleContent(
                .color(Color.hexColor("#77fba7")),
                .textPosition(Position.top),
                .shadowBlur(7.2736)
                ))
        )
        
        let restore = Toolbox.Feature.Restore()
        restore.show = showRestoreValue
        restore.title = titleRestoreValue
        restore.icon = iconRestoreValue
        restore.iconStyle = iconStyleRestoreValue
        
        describe("For Toolbox.Feature.Restore") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showRestoreValue,
                    "title": titleRestoreValue,
                    "icon": iconRestoreValue,
                    "iconStyle": iconStyleRestoreValue
                ]
                
                expect(restore.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let restoreByEnums = Toolbox.Feature.Restore(
                    .show(showRestoreValue),
                    .title(titleRestoreValue),
                    .icon(iconRestoreValue),
                    .iconStyle(iconStyleRestoreValue)
                )
                
                expect(restoreByEnums.jsonString).to(equal(restore.jsonString))
            }
        }
        
        let showDataViewValue = true
        let titleDataViewValue = "dataViewTitleValue"
        let iconDataViewValue = "dataViewIconValue"
        let iconStyleDataViewValue = Toolbox.IconStyle(
            .normal(Toolbox.IconStyleContent(
                .borderWidth(0.00001),
                .opacity(0.99999999),
                .shadowOffsetY(100.01),
                .shadowOffsetX(999.0001)
                ))
        )
        let readOnlyDataViewValue = false
        let langDataViewValue: [String] = ["数据视图", "关闭", "刷新"]
        let backgroundColorDataViewValue = Color.array([Color.hexColor("#123abc"), Color.red, rgba(200, 19, 67, 0.888888)])
        let textareaColorDataViewValue = Color.hexColor("#667788")
        let textareaBorderColorDataViewValue = Color.rgb(99, 100, 101)
        let textColorDataViewValue = Color.red
        let buttonColorDataViewValue = Color.auto
        let buttonTextColorDataViewValue = rgba(0, 0, 0, 0)
        
        let dataView = Toolbox.Feature.DataView()
        dataView.show = showDataViewValue
        dataView.title = titleDataViewValue
        dataView.icon = iconDataViewValue
        dataView.iconStyle = iconStyleDataViewValue
        dataView.readOnly = readOnlyDataViewValue
        dataView.lang = langDataViewValue
        dataView.backgroundColor = backgroundColorDataViewValue
        dataView.textareaColor = textareaColorDataViewValue
        dataView.textareaBorderColor = textareaBorderColorDataViewValue
        dataView.textColor = textColorDataViewValue
        dataView.buttonColor = buttonColorDataViewValue
        dataView.buttonTextColor = buttonTextColorDataViewValue
        
        describe("For ToolboxFeature.DataView") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showDataViewValue,
                    "title": titleDataViewValue,
                    "icon": iconDataViewValue,
                    "iconStyle": iconStyleDataViewValue,
                    "readOnly": readOnlyDataViewValue,
                    "lang": langDataViewValue,
                    "backgroundColor": backgroundColorDataViewValue,
                    "textareaColor": textareaColorDataViewValue,
                    "textareaBorderColor": textareaBorderColorDataViewValue,
                    "textColor": textColorDataViewValue,
                    "buttonColor": buttonColorDataViewValue,
                    "buttonTextColor": buttonTextColorDataViewValue
                ]
                
                expect(dataView.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let dataViewByEnums = Toolbox.Feature.DataView(
                    .show(showDataViewValue),
                    .title(titleDataViewValue),
                    .icon(iconDataViewValue),
                    .iconStyle(iconStyleDataViewValue),
                    .readOnly(readOnlyDataViewValue),
                    .lang(langDataViewValue),
                    .backgroundColor(backgroundColorDataViewValue),
                    .textareaColor(textareaColorDataViewValue),
                    .textareaBorderColor(textareaBorderColorDataViewValue),
                    .textColor(textColorDataViewValue),
                    .buttonColor(buttonColorDataViewValue),
                    .buttonTextColor(buttonTextColorDataViewValue)
                )
                
                expect(dataViewByEnums.jsonString).to(equal(dataView.jsonString))
            }
        }
        
        describe("For Toolbox.Feature.DataZoom.AxisIndexSelector") {
            
            let trueValue = true
            let falseValue = false
            let allString = "all"
            let noneString = "none"
            let intValue: UInt = UInt.max
            let arrayValue: [UInt] = [UInt.min, 0, 255, 8, 89]
            
            let trueAxisIndexSelector = Toolbox.Feature.DataZoom.AxisIndexSelector.bool(trueValue)
            let falseAxisIndexSelector = Toolbox.Feature.DataZoom.AxisIndexSelector.bool(falseValue)
            let intAxisIndexSelector = Toolbox.Feature.DataZoom.AxisIndexSelector.int(intValue)
            let arrayAxisIndexSelector = Toolbox.Feature.DataZoom.AxisIndexSelector.array(arrayValue)
            
            it("needs to check the enum case jsonString") {
                expect(trueAxisIndexSelector.jsonString).to(equal(allString.jsonString))
                expect(falseAxisIndexSelector.jsonString).to(equal(noneString.jsonString))
                expect(intAxisIndexSelector.jsonString).to(equal(intValue.jsonString))
                expect(arrayAxisIndexSelector.jsonString).to(equal(arrayValue.jsonString))
            }
            
            it("needs to check the ExpressibleByBooleanLiteral, ExpressibleByIntegerLiteral, ExpressibleByArrayLiteral") {
                let trueLiteral: Toolbox.Feature.DataZoom.AxisIndexSelector = true
                let falseLiteral: Toolbox.Feature.DataZoom.AxisIndexSelector = false
                let intLiteral: Toolbox.Feature.DataZoom.AxisIndexSelector = 18446744073709551615
                let arrayLiteral: Toolbox.Feature.DataZoom.AxisIndexSelector = [UInt.min, UInt(0), UInt(255), UInt(8), UInt(89)]
                
                expect(trueLiteral.jsonString).to(equal(trueAxisIndexSelector.jsonString))
                expect(falseLiteral.jsonString).to(equal(falseAxisIndexSelector.jsonString))
                expect(intLiteral.jsonString).to(equal(intAxisIndexSelector.jsonString))
                expect(arrayLiteral.jsonString).to(equal(arrayAxisIndexSelector.jsonString))
                
            }
        }
        
        
        let zoomTitleValue = "dataZoomTitleZoomValue"
        let backTitleValue = "dataZoomTitleBackValue"
        
        let title = Toolbox.Feature.DataZoom.Title()
        title.zoom = zoomTitleValue
        title.back = backTitleValue
        
        describe("For Toolbox.Feature.DataZoom.Title") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "zoom": zoomTitleValue,
                    "back": backTitleValue
                ]
                
                expect(title.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let titleByEnums = Toolbox.Feature.DataZoom.Title(
                    .zoom(zoomTitleValue),
                    .back(backTitleValue)
                )
                
                expect(titleByEnums.jsonString).to(equal(title.jsonString))
            }
        }
        
        let zoomIconValue = "dataZoomIconZoomValue"
        let backIconValue = "dataZoomIconBackValue"
        
        let icon = Toolbox.Feature.DataZoom.Icon()
        icon.zoom = zoomIconValue
        icon.back = backIconValue
        
        describe("For Toolbox.Feature.DataZoom.Icon") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "zoom": zoomIconValue,
                    "back": backIconValue
                ]
                
                expect(icon.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let iconByEnums = Toolbox.Feature.DataZoom.Icon(
                    .zoom(zoomIconValue),
                    .back(backIconValue)
                )
                
                expect(iconByEnums.jsonString).to(equal(icon.jsonString))
            }
        }
        
        let showDataZoomValue = false
        let titleDataZoomValue = title
        let iconDataZoomValue = icon
        let iconStyleDataZoomValue = Toolbox.IconStyle(
            .emphasis(Toolbox.IconStyleContent(
                .opacity(0.576),
                .color(Color.auto),
                .borderType(LineType.dashed)
                ))
        )
        let xAxisIndexDataZoomValue = Toolbox.Feature.DataZoom.AxisIndexSelector.bool(false)
        let yAxisIndexDataZoomValue = Toolbox.Feature.DataZoom.AxisIndexSelector.int(77)
        
        let dataZoom = Toolbox.Feature.DataZoom()
        dataZoom.show = showDataZoomValue
        dataZoom.title = titleDataZoomValue
        dataZoom.icon = iconDataZoomValue
        dataZoom.iconStyle = iconStyleDataZoomValue
        dataZoom.xAxisIndex = xAxisIndexDataZoomValue
        dataZoom.yAxisIndex = yAxisIndexDataZoomValue
        
        describe("For Toolbox.Feature.DataZoom") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showDataZoomValue,
                    "title": titleDataZoomValue,
                    "icon": iconDataZoomValue,
                    "iconStyle": iconStyleDataZoomValue,
                    "xAxisIndex": xAxisIndexDataZoomValue,
                    "yAxisIndex": yAxisIndexDataZoomValue
                ]
                
                expect(dataZoom.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let dataZoomByEnums = Toolbox.Feature.DataZoom(
                    .show(showDataZoomValue),
                    .title(titleDataZoomValue),
                    .icon(iconDataZoomValue),
                    .iconStyle(iconStyleDataZoomValue),
                    .xAxisIndex(xAxisIndexDataZoomValue),
                    .yAxisIndex(yAxisIndexDataZoomValue)
                )
                
                expect(dataZoomByEnums.jsonString).to(equal(dataZoom.jsonString))
            }
        }
        
        describe("For Toolbox.Feature.MagicType.Type") {
            let lineString = "line"
            let barString = "bar"
            let stackString = "stack"
            let tiledString = "tiled"
            
            let lineType = Toolbox.Feature.MagicType.Type.line
            let barType = Toolbox.Feature.MagicType.Type.bar
            let stackType = Toolbox.Feature.MagicType.Type.stack
            let tiledType = Toolbox.Feature.MagicType.Type.tiled
            
            it("needs to check the enum case jsonString") {
                expect(lineType.jsonString).to(equal(lineString.jsonString))
                expect(barType.jsonString).to(equal(barString.jsonString))
                expect(stackType.jsonString).to(equal(stackString.jsonString))
                expect(tiledType.jsonString).to(equal(tiledString.jsonString))
            }
        }
        
        let lineTitleValue = "magicTypeTitleLineValue"
        let barTitleValue = "magicTypeTitleBarValue"
        let stackTitleValue = "magicTypeTitleStatckValue"
        let tiledTitleValue = "magicTypeTitleTiledValue"
        
        let magicTypeTitle = Toolbox.Feature.MagicType.Title()
        magicTypeTitle.line = lineTitleValue
        magicTypeTitle.bar = barTitleValue
        magicTypeTitle.stack = stackTitleValue
        magicTypeTitle.tiled = tiledTitleValue
        
        describe("For Toolbox.Feature.MagicType.Title") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "line": lineTitleValue,
                    "bar": barTitleValue,
                    "stack": stackTitleValue,
                    "tiled": tiledTitleValue
                ]
                
                expect(magicTypeTitle.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let magicTypeTitleByEnums = Toolbox.Feature.MagicType.Title(
                    .line(lineTitleValue),
                    .bar(barTitleValue),
                    .stack(stackTitleValue),
                    .tiled(tiledTitleValue)
                )
                
                expect(magicTypeTitleByEnums.jsonString).to(equal(magicTypeTitle.jsonString))
            }
        }
        
        let lineIconValue = "magicTypeIconLineValue"
        let barIconValue = "magicTypeIconBarValue"
        let stackIconValue = "magicTypeIconStatckValue"
        let tiledIconValue = "magicTypeIconTiledValue"
        
        let magicTypeIcon = Toolbox.Feature.MagicType.Icon()
        magicTypeIcon.line = lineIconValue
        magicTypeIcon.bar = barIconValue
        magicTypeIcon.stack = stackIconValue
        magicTypeIcon.tiled = tiledIconValue
        
        describe("For Toolbox.Feature.MagicType.Icon") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "line": lineIconValue,
                    "bar": barIconValue,
                    "stack": stackIconValue,
                    "tiled": tiledIconValue
                ]
                
                expect(magicTypeIcon.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let magicTypeIconByEnums = Toolbox.Feature.MagicType.Icon(
                    .line(lineIconValue),
                    .bar(barIconValue),
                    .stack(stackIconValue),
                    .tiled(tiledIconValue)
                )
                
                expect(magicTypeIconByEnums.jsonString).to(equal(magicTypeIcon.jsonString))
            }
        }
        
        let showMagicTypeValue = true
        let typeMagicTypeValue = [Toolbox.Feature.MagicType.Type.line, Toolbox.Feature.MagicType.Type.bar, Toolbox.Feature.MagicType.Type.stack, Toolbox.Feature.MagicType.Type.tiled]
        let titleMagicTypeValue = magicTypeTitle
        let iconMaigcTypeValue = magicTypeIcon
        
        let magicType = Toolbox.Feature.MagicType()
        magicType.show = showMagicTypeValue
        magicType.type = typeMagicTypeValue
        magicType.title = titleMagicTypeValue
        magicType.icon = iconMaigcTypeValue
        
        describe("For Toolbox.Feature.MagicType") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showMagicTypeValue,
                    "type": typeMagicTypeValue,
                    "title": titleMagicTypeValue,
                    "icon": iconMaigcTypeValue
                ]
                
                expect(magicType.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let magicTypeByEnums = Toolbox.Feature.MagicType(
                    .show(showMagicTypeValue),
                    .type(typeMagicTypeValue),
                    .title(titleMagicTypeValue),
                    .icon(iconMaigcTypeValue)
                )
                
                expect(magicTypeByEnums.jsonString).to(equal(magicType.jsonString))
            }
        }
        
        describe("For Toolbox.Feature.Brush.Type") {
            let rectString = "rect"
            let polygonString = "polygon"
            let lineXString = "lineX"
            let lineYString = "lineY"
            let keepString = "keep"
            let clearString = "clear"
            
            let rectBrush = Toolbox.Feature.Brush.Type.rect
            let polygonBrush = Toolbox.Feature.Brush.Type.polygon
            let lineXBrush = Toolbox.Feature.Brush.Type.lineX
            let lineYBrush = Toolbox.Feature.Brush.Type.lineY
            let keepBrush = Toolbox.Feature.Brush.Type.keep
            let clearBrush = Toolbox.Feature.Brush.Type.clear
            
            it("needs to check enum case jsonString") {
                expect(rectBrush.jsonString).to(equal(rectString.jsonString))
                expect(polygonBrush.jsonString).to(equal(polygonString.jsonString))
                expect(lineXBrush.jsonString).to(equal(lineXString.jsonString))
                expect(lineYBrush.jsonString).to(equal(lineYString.jsonString))
                expect(keepBrush.jsonString).to(equal(keepString.jsonString))
                expect(clearBrush.jsonString).to(equal(clearString.jsonString))
            }
        }
        
        let rectBrushIconValue = "brushIconRectValue"
        let polygonBrushIconValue = "brushIconPolygonValue"
        let lineXBrushIconValue = "brushIconLineXValue"
        let lineYBrushIconValue = "brushIconLineYValue"
        let keepBrushIconValue = "brushIconKeepValue"
        let clearBrushIconValue = "brushIconClearValue"
        
        let brushIcon = Toolbox.Feature.Brush.Icon()
        brushIcon.rect = rectBrushIconValue
        brushIcon.polygon = polygonBrushIconValue
        brushIcon.lineX = lineXBrushIconValue
        brushIcon.lineY = lineYBrushIconValue
        brushIcon.keep = keepBrushIconValue
        brushIcon.clear = clearBrushIconValue
        
        describe("For Toolbox.Feature.Brush.Icon") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "rect": rectBrushIconValue,
                    "polygon": polygonBrushIconValue,
                    "lineX": lineXBrushIconValue,
                    "lineY": lineYBrushIconValue,
                    "keep": keepBrushIconValue,
                    "clear": clearBrushIconValue
                ]
                
                expect(brushIcon.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let brushIconByEnums = Toolbox.Feature.Brush.Icon(
                    .rect(rectBrushIconValue),
                    .polygon(polygonBrushIconValue),
                    .lineX(lineXBrushIconValue),
                    .lineY(lineYBrushIconValue),
                    .keep(keepBrushIconValue),
                    .clear(clearBrushIconValue)
                )
                
                expect(brushIconByEnums.jsonString).to(equal(brushIcon.jsonString))
            }
        }
        
        let rectBrushTitleValue = "brushTitleRectValue"
        let polygonBrushTitleValue = "brushTitlePolygonValue"
        let lineXBrushTitleValue = "brushTitleLineXValue"
        let lineYBrushTitleValue = "brushTitleLineYValue"
        let keepBrushTitleValue = "brushTitleKeepValue"
        let clearBrushTitleValue = "brushTitleClearValue"
        
        let brushTitle = Toolbox.Feature.Brush.Title()
        brushTitle.rect = rectBrushTitleValue
        brushTitle.polygon = polygonBrushTitleValue
        brushTitle.lineX = lineXBrushTitleValue
        brushTitle.lineY = lineYBrushTitleValue
        brushTitle.keep = keepBrushTitleValue
        brushTitle.clear = clearBrushTitleValue
        
        describe("For Toolbox.Feature.Brush.Title") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "rect": rectBrushTitleValue,
                    "polygon": polygonBrushTitleValue,
                    "lineX": lineXBrushTitleValue,
                    "lineY": lineYBrushTitleValue,
                    "keep": keepBrushTitleValue,
                    "clear": clearBrushTitleValue
                ]
                
                expect(brushTitle.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let brushTitleByEnums = Toolbox.Feature.Brush.Title(
                    .rect(rectBrushTitleValue),
                    .polygon(polygonBrushTitleValue),
                    .lineX(lineXBrushTitleValue),
                    .lineY(lineYBrushTitleValue),
                    .keep(keepBrushTitleValue),
                    .clear(clearBrushTitleValue)
                )
                
                expect(brushTitleByEnums.jsonString).to(equal(brushTitle.jsonString))
            }
        }
        
        
        
        let typeBrushValue = [Toolbox.Feature.Brush.Type.rect, Toolbox.Feature.Brush.Type.polygon, Toolbox.Feature.Brush.Type.lineX, Toolbox.Feature.Brush.Type.lineY, Toolbox.Feature.Brush.Type.keep, Toolbox.Feature.Brush.Type.clear]
        let iconBrushValue = brushIcon
        let titleBrushValue = brushTitle
        
        let brush = Toolbox.Feature.Brush()
        brush.type = typeBrushValue
        brush.icon = iconBrushValue
        brush.title = titleBrushValue
        
        describe("For Toolbox.Feature.Brush") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": typeBrushValue,
                    "icon": iconBrushValue,
                    "title": titleBrushValue
                ]
                
                expect(brush.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let brushByEnums = Toolbox.Feature.Brush(
                    .type(typeBrushValue),
                    .icon(iconBrushValue),
                    .title(titleBrushValue)
                )
                
                expect(brushByEnums.jsonString).to(equal(brush.jsonString))
            }
        }
        
        let saveAsImageFeatureValue = saveAsImage
        let restoreFeatureValue = restore
        let dataViewFeatureValue = dataView
        let dataZoomFeatureValue = dataZoom
        let magicTypeFeatureValue = magicType
        let brushFeatureValue = brush
        
        let feature = Toolbox.Feature()
        feature.saveAsImage = saveAsImageFeatureValue
        feature.restore = restoreFeatureValue
        feature.dataView = dataViewFeatureValue
        feature.dataZoom = dataZoomFeatureValue
        feature.magicType = magicTypeFeatureValue
        feature.brush = brushFeatureValue
        
        describe("For Toolbox.Feature") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "saveAsImage": saveAsImageFeatureValue,
                    "restore": restoreFeatureValue,
                    "dataView": dataViewFeatureValue,
                    "dataZoom": dataZoomFeatureValue,
                    "magicType": magicTypeFeatureValue,
                    "brush": brushFeatureValue
                ]
                
                expect(feature.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let featureByEnums = Toolbox.Feature(
                    .saveAsImage(saveAsImageFeatureValue),
                    .restore(restoreFeatureValue),
                    .dataView(dataViewFeatureValue),
                    .dataZoom(dataZoomFeatureValue),
                    .magicType(magicTypeFeatureValue),
                    .brush(brushFeatureValue)
                )
                
                expect(featureByEnums.jsonString).to(equal(feature.jsonString))
            }
        }
        
        describe("For Toolbox") {
            let showValue = false
            let orientValue = Orient.vertical
            let itemSizeValue: Float = 0.57236
            let itemGapValue: Float = 85.347
            let showTitleValue = true
            let featureValue = feature
            let iconStyleValue = Toolbox.IconStyle()
            let zlevelValue: Float = 10
            let zValue: Float = -1
            let leftValue = Position.right
            let rightValue = Position.left
            let topValue = Position.bottom
            let bottomValue = Position.top
            let widthValue: Float = 100
            let heightValue: Float = 8.34764
            
            let toolbox = Toolbox()
            toolbox.show = showValue
            toolbox.orient = orientValue
            toolbox.itemSize = itemSizeValue
            toolbox.itemGap = itemGapValue
            toolbox.showTitle = showTitleValue
            toolbox.feature = featureValue
            toolbox.iconStyle = iconStyleValue
            toolbox.zlevel = zlevelValue
            toolbox.z = zValue
            toolbox.left = leftValue
            toolbox.top = topValue
            toolbox.right = rightValue
            toolbox.bottom = bottomValue
            toolbox.width = widthValue
            toolbox.height = heightValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showValue,
                    "orient": orientValue,
                    "itemSize": itemSizeValue,
                    "itemGap": itemGapValue,
                    "showTitle": showTitleValue,
                    "feature": featureValue,
                    "iconStyle": iconStyleValue,
                    "zlevel": zlevelValue,
                    "z": zValue,
                    "left": leftValue,
                    "top": topValue,
                    "right": rightValue,
                    "bottom": bottomValue,
                    "width": widthValue,
                    "height": heightValue
                ]
                
                expect(toolbox.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let toolboxByEnums = Toolbox(
                    .show(showValue),
                    .orient(orientValue),
                    .itemSize(itemSizeValue),
                    .itemGap(itemGapValue),
                    .showTitle(showTitleValue),
                    .feature(featureValue),
                    .iconStyle(iconStyleValue),
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .left(leftValue),
                    .top(topValue),
                    .right(rightValue),
                    .bottom(bottomValue),
                    .width(widthValue),
                    .height(heightValue)
                )
                
                expect(toolboxByEnums.jsonString).to(equal(toolbox.jsonString))
            }
        }
    }
}
