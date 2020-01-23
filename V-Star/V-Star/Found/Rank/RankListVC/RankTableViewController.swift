//
//  RankTableViewController.swift
//  V-Star
//
//  Created by 王申宇 on 2019/11/6.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import JXSegmentedView

class RankTableViewController: UITableViewController {
    let searchBar = UISearchBar()
    let rankSignView = RankSignView(frame: CGRect(x: 0, y: 0, width: Screen.width, height: 50))
    let ranktopView = RankTotalTopView()
    let rankWorkHeaderView = RankWorkView()
    var userRank: UserRank!
    var workRank: WorkRank!
    
//    override func tableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        loadData()
        
    }
    
    func setView() {
        rankSignView.setView()
        rankSignView.addView()
        
        tableView.backgroundColor = .gray
        tableView.tableHeaderView = rankSignView
        tableView.tableHeaderView?.height = 50
        tableView.register(UserRankCell.self, forCellReuseIdentifier: "userRankCell")
        tableView.register(RankWorkCell.self, forCellReuseIdentifier: "workRankCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setRankTopView() {
        self.ranktopView.top1.avatarView.sd_setImage(with: URL(string: userRank.data![0].avatar!), completed: .none)
        self.ranktopView.top2.avatarView.sd_setImage(with: URL(string: userRank.data![1].avatar!), completed: .none)
        self.ranktopView.top3.avatarView.sd_setImage(with: URL(string: userRank.data![2].avatar!), completed: .none)
        self.ranktopView.top1.username.text = userRank.data![0].username!
        self.ranktopView.top1.fad.text = String(userRank.data![1].weekHotValue ?? 0)
        self.ranktopView.top2.username.text = userRank.data![0].username!
        self.ranktopView.top2.fad.text = String(userRank.data![1].weekHotValue ?? 0)
        self.ranktopView.top3.username.text = userRank.data![0].username!
        self.ranktopView.top3.fad.text = String(userRank.data![1].weekHotValue ?? 0)
    }
    
    func loadData() {
        WorkStorage.num = 9
        GetHelper.GetUserRank(success: { userRank in
            self.userRank = userRank
            self.ranktopView.userRank = userRank
            self.setRankTopView()
            self.tableView.reloadData()
        }, failure: { _ in
            print("Rank的来看看")
        })
        WorkStorage.num = 4
        GetHelper.GetWorkRank(success: { workRank in
            self.workRank = workRank
            self.tableView.reloadData()
        }) { _ in
            print("error: workrank")
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 70
        }
        return 120
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if section == 0 {
                return 3
            } else {
                return 3
            }
        }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if userRank == nil {
                return UserRankCell()
            }
            else {
                return UserRankCell(byModel: userRank, withIndex: indexPath.row)
            }
        }
        else {
            if workRank == nil {
                return RankWorkCell()
            }else {
                return RankWorkCell(byModel: workRank, withIndex: indexPath.row)
            }
        }
    }
        
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            if userRank != nil {
                ranktopView.backgroundColor = .white
                ranktopView.setView()
                ranktopView.addView()
                return ranktopView
            }
            else {return UIView()}
        } else if section == 1 {
            rankWorkHeaderView.setView()
            return rankWorkHeaderView
        }
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
            let footView = UIView()
            let footUpView = UIView()
            let footDownView = UIView()
            let moreBtn = UIButton()
            footView.backgroundColor = .clear
            footUpView.backgroundColor = .white
            footDownView.backgroundColor = .clear
            moreBtn.backgroundColor = .white
            moreBtn.setTitleColor(UIColor(hex6: 0xcccccc), for: .normal)
            moreBtn.setTitle("查看更多 >", for: .normal)
            moreBtn.titleLabel?.font = UIFont.flexibleSystemFont(ofSize: 12)
            footView.addSubview(footUpView)
            footView.addSubview(footDownView)
            footUpView.addSubview(moreBtn)
            footUpView.snp.makeConstraints { make in
                make.left.right.equalTo(footView)
                make.height.equalTo(35)
                make.top.equalTo(footView)
            }
            footDownView.snp.makeConstraints { make in
                make.left.right.equalTo(footView)
                make.height.equalTo(6)
                make.top.equalTo(footUpView.snp.bottom)
            }
            moreBtn.snp.makeConstraints { make in
                make.right.equalTo(footView).inset(64 / 3)
                make.centerY.equalTo(footUpView)
            }
            return footView
        }
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 41
        }
        return 0
    }
    
    
        
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat(200)
        } else {
            return CGFloat(40)
        
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}

extension RankTableViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
    
    
}
