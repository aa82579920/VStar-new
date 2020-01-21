//
//  MineCardView.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/2.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import SnapKit

class UserCardView: UIView {
    let rank = UILabel()             // 排名
    let rankNum = UILabel()
    let userName = UILabel()         // 用户名
    let information = UIView()       // 详细信息
    let sex = UILabel()              /// 性别
    let age = UILabel()              /// 年龄
    let city = UILabel()             /// 城市
    let id = UILabel()               // ID号
    let trends = UILabel()           // 动态
    let trendsContent = UILabel()
    let fans = UILabel()             // 粉丝
    let fansContent = UILabel()
    let popular = UILabel()          // 人气
    let popularContent = UILabel()
    let attend = UILabel()           // 关注
    let attendContent = UILabel()
    let photoSlide = UILabel()       // 头像底板
    var photo = UIImageView()        // 头像图片
    let myPageBtn = UIButton()
   
    func setView() {
        self.backgroundColor = UIColor.starRed
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
        self.height = UIScreen.main.bounds.height * 6 / 25
        self.width = UIScreen.main.bounds.width - 10
        
        rank.backgroundColor = UIColor.starRed
        rank.textColor = UIColor(hex6: 0xffffff)
        rank.text = "本月排名："
        rank.textAlignment = .right
        rank.font = UIFont.flexibleSystemFont(ofSize: 18)
        
        rankNum.backgroundColor = UIColor.starRed
        rankNum.textColor = .white
        rankNum.text = "00"
        rankNum.textAlignment = .right
        rankNum.font = UIFont.flexibleSystemFont(ofSize: 28)
        
        userName.backgroundColor = UIColor.starRed
        userName.textColor = UIColor(hex6: 0xffffff)
        userName.font = UIFont.flexibleSystemFont(ofSize: 20)
        
        information.backgroundColor = UIColor.starRed
        
        id.backgroundColor = UIColor.starRed
        id.textColor = UIColor(hex6: 0xffffff)
        id.font = UIFont.flexibleSystemFont(ofSize: 16)
        
        trends.backgroundColor = UIColor.starRed
        trends.textColor = UIColor(hex6: 0xffffff)
        trends.text = "动态"
        trends.font = UIFont.flexibleSystemFont(ofSize: 14)
        
        trendsContent.backgroundColor = UIColor.starRed
        trendsContent.textColor = UIColor(hex6: 0xffffff)
        trendsContent.font = UIFont.flexibleSystemFont(ofSize: 20)
        
        fans.backgroundColor = UIColor.starRed
        fans.textColor = UIColor(hex6: 0xffffff)
        fans.text = "粉丝"
        fans.font = UIFont.flexibleSystemFont(ofSize: 14)
        
        fansContent.backgroundColor = UIColor.starRed
        fansContent.textColor = UIColor(hex6: 0xffffff)
        fansContent.font = UIFont.flexibleSystemFont(ofSize: 20)
        
        popular.backgroundColor = UIColor.starRed
        popular.textColor = UIColor(hex6: 0xffffff)
        popular.text = "人气"
        popular.font = UIFont.flexibleSystemFont(ofSize: 14)
        
        popularContent.backgroundColor = UIColor.starRed
        popularContent.textColor = UIColor(hex6: 0xffffff)
        popularContent.font = UIFont.flexibleSystemFont(ofSize: 20)
        
        attend.backgroundColor = UIColor.starRed
        attend.textColor = UIColor(hex6: 0xffffff)
        attend.text = "关注"
        attend.font = UIFont.flexibleSystemFont(ofSize: 14)
        
        attendContent.backgroundColor = UIColor.starRed
        attendContent.textColor = UIColor(hex6: 0xffffff)
        attendContent.font = UIFont.flexibleSystemFont(ofSize: 20)
        
        myPageBtn.backgroundColor = UIColor.starRed
        myPageBtn.setTitle("进入个人主页>>", for: .normal)
        myPageBtn.titleLabel?.textColor = UIColor(hex6: 0xffffff)
        myPageBtn.titleLabel?.font = UIFont.flexibleSystemFont(ofSize: 16)
    }
    
