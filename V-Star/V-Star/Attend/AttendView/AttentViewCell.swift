//
//  AttentViewCell.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/11.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import SnapKit

class AttendViewCell: UITableViewCell {
    
    let avatar = UIImageView()
    let avatarBtn = UIButton()
    let rank = UILabel()
    let userName = UILabel()
    let signText = UILabel()
    let attendBtn = UIButton()
    let sign = UILabel()
    var model: RecommendUser!
    
    func setDefaultView() {
        //头像
        avatar.layer.masksToBounds = true
        avatar.layer.cornerRadius = 25
        avatar.layer.borderWidth = 0.5
        avatar.layer.borderColor = UIColor.starRed.cgColor
        avatarBtn.alpha = 0
        avatarBtn.addTarget(self, action: #selector(toUserPage), for: .touchUpInside)
        //排名
        rank.textColor = UIColor(hex6: 0x888888)
        rank.font = UIFont.flexibleSystemFont(ofSize: 12)
        //用户名
        userName.textColor = UIColor(hex6: 0x333333)
        userName.font = UIFont.flexibleSystemFont(ofSize: 16)
        //签名
        signText.textColor = UIColor(hex6: 0x999999)
        signText.font = UIFont.flexibleSystemFont(ofSize: 12)
    }
    
    //设置属性
    func setView(_ model: RecommendUser, _ index: Int) {
        self.model = model
        let data = model.data![index]
        avatar.sd_setImage(with: URL(string: data.avatar ?? ""), completed: .none)
        if data.monthRank != nil {
            rank.text = "No.\(data.monthRank ?? 0)"
        }
        userName.text = data.username
        signText.text = data.signature ?? ""
        //+关注
        attendBtn.setTitle("+关注", for: .normal)
        attendBtn.titleLabel?.font = UIFont.flexibleSystemFont(ofSize: 12)
        attendBtn.layer.masksToBounds = true
        attendBtn.layer.cornerRadius = 15
        attendBtn.backgroundColor = UIColor.starRed
        attendBtn.titleLabel?.textColor = .white
        attendBtn.addTarget(self, action: #selector(addAttend(_:)), for: .touchUpInside)
    }
    func addView() {
        contentView.addSubview(avatar)
        contentView.addSubview(avatarBtn)
        contentView.addSubview(rank)
        contentView.addSubview(userName)
        contentView.addSubview(signText)
        contentView.addSubview(attendBtn)
        contentView.addSubview(sign)
        contentView.addSubview(attendBtn)
        
        avatar.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.left.equalTo(self).offset(15)
            make.top.equalTo(self).offset(4)
        }
        
        avatarBtn.snp.makeConstraints { make in
            make.edges.equalTo(avatar)
        }
        
        rank.snp.makeConstraints { make in
            make.left.equalTo(avatar).offset(5)
            make.top.equalTo(avatar.snp.bottom).offset(2)
        }
        
        userName.snp.makeConstraints { make in
            make.left.equalTo(avatar.snp.right).offset(30)
            make.top.equalTo(avatar).offset(6)
        }
        
        signText.snp.makeConstraints { make in
            make.left.equalTo(userName)
            make.top.equalTo(userName.snp.bottom).offset(4)
        }
        
        attendBtn.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.right.equalTo(self.snp.right).offset(-30)
            make.width.equalTo(60)
            make.height.equalTo(28)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
    }
    convenience init() {
        self.init(style: .default, reuseIdentifier: "attendTableView")
        setDefaultView()
        addView()
    }
    convenience init(byModel recommendUser: RecommendUser, withIndex index: Int) {
        self.init(style: .default, reuseIdentifier: "attendTableView")
        setDefaultView()
        setView(recommendUser, index)
        addView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func toUserPage() {
    }
    @objc func addAttend(_ btn: UIButton) {
        WorkStorage.toUserID = "\(self.model.data![btn.tag].userID ?? 0)"
        if btn.isHighlighted {
            PostHelper.PostFollowAdd(success: { _ in
                self.btnToHightlight()
                print("关注成功")
            }) { _ in
                
            }
        } else {
            PostHelper.PostFollowDelete(success: { _ in
                print("解除关注")
            }) { _ in
            }
        }
        
    }
    
    func btnToHightlight() {
        self.attendBtn.setTitle("已关注", for: .normal)
        self.attendBtn.backgroundColor = UIColor(hex6: 0x999999)
        self.attendBtn.titleLabel?.textColor = .black
        self.attendBtn.isHighlighted = false
    }
    
    func btnToNormal() {
        attendBtn.setTitle("+关注", for: .normal)
        attendBtn.backgroundColor = UIColor.starRed
        self.attendBtn.titleLabel?.textColor = .white
        self.attendBtn.isHighlighted = true
    }
}
