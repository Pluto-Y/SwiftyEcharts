//
//  PiesControllerViewController.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 25/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import UIKit

class PiesController: BaseDemoController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus = ["Customized Pie", "环形图", "嵌套环形图", "饼图纹理", "某站点用户访问来源", "南丁格尔玫瑰图", "富文本标签", "可滚动的图例(暂无)"]
        
        optionClosures = [PieOptions.pieCustomOption, PieOptions.pieDoughnutOption, PieOptions.pieNestOption, PieOptions.piePatternOption, PieOptions.pieSimpleOption, PieOptions.pieRoseTypeOption, PieOptions.pieRichTextOption, PieOptions.pieLegendOption]

        self.title = "饼图"
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        super.tableView(tableView, didSelectRowAtIndexPath: indexPath)
        if indexPath.row == 4 {
            echartsView.addListener(for: .click, with: { (params) in
                print("params: \(params)")
            })
        }
    }
    
}
