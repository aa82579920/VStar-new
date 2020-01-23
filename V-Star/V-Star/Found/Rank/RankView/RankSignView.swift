//
//  RankSignView.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/30.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class RankSignView: GradualColorView {
    let title = UILabel()
    let updateSign = UILabel()
    
    func setView() {
        title.text = "本月人气排行"
        title.textColor = .white
        title.backgroundColor = .none
        title.font = UIFont.flexibleSystemFont(ofSize: 14)
        
        updateSign.text = "更新时间：每日凌晨4点"
        updateSign.textColor = .white
        updateSign.backgroundColor = .none
        updateSign.font = UIFont.flexibleSystemFont(ofSize: 10)
    }
    
    func addView() {
        self.addSubview(title)
        self.addSubview(updateSign)
        
        title.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(10)
        }
        
        updateSign.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(title.snp.bottom).offset(6)
        }
    }
}
