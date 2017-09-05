//
//  FunnelOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public final class FunnelOptions {
    
    // MARK: 漏斗图(对比)
    /// 地址: http://echarts.baidu.com/demo.html#funnel-align
    static func unnelAlignOption() -> Option {
        return Option(
            .title(Title(
                .text("漏斗图(对比)"),
                .subtext("纯属虚构"),
                .left(.left),
                .top(.bottom)
                )),
            .tooltip(Tooltip(
                .trigger(.item),
                .formatter(.string("{a} <br/>{b} : {c}%"))
                )),
            .toolbox(Toolbox(
                .show(true),
                .orient(.vertical),
                .top(.center),
                .feature(ToolboxFeature(
                    .dataView(ToolboxFeatureDataView(
                        .readOnly(false)
                        )),
                    .restore(ToolboxFeatureRestore()),
                    .saveAsImage(ToolboxFeatureSaveAsImage())
                    ))
                )),
            .legend(Legend(
                .orient(.vertical),
                .left(.left),
                .data(["产品A","产品B","产品C","产品D","产品E"])
                )),
            .series([
                FunnelSerie(
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
                FunnelSerie(
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
                FunnelSerie(
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
                FunnelSerie(
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
    static func funnelCustomizeOption() -> Option {
        return Option(
            .title(Title(
                .text("漏斗图"),
                .subtext("纯属虚构")
                )),
            .tooltip(Tooltip(
                .trigger(.item),
                .formatter(.string("{a} <br/>{b} : {c}%"))
                )),
            .toolbox(Toolbox(
                .feature(ToolboxFeature(
                    .dataView(ToolboxFeatureDataView(
                        .readOnly(false)
                        )),
                    .restore(ToolboxFeatureRestore()),
                    .saveAsImage(ToolboxFeatureSaveAsImage())
                    ))
                )),
            .legend(Legend(
                .data(["展现","点击","访问","咨询","订单"])
                )),
            .series([
                FunnelSerie(
                    .name("预期"),
                    .maxSize(80%),
                    .label(EmphasisLabel(
                        .normal(LabelStyle(
                            .formatter(.string("{b}预期"))
                            )),
                        .emphasis(LabelStyle(
                            .position(.inside),
                            .formatter(.string("{b}预期: {c}%"))
                            ))
                        )),
                    .labelLine(FunnelSerie.LabelLine(
                        .normal(FunnelSerie.LabelLineContent(
                            .show(false)
                            ))
                        )),
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
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
                FunnelSerie(
                    .name("实际"),
                    .maxSize(80%),
                    .label(EmphasisLabel(
                        .normal(LabelStyle(
                            .position(.inside),
                            .formatter(.string("{c}%")),
                            .color(.hexColor("#fff"))
                            )),
                        .emphasis(LabelStyle(
                            .position(.inside),
                            .formatter(.string("{b}实际: {c}%"))
                            ))
                        )),
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
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
    static func funnelMutipleOption() -> Option {
        return Option(
            .title(Title(
                .text("漏斗图"),
                .subtext("纯属虚构"),
                .left(.left),
                .top(.bottom)
                )),
            .tooltip(Tooltip(
                .trigger(.item),
                .formatter(.string("{a} <br/>{b} : {c}%"))
                )),
            .toolbox(Toolbox(
                .orient(.vertical),
                .top(.center),
                .feature(ToolboxFeature(
                    .dataView(ToolboxFeatureDataView(
                        .readOnly(false)
                        )),
                    .restore(ToolboxFeatureRestore()),
                    .saveAsImage(ToolboxFeatureSaveAsImage())
                    ))
                )),
            .legend(Legend(
                .orient(.vertical),
                .left(.left),
                .data(["展现","点击","访问","咨询","订单"])
                )),
            .series([
                FunnelSerie(
                    .name("漏斗图"),
                    .data([
                        ["value":60, "name":"访问"],
                        ["value":30, "name":"咨询"],
                        ["value":10, "name":"订单"],
                        ["value":80, "name":"点击"],
                        ["value":100, "name":"展现"]
                        ])
                ),
                FunnelSerie(
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
                FunnelSerie(
                    .name("漏斗图"),
                    .label(EmphasisLabel(
                        .normal(LabelStyle(
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
                FunnelSerie(
                    .name("金字塔"),
                    .sort(.ascending),
                    .label(EmphasisLabel(
                        .normal(LabelStyle(
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
    static func funnelOption() -> Option {
        return Option(
            .title(Title(
                .text("漏斗图"),
                .subtext("纯属虚构")
                )),
            .tooltip(Tooltip(
                .trigger(.item),
                .formatter(.string("{a} <br/>{b} : {c}%"))
                )),
            .toolbox(Toolbox(
                .feature(ToolboxFeature(
                    .dataView(ToolboxFeatureDataView(
                        .readOnly(false)
                        )),
                    .restore(ToolboxFeatureRestore()),
                    .saveAsImage(ToolboxFeatureSaveAsImage())
                    ))
                )),
            .legend(Legend(
                .data(["展现","点击","访问","咨询","订单"])
                )),
            .series([
                FunnelSerie(
                    .name("漏斗图"),
                    .min(0),
                    .max(100),
                    .minSize(0%),
                    .maxSize(100%),
                    .sort(.descending),
                    .gap(2),
                    .label(EmphasisLabel(
                        .normal(LabelStyle(
                            .show(true),
                            .position(.inside)
                            )),
                        .emphasis(LabelStyle(
                            .fontSize(20)
                            ))
                        )),
                    .labelLine(FunnelSerie.LabelLine(
                        .normal(FunnelSerie.LabelLineContent(
                            .length(10),
                            .lineStyle(LineStyle(
                                .width(1),
                                .type(.solid)
                                ))
                            ))
                        )),
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
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
