//
//  STTabBarCenterButton.swift
//  V-Star
//
//  Created by 王申宇 on 2019/11/4.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class STTabBarCenterButton: UIButton {
    var type = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImage(UIImage(named: "摄像头"), for: .normal)
        self.adjustsImageWhenHighlighted = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
