//
//  UserRankCell.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/29.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import SnapKit

class UserRankCell: UITableViewCell {
    
    let rankNum = UILabel()
    let isEnhance = UIImageView()
    let avatar = UIImageView()
    let userName = UILabel()
    let likePng = UIImageView(image: UIImage(named: "助力圈"))
    let likeNum = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView() {
        rankNum.textColor = UIColor(hex6: 0x333333)
        rankNum.font = UIFont.flexibleSystemFont(ofSize: 18)
        
        avatar.layer.masksToBounds = true
        avatar.layer.cornerRadius = 51 / 2
        avatar.layer.borderWidth = 0.5
        avatar.layer.borderColor = UIColor.lightGray.cgColor
        
        userName.textColor = UIColor(hex6: 0x333333)
        userName.textAlignment = .left
        userName.font = UIFont.flexibleSystemFont(ofSize: 16)
        
        likeNum.textColor = UIColor.starRed
        likeNum.font = UIFont.flexibleSystemFont(ofSize: 12)
    }
    
    func addView() {
        contentView.addSubview(rankNum)
        contentView.addSubview(isEnhance)
        contentView.addSubview(avatar)
        contentView.addSubview(userName)
        contentView.addSubview(likePng)
        contentView.addSubview(likeNum)
        
        rankNum.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView).offset(16)
            make.height.width.equalTo(23)
        }
        
        isEnhance.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(rankNum.snp.right).offset(6)
            make.width.equalTo(34 / 3)
            make.height.equalTo(37 / 3)
        }
        
        avatar.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(isEnhance.snp.right).offset(11)
            make.height.width.equalTo(51)
        }
        
        userName.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(avatar.snp.right).offset(10)
        }
        
        likeNum.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.right.equalTo(contentView).offset(-64 / 3)
        }
        
        likePng.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.right.equalTo(likeNum.snp.left).offset(-6)
            make.width.height.equalTo(71 / 4)
        }
    }
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: "userRankCell")
    }
    
    convenience init(byModel userRank: UserRank, withIndex index: Int) {
        self.init(style: .default, reuseIdentifier: "userRankCell")
        setView()
        addView()
        rankNum.text = String(index + 3)
        avatar.sd_setImage(with: URL(string: userRank.data![index + 3].avatar!), completed: .none)
        userName.text = userRank.data![index + 3].username
        likeNum.text = String(userRank.data![index + 3].weekHotValue ?? 0)
    }
}
