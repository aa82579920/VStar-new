//
//  RankTopView.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/28.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class RealRankTopView: UIView {
    var backView = UIImageView()
    var avatarView = UIImageView()
    let username = UILabel()
    let fad = UILabel()
    let toUserBtn = UIButton()
    var realRank = 0
    let imageArr = [UIImage(named: "第一"), UIImage(named: "第二"), UIImage(named: "第三")]
    let likeImage = UIImageView(image: UIImage(named: "助力圈"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /// 前三名可用 不一样的view
    ///
    /// - Parameter realRank: 实际排名
    func setRank(realRank: Int) {
//        self.init(frame: frame)
        self.realRank = realRank - 1
        backView = UIImageView(image: imageArr[self.realRank])
        setView()
        addView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView() {
//        backView和avatarView之后再写
        username.textColor = UIColor(hex6: 0x333333)
        username.font = UIFont.flexibleSystemFont(ofSize: 14)
        username.textAlignment = .center
        
        avatarView.layer.masksToBounds = true
        avatarView.layer.cornerRadius = 35
        
        fad.textColor = UIColor.starRed
        fad.font = UIFont.flexibleSystemFont(ofSize: 12)
        //FIXME: 记得写addTarget
        toUserBtn.backgroundColor = .none
    }
    
    func addView() {
        addSubview(username)
        addSubview(fad)
        addSubview(avatarView)
        addSubview(backView)
        addSubview(likeImage)
        addSubview(toUserBtn)
        backView.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.width.equalTo(80)
            make.height.equalTo(337 / 3)
        }
        avatarView.snp.makeConstraints { make in
            make.centerX.equalTo(backView)
            make.centerY.equalTo(backView).offset(18)
            make.width.height.equalTo(75)
        }
        
        username.snp.makeConstraints { make in
            make.top.equalTo(backView.snp.bottom).offset(10)
            make.centerX.equalTo(backView)
        }
        
        fad.snp.makeConstraints { make in
            make.top.equalTo(username.snp.bottom).offset(5)
            make.centerX.equalTo(backView)
        }
        
        likeImage.snp.makeConstraints { make in
            make.right.equalTo(fad.snp.left).offset(-5)
            make.centerY.equalTo(fad)
            make.width.height.equalTo(71 / 4)
        }
        
        toUserBtn.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
}

