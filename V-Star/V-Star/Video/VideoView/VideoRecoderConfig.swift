//
//  VideoRecoderConfig.swift
//  V-Star
//
//  Created by 王申宇 on 2019/10/17.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class VideoRecoderConfig: UIView {
    let flip_over = UIButton()
    let flip_overLabel = UILabel()
    let filter = UIButton()
    let filterLabel = UILabel()
    let record_delete = UIButton()
    let record_save = UIButton()
    let recordBtn = UIButton()
    let uploadBtn = UIButton()
    let backBtn = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    func initView() {
        self.backgroundColor = .clear
        flip_over.setImage(UIImage(named: "flip_over"), for: .normal)
        flip_over.setImage(UIImage(named: "flip_over"), for: .highlighted)
//        flip_over.addTarget(self, action: #selector(flip), for: .touchUpInside)
        flip_over.backgroundColor = .clear
        self.addSubview(flip_over)
        flip_over.snp.makeConstraints { make in
            make.right.equalTo(self).offset(18)
            make.top.equalTo(self).offset(22)
            make.width.height.equalTo(35)
        }
        backBtn.setImage(UIImage(named: "后退"), for: .normal)
        backBtn.adjustsImageWhenHighlighted = false
        backBtn.backgroundColor = .clear
        self.addSubview(backBtn)
        backBtn.snp.makeConstraints { make in
            make.left.equalTo(self).offset(18)
            make.top.equalTo(flip_over)
            make.width.equalTo(21)
            make.height.equalTo(30)
        }
        flip_overLabel.text = "翻转"
        flip_overLabel.textAlignment = .center
        flip_overLabel.font = UIFont.flexibleSystemFont(ofSize: 12)
        flip_overLabel.textColor = .white
        flip_overLabel.backgroundColor = .clear
        self.addSubview(flip_overLabel)
        flip_overLabel.snp.makeConstraints { make in
            make.top.equalTo(flip_over.snp.bottom).offset(10)
            make.centerX.equalTo(flip_over)
            make.width.equalTo(flip_over)
            make.height.equalTo(flip_over)
        }
        filter.setImage(UIImage(named: "filter"), for: .normal)
        filter.setImage(UIImage(named: "filter"), for: .highlighted)
        filter.addTarget(self, action: #selector(filte), for: .touchUpInside)
        filter.backgroundColor = .clear
        self.addSubview(filter)
        filter.snp.makeConstraints { make in
            make.top.equalTo(flip_overLabel.snp.bottom).offset(20)
            make.centerX.equalTo(flip_over)
            make.width.height.equalTo(35)
        }
        filterLabel.text = "滤镜"
        filterLabel.textAlignment = .center
        filterLabel.font = UIFont.flexibleSystemFont(ofSize: 12)
        filterLabel.textColor = .white
        filterLabel.backgroundColor = .clear
        self.addSubview(filterLabel)
        filterLabel.snp.makeConstraints { make in
            make.top.equalTo(filter).offset(10)
            make.centerX.equalTo(filter)
            make.width.height.equalTo(filterLabel)
        }
        recordBtn.layer.masksToBounds = true
        recordBtn.layer.cornerRadius = 40
        recordBtn.backgroundColor = UIColor.starRed
        recordBtn.frame = CGRect(origin: CGPoint(x: Screen.width / 2, y: Screen.height - 70), size: CGSize(width: 80, height: 80))
        self.addSubview(recordBtn)
        record_save.setImage(UIImage(named: "record_save"), for: .normal)
        record_save.setImage(UIImage(named: "record_save"), for: .normal)
        record_save.backgroundColor = .clear
        self.addSubview(record_save)
        record_save.snp.makeConstraints { make in
            make.centerY.equalTo(recordBtn)
            make.left.equalTo(recordBtn.snp.right).offset(20)
            make.width.height.equalTo(30)
        }
        record_delete.setImage(UIImage(named: "record_delete"), for: .normal)
        record_delete.setImage(UIImage(named: "record_delete"), for: .highlighted)
        record_delete.backgroundColor = .clear
        self.addSubview(record_delete)
        record_save.snp.makeConstraints { make in
            make.centerY.equalTo(recordBtn)
            make.left.equalTo(record_save.snp.right).offset(20)
            make.width.height.equalTo(30)
        }
        uploadBtn.setTitle("本地上传", for: .normal)
        uploadBtn.setTitle("本地上传", for: .normal)
        uploadBtn.titleLabel?.font = UIFont.flexibleSystemFont(ofSize: 12)
        uploadBtn.titleLabel?.textColor = .white
        uploadBtn.titleLabel?.textAlignment = .center
        uploadBtn.backgroundColor = .clear
        self.addSubview(uploadBtn)
        uploadBtn.snp.makeConstraints { make in
            make.centerY.equalTo(recordBtn)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VideoRecoderConfig {
    //滤镜
    @objc func filte() {
        
    }
    
    
}

