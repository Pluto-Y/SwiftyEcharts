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
        
        menus = ["模拟迁徙", "65k+ 飞机航线", "北京公交路线 - 百度地图(暂缺)", "北京公交路线 - 线特效(暂缺)", "杭州热门步行路线 - 百度地图(暂缺)", "iPhone销量", "Map China", "香港18区人口密度 （2011）", "Map Locate(暂缺)", "34 省切换查看(暂缺)", "USA Population Estimates (2012)", "World Population (2010)", "map and scatter share a geo", "Map World"]
        
        optionClosures = [MapOptions.geoLinesOption, MapOptions.linesAirlineOption, MapOptions.linesBmapBusOption, MapOptions.linesBmapEffectOption, MapOptions.linesBmapOption, MapOptions.mapChinaDataRangeOption, MapOptions.mapChinaOption, MapOptions.mapHKOption, MapOptions.mapLocateOption, MapOptions.mapProvinceOption, MapOptions.mapUsaOption, MapOptions.mapWorldDataRangeOption, MapOptions.geoMapScatterOption, MapOptions.mapWorldOption]
        
        self.title = "地图"
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 { // 65k+ 飞机航线
            echartsView.showLoading()
            DispatchQueue.global().async { [unowned self] in
                let tmpOption = self.optionClosures[indexPath.row]()
                
                DispatchQueue.main.sync {
                    self.option = tmpOption
                    self.echartsView.hideLoading()
                }
            }
        } else if indexPath.row == 7 { // 香港18区人口密度 （2011）
            echartsView.showLoading()
            DispatchQueue.global().async { [unowned self] in
                guard let jsonUrl = Bundle.main.url(forResource: "HK", withExtension: "json"), let jsonData = try? Data(contentsOf: jsonUrl), let jsonObj = try? JSONSerialization.jsonObject(with: jsonData, options: []) else {
                    self.echartsView.hideLoading()
                    return
                }
                
                let data = jsonObj as! NSDictionary
                let tmpOption = self.optionClosures[indexPath.row]()
                
                DispatchQueue.main.sync {
                    self.echartsView.registerMap("HK", data: data)
                    self.option = tmpOption
                    self.echartsView.hideLoading()
                }
                
            }
        } else if indexPath.row == 10 { // USA Population Estimates (2012)
            echartsView.showLoading()
            DispatchQueue.global().async { [unowned self] in
                guard let jsonUrl = Bundle.main.url(forResource: "USA", withExtension: "json"), let jsonData = try? Data(contentsOf: jsonUrl), let jsonObject = try? JSONSerialization.jsonObject(with: jsonData, options: []) else {
                    self.echartsView.hideLoading()
                    return
                }
                
                let data = jsonObject as! NSDictionary
                let tmpOption = self.optionClosures[indexPath.row]()
                
                DispatchQueue.main.sync {
                    self.echartsView.registerMap("USA", data: data, specialAreas: [
                        "Alaska": ["left": -131, "top": 25, "width": 15],
                        "Hawaii": ["left": -110, "top": 28, "width": 5],
                        "Puerto Rio": ["left": -76, "top": 26, "width": 2]
                        ])
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
        serie.center = location[currLoc]["coord"] as? Point
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
