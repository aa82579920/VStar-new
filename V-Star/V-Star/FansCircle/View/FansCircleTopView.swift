//
//  FansCircleTopView.swift
//  V-Star
//
//  Created by 王春杉 on 2019/10/10.
//  Copyright © 2019 mac. All rights reserved.
//
// 粉丝圈主页头部视图
import UIKit
import SnapKit
class FansCircleTopView: UIView {
    var backgroundImageView: UIImageView!
    let backgroundImage = UIImage(named: "占位图")
    var colorView: UIView!
    var headImageView: UIImageView!
    var nickNameLable: UILabel!
    var paiMingLable: UILabel!
    var paiMingNumLable: UILabel!
    var yueduLable: UILabel!
    var yueDuNumLable: UILabel!
    var tieZiLable: UILabel!
    var tieZiNumLable: UILabel!
    var fenSiLable: UILabel!
    var fenSiNumLable: UILabel!
    
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
            make.height.equalTo(self).multipliedBy(0.5)
        }
        setHeadImageView()
        setLable()
    }
    
    /// 设置头像
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
            make.centerY.equalTo(self).offset(10)
        }
        headImageView.layer.masksToBounds = true
        headImageView.layer.cornerRadius = self.height * 0.3 / 2
        
        
    }
    // 初始化lable
    func setLable() {
        nickNameLable = UILabel()
        nickNameLable.textColor = .white
        nickNameLable.text = "世界无敌第一丧女孩最棒"
        nickNameLable.font = UIFont.systemFont(ofSize: 23)
        self.colorView.addSubview(nickNameLable)
        nickNameLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.headImageView.snp.right).offset(16)
            make.right.equalTo(self.colorView).offset(-20)
            make.top.equalTo(self.colorView).offset(20)
            make.height.equalTo(30)
            
        }
        
        paiMingLable = UILabel()
        paiMingLable.textColor = .white
        paiMingLable.text = "本月排名:"
        paiMingLable.font = UIFont.systemFont(ofSize: 20)
        paiMingLable.adjustsFontSizeToFitWidth = true
        self.colorView.addSubview(paiMingLable)
        paiMingLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.nickNameLable)
            make.width.equalTo(self).multipliedBy(0.23)
            make.top.equalTo(self.nickNameLable.snp.bottom).offset(16)
            make.height.equalTo(20)
            
        }
        
        paiMingNumLable = UILabel()
        paiMingNumLable.textColor = .white
        paiMingNumLable.text = "93"
        paiMingNumLable.font = UIFont.systemFont(ofSize: 24)
        self.colorView.addSubview(paiMingNumLable)
        paiMingNumLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.paiMingLable.snp.right)
            make.width.equalTo(30)
            make.top.equalTo(self.nickNameLable.snp.bottom).offset(15)
            make.bottom.equalTo(self.paiMingLable)
            
        }
        
        yueduLable = UILabel()
        yueduLable.textColor = .white
        yueduLable.text = "阅读"
        yueduLable.font = UIFont.systemFont(ofSize: 17)
        self.colorView.addSubview(yueduLable)
        yueduLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.colorView).offset(25)
            make.bottom.equalTo(self.colorView).offset(-10)
            make.width.equalTo(self.colorView).multipliedBy(0.1)
            make.height.equalTo(20)
        }
        
        yueDuNumLable = UILabel()
        yueDuNumLable.textColor = .white
        yueDuNumLable.text = "98.7 w"
        yueDuNumLable.font = UIFont.systemFont(ofSize: 21)
        yueDuNumLable.adjustsFontSizeToFitWidth = true
        self.colorView.addSubview(yueDuNumLable)
        yueDuNumLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.yueduLable.snp.right)
            make.width.equalTo(65)
            make.height.equalTo(self.yueduLable).offset(3)
            make.bottom.equalTo(self.yueduLable)
            
        }
        
        tieZiLable = UILabel()
        tieZiLable.textColor = .white
        tieZiLable.text = "帖子"
        tieZiLable.font = UIFont.systemFont(ofSize: 17)
        self.colorView.addSubview(tieZiLable)
        tieZiLable.snp.makeConstraints { (make) in
            make.right.equalTo(self.colorView.snp.centerX).offset(-5)
            make.bottom.equalTo(self.colorView).offset(-10)
            make.width.equalTo(self.colorView).multipliedBy(0.1)
            make.height.equalTo(20)
        }
        tieZiLable.textAlignment = .right
        
        tieZiNumLable = UILabel()
        tieZiNumLable.textColor = .white
        tieZiNumLable.text = "10987"
        tieZiNumLable.font = UIFont.systemFont(ofSize: 21)
        tieZiNumLable.adjustsFontSizeToFitWidth = true
        self.colorView.addSubview(tieZiNumLable)
        tieZiNumLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.tieZiLable.snp.right).offset(3)
            make.width.equalTo(65)
            make.height.equalTo(self.tieZiLable).offset(3)
            make.bottom.equalTo(self.tieZiLable)
            
        }
        
        fenSiNumLable = UILabel()
        fenSiNumLable.textColor = .white
        fenSiNumLable.text = "2345"
        fenSiNumLable.font = UIFont.systemFont(ofSize: 21)
        fenSiNumLable.adjustsFontSizeToFitWidth = true
        self.colorView.addSubview(fenSiNumLable)
        fenSiNumLable.snp.makeConstraints { (make) in
            make.right.equalTo(self.colorView).offset(-25)
            make.width.equalTo(55)
            make.height.equalTo(self.yueduLable).offset(3)
            make.bottom.equalTo(self.yueduLable)
        }
        
        
        fenSiLable = UILabel()
        fenSiLable.textColor = .white
        fenSiLable.text = "粉丝"
        fenSiLable.font = UIFont.systemFont(ofSize: 17)
        fenSiLable.textAlignment = .right
        self.colorView.addSubview(fenSiLable)
        fenSiLable.snp.makeConstraints { (make) in
            make.right.equalTo(self.fenSiNumLable.snp.left).offset(-3)
            make.bottom.equalTo(self.colorView).offset(-10)
            make.width.equalTo(self.colorView).multipliedBy(0.1)
            make.height.equalTo(20)
        }
        fenSiLable.textAlignment = .right
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
