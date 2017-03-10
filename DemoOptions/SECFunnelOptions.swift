//
//  SECFunnelOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public struct SECFunnelOptions {
    
    // MARK: 漏斗图(对比)
    /// 地址: http://echarts.baidu.com/demo.html#funnel-align
    static func unnelAlignOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
            .title(SECTitle(
                .text("漏斗图(对比)"),
                .subtext("纯属虚构"),
                .left(.left),
                .top(.bottom)
                )),
            .tooltip(SECTooltip(
                .trigger(.item),
                .formatter(.string("{a} <br/>{b} : {c}%"))
                )),
            .toolbox(SECToolbox(
                .show(true),
                .orient(.vertical),
                .top(.center),
                .feature(SECTFeature(
                    .dataView(SECTFDataView(
                        .readOnly(false)
                        )),
                    .restore(SECTFRestore()),
                    .saveAsImage(SECTFSaveAsImage())
                    ))
                )),
            .legend(SECLegend(
                .orient(.vertical),
                .left(.left),
                .data(["产品A","产品B","产品C","产品D","产品E"])
                )),
            .series([
                SECFunnelSerie(
                    .name("漏斗图"),
                    .funnelAlign(.right),
                    .data([
                        ["value":60, "name":"产品C"],
                        ["value":30, "name":"产品D"],
                        ["value":10, "name":"产品E"],
                        ["value":80, "name":"产品B"],
                        ["value":100, "name":"产品A"]
                        ])
                ),
                SECFunnelSerie(
                    .name("金字塔"),
                    .sort(.ascending),
                    .funnelAlign(.right),
                    .data([
                        ["value":60, "name":"产品C"],
                        ["value":30, "name":"产品D"],
                        ["value":10, "name":"产品E"],
                        ["value":80, "name":"产品B"],
                        ["value":100, "name":"产品A"]
                        ])
                ),
                SECFunnelSerie(
                    .name("漏斗图"),
                    .funnelAlign(.right),
                    .data([
                        ["value":60, "name":"产品C"],
                        ["value":30, "name":"产品D"],
                        ["value":10, "name":"产品E"],
                        ["value":80, "name":"产品B"],
                        ["value":100, "name":"产品A"]
                        ])
                ),
                SECFunnelSerie(
                    .name("金字塔"),
                    .sort(.ascending),
                    .funnelAlign(.right),
                    .data([
                        ["value":60, "name":"产品C"],
                        ["value":30, "name":"产品D"],
                        ["value":10, "name":"产品E"],
                        ["value":80, "name":"产品B"],
                        ["value":100, "name":"产品A"]
                        ])
                )
            ])
        )
    }
    
    // MARK: 漏斗图
    /// 地址: http://echarts.baidu.com/demo.html#funnel-customize
    static func funnelCustomizeOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
            .title(SECTitle(
                .text("漏斗图"),
                .subtext("纯属虚构")
                )),
            .tooltip(SECTooltip(
                .trigger(.item),
                .formatter(.string("{a} <br/>{b} : {c}%"))
                )),
            .toolbox(SECToolbox(
                .feature(SECTFeature(
                    .dataView(SECTFDataView(
                        .readOnly(false)
                        )),
                    .restore(SECTFRestore()),
                    .saveAsImage(SECTFSaveAsImage())
                    ))
                )),
            .legend(SECLegend(
                .data(["展现","点击","访问","咨询","订单"])
                )),
            .series([
                SECFunnelSerie(
                    .name("预期"),
                    .maxSize(80%),
                    .label(SECFormattedLabel(
                        .normal(SECFormattedLabelStyle(
                            .formatter(.string("{b}预期"))
                            )),
                        .emphasis(SECFormattedLabelStyle(
                            .position(.inside),
                            .formatter(.string("{b}预期: {c}%"))
                            ))
                        )),
                    .labelLine(SECFunnelSerie.LabelLine(
                        .normal(SECFunnelSerie.LabelLineContent(
                            .show(false)
                            ))
                        )),
                    .itemStyle(SECItemStyle(
                        .normal(SECCommonItemStyleContent(
                            .opacity(0.7)
                            ))
                        )),
                    .data([
                        ["value":60, "name":"访问"],
                        ["value":40, "name":"咨询"],
                        ["value":20, "name":"订单"],
                        ["value":80, "name":"点击"],
                        ["value":100, "name":"展现"]
                        ])
                ),
                SECFunnelSerie(
                    .name("实际"),
                    .maxSize(80%),
                    .label(SECFormattedLabel(
                        .normal(SECFormattedLabelStyle(
                            .position(.inside),
                            .formatter(.string("{c}%")),
                            .textStyle(SECTextStyle(
                                .color(.hexColor("#fff"))
                                ))
                            )),
                        .emphasis(SECFormattedLabelStyle(
                            .position(.inside),
                            .formatter(.string("{b}实际: {c}%"))
                            ))
                        )),
                    .itemStyle(SECItemStyle(
                        .normal(SECCommonItemStyleContent(
                            .opacity(0.5),
                            .borderColor(.hexColor("#fff")),
                            .borderWidth(2)
                            ))
                        )),
                    .data([
                        ["value":30, "name":"访问"],
                        ["value":10, "name":"咨询"],
                        ["value":5, "name":"订单"],
                        ["value":50, "name":"点击"],
                        ["value":80, "name":"展现"]
                        ])
                )
            ])
            
        )
    }
    
    // MARK: 漏斗图
    /// 地址: http://echarts.baidu.com/demo.html#funnel-mutiple
    static func funnelMutipleOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
            .title(SECTitle(
                .text("漏斗图"),
                .subtext("纯属虚构"),
                .left(.left),
                .top(.bottom)
                )),
            .tooltip(SECTooltip(
                .trigger(.item),
                .formatter(.string("{a} <br/>{b} : {c}%"))
                )),
            .toolbox(SECToolbox(
                .orient(.vertical),
                .top(.center),
                .feature(SECTFeature(
                    .dataView(SECTFDataView(
                        .readOnly(false)
                        )),
                    .restore(SECTFRestore()),
                    .saveAsImage(SECTFSaveAsImage())
                    ))
                )),
            .legend(SECLegend(
                .orient(.vertical),
                .left(.left),
                .data(["展现","点击","访问","咨询","订单"])
                )),
            .series([
                SECFunnelSerie(
                    .name("漏斗图"),
                    .data([
                        ["value":60, "name":"访问"],
                        ["value":30, "name":"咨询"],
                        ["value":10, "name":"订单"],
                        ["value":80, "name":"点击"],
                        ["value":100, "name":"展现"]
                        ])
                ),
                SECFunnelSerie(
                    .name("金字塔"),
                    .sort(.ascending),
                    .data([
                        ["value":60, "name":"访问"],
                        ["value":30, "name":"咨询"],
                        ["value":10, "name":"订单"],
                        ["value":80, "name":"点击"],
                        ["value":100, "name":"展现"]
                        ])
                ),
                SECFunnelSerie(
                    .name("漏斗图"),
                    .label(SECFormattedLabel(
                        .normal(SECFormattedLabelStyle(
                            .position(.left)
                            ))
                        )),
                    .data([
                        ["value":60, "name":"访问"],
                        ["value":30, "name":"咨询"],
                        ["value":10, "name":"订单"],
                        ["value":80, "name":"点击"],
                        ["value":100, "name":"展现"]
                        ])
                ),
                SECFunnelSerie(
                    .name("金字塔"),
                    .sort(.ascending),
                    .label(SECFormattedLabel(
                        .normal(SECFormattedLabelStyle(
                            .position(.left)
                            ))
                        )),
                    .data([
                        ["value":60, "name":"访问"],
                        ["value":30, "name":"咨询"],
                        ["value":10, "name":"订单"],
                        ["value":80, "name":"点击"],
                        ["value":100, "name":"展现"]
                        ])
                )
            ])
        )
    }
    
    // MARK: 漏斗图
    /// 地址: http://echarts.baidu.com/demo.html#funnel
    static func funnelOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
            .title(SECTitle(
                .text("漏斗图"),
                .subtext("纯属虚构")
                )),
            .tooltip(SECTooltip(
                .trigger(.item),
                .formatter(.string("{a} <br/>{b} : {c}%"))
                )),
            .toolbox(SECToolbox(
                .feature(SECTFeature(
                    .dataView(SECTFDataView(
                        .readOnly(false)
                        )),
                    .restore(SECTFRestore()),
                    .saveAsImage(SECTFSaveAsImage())
                    ))
                )),
            .legend(SECLegend(
                .data(["展现","点击","访问","咨询","订单"])
                )),
            .series([
                SECFunnelSerie(
                    .name("漏斗图"),
                    .min(0),
                    .max(100),
                    .minSize(0%),
                    .maxSize(100%),
                    .sort(.descending),
                    .gap(2),
                    .label(SECFormattedLabel(
                        .normal(SECFormattedLabelStyle(
                            .show(true),
                            .position(.inside)
                            )),
                        .emphasis(SECFormattedLabelStyle(
                            .textStyle(SECTextStyle(
                                .fontSize(20)
                                ))
                            ))
                        )),
                    .labelLine(SECFunnelSerie.LabelLine(
                        .normal(SECFunnelSerie.LabelLineContent(
                            .length(10),
                            .lineStyle(SECLineStyle(
                                .width(1),
                                .type(.solid)
                                ))
                            ))
                        )),
                    .itemStyle(SECItemStyle(
                        .normal(SECCommonItemStyleContent(
                            .borderColor(.hexColor("#fff")),
                            .borderWidth(1)
                            ))
                        )),
                    .data([
                        ["value":60, "name":"访问"],
                        ["value":40, "name":"咨询"],
                        ["value":20, "name":"订单"],
                        ["value":80, "name":"点击"],
                        ["value":100, "name":"展现"]
                        ])
                )
            ])
        )
    }
}
