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
    let rank = UILabel()
    let tags = UILabel()
    var workByID = 0
    var gradientLayer: CAGradientLayer!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    private func setView() {
        workTitle.textColor = UIColor(hex6: 0x333333)
        workTitle.numberOfLines = 2
        workTitle.font = UIFont.flexibleSystemFont(ofSize: 16)
        
        username.textColor = UIColor(hex6: 0xaaaaaa)
        username.font = UIFont.flexibleSystemFont(ofSize: 10)
        
        helpTime.textColor = UIColor(hex6: 0xaaaaaa)
        helpTime.font = UIFont.flexibleSystemFont(ofSize: 10)
        
        time.textColor = UIColor(hex6: 0xaaaaaa)
        time.font = UIFont.flexibleSystemFont(ofSize: 10)
        
        help.setTitle("助力", for: .normal)
        help.setTitleColor(UIColor.starRed, for: .normal)
        help.titleLabel?.font = UIFont.flexibleSystemFont(ofSize: 14)
        help.layer.masksToBounds = true
        help.layer.cornerRadius = 32 / 3
        help.layer.borderWidth = 1
        help.layer.borderColor = UIColor.starRed.cgColor
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.help.bounds
        //设置渐变的主颜色
        gradientLayer.colors = [UIColor.starRed.cgColor, UIColor.orange.cgColor]
        //将gradientLayer作为子layer添加到主layer上
        self.help.layer.addSublayer(gradientLayer)
        
        rank.textColor = .starRed
        rank.font = UIFont.flexibleSystemFont(ofSize: 16)
    }
    
    private func addView() {
        contentView.addSubview(workTitle)
        contentView.addSubview(workPicture)
        contentView.addSubview(rank)
        contentView.addSubview(username)
        contentView.addSubview(time)
        contentView.addSubview(helpTime)
        contentView.addSubview(help)
        contentView.addSubview(tags)
        
        workPicture.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(10)
            make.top.equalTo(contentView).offset(14)
            make.height.equalTo(92)
            make.width.equalTo(92 * 5 / 3)
        }
        
        workTitle.snp.makeConstraints { make in
            make.left.equalTo(workPicture.snp.right).offset(12)
            make.top.equalTo(contentView).offset(10)
            make.height.equalTo(contentView.height / 3)
            make.right.equalTo(contentView).offset(29)
        }
        rank.snp.makeConstraints { make in
            make.top.equalTo(workTitle).offset(10)
            make.right.equalTo(self).inset(10)
        }
        username.snp.makeConstraints { make in
            make.top.equalTo(workTitle.snp.bottom).offset(8)
            make.left.equalTo(workTitle)
            make.right.equalTo(workTitle)
            make.bottom.equalTo(contentView.snp.centerY)
        }
        
        helpTime.snp.makeConstraints { make in
            make.top.equalTo(username.snp.bottom).offset(8)
            make.left.equalTo(username)
            make.right.lessThanOrEqualTo(username.snp.centerX)
        }
        
        time.snp.makeConstraints { make in
            make.top.equalTo(helpTime)
            make.left.equalTo(helpTime.snp.right).offset(10)
            make.right.equalTo(workTitle)
        }
        
        help.snp.makeConstraints { make in
            make.right.equalTo(contentView).inset(10)
            make.bottom.equalTo(workPicture)
            make.height.equalTo(64 / 3)
            make.width.equalTo(50)
        }
    }
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: "workRankCell")
    }
    
    convenience init(byModel workRank: WorkRank, withIndex index: Int) {
        self.init(style: .default, reuseIdentifier: "workRankCell")
        let data = workRank.data![index]
        workPicture.sd_setImage(with: URL(string: data.coverURL!), completed: .none)
        workTitle.text = data.workName
        username.text = data.username
        time.text = time(str: data.time!)
        helpTime.text = "\(data.monthHotValue ?? 0)次助力"
        workByID = data.workID ?? 0
        setView()
        addView()
    }
    
    func time(str: String) -> String {
        let s = str.components(separatedBy: " ")
        let str1 = "\(s[0].prefix(4))/\(s[0].prefix(7).suffix(2))/\(s[0].suffix(2))"
        return str1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
