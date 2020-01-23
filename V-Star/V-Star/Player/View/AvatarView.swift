//
//  AvatarView.swift
//  V-Star
//
//  Created by 王申宇 on 2019/11/12.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class AvatarView: UIView {
    var avatar = UIImageView()
    var rank = UILabel()
    var title = UILabel()
    var attend = UIButton()
    var complain = UIButton()
    var to_id: String!
    var gradientLayer: CAGradientLayer!
    var isFollow: Bool!
    init() {
        super.init(frame: .zero)
        initSubview()
        loadData()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubview()
        loadData()
    }
    
    func loadData() {
        //MARK: - 还未获取是否关注
//        GetHelper.GetMyself(success: { user in
//            self.avatar.sd_setImage(with: URL(string: (user.data?.avatar)!), completed: .none)
//            self.rank.text = String((user.data?.monthRank)!)
//            self.title.text = String((user.data?.username)!)
//            self.addView()
//        }) { _ in
//            print("用户获取失败")
//        }
    }
    
    func initSubview() {
        self.backgroundColor = UIColor(red: 71 / 255, green: 71 / 255, blue: 71 / 255, alpha: 0.5)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 22
        avatar.layer.masksToBounds = true
        avatar.layer.cornerRadius = (self.frame.height - 4) / 2
        rank.textColor = UIColor(red: 238 / 255, green: 79 / 255, blue: 73 / 255, alpha: 1.0)
        rank.font = UIFont.flexibleSystemFont(ofSize: 12)
        rank.backgroundColor = .clear
        rank.textAlignment = .center
        rank.sizeToFit()
        title.textColor = UIColor(hex6: 0xffffff)
        title.font = UIFont.flexibleSystemFont(ofSize: 12)
        title.backgroundColor = .clear
        title.textAlignment = .left
        attend.setTitle("+ 关注", for: .normal)
        attend.titleLabel?.font = UIFont.flexibleSystemFont(ofSize: 12)
        attend.titleLabel?.textColor = UIColor(hex6: 0xffffff)
        attend.titleLabel?.textAlignment = .center
        attend.addTarget(self, action: #selector(addAttend), for: .touchUpInside)
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = attend.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        //设置渐变的主颜色
        gradientLayer.colors = [UIColor.starRed.cgColor, UIColor.orange.cgColor]
        //将gradientLayer作为子layer添加到主layer上
        attend.layer.addSublayer(gradientLayer)
        attend.layer.cornerRadius = 7
        complain.setTitle("投诉", for: .normal)
        complain.backgroundColor = .clear
        complain.titleLabel?.font = UIFont.flexibleSystemFont(ofSize: 12)
        complain.titleLabel?.textColor = UIColor(hex6: 0xcccccc)
        complain.titleLabel?.textAlignment = .center
        complain.backgroundColor = UIColor(hex6: 0x666666)
        complain.addTarget(self, action: #selector(toComplain), for: .touchUpInside)
    }
    
    func addView() {
        
        rank.text = "No.123"
        title.text = "shijiasfih"
        self.addSubview(rank)
        self.addSubview(avatar)
        self.addSubview(title)
        self.addSubview(attend)
        self.addSubview(complain)
        
        rank.snp.makeConstraints { make in
            make.top.equalTo(self).offset(8)
            make.left.equalTo(self).offset(14)
        }
        avatar.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.right.equalTo(self).inset(2)
            make.width.height.equalTo(self.snp.height).inset(4)
        }
        title.snp.makeConstraints { make in
            make.top.equalTo(rank)
            make.left.equalTo(rank.snp.right).offset(8)
            make.right.equalTo(avatar.snp.left).inset(10)
        }
        attend.snp.makeConstraints { make in
            make.top.equalTo(rank.snp.bottom).offset(4)
            make.left.equalTo(self)
            make.right.equalTo(title.snp.left)
        }
        complain.snp.makeConstraints { make in
            make.top.equalTo(attend)
            make.left.equalTo(attend.snp.right).offset(4)
            make.right.equalTo(avatar.snp.left).inset(8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func addAttend() {
        WorkStorage.toUserID = to_id
        PostHelper.PostFollowAdd(success: { isError in
            print(isError.message)
        }) { _ in
            print("error: fail to follow")
        }
    }
    
    @objc func toComplain() {
        
    }
}
