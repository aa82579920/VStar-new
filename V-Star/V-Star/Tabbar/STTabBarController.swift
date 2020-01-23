//
//  StarTabBarController.swift
//  V-Star
//
//  Created by 王申宇 on 2019/11/4.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

@objc protocol STTabBarControllerDelegate {
    @objc optional func STTabBarControllerDidSelectedItemAtIndex(tabBarController: STTabBarController, index: Int)
    @objc optional func STTabBarControllerDidSelectedCenterButton(tabBarController: STTabBarController)
}

class STTabBarController: UITabBarController, STTabBarDelegate {
    
    var stTabBarControllerDelegate: STTabBarControllerDelegate? {
        didSet{
            let de = stTabBarControllerDelegate
            delegates.append(de!)
        }
    }
    fileprivate var delegates:Array<STTabBarControllerDelegate> = []
    //当前选中的是第几个item
    var currentItemIndex = 0
    fileprivate var tabBarItems:Array<UITabBarItem> = []
    fileprivate var tabBarItemTag = 0
    
    fileprivate lazy var tabbar:STTabBar = {
        var height:CGFloat = 49
        if Screen.height >= 812{
            height = 49 + 34
        }
        let tab = STTabBar.init(frame: CGRect.init(x: 0, y: Screen.height - height, width: Screen.width, height: height))
        tab.stTabBarDelegate = self
        return tab
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTabBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    fileprivate func addTabBar(){
        self.setValue(self.tabbar, forKey: "tabBar")
    }
    
    func addChildController(childController:UIViewController,title:String){
        childController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
        childController.tabBarItem.title = title
        childController.tabBarItem.image = nil
        childController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.flexibleSystemFont(ofSize: 16),NSAttributedString.Key.foregroundColor:UIColor(hex6: 0xe2294b)], for: .selected)
        childController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.flexibleSystemFont(ofSize: 16),NSAttributedString.Key.foregroundColor:UIColor(hex6: 0xcccccc)], for: .normal)
        childController.tabBarItem.tag = tabBarItemTag
        tabBarItemTag += 1
        tabBarItems.append(childController.tabBarItem)
        self.addChild(childController)
    }
    
    
    func STTabBarCenterButtonClicked() {
        //点击了中间按钮\
        if self.delegates.count != 0 {
            debugPrint("点击了中间按钮")
            self.delegates.forEach({ dele in
                dele.STTabBarControllerDidSelectedCenterButton!(tabBarController: self)
            })
        }
        navigationController?.pushViewController(SetViewController(), animated: true)
    }

    func getCurrentViewController() -> UIViewController{
            let rootController = UIApplication.shared.keyWindow?.rootViewController
            if let tabController = rootController as? UITabBarController   {
                if let navController = tabController.selectedViewController as? UINavigationController{
                    return navController.children.last!
                }else{
                    return tabController
                }
            }else if let navController = rootController as? UINavigationController {

                return navController.children.last!
            }else{

                return rootController!
            }
        }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    //       super.tabBar(tabBar, didSelect: item)
        if self.delegates.count != 0 {
            currentItemIndex = self.tabBarItems.firstIndex(of: item)!
            self.delegates.forEach({ (dele) in
                dele.STTabBarControllerDidSelectedItemAtIndex!(tabBarController:self, index: currentItemIndex)
            })
        }
    }
    // 隐藏状态栏
       override var prefersStatusBarHidden: Bool {
           get {
               return false
           }
       }
       override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }
       
}
