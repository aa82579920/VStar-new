//
//  FansCirclePingLunTableViewCell.swift
//  V-Star
//
//  Created by 王春杉 on 2019/10/21.
//  Copyright © 2019 mac. All rights reserved.
//
// 粉丝圈评论cell
import UIKit
import SnapKit
class FansCirclePingLunTableViewCell: UITableViewCell {
    
    let statusBarHeight = UIApplication.shared.statusBarFrame.height
    var headImageView = UIImageView()
    var nickNameLable = UILabel()
    var timeLable = UILabel()
    var touSuBtn = UIButton(type: .system)
    var touSuImageView = UIImageView(image: UIImage(named: "投诉"))
    var dongTaiImageView = UIImageView()
    var dongTaiTextLable = UILabel()
    var liuYanLable = UILabel()
    var liuYanImageView = UIImageView(image: UIImage(named: "commit_normal"))
    var dianZanTextLable = UILabel()
    var dianZanBtn = UIButton(type: .system)
    var zhuanFaLable = UILabel()
    var zhuanFaBtn = UIButton(type: .system)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: "FansCirclePingLunTableViewCell")
        let padding = 15
        
        //        contentView.addSubview(box)
        //        box.snp.makeConstraints { (make) in
        //            make.edges.equalTo(contentView).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        //        }
        
        headImageView.backgroundColor = .red
        headImageView.layer.masksToBounds = true
        headImageView.frame = CGRect(x: padding, y: padding, width: 50, height: 50)
        headImageView.layer.cornerRadius = headImageView.width/2
        contentView.addSubview(headImageView)
        
        nickNameLable.text = "世界第一丧女孩"
        contentView.addSubview(nickNameLable)
        nickNameLable.snp.makeConstraints { (make) in
            make.left.equalTo(headImageView.snp.right).offset(padding)
            make.width.equalTo(self).multipliedBy(0.5)
            make.top.equalTo(self).offset(padding)
            make.height.equalTo(23)
        }
        nickNameLable.adjustsFontSizeToFitWidth = true
        
        
        
//        contentView.addSubview(dongTaiImageView)
//        dongTaiImageView.image = UIImage(named: "占位图")
//        dongTaiImageView.snp.makeConstraints { (make) in
//            make.left.right.equalTo(self).inset(padding)
//            make.top.equalTo(self.headImageView.snp.bottom).offset(10)
//            make.height.equalTo((self.width-20)*3/4)
//        }
        
        
        contentView.addSubview(liuYanLable)
        liuYanLable.text = "278"
        liuYanLable.snp.makeConstraints { (make) in
            make.right.equalTo(self).inset(padding)
            make.bottom.equalTo(-20)
            make.width.equalTo(40)
            make.height.equalTo(20)
        }
        liuYanLable.textColor = .gray
        
        contentView.addSubview(dongTaiTextLable)
        dongTaiTextLable.text = "如日本满街的樱花一样好看，其实我是在吴家窑地铁站门口拍的哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊啊啊啊啊啊啊啊啊啊啊啊"
        dongTaiTextLable.numberOfLines = 0
        dongTaiTextLable.snp.makeConstraints { (make) in
            make.left.equalTo(self).inset(padding*2 + 50)
            make.right.equalTo(self).inset(padding)
            make.top.equalTo(headImageView.snp.bottom).offset(-20)
            make.bottom.equalTo(liuYanLable.snp.top).offset(-20)
        }
        
        
        
        
        
        
    }
    
    @objc func touSu() {
        print("投诉被点击了")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
