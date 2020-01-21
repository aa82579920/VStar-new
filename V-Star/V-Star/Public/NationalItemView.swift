//
//  NationalItemView.swift
//  V-Star
//
//  Created by 王申宇 on 2019/9/27.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
//通用的小标签
class NationalItemView: UIView {
    let textLabel = UILabel()
    convenience init(content: String, color: UIColor, suitToLength: Bool) {
        self.init(content: content, color: color, suitToLength: suitToLength)
        self.setView()
        textLabel.text = content
        textLabel.font = UIFont.flexibleSystemFont(ofSize: 16)
        textLabel.backgroundColor = color
        textLabel.textAlignment = .center
        if suitToLength {
            textLabel.sizeToFit()
            self.width = textLabel.width
        }
        addLabel()
    }
    convenience init(content: String, backImage: UIImageView, suitToLength: Bool) {
        self.init(content: content, backImage: backImage, suitToLength: suitToLength)
        setView()
        self.addSubview(backImage)
        backImage.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        textLabel.text = content
        textLabel.font = UIFont.flexibleSystemFont(ofSize: 16)
        textLabel.textAlignment = .center
        if suitToLength {
            textLabel.sizeToFit()
            self.width = textLabel.width
        }
        addLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setView() {
        self.width = 30
        self.height = 16
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.height / 2
    }
    func addLabel() {
        self.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
}
