//
//  NationalItemView.swift
//  V-Star
//
//  Created by 王申宇 on 2019/9/27.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import SnapKit
//通用的小标签
class NationalTagView: UIView {
    let textLabel = UILabel()
    var content: String!
    var color: UIColor!
    var backImage: UIImageView!
    var suitToLength: Bool!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        defaultData()
    }
    
    func defaultData() {
        self.content = ""
        self.color = .red
        self.width = 30
        self.height = 16
        self.suitToLength = true
    }
    func setTextLabel(content: String, color: UIColor) {
        textLabel.text = content
        textLabel.font = UIFont.flexibleSystemFont(ofSize: 16)
        textLabel.backgroundColor = color
        textLabel.textAlignment = .center
        if suitToLength {
            textLabel.sizeToFit()
            self.width = textLabel.width
        }
    }
    func setTextLabel(content: String, backImage: UIImageView) {
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
        self.addSubview(backImage)
        backImage.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setView() {
        
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
