//
//  AttendActionView.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/26.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

class AttendActionViewCell: UITableViewCell {
    var backView = UIView()
    let avatar = UIImageView()
    let userName = UILabel()
    let rank = UILabel()
    let releaseTime = UILabel()
    let complainImage = UIImageView()
    let complain = UILabel()
    let video = UIButton()
    let suport = UIButton()
    let suportNum = UILabel()
    let share = UIButton()
    let shareNum = UILabel()
    let collect = UIButton()
    let collectNum = UILabel()
    let commit = UIButton()
    let commitNum = UILabel()
    let copy = UILabel() //文本
    let tags = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    func setView() {
        userName.backgroundColor = .white
        userName.font = UIFont.flexibleSystemFont(ofSize: 14)
        userName.textAlignment = .left
        userName.textColor = UIColor(hex6: 0x333333)
        userName.sizeToFit()
        
        rank.backgroundColor = .white
        rank.font = UIFont.flexibleSystemFont(ofSize: 16)
        rank.textColor = UIColor(hex6: 0xff453b)
        
        releaseTime.backgroundColor = .white
        releaseTime.font = UIFont.flexibleSystemFont(ofSize: 12)
        releaseTime.textColor = UIColor(hex6: 0xcccccc)
        
        complain.backgroundColor = .white
        complain.font = UIFont.flexibleSystemFont(ofSize: 12)
        complain.textColor = UIColor(hex6: 0xcccccc)
        
        suport.backgroundColor = .white
        
        suportNum.backgroundColor = .white
        suportNum.font = UIFont.flexibleSystemFont(ofSize: 12)
        suportNum.textColor = UIColor(hex6: 0x999999)
//        suportNum.textColor = UIColor(hex6: 0xbd3d52)  //点过赞
        
        share.backgroundColor = .white
        share.setImage(UIImage(named: "share_normal"), for: .normal)
        
        shareNum.backgroundColor = .white
        shareNum.font = UIFont.flexibleSystemFont(ofSize: 12)
        shareNum.textColor = UIColor(hex6: 0x999999)
        
        collect.backgroundColor = .white
        collect.setImage(UIImage(named: "collect_normal"), for: .normal)
        
        collectNum.backgroundColor = .white
        collectNum.font = UIFont.flexibleSystemFont(ofSize: 12)
        collectNum.textColor = UIColor(hex6: 0x999999)
        
        commit.backgroundColor = .white
        commit.setImage(UIImage(named: "commit_normal"), for: .normal)
        
        commitNum.backgroundColor = .white
        commitNum.font = UIFont.flexibleSystemFont(ofSize: 12)
        commitNum.textColor = UIColor(hex6: 0x999999)
        
        copy.backgroundColor = .white
        copy.font = UIFont.flexibleSystemFont(ofSize: 14)
        copy.textColor = UIColor(hex6: 0x333333)
        copy.numberOfLines = 0
        copy.sizeToFit()
        
        tags.backgroundColor = .white
        tags.font = UIFont.flexibleSystemFont(ofSize: 14)
        tags.textColor = UIColor(hex6: 0xcccccc)
        tags.numberOfLines = 0
        tags.sizeToFit()
    }
    
    
    
    func addView() {
        contentView.addSubview(avatar)
        avatar.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(contentView).offset(10)
            make.height.width.equalTo(40)
        }
//        userName.frame = CGRect(x: 0, y: 0, width: 100, height: 18)
        contentView.addSubview(userName)
        userName.snp.makeConstraints { make in
            make.top.equalTo(avatar)
            make.left.equalTo(avatar.snp.right).offset(10)
            make.height.equalTo(avatar.height / 2)
            make.width.equalTo(100)
        }
        contentView.addSubview(releaseTime)
        releaseTime.snp.makeConstraints { make in
            make.top.equalTo(userName.snp.bottom).offset(4)
            make.left.equalTo(userName)
            make.height.equalTo(avatar.height / 2)
            make.width.equalTo(self.width / 5)
        }
        contentView.addSubview(complainImage)
        complainImage.snp.makeConstraints { make in
            make.top.equalTo(releaseTime)
            make.left.equalTo(releaseTime.snp.right).offset(10)
            make.height.width.equalTo(releaseTime)
        }
        contentView.addSubview(complain)
        complain.snp.makeConstraints { make in
            make.top.equalTo(releaseTime)
            make.left.equalTo(complainImage.snp.right).offset(10)
            make.height.equalTo(releaseTime)
            make.width.equalTo(contentView.width)
        }
        contentView.addSubview(rank)
        rank.snp.makeConstraints { make in
            make.top.equalTo(self).offset(23)
            make.right.equalTo(self).offset(18)
            make.height.equalTo(32)
            make.width.equalTo(50)
        }
        
