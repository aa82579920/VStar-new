
//
//  File.swift
//  V-Star
//
//  Created by 王申宇 on 2019/11/5.
//  Copyright © 2019 mac. All rights reserved.
//

class RankTotalTopView: UIView {
    let top1 = RealRankTopView()
    let top2 = RealRankTopView()
    let top3 = RealRankTopView()
    var userRank: UserRank!
    
    
    func setView() {
        top1.setRank(realRank: 1)
        top2.setRank(realRank: 2)
        top3.setRank(realRank: 3)
    }
    func addView() {
        addSubview(top1)
        addSubview(top2)
        addSubview(top3)
        
        top1.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(8)
            make.left.equalTo(self).offset(UIScreen.main.bounds.maxX / 3 + 23)
            make.right.equalTo(self).offset(-UIScreen.main.bounds.maxX / 3 - 23)
            make.bottom.equalTo(self).offset(-30)
        }
        
        top2.snp.makeConstraints { make in
            make.right.equalTo(top1.snp.left).offset(-40)
            make.top.equalTo(self).offset(27)
            make.width.height.equalTo(top1)
        }
        
        top3.snp.makeConstraints { make in
            make.left.equalTo(top1.snp.right).offset(40)
            make.top.equalTo(top2)
            make.width.height.equalTo(top1)

        }
    }
}
