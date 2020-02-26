//
//  TaskTableView.swift
//  V-Star
//
//  Created by 王申宇 on 16/01/2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import UIKit

class TaskTableView: UITableView {
    var weekInfo: WeekInfo!
    let getSignBtn = UIButton()
    let getUploadBtn = UIButton()
    let getWatchBtn = UIButton()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .grouped)
        self.delegate = self
        self.dataSource = self
//        loadData()
        self.reloadData()
    }
    func loadData() {
        TaskHelper.getWeekInfo(success: { weekInfo in
            self.weekInfo = weekInfo
            self.reloadData()
        }) { _ in
            print("error")
        }
    }
    public func loginCount(_ weekInfo: WeekInfo) -> Int{
        var count = 0
        let array = [weekInfo.data?.day1, weekInfo.data?.day2, weekInfo.data?.day3, weekInfo.data?.day4, weekInfo.data?.day5, weekInfo.data?.day6, weekInfo.data?.day7]
        for i in array {
            if i != "" { count = count + 1 }
        }
        return count
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TaskTableView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .white
        if weekInfo != nil && indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                let firstLabel = UILabel()
                firstLabel.text = "累计登陆"
                firstLabel.font = UIFont.flexibleSystemFont(ofSize: 16)
                firstLabel.textColor = UIColor(hex6: 0x333333)
                cell.contentView.addSubview(firstLabel)
                firstLabel.snp.makeConstraints { make in
                    make.centerY.equalTo(cell)
                    make.left.equalTo(30)
                }
                
                let dayLabel = UILabel()
                dayLabel.text = String(loginCount(weekInfo))
                dayLabel.textColor = UIColor(hex6: 0xe3294b)
                dayLabel.font = UIFont.flexibleSystemFont(ofSize: 20)
                cell.contentView.addSubview(dayLabel)
                dayLabel.snp.makeConstraints { make in
                    make.centerY.equalTo(cell)
                    make.left.equalTo(firstLabel.snp.right).offset(20)
                }
                
                let secondLabel = UILabel()
                secondLabel.text = "天"
                secondLabel.font = UIFont.flexibleSystemFont(ofSize: 16)
                secondLabel.textColor = UIColor(hex6: 0x333333)
                cell.contentView.addSubview(secondLabel)
                secondLabel.snp.makeConstraints { make in
                    make.centerY.equalTo(cell)
                    make.left.equalTo(dayLabel.snp.right).offset(20)
                }
                getSignBtn.backgroundColor = .white
                getSignBtn.setTitle("领取", for: .normal)
                getSignBtn.layer.cornerRadius = 15
                getSignBtn.layer.borderWidth = 1
                if (weekInfo.data?.isTodaySigned)! == true {
                    getSignBtn.setTitleColor(UIColor(hex6: 0x999999), for: .normal)
                    getSignBtn.layer.borderColor = UIColor(hex6: 0x999999).cgColor
                    getSignBtn.isSelected = false
                }else{
                    getSignBtn.setTitleColor(UIColor(hex6: 0xe3294b), for: .normal)
                    getSignBtn.layer.borderColor = UIColor(hex6: 0xe3294b).cgColor
                    getSignBtn.isSelected = true
                }
                cell.contentView.addSubview(getSignBtn)
                getSignBtn.snp.makeConstraints { make in
                    make.centerY.equalTo(cell)
                    make.right.equalTo(cell).inset(20)
                    make.width.equalTo(60)
                    make.height.equalTo(30)
                }
            case 1:
                let firstLabel = UILabel()
                firstLabel.text = "发布视频"
                firstLabel.font = UIFont.flexibleSystemFont(ofSize: 16)
                firstLabel.textColor = UIColor(hex6: 0x333333)
                cell.contentView.addSubview(firstLabel)
                firstLabel.snp.makeConstraints { make in
                    make.centerY.equalTo(cell)
                    make.left.equalTo(30)
                }
                getUploadBtn.backgroundColor = .white
                getUploadBtn.setTitle("领取", for: .normal)
                getUploadBtn.layer.cornerRadius = 15
                getUploadBtn.layer.borderWidth = 1
                if (weekInfo.data?.isTodayTakeUploadMoney)!  == true {
                    getUploadBtn.setTitleColor(UIColor(hex6: 0x999999), for: .normal)
                    getUploadBtn.layer.borderColor = UIColor(hex6: 0x999999).cgColor
                    getUploadBtn.isSelected = false
                }else{
                    getUploadBtn.setTitleColor(UIColor(hex6: 0xe3294b), for: .normal)
                    getUploadBtn.layer.borderColor = UIColor(hex6: 0xe3294b).cgColor
                    getUploadBtn.isSelected = true
                }
                cell.contentView.addSubview(getUploadBtn)
                getUploadBtn.snp.makeConstraints { make in
                    make.centerY.equalTo(cell)
                    make.right.equalTo(cell).inset(20)
                    make.width.equalTo(60)
                    make.height.equalTo(30)
                }
            default:
                let firstLabel = UILabel()
                firstLabel.text = "观看视频数"
                firstLabel.font = UIFont.flexibleSystemFont(ofSize: 16)
                firstLabel.textColor = UIColor(hex6: 0x333333)
                cell.contentView.addSubview(firstLabel)
                firstLabel.snp.makeConstraints { make in
                    make.centerY.equalTo(cell)
                    make.left.equalTo(30)
                }
                let secondLabel = UILabel()
                secondLabel.text = "\(weekInfo.data?.todayTotalWatch ?? 0)"
                secondLabel.font = UIFont.flexibleSystemFont(ofSize: 16)
                secondLabel.textColor = UIColor(hex6: 0x333333)
                cell.contentView.addSubview(secondLabel)
                secondLabel.snp.makeConstraints { make in
                    make.centerY.equalTo(cell)
                    make.left.equalTo(firstLabel.snp.right).offset(24)
                }
                let thirdLabel = UILabel()
                thirdLabel.text = "/5"
                thirdLabel.font = UIFont.flexibleSystemFont(ofSize: 16)
                thirdLabel.textColor = UIColor(hex6: 0x999999)
                cell.contentView.addSubview(thirdLabel)
                thirdLabel.snp.makeConstraints { make in
                    make.centerY.equalTo(cell)
                    make.left.equalTo(secondLabel.snp.right)
                }
                getWatchBtn.backgroundColor = .white
                getWatchBtn.setTitle("领取", for: .normal)
                getWatchBtn.layer.cornerRadius = 15
                getWatchBtn.layer.borderWidth = 1
                if (weekInfo.data?.isTodayTakeWatchMoney)!  == true {
                    getWatchBtn.setTitleColor(UIColor(hex6: 0x999999), for: .normal)
                    getWatchBtn.layer.borderColor = UIColor(hex6: 0x999999).cgColor
                    getWatchBtn.isSelected = false
                }else{
                    getWatchBtn.setTitleColor(UIColor(hex6: 0xe3294b), for: .normal)
                    getWatchBtn.layer.borderColor = UIColor(hex6: 0xe3294b).cgColor
                    getWatchBtn.isSelected = true
                }
                cell.contentView.addSubview(getWatchBtn)
                getWatchBtn.snp.makeConstraints { make in
                    make.centerY.equalTo(cell)
                    make.right.equalTo(cell).inset(20)
                    make.width.equalTo(60)
                    make.height.equalTo(30)
                }
            }
        }
        if weekInfo != nil && indexPath.section == 1 {
            let firstLabel = UILabel()
            firstLabel.text = "我的邀请码"
            firstLabel.font = UIFont.flexibleSystemFont(ofSize: 16)
            firstLabel.textColor = UIColor(hex6: 0x333333)
            cell.contentView.addSubview(firstLabel)
            firstLabel.snp.makeConstraints { make in
                make.centerY.equalTo(cell)
                make.left.equalTo(30)
            }
            
            let inviteCode = UILabel()
            inviteCode.text = weekInfo.data?.invitationCode
            inviteCode.font = UIFont.flexibleSystemFont(ofSize: 14)
            inviteCode.textColor = .starRed
            inviteCode.textAlignment = .center
            cell.contentView.addSubview(inviteCode)
            inviteCode.snp.makeConstraints { make in
                make.center.equalTo(cell)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
