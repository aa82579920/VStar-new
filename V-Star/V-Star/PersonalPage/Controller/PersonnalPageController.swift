//
//  PersonnalPageController.swift
//  V-Star
//
//  Created by 王春杉 on 2020/2/26.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import SnapKit
import WMPageController
class PersonnalPageController: UIViewController {
    
    var mainScrollView: UIScrollView!  // 整个滑动栏
    var topView: PersonalPageTopView!
    var pageController: WMPageController!
    var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setMainScrollView()
        setHeadView()
        setPageView()
    }
    
    
    //MARK: -设置导航栏
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        setNavigation()
    }
    
    func setMainScrollView() {
        mainScrollView = UIScrollView(frame: self.view.frame)
        mainScrollView = UIScrollView(frame: self.view.frame)
        mainScrollView?.contentSize = CGSize(width: Device.width, height: Device.height*2)
        mainScrollView?.backgroundColor = .gray
        mainScrollView?.delegate = self
        // 当存在导航栏时，scrollview自动下移的问题解决
        mainScrollView.contentInsetAdjustmentBehavior = .never
        view.addSubview(mainScrollView!)
    }
    
    func setHeadView() {
        topView = PersonalPageTopView(frame: CGRect(x: 0, y: 0, width: self.view.width, height: 300))
//        topView.headImageView.sd_setImage(with: URL(string: HostUserID.headImageUrl!))
        
        self.mainScrollView.addSubview(topView)
    }
    
    // MARK: -初始化PageView
    func setPageView() {
        contentView = UIView()
        self.mainScrollView.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.width.height.equalTo(mainScrollView)
            make.top.equalTo(topView.snp.bottom)
            make.left.equalTo(0)
        }
        contentView.backgroundColor = .red
        
        pageController = WMPageController.init(viewControllerClasses: [CircleDongTaiController.self, CircleDongTaiController.self], andTheirTitles: ["圈子动态", "明星帖子"])
        pageController!.menuViewStyle = .line
        pageController!.menuItemWidth = Device.width/3  // 每个 MenuItem 的宽度
        pageController!.menuHeight = 60            // 导航栏高度
        //                pageController!.postNotification = true
        //                pageController!.bounces = true
        pageController!.titleSizeSelected = 16    // 选中时的标题尺寸
        pageController!.titleSizeNormal = 15      // 非选中时的标题尺寸
        pageController!.titleColorSelected = UIColor.white    //标题选中时的颜色, 颜色是可动画的
        pageController!.titleColorNormal = UIColor.white    //标题非选择时的颜色, 颜色是可动画的
        pageController!.menuBGColor = UIColor.starRed        //导航栏背景色
        pageController?.viewFrame = CGRect(x: 0, y: 0, width: Device.width, height: Device.height-64)
        self.mainScrollView?.addSubview(contentView!)
        contentView?.addSubview(self.pageController!.view)
        
        
    }
    
    func setNavigation() {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(), for: .default)
        UIApplication.shared.statusBarStyle = .lightContent
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        let leftButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self
            , action: #selector(back))
        leftButton.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = leftButton
        
        self.view.backgroundColor = UIColor.gray
        
        let backItem = UIBarButtonItem.init(title: "", style: .done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
        
    }
    @objc func back() {
         self.navigationController?.popViewController(animated: true)
    }
}

extension PersonnalPageController: UIScrollViewDelegate {
    
}
