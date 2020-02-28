//
//  MyNewsController.swift
//  V-Star
//
//  Created by 王春杉 on 2020/2/28.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import WMPageController
class MyNewsController:  UIViewController {
    var pageController: WMPageController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的消息"
        self.view.backgroundColor = UIColor.white
        
    }
    
    //MARK: -设置导航栏
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(color: UIColor.starRed), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        setPageView()
    }
    func setPageView() {
        
        pageController = WMPageController.init(viewControllerClasses: [NoticeController.self, MessageController.self, LikesController.self, CommentController.self], andTheirTitles: ["消息", "留言","点赞", "评论"])
        pageController!.menuViewStyle = .line
        pageController!.menuItemWidth = Device.width/5  // 每个 MenuItem 的宽度
        pageController!.menuHeight = 60            // 导航栏高度
        //                pageController!.postNotification = true
        //                pageController!.bounces = true
        pageController!.titleSizeSelected = 16    // 选中时的标题尺寸
        pageController!.titleSizeNormal = 15      // 非选中时的标题尺寸
        pageController!.titleColorSelected = UIColor.black    //标题选中时的颜色, 颜色是可动画的
        pageController!.titleColorNormal = UIColor.gray    //标题非选择时的颜色, 颜色是可动画的
        pageController!.menuBGColor = UIColor.white        //导航栏背景色
        pageController?.viewFrame = CGRect(x: 0, y: 64, width: Device.width, height: Device.height-64)
        view.addSubview(self.pageController!.view)
        
    }}
