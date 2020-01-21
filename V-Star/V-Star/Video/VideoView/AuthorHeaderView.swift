//
//  AuthorHeaderVIew.swift
//  V-Star
//
//  Created by 王申宇 on 2019/9/27.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class AuthorHeaderView: UIView {
    let rankLabel = UILabel()
    let authorName = UILabel()
    let avatar = UIImageView()
    var attendItem: NationalItemView?
    var complainItem: NationalItemView?
    
    convenience init(rank: String, authorName: String, avatar: String) {
        self.init(rank: rank, authorName: authorName, avatar: avatar)
        
        
    }
    func setView() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.height / 2
//        rankLabel.backgroundColor
        attendItem = NationalItemView(content: "+ 关注", color: UIColor.starRed, suitToLength: false)
        complainItem = NationalItemView(content: "投诉", color: UIColor.lightGray, suitToLength: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
