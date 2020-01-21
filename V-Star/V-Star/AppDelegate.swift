//
//  AppDelegate.swift
//  V-Star
//
//  Created by 王申宇 on 2019/7/17.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, WXApiDelegate {

    var window: UIWindow?
    let weChatAPPID = "wx25f4247bfc210abf"
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        WXApi.registerApp(weChatAPPID, universalLink: <#T##String#>)
        WXApi.registerApp(weChatAPPID)
        
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem.image = nil
        homeViewController.tabBarItem.title = "首页"
        homeViewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)], for: .normal)
        homeViewController.tabBarItem.badgeColor = UIColor(hex6: 0xcccccc)
        homeViewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
        
        let attentViewController = AttentViewController()
        attentViewController.tabBarItem.image = nil
        attentViewController.tabBarItem.title = "关注"
        attentViewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)], for: .normal)
        attentViewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
        
        let setViewController = SetViewController()
        setViewController.tabBarItem.image = UIImage(named: "摄像头")?.withRenderingMode(.alwaysOriginal)
        setViewController.tabBarItem.selectedImage = UIImage(named: "摄像头")
        //FIXME: - 不同机型图的大小会不同。。。
        setViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 40, bottom: 0, right: 40)
        setViewController.tabBarItem.title = nil
        
        let foundViewController = FoundViewController()
        foundViewController.tabBarItem.image = nil
        foundViewController.tabBarItem.title = "发现"
        foundViewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)], for: .normal)
        foundViewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
        
        let mineViewController = MineViewController()
//        mineViewController.tabBarItem.image = nil
//        mineViewController.tabBarItem.title = "我的"
//        mineViewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)], for: .normal)
        mineViewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
        let mineNavigationController = UINavigationController(rootViewController: mineViewController)
        mineNavigationController.tabBarItem.title = "我的"
        mineNavigationController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)], for: .normal)
        mineNavigationController.tabBarItem.image = nil
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = UIColor(hex6: 0xe2294b)
        tabBarController.tabBar.barTintColor = .black
        //tabBarController.viewControllers = [homeViewController,attentViewController,setViewController,foundViewController,mineViewController]
        tabBarController.viewControllers = [homeViewController,attentViewController,setViewController,foundViewController,mineNavigationController]
        window?.backgroundColor = .white
        let loginVC = SignInViewController()
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.makeKeyAndVisible()
        window?.rootViewController = loginVC
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let urlKey: String = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String
        
        if urlKey == "com.tencent.xin" {
            // 微信 的回调
            return  WXApi.handleOpen(url, delegate: self)
        }
        
        return true
    }
    
    
    func onReq(_ req: BaseReq) {
        print("aaaaaaaaaaaaaa")
    }
    
    func onResp(_ resp: BaseResp) {
        // 这里是使用异步的方式来获取的
        let sendRes: SendAuthResp? = resp as? SendAuthResp
        let queue = DispatchQueue(label: "wechatLoginQueue")
        queue.async {
            
            print("async: \(Thread.current)")
            if let sd = sendRes {
                if sd.errCode == 0 {
                    
                    guard (sd.code) != nil else {
                        return
                    }
                    // 第一步: 获取到code, 根据code去请求accessToken
                    print("第一步: 获取到code, 根据code去请求accessToken")
                    self.requestAccessToken((sd.code)!)
                } else {
                    
                    DispatchQueue.main.async {
                        // 授权失败
                        print("授权失败")
                    }
                }
            } else {
                
                DispatchQueue.main.async {
                    // 异常
                }
            }
        }
    }
    private func requestAccessToken(_ code: String) {
        // 第二步: 请求accessToken
        let urlStr = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=\(self.weChatAPPID)&secret=86318e785200ed1b398f6c67e9580695&code=\(code)&grant_type=authorization_code"
        
        let url = URL(string: urlStr)
        
        do {
            //                    let responseStr = try String.init(contentsOf: url!, encoding: String.Encoding.utf8)
            
            let responseData = try Data.init(contentsOf: url!, options: Data.ReadingOptions.alwaysMapped)
            
            let dic = try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.allowFragments) as? Dictionary<String, Any>
            
            guard dic != nil else {
                DispatchQueue.main.async {
                    // 获取授权信息异常
                }
                return
            }
            
            guard dic!["access_token"] != nil else {
                DispatchQueue.main.async {
                    print("获取授权信息异常")                }
                return
            }
            
            guard dic!["openid"] != nil else {
                DispatchQueue.main.async {
                    // 获取授权信息异常
                }
                return
            }
            // 根据获取到的accessToken来请求用户信息
            self.requestUserInfo(dic!["access_token"]! as! String, openID: dic!["openid"]! as! String)
        } catch {
            DispatchQueue.main.async {
                // 获取授权信息异常
            }
        }
    }
    
    private func requestUserInfo(_ accessToken: String, openID: String) {
        
        let urlStr = "https://api.weixin.qq.com/sns/userinfo?access_token=\(accessToken)&openid=\(openID)"
        
        let url = URL(string: urlStr)
        
        do {
            //                    let responseStr = try String.init(contentsOf: url!, encoding: String.Encoding.utf8)
            
            let responseData = try Data.init(contentsOf: url!, options: Data.ReadingOptions.alwaysMapped)
            
            let dic = try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.allowFragments) as? Dictionary<String, Any>
            
            guard dic != nil else {
                DispatchQueue.main.async {
                    // 获取授权信息异常
                }
                
                return
            }
            
            if let dic = dic {
                // 这个字典(dic)内包含了我们所请求回的相关用户信息
                MyStorage.avatar = dic["headimgurl"] as! String
                MyStorage.nickname = dic["nickname"] as! String
                MyStorage.sex = dic["sex"] as! Int
                
            }
        } catch {
            DispatchQueue.main.async {
                // 获取授权信息异常
            }
        }
    }
}

