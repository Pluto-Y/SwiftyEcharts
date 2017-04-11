//
//  SankeyOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public struct SankeyOptions {
    
    // MARK: Sankey Diagram
    /// 地址: http://echarts.baidu.com/demo.html#sankey-energy
    static func sankeyEnergyOption() -> Option {
        let datas: [Jsonable] = [
            ["name": "Total"],
            ["name": "Environment"],
            ["name": "Land use"],
            ["name": "Cocoa butter (Organic)"],
            ["name": "Cocoa mass (Organic)"],
            ["name": "Hazelnuts (Organic)"],
            ["name": "Cane sugar (Organic)"],
            ["name": "Vegetables (Organic)"],
            ["name": "Climate change"],
            ["name": "Harmful substances"],
            ["name": "Water use"],
            ["name": "Resource depletion"],
            ["name": "Refrigeration"],
            ["name": "Packaging"],
            ["name": "Human rights"],
            ["name": "Child labour"],
            ["name": "Coconut oil (Organic)"],
            ["name": "Forced labour"],
            ["name": "Health safety"],
            ["name": "Access to water"],
            ["name": "Freedom of association"],
            ["name": "Access to land"],
            ["name": "Sufficient wage"],
            ["name": "Equal rights migrants"],
            ["name": "Discrimination"],
            ["name": "Working hours"]
        ]
        let links: [Jsonable] = [
            ["source": "Total", "target": "Environment", "value": 0.342284047256003],
            ["source": "Environment", "target": "Land use", "value": 0.32322870366987],
            ["source": "Land use", "target": "Cocoa butter (Organic)", "value": 0.177682517071359],
            ["source": "Land use", "target": "Cocoa mass (Organic)", "value": 0.137241325342711],
            ["source": "Land use", "target": "Hazelnuts (Organic)", "value": 0.00433076373512774],
            ["source": "Land use", "target": "Cane sugar (Organic)", "value": 0.00296956039863467],
            ["source": "Land use", "target": "Vegetables (Organic)", "value": 0.00100453712203756],
            ["source": "Environment", "target": "Climate change", "value": 0.0112886157414413],
            ["source": "Climate change", "target": "Cocoa butter (Organic)", "value": 0.00676852971933996],
            ["source": "Climate change", "target": "Cocoa mass (Organic)", "value": 0.00394686874786743],
            ["source": "Climate change", "target": "Cane sugar (Organic)", "value": 0.000315972058711838],
            ["source": "Climate change", "target": "Hazelnuts (Organic)", "value": 0.000218969462265292],
            ["source": "Climate change", "target": "Vegetables (Organic)", "value": 3.82757532567656e-05],
            ["source": "Environment", "target": "Harmful substances", "value": 0.00604275542495656],
            ["source": "Harmful substances", "target": "Cocoa mass (Organic)", "value": 0.0055125989240741],
            ["source": "Harmful substances", "target": "Cocoa butter (Organic)", "value": 0.000330017607892127],
            ["source": "Harmful substances", "target": "Cane sugar (Organic)", "value": 0.000200138892990337],
            ["source": "Harmful substances", "target": "Hazelnuts (Organic)", "value": 0],
            ["source": "Harmful substances", "target": "Vegetables (Organic)", "value": 0],
            ["source": "Environment", "target": "Water use", "value": 0.00148345269044703],
            ["source": "Water use", "target": "Cocoa butter (Organic)", "value": 0.00135309891304186],
            ["source": "Water use", "target": "Cocoa mass (Organic)", "value": 0.000105714137908639],
            ["source": "Water use", "target": "Hazelnuts (Organic)", "value": 1.33452642581887e-05],
            ["source": "Water use", "target": "Cane sugar (Organic)", "value": 8.78074837009238e-06],
            ["source": "Water use", "target": "Vegetables (Organic)", "value": 2.5136268682477e-06],
            ["source": "Environment", "target": "Resource depletion", "value": 0.000240519729288764],
            ["source": "Resource depletion", "target": "Cane sugar (Organic)", "value": 0.000226237279345084],
            ["source": "Resource depletion", "target": "Vegetables (Organic)", "value": 1.42824499436793e-05],
            ["source": "Resource depletion", "target": "Hazelnuts (Organic)", "value": 0],
            ["source": "Resource depletion", "target": "Cocoa mass (Organic)", "value": 0],
            ["source": "Resource depletion", "target": "Cocoa butter (Organic)", "value": 0],
            ["source": "Environment", "target": "Refrigeration", "value": 0],
            ["source": "Environment", "target": "Packaging", "value": 0],
            ["source": "Total", "target": "Human rights", "value": 0.307574096993239],
            ["source": "Human rights", "target": "Child labour", "value": 0.0410641202645833],
            ["source": "Child labour", "target": "Hazelnuts (Organic)", "value": 0.0105339381639722],
            ["source": "Child labour", "target": "Cocoa mass (Organic)", "value": 0.0105],
            ["source": "Child labour", "target": "Cocoa butter (Organic)", "value": 0.0087294420777],
            ["source": "Child labour", "target": "Coconut oil (Organic)", "value": 0.00474399974233333],
            ["source": "Child labour", "target": "Cane sugar (Organic)", "value": 0.00388226450884445],
            ["source": "Child labour", "target": "Vegetables (Organic)", "value": 0.00267447577173333],
            ["source": "Human rights", "target": "Forced labour", "value": 0.0365458590642445],
            ["source": "Forced labour", "target": "Hazelnuts (Organic)", "value": 0.0114913076376389],
            ["source": "Forced labour", "target": "Cocoa butter (Organic)", "value": 0.0081134807347],
            ["source": "Forced labour", "target": "Cocoa mass (Organic)", "value": 0.00765230236575],
            ["source": "Forced labour", "target": "Cane sugar (Organic)", "value": 0.004],
            ["source": "Forced labour", "target": "Vegetables (Organic)", "value": 0.00296668823626667],
            ["source": "Forced labour", "target": "Coconut oil (Organic)", "value": 0.00232208008988889],
            ["source": "Human rights", "target": "Health safety", "value": 0.0345435327843611],
            ["source": "Health safety", "target": "Hazelnuts (Organic)", "value": 0.0121419536385],
            ["source": "Health safety", "target": "Cocoa mass (Organic)", "value": 0.00766772850678333],
            ["source": "Health safety", "target": "Cocoa butter (Organic)", "value": 0.0056245892061],
            ["source": "Health safety", "target": "Coconut oil (Organic)", "value": 0.00361616847688889],
            ["source": "Health safety", "target": "Cane sugar (Organic)", "value": 0.00277374682533333],
            ["source": "Health safety", "target": "Vegetables (Organic)", "value": 0.00271934613075556],
            ["source": "Human rights", "target": "Access to water", "value": 0.0340206659360667],
            ["source": "Access to water", "target": "Cocoa mass (Organic)", "value": 0.0105],
            ["source": "Access to water", "target": "Cocoa butter (Organic)", "value": 0.0089274160792],
            ["source": "Access to water", "target": "Hazelnuts (Organic)", "value": 0.0054148022845],
            ["source": "Access to water", "target": "Cane sugar (Organic)", "value": 0.00333938149786667],
            ["source": "Access to water", "target": "Vegetables (Organic)", "value": 0.00314663377488889],
            ["source": "Access to water", "target": "Coconut oil (Organic)", "value": 0.00269243229961111],
            ["source": "Human rights", "target": "Freedom of association", "value": 0.0320571523941667],
            ["source": "Freedom of association", "target": "Hazelnuts (Organic)", "value": 0.0132312483463611],
            ["source": "Freedom of association", "target": "Cocoa butter (Organic)", "value": 0.0077695200707],
            ["source": "Freedom of association", "target": "Cocoa mass (Organic)", "value": 0.00510606573995],
            ["source": "Freedom of association", "target": "Vegetables (Organic)", "value": 0.00354321156324444],
            ["source": "Freedom of association", "target": "Cane sugar (Organic)", "value": 0.00240710667391111],
            ["source": "Freedom of association", "target": "Coconut oil (Organic)", "value": 0],
            ["source": "Human rights", "target": "Access to land", "value": 0.0315022209894056],
            ["source": "Access to land", "target": "Hazelnuts (Organic)", "value": 0.00964970063322223],
            ["source": "Access to land", "target": "Cocoa mass (Organic)", "value": 0.00938530207965],
            ["source": "Access to land", "target": "Cocoa butter (Organic)", "value": 0.0060110791848],
            ["source": "Access to land", "target": "Cane sugar (Organic)", "value": 0.00380818314608889],
            ["source": "Access to land", "target": "Vegetables (Organic)", "value": 0.00264795594564445],
            ["source": "Access to land", "target": "Coconut oil (Organic)", "value": 0],
            ["source": "Human rights", "target": "Sufficient wage", "value": 0.0287776757227333],
            ["source": "Sufficient wage", "target": "Cocoa mass (Organic)", "value": 0.00883512456493333],
            ["source": "Sufficient wage", "target": "Cocoa butter (Organic)", "value": 0.0078343367268],
            ["source": "Sufficient wage", "target": "Coconut oil (Organic)", "value": 0.00347879026511111],
            ["source": "Sufficient wage", "target": "Hazelnuts (Organic)", "value": 0.00316254211388889],
            ["source": "Sufficient wage", "target": "Vegetables (Organic)", "value": 0.00281013722808889],
            ["source": "Sufficient wage", "target": "Cane sugar (Organic)", "value": 0.00265674482391111],
            ["source": "Human rights", "target": "Equal rights migrants", "value" : 0.0271146645119444],
            ["source": "Equal rights migrants", "target": "Cocoa butter (Organic)", "value": 0.0071042315061],
            ["source": "Equal rights migrants", "target": "Cocoa mass (Organic)", "value": 0.00636673210005],
            ["source": "Equal rights migrants", "target": "Hazelnuts (Organic)", "value": 0.00601459775836111],
            ["source": "Equal rights migrants", "target": "Coconut oil (Organic)", "value": 0.00429185583138889],
            ["source": "Equal rights migrants", "target": "Cane sugar (Organic)", "value": 0.00182647471915556],
            ["source": "Equal rights migrants", "target": "Vegetables (Organic)", "value": 0.00151077259688889],
            ["source": "Human rights", "target": "Discrimination", "value": 0.0211217763359833],
            ["source": "Discrimination", "target": "Cocoa mass (Organic)", "value": 0.00609671700306667],
            ["source": "Discrimination", "target": "Cocoa butter (Organic)", "value": 0.0047738806325],
            ["source": "Discrimination", "target": "Coconut oil (Organic)", "value": 0.00368119084494444],
            ["source": "Discrimination", "target": "Vegetables (Organic)", "value": 0.00286009813604444],
            ["source": "Discrimination", "target": "Cane sugar (Organic)", "value": 0.00283706180951111],
            ["source": "Discrimination", "target": "Hazelnuts (Organic)", "value": 0.000872827909916666],
            ["source": "Human rights", "target": "Working hours", "value": 0.02082642898975],
            ["source": "Working hours", "target": "Hazelnuts (Organic)", "value": 0.0107216773848333],
            ["source": "Working hours", "target": "Coconut oil (Organic)", "value": 0.00359009052944444],
            ["source": "Working hours", "target": "Vegetables (Organic)", "value": 0.00212300379075556],
            ["source": "Working hours", "target": "Cocoa butter (Organic)", "value": 0.0018518584356],
            ["source": "Working hours", "target": "Cocoa mass (Organic)", "value": 0.00158227069058333],
            ["source": "Working hours", "target": "Cane sugar (Organic)", "value": 0.000957528158533333]
        ]
        return Option(
            .title(Title(
                .text("Sankey Diagram")
                )),
            .tooltip(Tooltip(
                .trigger(.item),
                .triggerOn(.mousemove)
                )),
            .series([
                SankeySerie( // FIXME: layout 好像没有什么效果
                    .data(datas),
                    .links(links),
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
                            .borderWidth(1),
                            .borderColor(.hexColor("#aaa"))
                            ))
                        )),
                    .lineStyle(EmphasisLineStyle(
                        .normal(LineStyle(
                            .curveness(0.5)
                            ))
                        ))
                )
                ])
        )
    }
    
    // MARK: Sankey Diagram
    /// 地址: http://echarts.baidu.com/demo.html#sankey-product
    static func sankeyProductOption() -> Option {
        let datas: [Jsonable] = [
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
        let links: [Jsonable] = [
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
        return Option(
            .title(Title(
                .text("Sankey Diagram")
                )),
            .tooltip(Tooltip(
                .trigger(.item),
                .triggerOn(.mousemove)
                )),
            .series([
                SankeySerie( // FIXME: layout 好像没有什么效果
                    .data(datas),
                    .links(links),
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
                            .borderWidth(1),
                            .borderColor(.hexColor("#aaa"))
                            ))
                        )),
                    .lineStyle(EmphasisLineStyle(
                        .normal(LineStyle(
                            .curveness(0.5)
                            ))
                        ))
                )
                ])
        )
    }
}
