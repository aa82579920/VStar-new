//
//  RankWorkCell.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/30.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class RankWorkCell: UITableViewCell {
    let workPicture = UIImageView()
    let workTitle = UILabel()
    let username = UILabel()
    let time = UILabel()
    let helpTime = UILabel()
    let help = UIButton()
    var workRank: WorkRank!
    var workByID: WorkByID!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    private func setView() {
        workTitle.backgroundColor = .white
        workTitle.textColor = UIColor(hex6: 0x333333)
        workTitle.font = UIFont.flexibleSystemFont(ofSize: 14)
        
        username.backgroundColor = .white
        username.textColor = UIColor(hex6: 0xaaaaaa)
        username.font = UIFont.flexibleSystemFont(ofSize: 10)
        
        time.backgroundColor = .white
        time.textColor = UIColor(hex6: 0xaaaaaa)
        time.font = UIFont.flexibleSystemFont(ofSize: 10)
        
        help.setTitle("助力", for: .normal)
        help.setTitleColor(UIColor.starRed, for: .normal)
        help.backgroundColor = .white
        help.layer.masksToBounds = true
        help.layer.cornerRadius = 12
        help.layer.borderWidth = 2
        help.layer.borderColor = UIColor.starRed.cgColor
    }
    
    private func addView() {
        contentView.addSubview(workTitle)
        contentView.addSubview(workPicture)
        contentView.addSubview(username)
        contentView.addSubview(time)
        contentView.addSubview(helpTime)
        contentView.addSubview(help)
        
        workPicture.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(10)
            make.top.equalTo(contentView).offset(13)
            make.right.equalTo(contentView.snp.centerX).offset(25)
        }
        
        workTitle.snp.makeConstraints { make in
            make.left.equalTo(workPicture.snp.right).offset(12)
            make.top.equalTo(contentView).offset(10)
            make.height.equalTo(contentView.height / 3)
            make.right.equalTo(contentView).offset(29)
        }
        
        username.snp.makeConstraints { make in
            make.top.equalTo(workTitle.snp.bottom).offset(5)
            make.left.equalTo(workTitle)
            make.right.equalTo(workTitle)
            make.bottom.equalTo(contentView.snp.centerY)
        }
        
        helpTime.snp.makeConstraints { make in
            make.top.equalTo(username.snp.bottom).offset(5)
            make.left.equalTo(username)
            make.right.equalTo(username.snp.centerX)
            make.height.equalTo(12)
        }
        
        time.snp.makeConstraints { make in
            make.top.equalTo(helpTime)
            make.left.equalTo(workTitle.snp.centerX)
            make.right.equalTo(workTitle)
            make.height.equalTo(helpTime)
        }
        
        help.snp.makeConstraints { make in
            make.top.equalTo(time.snp.bottom).offset(8)
            make.left.equalTo(workTitle.snp.right).offset(-7)
            make.right.equalTo(contentView).offset(7)
            make.bottom.equalTo(workPicture)
        }
    }
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: "workRankCell")
    }
    
    convenience init(byModel workRank: WorkRank, withIndex index: Int) {
        self.init(style: .default, reuseIdentifier: "workRankCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
