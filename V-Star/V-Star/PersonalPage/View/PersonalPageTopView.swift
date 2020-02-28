//
//  PersonalPageTopView.swift
//  V-Star
//
//  Created by 王春杉 on 2020/2/27.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import SnapKit
class PersonalPageTopView: UIView {
    var backgroundImageView: UIImageView!
    let backgroundImage = UIImage(named: "占位图")
    var headImageView: UIImageView!
    var colorView: UIView!
    var benYuePaiMing: UILabel!
    var benYuePaiMingContent: UILabel!
    var nickNameLable: UILabel!
    var nickNameContent: UILabel!
    var infomationLabel: UILabel!
    var IDLabel: UILabel!
    var geXingQianMing: UILabel!
    var fensiLabel: UILabel!
    var fensiContent: UILabel!
    var renQiLabel: UILabel!
    var renQiContent: UILabel!
    var guanZhuLabel: UILabel!
    var guanZhuContent: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 设置背景图
        self.backgroundImageView = UIImageView(frame: frame)
        self.backgroundImageView.image = backgroundImage
        self.addSubview(backgroundImageView)
        // 设置粉色面板
        self.colorView = UIView()
        self.colorView.backgroundColor = .starRed
        self.addSubview(colorView)
        colorView.snp.makeConstraints { (make) ->  Void in
            make.bottom.equalTo(self)
            make.left.equalTo(self)
            make.width.equalTo(self)
            make.height.equalTo(self).multipliedBy(0.65)
        }
        setHeadImageView()
        setLable()
    }
    
    // 设置头像
    func setHeadImageView() {
        self.headImageView = UIImageView(image: UIImage(named: "占位图"))
        // 添加阴影
        self.headImageView.layer.shadowOpacity = 0.8
        self.headImageView.layer.shadowColor = UIColor.gray.cgColor
        self.headImageView.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.headImageView.layer.shadowRadius = 1
        self.headImageView.layer.borderColor = UIColor.white.cgColor
        self.headImageView.layer.borderWidth = 1
        
        self.addSubview(headImageView)
        headImageView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(20)
            make.width.height.equalTo(self.snp.height).multipliedBy(0.3)
            make.top.equalTo(self.colorView.snp.top).offset(-25)
        }
        headImageView.layer.masksToBounds = true
        headImageView.layer.cornerRadius = self.height * 0.3 / 2
        
        
    }
    // 初始化lable
    func setLable() {
        nickNameLable = UILabel()
        nickNameLable.textColor = .white
        nickNameLable.text = "世界无敌第一丧女孩最棒"
        nickNameLable.font = UIFont.systemFont(ofSize: 20)
        self.colorView.addSubview(nickNameLable)
        nickNameLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.headImageView.snp.left)
//            make.right.equalTo(self.colorView).offset(-20)
            make.top.equalTo(self.headImageView.snp.bottom).offset(15)
            make.height.equalTo(30)
            
        }
        
        
        benYuePaiMingContent = UILabel()
        benYuePaiMingContent.textColor = .white
        benYuePaiMingContent.text = "93"
        benYuePaiMingContent.font = UIFont.systemFont(ofSize: 23)
        benYuePaiMingContent.textAlignment = .right
        self.colorView.addSubview(benYuePaiMingContent)
        benYuePaiMingContent.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-20)
//            make.width.equalTo(30)
            make.top.equalTo(self.colorView).offset(15)
            make.height.equalTo(23)
        }
        
        benYuePaiMing = UILabel()
        benYuePaiMing.textColor = .white
        benYuePaiMing.text = "本月排名:"
        benYuePaiMing.font = UIFont.systemFont(ofSize: 20)
        benYuePaiMing.textAlignment = .right
        benYuePaiMing.adjustsFontSizeToFitWidth = true
        self.colorView.addSubview(benYuePaiMing)
        benYuePaiMing.snp.makeConstraints { (make) in
            make.right.equalTo(self.benYuePaiMingContent.snp.left).offset(-10)
//            make.width.equalTo(self).multipliedBy(0.23)
//            make.top.equalTo(self.nickNameLable.snp.bottom).offset(16)
            make.bottom.equalTo(self.benYuePaiMingContent)
            make.height.equalTo(20)
            
        }
        
        
        
        fensiLabel = UILabel()
        fensiLabel.textColor = .white
        fensiLabel.text = "粉丝"
        fensiLabel.font = UIFont.systemFont(ofSize: 15)
        self.colorView.addSubview(fensiLabel)
        fensiLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.headImageView)
            make.bottom.equalTo(self.colorView).offset(-10)
            make.height.equalTo(20)
        }
        
        fensiContent = UILabel()
        fensiContent.textColor = .white
        fensiContent.text = "98.7 w"
        fensiContent.font = UIFont.systemFont(ofSize: 20)
        fensiContent.adjustsFontSizeToFitWidth = true
        self.colorView.addSubview(fensiContent)
        fensiContent.snp.makeConstraints { (make) in
            make.left.equalTo(self.fensiLabel.snp.right).offset(3)
//            make.width.equalTo(65)
            make.top.equalTo(self.fensiLabel).offset(-5)
            make.bottom.equalTo(self.fensiLabel)
            
        }
        
        renQiLabel = UILabel()
        renQiLabel.textColor = .white
        renQiLabel.text = "人气"
        renQiLabel.font = UIFont.systemFont(ofSize: 15)
        self.colorView.addSubview(renQiLabel)
        renQiLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.fensiContent.snp.right).offset(12)
            make.bottom.equalTo(self.fensiLabel)
            make.height.equalTo(20)
        }
        renQiLabel.textAlignment = .right
        
        renQiContent = UILabel()
        renQiContent.textColor = .white
        renQiContent.text = "10987"
        renQiContent.font = UIFont.systemFont(ofSize: 21)
        renQiContent.adjustsFontSizeToFitWidth = true
        self.colorView.addSubview(renQiContent)
        renQiContent.snp.makeConstraints { (make) in
            make.left.equalTo(self.renQiLabel.snp.right).offset(3)
            //            make.width.equalTo(65)
            make.top.equalTo(self.renQiLabel).offset(-5)
            make.bottom.equalTo(self.renQiLabel)
                        
        }
        
        guanZhuLabel = UILabel()
        guanZhuLabel.textColor = .white
        guanZhuLabel.text = "关注"
        guanZhuLabel.font = UIFont.systemFont(ofSize: 15)
        self.colorView.addSubview(guanZhuLabel)
        guanZhuLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.renQiContent.snp.right).offset(12)
            make.bottom.equalTo(self.fensiLabel)
            make.height.equalTo(20)
        }
        guanZhuLabel.textAlignment = .right

        guanZhuContent = UILabel()
        guanZhuContent.textColor = .white
        guanZhuContent.text = "234"
        guanZhuContent.font = UIFont.systemFont(ofSize: 21)
        guanZhuContent.adjustsFontSizeToFitWidth = true
        self.colorView.addSubview(guanZhuContent)
        guanZhuContent.snp.makeConstraints { (make) in
            make.left.equalTo(self.guanZhuLabel.snp.right).offset(3)
            make.top.equalTo(self.renQiLabel).offset(-5)
            make.bottom.equalTo(self.renQiLabel)
                        
        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
