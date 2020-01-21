//
//  DongTaiTableViewCell.swift
//  V-Star
//
//  Created by 王春杉 on 2019/10/12.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import SnapKit
class DongTaiTableViewCell: UITableViewCell {
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
        self.init(style: .default, reuseIdentifier: "DongTaiTableViewCell")
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
        
        timeLable.text = "2019-04-09"
        timeLable.textColor = .gray
        contentView.addSubview(timeLable)
        timeLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.nickNameLable)
            make.top.equalTo(self.nickNameLable.snp.bottom).offset(5)
            make.height.equalTo(20)
            make.width.equalTo(self).multipliedBy(0.4)
        }
        timeLable.adjustsFontSizeToFitWidth = true
        
        touSuBtn.setTitle("投诉", for: .normal)
        contentView.addSubview(touSuBtn)
        touSuBtn.setTitleColor(.gray, for: .normal)
        touSuBtn.setTitleColor(.red, for: .highlighted)
        touSuBtn.addTarget(self, action: #selector(touSu), for: .touchUpInside)
        touSuBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self).inset(padding)
            make.top.equalTo(self).offset(30)
            make.width.equalTo(35)
            make.height.equalTo(30)
        }
        touSuBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        
        contentView.addSubview(touSuImageView)
        touSuImageView.snp.makeConstraints { (make) in
            make.right.equalTo(touSuBtn.snp.left).offset(-3)
            make.width.equalTo(20)
            make.height.equalTo(20)
            make.top.equalTo(touSuBtn).offset(5)
        }
        
        contentView.addSubview(dongTaiImageView)
        dongTaiImageView.image = UIImage(named: "占位图")
        dongTaiImageView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self).inset(padding)
            make.top.equalTo(self.headImageView.snp.bottom).offset(10)
            make.height.equalTo((self.width-20)*3/4)
        }
        
        
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
        dongTaiTextLable.lineBreakMode = .byTruncatingTail
        dongTaiTextLable.snp.makeConstraints { (make) in
            make.left.right.equalTo(self).inset(padding)
            make.top.equalTo(self.dongTaiImageView.snp.bottom).offset(10)
            make.bottom.equalTo(liuYanLable.snp.top).offset(-20)
//            make.height.equalTo(50)
        }
        dongTaiTextLable.numberOfLines = 2
        
        
        
        contentView.addSubview(liuYanImageView)
        liuYanImageView.snp.makeConstraints { (make) in
            make.right.equalTo(liuYanLable.snp.left).inset(-5)
            make.top.equalTo(liuYanLable).offset(-5)
            make.height.width.equalTo(30)
        }
        
        contentView.addSubview(dianZanTextLable)
        dianZanTextLable.snp.makeConstraints { (make) in
            make.right.equalTo(liuYanImageView.snp.left).offset(-25)
            make.top.width.height.equalTo(liuYanLable)
        }
        dianZanTextLable.text = "1238"
        dianZanTextLable.textColor = .gray
        
        contentView.addSubview(dianZanBtn)
        // 保留图标原来的颜色
        let dianZanImage = UIImage(named: "diianZan_highlighting")?.withRenderingMode(.alwaysOriginal)
        dianZanBtn.setImage(dianZanImage, for: .normal)
        dianZanBtn.snp.makeConstraints { (make) in
            make.right.equalTo(dianZanTextLable.snp.left).offset(-5)
            make.top.equalTo(dianZanTextLable).offset(-5)
            make.height.width.equalTo(28)
        }
        
        contentView.addSubview(zhuanFaLable)
        zhuanFaLable.snp.makeConstraints { (make) in
            make.right.equalTo(dianZanBtn.snp.left).offset(-25)
            make.top.width.height.equalTo(liuYanLable)
        }
        zhuanFaLable.text = "500"
        zhuanFaLable.textColor = .gray
        
        contentView.addSubview(zhuanFaBtn)
        // 保留图标原来的颜色
        let zhuanFaImage = UIImage(named: "share_highlighting")?.withRenderingMode(.alwaysOriginal)
        zhuanFaBtn.setImage(zhuanFaImage, for: .normal)
        zhuanFaBtn.snp.makeConstraints { (make) in
            make.right.equalTo(zhuanFaLable.snp.left).offset(-5)
            make.top.equalTo(zhuanFaLable).offset(-5)
            make.height.width.equalTo(28)
        }
    }
    
    @objc func touSu() {
        print("投诉被点击了")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
