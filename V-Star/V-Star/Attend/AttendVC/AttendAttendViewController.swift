//
//  AttendAttendViewController.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/28.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import JXSegmentedView

class AttendAttendController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return AttendAttendCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 47
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
}

extension AttendAttendController: JXSegmentedListContainerViewListDelegate {
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
