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
    var recommendUser: RecommendUser!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        GetHelper.GetRecommendUser(success: { recommendUser in
            self.recommendUser = recommendUser
//            if let self.recommendUser.da
            self.tableView.reloadData()
        }) { _ in
            debugPrint("获取推荐用户失败")
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.recommendUser == nil {return AttendViewCell()}
        else {
            return AttendViewCell(byModel: self.recommendUser, withIndex: indexPath.row)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.recommendUser == nil {return 0}
        else {
            return self.recommendUser.data!.count
        }
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
