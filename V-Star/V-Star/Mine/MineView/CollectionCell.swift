//
//  CollectionCell.swift
//  V-Star
//
//  Created by 王申宇 on 26/03/2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    var cover: UIImageView!
    var playImg: UIImageView!
    var num: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    private func initView() {
        cover = UIImageView()
        contentView.addSubview(cover)
        cover.snp.makeConstraints {$0.edges.equalTo(contentView)}
        num = UILabel()
        num.font = UIFont.flexibleSystemFont(ofSize: 10)
        num.textColor = UIColor(hex6: 0xffffff)
        num.textAlignment = .right
        contentView.addSubview(num)
        num.snp.makeConstraints { make in
            make.right.equalTo(contentView).inset(10)
            make.bottom.equalTo(contentView).inset(8)
        }
        playImg = UIImageView(image: UIImage(named: "play"))
        contentView.addSubview(playImg)
        playImg.snp.makeConstraints { make in
            make.centerY.equalTo(num)
            make.right.equalTo(num.snp.left).inset(6)
            make.width.height.equalTo(15)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
