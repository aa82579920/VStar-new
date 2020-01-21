//
//  UserRankCell.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/29.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class UserRankCell: UITableViewCell {
    
    let rankNum = UILabel()
    let isEnhance = UIImageView()
    let avatar = UIImageView()
    let userName = UILabel()
    let likePng = UIImageView()
    let likeNum = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView() {
        rankNum.textColor = UIColor(hex6: 0x333333)
        rankNum.font = UIFont.flexibleSystemFont(ofSize: 14)
        
        avatar.layer.masksToBounds = true
        avatar.layer.cornerRadius = 15
        avatar.layer.borderWidth = 1
        avatar.layer.borderColor = UIColor.lightGray.cgColor
        
        userName.textColor = UIColor(hex6: 0x333333)
        userName.font = UIFont.flexibleSystemFont(ofSize: 14)
        
        likeNum.textColor = UIColor.starRed
        likeNum.font = UIFont.flexibleSystemFont(ofSize: 12)
    }
    
    func addView() {
        contentView.addSubview(rankNum)
        contentView.addSubview(isEnhance)
        contentView.addSubview(avatar)
        contentView.addSubview(likePng)
        contentView.addSubview(likeNum)
        
        rankNum.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView).offset(12)
        }
        
        isEnhance.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(rankNum.snp.right).offset(5)
        }
        
        avatar.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(isEnhance.snp.right).offset(11)
        }
        
        userName.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(avatar.snp.right).offset(16)
        }
        
        likeNum.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.right.equalTo(contentView).offset(-20)
        }
        
        likePng.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.right.equalTo(likeNum.snp.left).offset(-5)
        }
    }
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: "userRankCell")
        setView()
        addView()
    }
    
    convenience init(byModel userRank: UserRank, withIndex index: Int) {
        self.init(style: .default, reuseIdentifier: "userRankCell")
        setView()
        addView()
        rankNum.text = String(index + 3)
        avatar.sd_setImage(with: URL(string: userRank.data[index + 3].avatar), completed: .none)
        userName.text = userRank.data[index + 3].username
        likeNum.text = String(userRank.data[index + 3].weekHotValue)
    }
}
