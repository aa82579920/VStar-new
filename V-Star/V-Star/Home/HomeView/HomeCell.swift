//
//  HomeCell.swift
//  V-Star
//
//  Created by 王申宇 on 2019/10/7.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import SDWebImage

/// 首页通用cell
class HomeCell: UICollectionViewCell {
    var tags = UILabel()
    var cover = UIButton()
    var footerView = HomeFooterView(frame: CGRect(x: 0, y: 120, width: (Screen.width - 10) / 2, height: 40))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
        
    func initView() {
        tags.font = UIFont.flexibleSystemFont(ofSize: 10)
        tags.textAlignment = .center
        tags.backgroundColor = .clear
        tags.layer.masksToBounds = true
        tags.layer.cornerRadius = 5
        tags.layer.borderWidth = 4
        tags.layer.borderColor = UIColor.white.cgColor
        self.contentView.addSubview(tags)
        self.contentView.addSubview(footerView)
        footerView.snp.makeConstraints { make in
            make.bottom.left.right.equalTo(self.contentView)
            make.height.equalTo(40)
        }
        self.contentView.addSubview(cover)
        cover.snp.makeConstraints { make in
            make.top.left.right.equalTo(self.contentView)
            make.bottom.equalTo(footerView.snp.top)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
