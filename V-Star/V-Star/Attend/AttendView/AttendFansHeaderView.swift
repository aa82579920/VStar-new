//
//  AttendFansHeaderView.swift
//  V-Star
//
//  Created by 王申宇 on 2019/11/5.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class AttendFansHeaderView: UIView {
    var fansLabel = UILabel()
    var num = UILabel()

    var imageArray: [UIImageView] = []
    let button = UIButton()
    let image = [UIImage(named: "qzl1"),UIImage(named: "qzl2"),UIImage(named: "qzl1"),UIImage(named: "qzl2"),UIImage(named: "qzl2")]
    
    /// num' s  text need fixing
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadData()
        fansLabel = UILabel(frame: CGRect(x: 30, y: 18, width: 100, height: 60))
        fansLabel.text = "新粉丝"
        self.addSubview(fansLabel)
        
        num = UILabel(frame: CGRect(x: 70, y: 10, width: 40, height: 20))
        num.text = "998"
        num.backgroundColor = .red
        num.layer.cornerRadius = 10
        num.clipsToBounds = true
        self.addSubview(num)

        var i = 0
        while i < 4 {
            let imageV = UIImageView(frame: CGRect(x: 90 + 24 + i * 60, y: 18, width: 40, height: 40))
            imageV.image = image[i]
            imageV.clipsToBounds = true
            imageV.layer.cornerRadius = 20
            imageArray.append(imageV)
            self.addSubview(imageV)
            blur(imgV: imageV, i: i)
            i += 1
        }
        
        button.frame = CGRect(x: Screen.width - 50, y: 18, width: 20, height: 10)
        button.setImage(UIImage(named: "qzl1"), for: .normal)
        button.addTarget(self, action: #selector(click), for: .touchUpInside)
        self.addSubview(button)
    }
    
    /// Mark: 加方法，嘿嘿
    @objc func click() {
        
    }
//    加载数据,把数据加载到image数组，应该就阔以了吧
    func loadData() {
        
    }
    
    func blur(imgV: UIImageView, i: Int) {
        if i == 3 {
            let blurEffect = UIBlurEffect(style: .light)
            let blurView = UIVisualEffectView(effect: blurEffect)
            blurView.frame.size = imgV.frame.size
            
            let vibrancyView = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: blurEffect))
            vibrancyView.frame.size = imgV.frame.size
            blurView.contentView.addSubview(vibrancyView)
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            label.text = "+\(imageArray.count - 3)"
            label.textAlignment = .center
            vibrancyView.contentView.addSubview(label)
            
            imgV.addSubview(blurView)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