    func addView() {
        self.addSubview(rankNum)
        rankNum.snp.makeConstraints { make in
            make.right.equalTo(self).offset(-20)
            make.top.equalTo(self).offset(12)
            make.height.equalTo(self.height / 6)
            make.width.equalTo(self.width / 10)
        }
        
        self.addSubview(rank)
        rank.snp.makeConstraints { make in
            make.right.equalTo(rankNum.snp.left)
            make.top.equalTo(self).offset(16)
            make.height.equalTo(self.height / 6)
            make.width.equalTo(self.width / 3)
        }
        
        self.addSubview(userName)
        userName.snp.makeConstraints { make in
            make.left.equalTo(self).offset(20)
            make.top.equalTo(self).offset(45)
            make.height.equalTo(self.height / 7)
            make.width.equalTo(self.width / 2)
        }
        
        self.addSubview(information)
        information.snp.makeConstraints { make in
            make.left.equalTo(userName.snp.right).offset(16)
            make.top.equalTo(userName)
            make.height.equalTo(self.height / 7)
            make.width.equalTo(self.width / 2)
        }
        
        self.addSubview(id)
        id.snp.makeConstraints { make in
            make.left.equalTo(userName)
            make.top.equalTo(userName.snp.bottom).offset(10)
            make.height.equalTo(self.height / 9)
            make.width.equalTo(self.width / 2)
        }
        
        self.addSubview(trends)
        trends.snp.makeConstraints { make in
            make.left.equalTo(userName)
            make.top.equalTo(id.snp.bottom).offset(27)
            make.height.equalTo(self.height / 7)
            make.width.equalTo(self.width / 10)
        }
        
        self.addSubview(trendsContent)
        trendsContent.snp.makeConstraints { make in
            make.left.equalTo(trends.snp.right).offset(10)
            make.bottom.equalTo(trends)
            make.height.equalTo(self.height / 6)
            make.width.equalTo(self.width / 9)
        }
        
        self.addSubview(fans)
        fans.snp.makeConstraints { make in
            make.left.equalTo(trendsContent.snp.right).offset(10)
            make.bottom.equalTo(trends)
            make.height.equalTo(self.height / 6)
            make.width.equalTo(self.width / 9)
        }
        
        self.addSubview(fansContent)
        fansContent.snp.makeConstraints { make in
            make.left.equalTo(fans.snp.right).offset(10)
            make.bottom.equalTo(trends)
            make.height.equalTo(self.height / 6)
            make.width.equalTo(self.width / 9)
        }
        
        self.addSubview(popular)
        popular.snp.makeConstraints { make in
            make.left.equalTo(fansContent.snp.right).offset(10)
            make.bottom.equalTo(trends)
            make.height.equalTo(self.height / 6)
            make.width.equalTo(self.width / 9)
        }
        
        self.addSubview(popularContent)
        popularContent.snp.makeConstraints { make in
            make.left.equalTo(popular.snp.right).offset(10)
            make.bottom.equalTo(trends)
            make.height.equalTo(self.height / 6)
            make.width.equalTo(self.width / 9)
        }
        
        self.addSubview(attend)
        attend.snp.makeConstraints { make in
            make.left.equalTo(popularContent.snp.right).offset(10)
            make.bottom.equalTo(trends)
            make.height.equalTo(self.height / 6)
            make.width.equalTo(self.width / 9)
        }
        
        self.addSubview(attendContent)
        attendContent.snp.makeConstraints { make in
            make.left.equalTo(attend).offset(10)
            make.bottom.equalTo(trends)
            make.height.equalTo(self.height / 6)
            make.width.equalTo(self.width / 9)
        }
        
        self.addSubview(myPageBtn)
        myPageBtn.snp.makeConstraints { make in
            make.right.equalTo(self)
            make.bottom.equalTo(self).offset(10)
            make.height.equalTo(self.height / 8)
            make.width.equalTo(self.width / 9)
        }
    }
}

class MineTableView: UITableView {
    let myHeaderView = UIView()
    let backImage = UIImageView()
    let userLabel = UserCardView()
    
    func setView() {
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.backgroundColor = .white
        self.bounces = false
    }
    
    func addView() {
        
        myHeaderView.addSubview(backImage)
        myHeaderView.addSubview(userLabel)
        userLabel.snp.makeConstraints { make in
            make.bottom.equalTo(myHeaderView)
            make.left.equalTo(myHeaderView).offset(5)
            make.right.equalTo(myHeaderView).offset(-5)
            make.height.equalTo(UIScreen.main.bounds.height * 6 / 25)
        }
        userLabel.setView()
        userLabel.addView()
        self.tableHeaderView = myHeaderView
        self.tableHeaderView?.height = UIScreen.main.bounds.height * 2 / 5
        self.reloadData()
    }
}

