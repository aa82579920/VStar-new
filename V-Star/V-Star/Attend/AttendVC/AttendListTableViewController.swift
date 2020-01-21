//
//  AttendListTableViewController.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/26.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import JXSegmentedView

class AttendTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return AttentCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 47
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
}

extension AttendTableViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
    
    func listDidAppear() {
        print("listDidAppear")
    }
    
    func listDidDisappear() {
        print("listDidDisappear")
    }
}
