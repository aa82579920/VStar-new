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
    var userRank: UserRank!
    var realRank = 0
    
    /// 前三名可用 不一样的view
    ///
    /// - Parameter realRank: 实际排名
    convenience init(realRank: Int) {
        self.init(realRank: realRank)
        self.realRank = realRank - 1
        setView()
        setWebData()
        addView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView() {
//        backView和avatarView之后再写
        username.textColor = UIColor(hex6: 0x333333)
        username.font = UIFont.flexibleSystemFont(ofSize: 14)
        
        avatarView.layer.masksToBounds = true
        avatarView.layer.cornerRadius = 13
        
        fad.textColor = UIColor.starRed
        fad.font = UIFont.flexibleSystemFont(ofSize: 12)
    }
    
    func setWebData() {
        username.text = userRank.data[realRank].username
        avatarView.sd_setImage(with: URL(string: userRank.data[realRank].avatar), completed: .none)
        fad.text = String(userRank.data[realRank].weekHotValue)
    }
    
    func addView() {
        addSubview(username)
        addSubview(fad)
        addSubview(avatarView)
        addSubview(backView)
        
        username.snp.makeConstraints { make in
            make.top.equalTo(backView.snp.bottom).offset(7)
            make.centerX.equalTo(backView)
        }
        
        fad.snp.makeConstraints { make in
            make.top.equalTo(username.snp.bottom).offset(5)
            make.centerX.equalTo(backView)
        }
        
    }
}

class RankTotalTopView: UIView {
    let top1 = RealRankTopView(realRank: 1)
    let top2 = RealRankTopView(realRank: 2)
    let top3 = RealRankTopView(realRank: 3)
    
    func addView() {
        addSubview(top1)
        addSubview(top2)
        addSubview(top3)
        
        top1.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(4)
            make.left.equalTo(self).offset(UIScreen.main.bounds.maxX / 3)
            make.right.equalTo(self).offset(-UIScreen.main.bounds.maxX / 3)
        }
        
        top2.snp.makeConstraints { make in
            make.right.equalTo(top1.snp.left).offset(-20)
            make.top.equalTo(top1).offset(19)
        }
        
        top3.snp.makeConstraints { make in
            make.left.equalTo(top1.snp.right).offset(20)
            make.top.equalTo(top2)
        }
    }
}
