//
//  HomeView.swift
//  V-Star
//
//  Created by 王申宇 on 2019/9/5.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class HomeViewCell: UICollectionViewCell {
    let video = UIImageView()
    let avatar = UIImageView()
    let username = UILabel()
    let sign = UILabel()
    let hot = UIImageView()
    let hotNum = UILabel()
    let type = UILabel()
    let bottomView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.setup()
    }
    
    func setup() {
        self.backgroundColor = .white
        type.layer.masksToBounds = true
        type.layer.cornerRadius = 14
        type.layer.borderColor = UIColor.white.cgColor
        type.layer.borderWidth = 2
        
        avatar.layer.masksToBounds = true
        avatar.layer.cornerRadius = 27
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.borderWidth = 2
        
        username.textColor = UIColor(hex6: 0x333333)
        username.font = UIFont.flexibleSystemFont(ofSize: 16)
        
        sign.textColor = UIColor(hex6: 0x999999)
        sign.font = UIFont.flexibleSystemFont(ofSize: 12)
        
        hot.image = UIImage(named: "hot")
        
        hotNum.textColor = UIColor(hex6: 0xe2294b)
        hotNum.font = UIFont.flexibleSystemFont(ofSize: 12)
        
        bottomView.backgroundColor = .white
    }
    func addView() {
        contentView.addSubview(video)
        contentView.addSubview(avatar)
        contentView.addSubview(username)
        contentView.addSubview(sign)
        contentView.addSubview(hot)
        contentView.addSubview(hotNum)
        contentView.addSubview(type)
        contentView.addSubview(bottomView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        return super.preferredLayoutAttributesFitting(layoutAttributes)
    }
}
