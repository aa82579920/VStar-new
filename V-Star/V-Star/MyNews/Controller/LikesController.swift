//
//  LikesController.swift
//  V-Star
//
//  Created by 王春杉 on 2020/2/28.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
class LikesController: UIViewController {
    
    var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), style: .plain)
        self.view.addSubview(tableView)
    }
}
