//
//  LinesController.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 25/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import UIKit
import SwiftyEcharts

class LinesController: BaseDemoController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        option = SECLineOptions.lineLogOption()
        
        menus = ["雨量流量关系图", "大数据量面积图(暂缺)", "堆叠区域图", "Confidence Band(暂缺)", "动态数据 + 时间坐标轴(暂缺)", "雨量流量关系图", "Beijing AQI(暂缺)", "Try Dragging these Points(暂缺)", "Different Easing Functions(暂缺)", "对数轴示例", "未来一周气温变化", "Click to Add Points(暂缺)", "极坐标双数值轴", "极坐标双数值轴", "一天用电量分布", "折线图堆叠", "Step Line", "高度(km)与气温(°C)变化关系"]
        
        self.title = "折线图"
        
    }
    
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0: // 雨量流量关系图
            option = SECLineOptions.areaRainfallOption()
        case 1: // 大数据量面积图
            option = SECLineOptions.areaSimpleOption()
        case 2: // 堆叠区域图
            option = SECLineOptions.areaStackOption()
        case 3: // Confidence Band
            option = SECLineOptions.confidenceBandOption()
        case 4: // 动态数据 + 时间坐标轴
            option = SECLineOptions.dynamicData2Option()
        case 5: // 雨量流量关系图
            option = SECLineOptions.gridMultipleOption()
        case 6: // Beijing AQI
            option = SECLineOptions.lineApiOption()
        case 7: // Try Dragging these Points
            option = SECLineOptions.lineDraggableOption()
        case 8: // Different Easing Functions
            option = SECLineOptions.lineEasingOption()
        case 9: // 对数轴示例
            option = SECLineOptions.lineLogOption()
        case 10: // 未来一周气温变化
            option = SECLineOptions.lineMarkerOption()
        case 11: // Click to Add Points
            option = SECLineOptions.linePenOption()
        case 12: // 极坐标双数值轴
            option = SECLineOptions.linePolarOption()
        case 13: // 极坐标双数值轴
            option = SECLineOptions.linePolar2Option()
        case 14: // 一天用电量分布
            option = SECLineOptions.lineSectionsOption()
        case 15: // 折线图堆叠
            option = SECLineOptions.lineStackOption()
        case 16: // Step Line
            option = SECLineOptions.lineStepOption()
        case 17: // 高度(km)与气温(°C)变化关系
            option = SECLineOptions.lineYCategory()
        default:
            option = SECOption()
        }
    }
}
