//
//  ViewController.swift
//  iOS_Example
//
//  Created by Pluto Y on 25/11/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//

import UIKit
import SwiftyEcharts

class MenuController : UITableViewController {

    var echartsView: EchartsView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0: // 散点图
            self.navigationController?.pushViewController(ScattersController(), animated: true)
        case 1: // 折线图
            self.navigationController?.pushViewController(LinesController(), animated: true)
        case 2: // 柱状图
            self.navigationController?.pushViewController(BarsController(), animated: true)
        case 3: // 地图
            self.navigationController?.pushViewController(MapsController(), animated: true)
        case 4: // 饼图的Demo
            self.navigationController?.pushViewController(PiesController(), animated: true)
        case 5: // 雷达图
            self.navigationController?.pushViewController(RadarsController(), animated: true)
        case 6: // k线图
            self.navigationController?.pushViewController(CandlesticksController(), animated: true)
        case 7: // 箱线图
            self.navigationController?.pushViewController(BoxplotsControllers(), animated: true)
        case 8: // 桑基图
            self.navigationController?.pushViewController(SankeysController(), animated: true)
        case 9: // 漏斗图
            self.navigationController?.pushViewController(FunnelController(), animated: true)
        case 10: // 仪表盘
            self.navigationController?.pushViewController(GaugesController(), animated: true)
        case 11: // 象形柱图
            self.navigationController?.pushViewController(PictorialBarsController(), animated: true)
        case 12: // 主题河流图
            self.navigationController?.pushViewController(ThemeRiversController(), animated: true)
        default:
            print("敬请期待...")
        }
    }

}