        contentView.addSubview(video)
        video.snp.makeConstraints { make in
            make.top.equalTo(avatar.snp.bottom).offset(12)
            make.left.equalTo(self).offset(14)
            make.right.equalTo(self).inset(14)
        }
        contentView.addSubview(suport)
        suport.snp.makeConstraints { make in
            make.top.equalTo(video.snp.bottom).offset(10)
            make.centerX.equalTo(video.snp.centerX)
            make.height.width.equalTo(20)
        }
        contentView.addSubview(suportNum)
        suportNum.snp.makeConstraints { make in
            make.top.equalTo(suport)
            make.left.equalTo(suport.snp.right).offset(14)
            make.height.width.equalTo(20)
        }
        contentView.addSubview(share)
        share.snp.makeConstraints { make in
            make.top.equalTo(suport)
            make.left.equalTo(suportNum.snp.right).offset(14)
            make.height.width.equalTo(20)
        }
        contentView.addSubview(shareNum)
        shareNum.snp.makeConstraints { make in
            make.top.equalTo(suport)
            make.left.equalTo(share.snp.right).offset(14)
            make.height.width.equalTo(20)
        }
        contentView.addSubview(collect)
        collect.snp.makeConstraints { make in
            make.top.equalTo(suport)
            make.left.equalTo(shareNum.snp.right).offset(14)
            make.height.width.equalTo(20)
        }
        contentView.addSubview(collectNum)
        collectNum.snp.makeConstraints { make in
            make.top.equalTo(suport)
            make.left.equalTo(collect.snp.right).offset(14)
            make.height.width.equalTo(20)
        }
        contentView.addSubview(commit)
        commit.snp.makeConstraints { make in
            make.top.equalTo(suport)
            make.left.equalTo(collectNum.snp.right).offset(14)
            make.height.width.equalTo(20)
        }
        contentView.addSubview(commitNum)
        commitNum.snp.makeConstraints { make in
            make.top.equalTo(suport)
            make.left.equalTo(commit.snp.right).offset(14)
            make.height.width.equalTo(20)
        }
        contentView.addSubview(self.copy)
        self.copy.snp.makeConstraints { make in
            make.top.equalTo(suport.snp.bottom).offset(10)
            make.left.equalTo(video)
            make.width.equalTo(video)
            make.height.equalTo(30)
        }
        contentView.addSubview(tags)
        tags.snp.makeConstraints { make in
            make.top.equalTo(copy.snp.bottom).offset(10)
            make.left.equalTo(video)
            make.width.equalTo(video)
            make.height.equalTo(20)
        }
    }
        
    convenience init() {
        self.init(style: .default, reuseIdentifier: "attendActionTableView")
        setView()
        addView()
    }
    
    convenience init(byModel fuva: FollowUserVideoAction, withIndex index: Int) {
        self.init(style: .default, reuseIdentifier: "attendActionTableView")
        if let temp = fuva.data![index].username {
            userName.text = temp
        }
        if let temp = fuva.data![index].avatar {
            avatar.sd_setImage(with: URL(string: temp), completed: .none)
        }
        if let temp = fuva.data![index].monthRank {
            rank.text = String(temp)
        }
        if let temp = fuva.data![index].signature {
            copy.text = temp
        }
        if let temp = fuva.data![index].collectionNum {
            collectNum.text = String(temp)
        }
        if let temp = fuva.data![index].commentNum {
            commitNum.text = String(temp)
        }
        setView()
        addView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

