//
//  SignInViewController.swift
//  V-Star
//
//  Created by 王春杉 on 2019/8/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
import SwiftyJSON
class SignInViewController: UIViewController, WXApiDelegate {
    
    var backView = UIImageView()
    let vtitle = UILabel()
    let userName = UILabel()
    let password = UILabel()
    let quickSign = UILabel()
    let userNameText = UITextField()
    let passwordText = UITextField()
    let fogetPwd = UIButton()
    let phoneSignIn = UIButton()
    let signUp = UIButton()
    let qq = UIButton()
    let wechat = UIButton()
    let weibo = UIButton()
    let lineL = UIView()
    let lineR = UIView()
    let view1 = UIView()
    let view2 = UIView()
    let loginBtn = UIButton()
    let qqBtn = UIButton()
    let weiXinBtn = UIButton()
    let weiBoBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSignInView()
        addSignInView()
        
    }
    //设置属性
    private func setSignInView() {
        backView = UIImageView(frame: self.view.bounds)
        backView.image = UIImage(named: "loginBack")
        
        //标题
        vtitle.text = "V-Star"
        vtitle.textColor = .white
        vtitle.font = UIFont.flexibleSystemFont(ofSize: 30)
        //账号label
        userName.text = "账号"
        userName.textColor = .white
        userName.font = UIFont.flexibleSystemFont(ofSize: 20)
        //密码label
        password.text = "密码"
        password.textColor = .white
        password.font = UIFont.flexibleSystemFont(ofSize: 20)
        //账号输入
        view1.layer.masksToBounds = true
        view1.layer.cornerRadius = 20
        view1.backgroundColor = UIColor(red: 133/255, green: 41/255, blue: 37/255, alpha: 1)
        
        userNameText.clearButtonMode = .unlessEditing
        userNameText.textAlignment = .left
        userNameText.backgroundColor = UIColor(red: 133/255, green: 41/255, blue: 37/255, alpha: 1)
        userNameText.returnKeyType = .done
        userNameText.delegate = self
        //密码输入
        view2.layer.masksToBounds = true
        view2.layer.cornerRadius = 20
        view2.backgroundColor = UIColor(red: 133/255, green: 41/255, blue: 37/255, alpha: 1)
        
        passwordText.clearButtonMode = .unlessEditing
        passwordText.textAlignment = .left
        passwordText.backgroundColor = UIColor(red: 133/255, green: 41/255, blue: 37/255, alpha: 1)
        passwordText.returnKeyType = UIReturnKeyType.done
        passwordText.isSecureTextEntry = true
        passwordText.delegate = self
        //忘记密码
        fogetPwd.setTitle("忘记密码？", for: .normal)
        fogetPwd.titleLabel?.textColor = .white
        fogetPwd.titleLabel?.font = UIFont.flexibleSystemFont(ofSize: 13)
        //手机登录
        phoneSignIn.setTitle("手机登录>>", for: .normal)
        phoneSignIn.titleLabel?.textColor = .white
        phoneSignIn.titleLabel?.font = UIFont.flexibleSystemFont(ofSize: 13)
        //注册新用户
        signUp.setTitle("注册新用户", for: .normal)
        signUp.titleLabel?.textColor = .white
        signUp.titleLabel?.font = UIFont.flexibleSystemFont(ofSize: 13)
        signUp.addTarget(.none, action: #selector(SignUp), for: .touchUpInside)
        //快速登录
        quickSign.text = "快速登录"
        quickSign.font = UIFont.flexibleSystemFont(ofSize: 13)
        quickSign.textColor = .white
        
        //快速登录左右两条线
        lineL.backgroundColor = .white
        lineR.backgroundColor = .white
        
        // 登录按钮
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.tintColor = .white
        loginBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        // qq按钮
        qqBtn.setImage(UIImage(named: "QQ"), for: .normal)
        qqBtn.addTarget(self, action: #selector(clickQQ), for: .touchUpInside)
        
        // 微信按钮
        weiXinBtn.setImage(UIImage(named: "Wechat"), for: .normal)
        weiXinBtn.addTarget(self, action: #selector(clickWeiXin), for: .touchUpInside)
        
        // 微博按钮
        weiBoBtn.setImage(UIImage(named: "sina"), for: .normal)
        weiBoBtn.addTarget(self, action: #selector(clickWeiBo), for: .touchUpInside)
        
    }
    
    private func addSignInView() {
        view.addSubview(backView)
        view.addSubview(vtitle)
        vtitle.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(90)
        }
        
        view.addSubview(userName)
        userName.snp.makeConstraints { make in
            make.left.equalTo(view).offset(50)
            make.top.equalTo(vtitle.snp.bottom).offset(50)
            
        }
        view.addSubview(view1)
        view1.snp.makeConstraints { make in
            make.left.equalTo(view).offset(40)
            make.right.equalTo(view).inset(40)
            make.top.equalTo(userName.snp.bottom).offset(7)
            make.height.equalTo(50)
        }
        view1.addSubview(userNameText)
        userNameText.snp.makeConstraints { make in
            make.left.equalTo(view1).offset(20)
            make.top.equalTo(view1).offset(1)
            make.right.equalTo(view1).inset(20)
            make.height.equalTo(48)
        }
        
        
        view.addSubview(password)
        password.snp.makeConstraints { make in
            make.left.equalTo(view).offset(50)
            make.top.equalTo(userNameText.snp.bottom).offset(7)
        }
        
        view.addSubview(view2)
        view2.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(40)
            make.right.equalTo(view).inset(40)
            make.top.equalTo(password.snp.bottom).offset(7)
            make.height.equalTo(50)
        }
        view2.addSubview(passwordText)
        passwordText.snp.makeConstraints { make in
            make.left.equalTo(view2).offset(20)
            make.top.equalTo(view2).offset(1)
            make.right.equalTo(view2).inset(20)
            make.height.equalTo(48)
        }
        
        view.addSubview(fogetPwd)
        fogetPwd.snp.makeConstraints { make in
            make.left.equalTo(view).offset(60)
            make.top.equalTo(passwordText.snp.bottom).offset(20)
        }
        
        view.addSubview(phoneSignIn)
        phoneSignIn.snp.makeConstraints { make in
            make.right.equalTo(view).inset(60)
            make.top.equalTo(fogetPwd)
        }
        
        view.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(phoneSignIn.snp.bottom).offset(50)
        }
        
        view.addSubview(signUp)
        signUp.snp.makeConstraints { make in
            make.centerX.equalTo(vtitle)
            make.top.equalTo(loginBtn.snp.bottom).offset(10)
        }
        
        view.addSubview(quickSign)
        quickSign.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(view.snp.bottom).inset(130)
        }
        
        view.addSubview(lineL)
        lineL.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(20)
            make.right.equalTo(quickSign.snp.left).offset(-20)
            make.height.equalTo(1)
            make.centerY.equalTo(quickSign)
        }
        
        view.addSubview(lineR)
        lineR.snp.makeConstraints { (make) in
            make.left.equalTo(quickSign.snp.right).offset(20)
            make.right.equalTo(view).inset(20)
            make.height.equalTo(1)
            make.centerY.equalTo(quickSign)
        }
        
        view.addSubview(weiBoBtn)
        weiBoBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(quickSign.snp.bottom).offset(25)
            make.height.width.equalTo(30)
        }
        
        view.addSubview(weiXinBtn)
        weiXinBtn.snp.makeConstraints { (make) in
            make.top.equalTo(quickSign.snp.bottom).offset(25)
            make.right.equalTo(weiBoBtn.snp.left).offset(-50)
            make.height.equalTo(30)
            make.width.equalTo(35)
        }
        
        view.addSubview(qqBtn)
        qqBtn.snp.makeConstraints { (make) in
            make.top.equalTo(quickSign.snp.bottom).offset(25)
            make.left.equalTo(weiBoBtn.snp.right).offset(50)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
    }
}

