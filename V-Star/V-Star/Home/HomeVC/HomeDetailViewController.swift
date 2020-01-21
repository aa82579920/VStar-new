//
//  HomeDetailViewController.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/10.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class HomeDetailVeiwController: UIViewController {
    var detailText = ""
    private var textLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "测试详情页面"
        view.backgroundColor = UIColor.white
        
        textLabel.textAlignment = .center
        textLabel.textColor = UIColor.black
        textLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(textLabel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        textLabel.text = detailText
        textLabel.sizeToFit()
        textLabel.center = view.center
    }

}
