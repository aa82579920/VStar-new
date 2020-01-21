//
//  AttendFansView.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/26.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import JXSegmentedView

class AttendFansController: UIViewController {
    let newFans = UIView()
    let nfAvatar = UIView()
    let nfAvatarArray = [UIImageView]()
    let nfLabel = UILabel()
    let attendFansTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func setView() {
        attendFansTableView.tableHeaderView = newFans
        attendFansTableView.tableHeaderView?.height = 20
        nfLabel.text = "新粉丝"
        nfLabel.font = UIFont.flexibleSystemFont(ofSize: 14)
        nfLabel.textColor = .black
        nfAvatarArray[0].layer.masksToBounds = true
        nfAvatarArray[0].layer.cornerRadius = 5
        nfAvatarArray[1].layer.masksToBounds = true
        nfAvatarArray[1].layer.cornerRadius = 5
        nfAvatarArray[2].layer.masksToBounds = true
        nfAvatarArray[2].layer.cornerRadius = 5
    }
    
    private func addView() {
        view.addSubview(attendFansTableView)
        newFans.addSubview(nfLabel)
        for i in 0...2 {
            newFans.addSubview(nfAvatarArray[i])
        }
        
        nfLabel.snp.makeConstraints { make in
            make.left.equalTo(newFans).offset(19)
            make.centerY.equalTo(newFans)
            make.top.equalTo(newFans).offset(8)
        }
        
        
    }
}

extension AttendFansController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}

extension AttendFansController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return AttendFansCell()
    }
    
    
}
