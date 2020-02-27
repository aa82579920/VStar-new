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
    let avatar = UIButton()
    let userName = UILabel()
    let rank = UILabel()
    let releaseTime = UILabel()
    var cpImg :UIImageView!
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
    var play: UIImageView!
    let duration = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func setDefaultView() {
        userName.font = UIFont.flexibleSystemFont(ofSize: 16)
        userName.textAlignment = .left
        userName.textColor = UIColor(hex6: 0x333333)
        userName.sizeToFit()
        
        rank.font = UIFont.flexibleSystemFont(ofSize: 20)
        rank.textColor = UIColor(hex6: 0xff453b)
        rank.textAlignment = .right
        
        releaseTime.font = UIFont.flexibleSystemFont(ofSize: 12)
        releaseTime.textColor = UIColor(hex6: 0xcccccc)
        
        cpImg = UIImageView(image: UIImage(named: "投诉"))
        
        complain.font = UIFont.flexibleSystemFont(ofSize: 10)
        complain.textColor = UIColor(hex6: 0xcccccc)
        complain.text = "投诉"
        
        suportNum.font = UIFont.flexibleSystemFont(ofSize: 10)

        suport.setImage(UIImage(named: "助力圈"), for: .normal)
        
        share.setImage(UIImage(named: "share_highlighting"), for: .normal)
        
        shareNum.font = UIFont.flexibleSystemFont(ofSize: 10)
        
        collectNum.font = UIFont.flexibleSystemFont(ofSize: 10)
        collectNum.textColor = UIColor(hex6: 0x999999)

        commit.setImage(UIImage(named: "commit_normal"), for: .normal)
        
        commitNum.font = UIFont.flexibleSystemFont(ofSize: 10)
        commitNum.textColor = UIColor(hex6: 0x999999)
        play = UIImageView(image: UIImage(named: "play"))

    }
    
    func setView(model: FollowUserVideoAction, index: Int) {
        let data = model.data![index]
        suportNum.textColor = UIColor(hex6: 0xbd3d52)  //点过赞
        
        shareNum.textColor = UIColor(hex6: 0x999999)
        
        if data.isCollected == false {
            collect.setImage(UIImage(named: "collect_normal"), for: .normal)
        } else {
            collect.setImage(UIImage(named: "collect_highlighting"), for: .normal)
        }
        
        releaseTime.text = data.time
        
        copy.font = UIFont.flexibleSystemFont(ofSize: 14)
        copy.textColor = UIColor(hex6: 0x333333)
        copy.numberOfLines = 2
        copy.text = data.signature
        
        tags.font = UIFont.flexibleSystemFont(ofSize: 14)
        tags.textColor = UIColor(hex6: 0xcccccc)
        tags.numberOfLines = 1
        tags.text = getTags(str: data.tags!)
        tags.sizeToFit()
        
        
        duration.text = getDuration(i: data.duration ?? 0.0)
        duration.textColor = .white
        duration.font = UIFont.flexibleSystemFont(ofSize: 24)
        
        suportNum.text = "\(data.hotValue ?? 0)"

        shareNum.text = "\(data.shareNum ?? 0)"
    }
    
    func getDuration(i: Double) -> String{
        let second = i.truncatingRemainder(dividingBy: 1.0) * 60
        let minute = i - i.truncatingRemainder(dividingBy: 1.0)
        return "\(Int(minute)):\(Int(second))"
    }
    
    func getTags(str: String) -> String {
        var tags = ""
        for i in str.split(separator: ",") {
            tags.append("#\(String(i))  ")
        }
        return tags
    }
    
    func addView() {
        contentView.addSubview(avatar)
        avatar.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(12)
            make.left.equalTo(contentView).offset(10)
            make.height.width.equalTo(37)
        }

        contentView.addSubview(userName)
        userName.snp.makeConstraints { make in
            make.top.equalTo(avatar)
            make.left.equalTo(avatar.snp.right).offset(10)
            make.height.equalTo(18.5)
            make.width.equalTo(100)
        }
        contentView.addSubview(releaseTime)
        releaseTime.snp.makeConstraints { make in
            make.top.equalTo(userName.snp.bottom).offset(4)
            make.left.equalTo(userName)
            make.height.equalTo(18.5)
        }
        contentView.addSubview(cpImg)
        cpImg.snp.makeConstraints { make in
            make.centerY.equalTo(releaseTime)
            make.left.equalTo(releaseTime.snp.right).offset(10)
            make.height.width.equalTo(9)
        }
        contentView.addSubview(complain)
        complain.snp.makeConstraints { make in
            make.centerY.equalTo(releaseTime)
            make.left.equalTo(cpImg.snp.right).offset(10)
            make.height.equalTo(releaseTime)
            make.width.equalTo(50)
        }
        contentView.addSubview(rank)
        rank.snp.makeConstraints { make in
            make.centerY.equalTo(avatar)
            make.right.equalTo(self).inset(18)
            make.height.equalTo(32)
        }
        
        contentView.addSubview(video)
        video.snp.makeConstraints { make in
            make.top.equalTo(avatar.snp.bottom).offset(12)
            make.left.equalTo(self).offset(14)
            make.right.equalTo(self).inset(14)
            make.bottom.equalTo(self).inset(114)
        }
        
        contentView.addSubview(play)
        play.snp.makeConstraints { make in
            make.left.equalTo(video).offset(20)
            make.bottom.equalTo(video).inset(12)
            make.width.height.equalTo(35)
        }
        
        contentView.addSubview(duration)
        duration.snp.makeConstraints { make in
            make.left.equalTo(play.snp.right).offset(6)
            make.centerY.equalTo(play)
            make.height.equalTo(35)
        }
        
        contentView.addSubview(suport)
        suport.snp.makeConstraints { make in
            make.top.equalTo(video.snp.bottom).offset(10)
            make.centerX.equalTo(video.snp.centerX)
            make.height.width.equalTo(22)
        }
        contentView.addSubview(suportNum)
        suportNum.snp.makeConstraints { make in
            make.top.equalTo(suport.snp.bottom).offset(6)
            make.centerX.equalTo(suport)
            make.height.equalTo(10)
        }
        contentView.addSubview(share)
        share.snp.makeConstraints { make in
            make.centerY.equalTo(suport)
            make.left.equalTo(suport.snp.right).offset(24)
            make.height.width.equalTo(22)
        }
        contentView.addSubview(shareNum)
        shareNum.snp.makeConstraints { make in
            make.centerY.equalTo(suportNum)
            make.centerX.equalTo(share)
            make.height.equalTo(10)
        }
        contentView.addSubview(collect)
        collect.snp.makeConstraints { make in
            make.centerY.equalTo(suport)
            make.left.equalTo(share.snp.right).offset(24)
            make.height.width.equalTo(22)
        }
