//
//  AttentViewCell.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/11.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import SnapKit

class AttentCell: UITableViewCell {
    
    let photo = UIImageView()
    let rank = UILabel()
    let userName = UILabel()
    let signText = UILabel()
    let attendBtn = UIButton()
    let sign = UILabel()
    
    //设置属性
    func setView() {
        //头像
        photo.backgroundColor = .white
        photo.layer.masksToBounds = true
        photo.layer.cornerRadius = 27
        //排名
        rank.backgroundColor = .white
        rank.textColor = UIColor(hex6: 0x888888)
        rank.font = UIFont.flexibleSystemFont(ofSize: 12)
        //用户名
        userName.backgroundColor = .white
        userName.textColor = UIColor(hex6: 0x333333)
        userName.font = UIFont.flexibleSystemFont(ofSize: 16)
        //签名
        signText.backgroundColor = .white
        signText.textColor = UIColor(hex6: 0x999999)
        signText.font = UIFont.flexibleSystemFont(ofSize: 12)
        //+关注
        attendBtn.setTitle("+关注", for: .normal)
        attendBtn.layer.masksToBounds = true
        attendBtn.layer.cornerRadius = 12
        attendBtn.backgroundColor = UIColor.starRed
        attendBtn.titleLabel?.textColor = .white
    }
    func addView() {
        contentView.addSubview(photo)
        contentView.addSubview(rank)
        contentView.addSubview(userName)
        contentView.addSubview(signText)
        contentView.addSubview(attendBtn)
        contentView.addSubview(sign)
        
        
        photo.snp.makeConstraints { make in
            make.width.height.equalTo(self).offset(-30)
            make.left.equalTo(self).offset(15)
            make.top.equalTo(self).offset(16)
        }
        
        rank.snp.makeConstraints { make in
            make.left.equalTo(photo).offset(5)
            make.top.equalTo(photo).offset(8)
        }
        
        userName.snp.makeConstraints { make in
            make.left.equalTo(photo).offset(30)
            make.top.equalTo(photo).offset(6)
        }
        
        signText.snp.makeConstraints { make in
            make.left.equalTo(userName)
            make.top.equalTo(userName.snp.bottom).offset(4)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
    }
    convenience init() {
        self.init(style: .default, reuseIdentifier: "attendTableView")
        setView()
        addView()
    }
//
//    convenience init(byModel xxxxx: xxxxx, withIndex index: Int) {
//        self.init(style: .default, reuseIdentifier: "attendTableView")
//    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
