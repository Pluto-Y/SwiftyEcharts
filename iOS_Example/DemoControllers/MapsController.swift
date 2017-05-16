//
//  MapsController.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 15/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import UIKit
import SwiftyEcharts

class MapsController: BaseDemoController {
    
    fileprivate var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus = ["模拟迁徙", "65k+ 飞机航线", "北京公交路线 - 百度地图(暂缺)", "北京公交路线 - 线特效(暂缺)", "杭州热门步行路线 - 百度地图(暂缺)", "iPhone销量", "Map China", "香港18区人口密度 （2011）(暂缺)", "Map Locate(暂缺)", "34 省切换查看(暂缺)", "USA Population Estimates (2012)(暂缺)", "World Population (2010)", "map and scatter share a geo", "Map World"]
        
        optionClosures = [MapOptions.geoLinesOption, MapOptions.linesAirlineOption, MapOptions.linesBmapBusOption, MapOptions.linesBmapEffectOption, MapOptions.linesBmapOption, MapOptions.mapChinaDataRangeOption, MapOptions.mapChinaOption, MapOptions.mapHKOption, MapOptions.mapLocateOption, MapOptions.mapProvinceOption, MapOptions.mapUsaOption, MapOptions.mapWorldDataRangeOption, MapOptions.geoMapScatterOption, MapOptions.mapWorldOption]
        
        self.title = "地图"
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            echartsView.showLoading()
            DispatchQueue.global().async {
                
                let tmpOption = self.optionClosures[indexPath.row]()
                
                DispatchQueue.main.sync {
                    self.option = tmpOption
                    self.echartsView.hideLoading()
                }
            }
        } else {
            option = optionClosures[indexPath.row]()
        }
        
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
        switch indexPath.row {
        case 8:
            
            timer = Timer(timeInterval: 2, target: self, selector: #selector(self.mapLocateOption), userInfo: nil , repeats: true)
        default:
            print("Nothing...")
        }
        
        if timer != nil {
            RunLoop.current.add(timer!, forMode: RunLoopMode.commonModes)
        }
    }
    
    fileprivate var currLoc = 0
    func mapLocateOption() {
        let location: [[String: Jsonable]] = [[
            "name": "上海",
            "coord": [121.472644, 31.231706]
            ], [
                "name": "北京",
                "coord": [116.405285, 39.904989]
            ], [
                "name": "广东",
                "coord": [113.280637, 23.839463714285714]
            ]]
        let tmpOpt = self.option
        let serie = tmpOpt?.series![0] as! MapSerie
        serie.center = location[currLoc]["coord"] as? Position
        serie.zoom = 4
        let data: [String: Jsonable] = ["name": location[currLoc]["name"]!, "selected": true]
        serie.data = [data]
        serie.animationDurationUpdate = 1000.0
        serie.animationEasingUpdate = .cubicInOut
        tmpOpt!.series = [serie]
        echartsView.refreshEcharts(tmpOpt!)
        print(serie.jsonString)
        currLoc = (currLoc + 1) % location.count
    }

    

}