//        contentView.addSubview(collectNum)
//        collectNum.snp.makeConstraints { make in
//            make.centerY.equalTo(suportNum)
//            make.centerX.equalTo(collect)
//            make.height.equalTo(10)
//        }
        contentView.addSubview(commit)
        commit.snp.makeConstraints { make in
            make.centerY.equalTo(suport)
            make.left.equalTo(collect.snp.right).offset(24)
            make.height.width.equalTo(22)
        }
        contentView.addSubview(commitNum)
        commitNum.snp.makeConstraints { make in
            make.centerY.equalTo(suportNum)
            make.centerX.equalTo(commit)
            make.height.equalTo(10)
        }
        contentView.addSubview(self.copy)
        self.copy.snp.makeConstraints { make in
            make.top.equalTo(suportNum.snp.bottom).offset(14)
            make.left.equalTo(video)
            make.width.equalTo(video)
        }
        contentView.addSubview(tags)
        tags.snp.makeConstraints { make in
            make.top.equalTo(copy.snp.bottom).offset(20)
            make.left.equalTo(video)
            make.width.equalTo(video)
        }
    }
        
    convenience init() {
        self.init(style: .default, reuseIdentifier: "attendActionTableView")
        setDefaultView()
        addView()
    }
    
    convenience init(byModel fuva: FollowUserVideoAction, withIndex index: Int) {
        self.init(style: .default, reuseIdentifier: "attendActionTableView")
        setDefaultView()
        setView(model: fuva, index: index)
        if let temp = fuva.data![index].username {
            userName.text = temp
        }
        if let temp = fuva.data![index].monthRank {
            rank.text = "NO.\(temp)"
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
        
        addView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

