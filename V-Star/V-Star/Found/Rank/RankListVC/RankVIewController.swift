//
//  RankVIewController.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/28.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import JXSegmentedView

class RankViewController: UIViewController {
    let searchRank = UISearchController()
    let signView = UIView()
    let rankSignView = RankSignView()
    let ranktopView = RankTotalTopView()
    let rankTableView = UITableView()
    let rankWorkHeaderView = RankWorkView()
    var userRank: UserRank!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setView()
        view.addSubview(rankTableView)
        rankTableView.reloadData()
    }
    
    private func setView() {
        rankTableView.tableHeaderView = RankSignView(frame: CGRect(x: 0, y: 0, width: Screen.width, height: 46))
        rankTableView.tableHeaderView?.height = 46
        rankTableView.allowsSelection = false
        rankTableView.delegate = self
        rankTableView.dataSource = self
    }
    
    func loadData() {
        GetHelper.GetUserRank(success: { userRank in
            self.userRank = userRank
            self.ranktopView.userRank = userRank
            self.rankTableView.reloadData()
        }, failure: { _ in
            print("Rank的来看看")
        })
    }
}

extension RankViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
    
    
}

extension RankViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else {
            return 9
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == 0 {
            if userRank == nil {return UserRankCell()}
            else {return UserRankCell(byModel: userRank, withIndex: indexPath.row)}
//        } else {
//
//        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            if userRank != nil {
                ranktopView.backgroundColor = .white
                ranktopView.setView()
                ranktopView.addView()
            }
            return ranktopView
        } else if section == 1 {
            return rankWorkHeaderView
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat(200)
        } else {
            return CGFloat(18)
        }
    }
}
