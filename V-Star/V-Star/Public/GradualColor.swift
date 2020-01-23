//
//  GradualColor.swift
//  V-Star
//
//  Created by 王申宇 on 2019/11/7.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class GradualColorView: UIView {
    var gradientLayer: CAGradientLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createGradientLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     //初始化gradientLayer并设置相关属性
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        //设置渐变的主颜色
        gradientLayer.colors = [UIColor.starRed.cgColor, UIColor.orange.cgColor]
        //将gradientLayer作为子layer添加到主layer上
        self.layer.addSublayer(gradientLayer)
    }
}
