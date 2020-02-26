//
//  PersonnalPageController.swift
//  V-Star
//
//  Created by 王春杉 on 2020/2/26.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
class PersonnalPageController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "个人主页"
        self.view.backgroundColor = .white
    }
    //MARK: -设置导航栏
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(color: UIColor.starRed), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
    }
}
