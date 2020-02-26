//
//  RedCard.swift
//  V-Star
//
//  Created by 王申宇 on 16/01/2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import SDWebImage

class RedCard: UIView {
    var backImage: UIImageView!
    var avator: UIImageView!
    var userName: UILabel!
    var prompt: UILabel!
    var money: UILabel!
    var want: UILabel!
    var myself: MySelf!
    var weekInfo: WeekInfo!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        loadData()
        addView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView() {
        self.backgroundColor = UIColor(hex6: 0xe3294b)
        self.layer.cornerRadius = 10
        backImage = UIImageView(image: UIImage(named: "redCard"))
        
        avator = UIImageView()
        avator.layer.borderColor = UIColor.white.cgColor
        avator.layer.borderWidth = 1
        avator.layer.cornerRadius = 40 / 3
        
        userName = UILabel()
        userName.font = UIFont.flexibleSystemFont(ofSize: 12)
        userName.textColor = UIColor(hex6: 0xffffff)
        
        prompt = UILabel()
        prompt.text = "红包金额"
        prompt.font = UIFont.flexibleSystemFont(ofSize: 12)
        prompt.textColor = UIColor(hex6: 0xffffff)
        
        money = UILabel()
        money.textColor = UIColor(hex6: 0xffffff)
        money.font = UIFont.flexibleSystemFont(ofSize: 60)
        
        want = UILabel()
        want.text = "我要拿红包"
        want.textColor = UIColor(hex6: 0xeeeeee)
        want.font = UIFont.flexibleSystemFont(ofSize: 10)
    }
    
    func addView() {
        self.addSubview(backImage)
        backImage.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        self.addSubview(avator)
        avator.snp.makeConstraints { make in
            make.top.equalTo(7)
            make.left.equalTo(20)
            make.height.width.equalTo(30)
        }
        
        self.addSubview(userName)
        userName.snp.makeConstraints { make in
            make.left.equalTo(avator.snp.right).offset(10)
            make.centerY.equalTo(avator)
        }
        
        self.addSubview(prompt)
        prompt.snp.makeConstraints { make in
            make.left.equalTo(avator.snp.centerX)
            make.top.equalTo(avator.snp.bottom).offset(20)
        }
        
        self.addSubview(money)
        money.snp.makeConstraints { make in
            make.left.equalTo(self).offset(30)
            make.top.equalTo(prompt.snp.bottom).offset(16)
            make.bottom.equalTo(self.snp.bottom).inset(36)
        }
        
        self.addSubview(want)
        want.snp.makeConstraints { make in
            make.right.equalTo(self).inset(30)
            make.bottom.equalTo(self.snp.bottom).inset(36)
        }
    }
    
    func loadData() {
        GetHelper.GetMyself(success: { myself in
            self.myself = myself
            self.avator.sd_setImage(with: URL(string: (myself.data?.avatar)!), completed: .none)
            self.userName.text = myself.data?.username
        }) { _ in
            print("error: userinfo can't get ")
        }
        
        TaskHelper.getWeekInfo(success: { weekInfo in
            self.money.text = "¥\(weekInfo.data?.totalMoney ?? String(0.0))"
        }) { _ in
            print("error")
        }
    }
}
