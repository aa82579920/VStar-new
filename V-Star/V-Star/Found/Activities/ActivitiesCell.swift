//
//  ActivitiesCell.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/31.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ActivitiesCell: UITableViewCell {
    let photo = UIImageView()
    let author = UILabel()
    let button = UIButton()
    let pic = UIImageView()
    let title = UILabel()
    let category = UILabel()
    let sche = UILabel()
    let schedule = UIProgressView()
    let percent = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(photo)
        contentView.addSubview(author)
        contentView.addSubview(button)
        contentView.addSubview(pic)
        contentView.addSubview(title)
        contentView.addSubview(category)
        contentView.addSubview(sche)
        contentView.addSubview(schedule)
        contentView.addSubview(percent)
    }
    
    convenience init() {
        self.init(style:.default, reuseIdentifier: "cell")
        photo.frame = CGRect(x: 12, y: 12, width: 40, height: 40)
        photo.image = UIImage(named: "qzl1")
        photo.contentMode = UIView.ContentMode.scaleAspectFill
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 20
        
        author.frame = CGRect(x: 64, y: 16, width: UIScreen.main.bounds.width - 64, height: 16)
        author.text = "嘻嘻哈哈啦啦啦"
        
        button.frame = CGRect(x: UIScreen.main.bounds.width - 66, y: 16, width: 50, height: 16)
        button.contentMode = .scaleAspectFill
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.backgroundColor = .purple
        button.setTitle("+关注", for: .normal)
        button.addTarget(self, action: #selector(click), for: .touchUpInside)
        
        pic.frame = CGRect(x: 14, y: 62, width: UIScreen.main.bounds.width - 28, height: 300)
        pic.image = UIImage(named: "qzl2")
        pic.contentMode = UIView.ContentMode.scaleAspectFill
        pic.clipsToBounds = true
        
        title.frame = CGRect(x: 16, y: pic.frame.maxY + 20, width: UIScreen.main.bounds.width - 32, height: 16)
        title.text = "标题：生日应援"
        
        category.frame = CGRect(x: 16, y: title.frame.maxY + 8, width: UIScreen.main.bounds.width - 32, height: 12)
        category.text = "分类：粉丝众筹"
        category.textColor = .darkGray
        
        sche.frame = CGRect(x: 16, y: category.frame.maxY + 8, width: 70, height: 12)
        sche.text = "进度："
        sche.textColor = .lightGray
        
        schedule.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 138, height: 30)
        schedule.layer.position = CGPoint(x: 220, y: category.frame.maxY + 10)
        schedule.transform = CGAffineTransform(scaleX: 1.0, y: 5.0)
        schedule.progressTintColor = .orange
        schedule.trackTintColor = .red
        schedule.progress = 0.3
        
        percent.frame = CGRect(x: schedule.frame.maxX + 10, y: schedule.frame.minY, width: 30, height: 12)
        percent.text = "10%"
        
    }
    
    /// Mark: 方法记得写
    @objc func click() {
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


