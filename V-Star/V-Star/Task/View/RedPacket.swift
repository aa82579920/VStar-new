//
//  RedPacket.swift
//  V-Star
//
//  Created by 王申宇 on 26/02/2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class RedPacket: UIView {
    var image: UIButton!
    var moneyIcon: UILabel!
    var money: UILabel!
    var param: UILabel!
    var sum = ""
    
    init(money: String) {
        super.init(frame: .zero)
        sum = money
        setView()
    }
    
    @objc func remove() {
        self.removeFromSuperview()
    }
    
    func setView() {
        image = UIButton()
        image.setImage(UIImage(named: "redTask"), for: .normal)
        image.setImage(UIImage(named: "redTask"), for: .highlighted)
        image.addTarget(self, action: #selector(remove), for: .touchUpInside)
        self.addSubview(image)
        image.snp.makeConstraints { make in
            make.top.equalTo(self).offset(208)
            make.bottom.equalTo(self).inset(358)
            make.left.equalTo(self).offset(86)
            make.right.equalTo(self).inset(86)
        }
        param = UILabel()
        param.text = "已存入红包"
        param.textColor = .white
        param.textAlignment = .center
        param.font = UIFont.flexibleSystemFont(ofSize: 16)
        self.addSubview(param)
        param.snp.makeConstraints { make in
            make.bottom.equalTo(image).inset(40)
            make.centerX.equalTo(image)
            make.width.equalTo(image)
            make.height.equalTo(20)
        }
        moneyIcon = UILabel()
        moneyIcon.text = "¥"
        moneyIcon.font = UIFont.flexibleSystemFont(ofSize: 24)
        moneyIcon.textColor = .white
        self.addSubview(moneyIcon)
        moneyIcon.snp.makeConstraints { make in
            make.left.equalTo(image).offset(43)
            make.width.height.equalTo(24)
            make.bottom.equalTo(param.snp.top).inset(24)
        }
        money = UILabel()
        money.text = sum
        money.font = UIFont.flexibleSystemFont(ofSize: 40)
        money.textColor = .white
        self.addSubview(money)
        money.snp.makeConstraints { make in
            make.bottom.equalTo(moneyIcon)
            make.left.equalTo(moneyIcon.snp.right).offset(10)
            make.width.equalTo(90)
            make.height.equalTo(40)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
