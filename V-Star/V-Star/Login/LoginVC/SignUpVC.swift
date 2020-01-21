//
//  SignUpVC.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/19.
//  Copyright © 2019 mac. All rights reserved.
//
// - MARK: 谁能告诉我为什么设计图和后台给的东西都不一样？？？
import UIKit
import SnapKit

class SignUpVC: UIViewController {
    
    let backBtn = UIButton()              //返回
    let signTitle = UILabel()             //界面标题
    let phoneNumber = UITextField()       //输入手机号码
    let indentify = UITextField()         //输入验证码
    let send = UIButton()                 //发送验证码
    let setPwd = UITextField()            //设置密码
    let confirmPwd = UITextField()        //确认密码
    let finish = UIButton()               //完成注册
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setView() {
        
        backBtn.setImage(UIImage(named: "后退"), for: .normal)
        backBtn.addTarget(.none, action: #selector(back), for: .touchUpInside)
        
        signTitle.text = "注册"
        signTitle.textColor = .white
        signTitle.font = UIFont.flexibleSystemFont(ofSize: 14)
        
        phoneNumber.placeholder = "输入手机号"
        phoneNumber.layer.masksToBounds = true
        phoneNumber.clearButtonMode = .unlessEditing
        
        indentify.placeholder = "输入验证码"
        indentify.layer.masksToBounds = true
        indentify.clearButtonMode = .unlessEditing
        
        send.setTitle("点击发送", for: .normal)
        send.titleLabel?.font = UIFont.flexibleSystemFont(ofSize: 12)
        send.titleLabel?.textColor = .white
        send.titleLabel?.backgroundColor = UIColor(red: 240, green: 153, blue: 100, alpha: 1.0)
        send.layer.masksToBounds = true
        
        setPwd.placeholder = "设置密码"
        setPwd.layer.masksToBounds = true
        setPwd.isSecureTextEntry = true
        setPwd.clearButtonMode = .unlessEditing
        
        confirmPwd.placeholder = "确认密码"
        confirmPwd.layer.masksToBounds = true
        confirmPwd.isSecureTextEntry = true
        confirmPwd.clearButtonMode = .unlessEditing
        
        finish.setTitle("完成注册", for: .normal)
        finish.layer.masksToBounds = true
        finish.titleLabel?.backgroundColor = UIColor(red: 240, green: 153, blue: 100, alpha: 1.0)
        finish.titleLabel?.textColor = .white
        finish.titleLabel?.font = UIFont.flexibleSystemFont(ofSize: 12)
    }
    
    private func addView() {
        view.addSubview(backBtn)
        backBtn.snp.makeConstraints { make in
            make.left.equalTo(view).offset(10)
            make.top.equalTo(view).offset(27)
        }
        
        view.addSubview(signTitle)
        signTitle.snp.makeConstraints { make in
            make.centerX.equalTo(view)
        }
        
        phoneNumber.layer.cornerRadius = 9
        view.addSubview(phoneNumber)
        phoneNumber.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.width.equalTo(view).inset(view.frame.width / 3)
            make.top.equalTo(backBtn).offset(60)
            make.height.equalTo(18)
        }
        
        indentify.layer.cornerRadius = 9
        view.addSubview(indentify)
        indentify.snp.makeConstraints { make in
            make.left.equalTo(phoneNumber)
            make.right.equalTo(phoneNumber.snp.centerX)
            make.top.equalTo(phoneNumber.snp.bottom).offset(18)
            make.height.equalTo(18)
        }
        
        send.layer.cornerRadius = 9
        view.addSubview(send)
        send.snp.makeConstraints { make in
            make.left.equalTo(indentify.snp.right).offset(8)
            make.top.equalTo(indentify)
            make.right.equalTo(phoneNumber)
            make.height.equalTo(18)
        }
        
        setPwd.layer.cornerRadius = 9
        view.addSubview(setPwd)
        setPwd.snp.makeConstraints { make in
            make.left.equalTo(phoneNumber)
            make.top.equalTo(send.snp.bottom).offset(18)
            make.right.equalTo(phoneNumber)
            make.height.equalTo(18)
        }
        
        confirmPwd.layer.cornerRadius = 9
        view.addSubview(confirmPwd)
        confirmPwd.snp.makeConstraints { make in
            make.left.equalTo(phoneNumber)
            make.top.equalTo(setPwd.snp.bottom).offset(18)
            make.right.equalTo(phoneNumber)
            make.height.equalTo(18)
        }
        
        finish.layer.cornerRadius = 9
        view.addSubview(finish)
        finish.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(confirmPwd.snp.bottom).offset(17)
        }
    }
}

extension SignUpVC {
    @objc func back() {
        self.navigationController?.popToViewController(SignInViewController(), animated: true)
    }
    
    @objc func finishSign() {
        MyStorage.username = phoneNumber.text!
        MyStorage.password = setPwd.text!
        PostHelper.PostSignUp(success: { signUp in
            print(signUp.errorCode)
        }, failure: { _ in
            
        })
    }
}
