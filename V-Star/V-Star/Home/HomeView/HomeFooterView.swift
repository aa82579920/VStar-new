//
//  HomeView.swift
//  V-Star
//
//  Created by 王申宇 on 2019/9/5.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class HomeFooterView: UIView {
    let avatar = UIImageView()
    let avatarBackView = UIView()
    let username = UILabel()
    let sign = UILabel()
    let hot = UIImageView()
    let hotNum = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        addView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.backgroundColor = .white
        
        avatar.layer.masksToBounds = true
        avatar.layer.cornerRadius = 27
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.borderWidth = 2
        
        username.textColor = UIColor(hex6: 0x333333)
        username.font = UIFont.flexibleSystemFont(ofSize: 16)
        username.textAlignment = .left
        
        sign.textColor = UIColor(hex6: 0x999999)
        sign.font = UIFont.flexibleSystemFont(ofSize: 12)
        sign.textAlignment = .left
        
        hot.image = UIImage(named: "hot")
        
        hotNum.textColor = UIColor(hex6: 0xe2294b)
        hotNum.font = UIFont.flexibleSystemFont(ofSize: 12)
        hotNum.textAlignment = .center
    }
    func addView() {
        addSubview(avatarBackView)
        avatarBackView.snp.makeConstraints { make in
            make.left.equalTo(self).offset(10)
            make.centerY.equalTo(self.snp.top).offset(10)
            make.width.height.equalTo(40)
        }
        addSubview(avatar)
        avatar.snp.makeConstraints { make in
            make.center.equalTo(avatarBackView)
            make.width.height.equalTo(avatarBackView).offset(-5)
        }
        addSubview(username)
        username.snp.makeConstraints { make in
            make.left.equalTo(avatarBackView.snp.right).offset(4)
            make.right.equalTo(self)
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self.snp.centerY)
        }
        addSubview(sign)
        sign.snp.makeConstraints { make in
            make.left.equalTo(username.snp.left)
            make.top.equalTo(username.snp.bottom).offset(6)
            make.right.equalTo(self)
            make.height.equalTo(username)
        }
        addSubview(hot)
        hot.snp.makeConstraints { make in
            make.right.equalTo(self).offset(-18)
            make.width.equalTo(11)
            make.height.equalTo(15)
            make.top.equalTo(self).offset(10)
        }
        addSubview(hotNum)
        hotNum.snp.makeConstraints { make in
            make.centerX.equalTo(hot)
            make.width.equalTo(Screen.width / 8)
            make.top.equalTo(hot.snp.bottom).offset(5)
        }
    }
    
}
