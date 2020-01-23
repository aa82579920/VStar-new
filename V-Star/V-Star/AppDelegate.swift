//
//  AppDelegate.swift
//  V-Star
//
//  Created by 王申宇 on 2019/7/17.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

let tabBarController = STTabBarController()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, WXApiDelegate {

    var window: UIWindow?
    let weChatAPPID = "wx25f4247bfc210abf"
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        WXApi.registerApp(weChatAPPID, universalLink: <#T##String#>)
        WXApi.registerApp(weChatAPPID)
        
        let homeViewController = UINavigationController.init(rootViewController: HomeViewController())
        let attendViewController = UINavigationController.init(rootViewController: AttentViewController())
        let foundViewController = UINavigationController.init(rootViewController: FoundViewController())
        let mineViewController = UINavigationController.init(rootViewController: MineViewController())
        homeViewController.setNavigationBarHidden(true, animated: false)
        attendViewController.setNavigationBarHidden(true, animated: false)
        foundViewController.setNavigationBarHidden(true, animated: false)
        mineViewController.setNavigationBarHidden(true, animated: false)
        tabBarController.addChildController(childController: homeViewController, title: "首页")
        tabBarController.addChildController(childController: attendViewController, title: "关注")
        tabBarController.addChildController(childController: foundViewController, title: "发现")
        tabBarController.addChildController(childController: mineViewController, title: "我的")
        let tabbarController = UINavigationController.init(rootViewController: tabBarController)
        tabbarController.setNavigationBarHidden(true, animated: false)
        self.window?.rootViewController = tabbarController
        window?.backgroundColor = .white
        
        if UserDefaults.standard.bool(forKey: "everLaunched") == false {
            UserDefaults.standard.set(true, forKey: "everLaunched")
            UserDefaults.standard.set(true, forKey: "firstLaunch")
        }else{
            UserDefaults.standard.set(false, forKey: "firstLaunch")
        }
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
        
//        let urlKey: String = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String
        
//        if urlKey == "com.tencent.xin" {
            // 微信 的回调
            return  WXApi.handleOpen(url, delegate: self)
//        }
        
//        return true
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

