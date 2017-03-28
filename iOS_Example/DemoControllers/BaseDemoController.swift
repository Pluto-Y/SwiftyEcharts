//
//  BaseDemoController.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 25/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import UIKit
import SwiftyEcharts

class BaseDemoController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var menuTableView: UITableView!
    var echartsView: EchartsView!
    var option: Option! {
        didSet {
            echartsView.option = option
            echartsView.loadEcharts()
        }
    }
    var menus: [String] = []
    var optionClosures: [() -> Option] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        menuTableView = UITableView(frame: CGRect(x: 0, y: 0, width: width, height: height - 300))
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.register(UITableViewCell.self, forCellReuseIdentifier: "DemoCell")
        self.view.addSubview(menuTableView)
        
        let line = UIView(frame: CGRect(x: 0, y: height - 300, width: width, height: 1))
        line.backgroundColor = UIColor(red: 239/255.0, green: 239/255.0, blue: 245/255.0, alpha: 1.0)
        self.view.addSubview(line)
        
        echartsView = EchartsView(frame: CGRect(x: 0, y: height - 299, width: width, height: 300))
        self.view.addSubview(echartsView!)
        
        Mapper.ignoreNil = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        option = optionClosures[0]()
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoCell", for: indexPath)
        cell.textLabel?.text = menus[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        option = optionClosures[indexPath.row]()
    }
    
}
