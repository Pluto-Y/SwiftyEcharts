//
//  PiesControllerViewController.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 25/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import UIKit
import SwiftyEcharts

class PiesController: BaseDemoController {
    
    private var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus = ["Customized Pie", "环形图", "嵌套环形图", "饼图纹理", "某站点用户访问来源", "南丁格尔玫瑰图", "富文本标签", "可滚动的图例(暂无)"]
        
        optionClosures = [PieOptions.pieCustomOption, PieOptions.pieDoughnutOption, PieOptions.pieNestOption, PieOptions.piePatternOption, PieOptions.pieSimpleOption, PieOptions.pieRoseTypeOption, PieOptions.pieRichTextOption, PieOptions.pieLegendOption]

        self.title = "饼图"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        if indexPath.row == 4 {
            
            if let _ = timer {
                self.timer?.invalidate()
                self.timer = nil
            }
            timer = Timer(timeInterval: 1.0, target: self, selector: #selector(self.dispatchAction), userInfo: nil, repeats: true)
            RunLoop.current.add(timer!, forMode: .commonModes)
//            echartsView.addListener(for: .click, with: { (params) in
//                print("params: \(params)")
//            })
        }
    }
    
    var currentIndex: Int = -1
    internal func dispatchAction() {
        let dataLen = (option.series![0] as! PieSerie).data!.count
        echartsView.dispatchAction(DownplayAction(
            .seriesIndex(0),
            .dataIndex(currentIndex)
            ))
        currentIndex = (currentIndex + 1) % dataLen
        echartsView.dispatchAction(HighlightAction(
            .seriesIndex(0),
            .dataIndex(currentIndex)
            ))
        echartsView.dispatchAction(Tooltip.ShowTipAction(
            .seriesIndex(0),
            .dataIndex(currentIndex)
            ))
    }
    
}