extension SignInViewController {
    @objc func SignUp() {
        self.navigationController?.pushViewController(SignUpVC(), animated: true)
    }
    
    @objc func clickQQ() {
        print("qq被点击了")
    }
    
    @objc func clickWeiXin() {
        print("微信被点击了")
        let req = SendAuthReq()
        req.scope = "snsapi_userinfo"
        req.state = "default_state"
        
        WXApi.send(req)
        
        afterLogin()
    }
    
    @objc func clickWeiBo() {
        print("微博被点击了")
    }
    
    @objc func login() {
        let username = userNameText.text
        let password = passwordText.text
        
        if (username != nil) && (password != nil) {
            MyStorage.username = username!
            MyStorage.password = password!
            
            let url = VStar_URL.baseURL + VStar_URL.user.login
            Alamofire.request(url, method: .post,
                              parameters: ["username": MyStorage.username, "password": MyStorage.password]).responseJSON { response in
                switch response.result.isSuccess {
                case true:
                    if let value = response.result.value {
                        let json = JSON(value)
                        let message = json["message"].string!
                        if message == "succeed" {
                            MyStorage.userID = json["data"]["user_ID"].int!
                            MyStorage.avatar = json["data"]["avatar"].string!
                            if json["data"]["sex"].string! == "男" {
                                MyStorage.sex = 1
                            }else {
                                MyStorage.sex = 2
                            }
                            MyStorage.age = json["data"]["age"].int!
                            MyStorage.signature = json["data"]["signature"].string!
                            MyStorage.cityName = json["data"]["city"].string!
                            
                            self.afterLogin()
                        }
                    }
    
                case false:
                    print(response.result.error)
                }
            }
        }else {
            print("用户名或密码不能为空！")
        }
    }
    
    func afterLogin() {
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
        mineViewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
        
        let mineNavigationController = UINavigationController(rootViewController: mineViewController)
        mineNavigationController.tabBarItem.title = "我的"
        mineNavigationController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)], for: .normal)
        mineNavigationController.tabBarItem.image = nil
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = UIColor(hex6: 0xe2294b)
        tabBarController.tabBar.barTintColor = .black
        
        tabBarController.viewControllers = [homeViewController,attentViewController,setViewController,foundViewController,mineNavigationController]
        
        self.present(tabBarController, animated: true, completion: nil)
    }
}
extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
