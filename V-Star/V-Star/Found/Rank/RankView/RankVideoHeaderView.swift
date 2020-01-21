//
//  RankVideoHeaderView.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/30.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class RankWorkView: UIView {
    let logo = UIImageView()
    let title = UILabel()
    
    convenience init() {
        self.init()
        title.text = "本月人气视频"
        title.textColor = UIColor.starRed
        title.font = UIFont.flexibleSystemFont(ofSize: 14)
        //MARK: - logo 现在没有图呜呜呜呜呜
        addSubview(title)
        addSubview(logo)
        
        logo.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(7)
        }
        
        title.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(logo.snp.right).offset(10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
