//
//  SetUpController.swift
//  V-Star
//
//  Created by 王春杉 on 2020/1/23.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class SetUpController: UIViewController {
    
    var tableView: UITableView?
    var cellNames: Dictionary<Int, [String]>?
    var headNames: [String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "设置"
        self.view.backgroundColor = .white
        
        setTableView()
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
    
    // MARK: -初始化tableview
    func setTableView() {
        self.cellNames = [
            0: [String]([
                    "账号设置",
                    "邀请好友",
                    "实名认证"]),
            1: [String]([
                "排名规则",
                "用户协议",
                "隐私协议",
                "意见反馈",
                "关于V-Star"]),
            2: [String](["退出"])
        ]
        
        self.headNames = ["账号", "关于", ""]
        
        self.tableView = UITableView(frame: self.view.frame, style: .grouped)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "SetUpCell")
        self.view.addSubview(self.tableView!)
        
        
    }
}

extension SetUpController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = cellNames?[section]
        return data!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = "SetUpCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        
        var data = self.cellNames?[indexPath.section]
        cell.textLabel?.text = data![indexPath.row]
        
        if indexPath.section == 2 {
            cell.textLabel?.textColor = .red
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.headNames?[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView?.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                let account = AccountSettingViewController()
                navigationController?.pushViewController(account, animated: true)
            }else if indexPath.row == 1 {
                
            }else {
                
            }
        case 1:
            if indexPath.row == 0 {
                
            }else if indexPath.row == 1 {
                let vc = UserProtocolController()
                navigationController?.pushViewController(vc, animated: true)
            }else if indexPath.row == 2 {
                let vc = PrivatyProtocolController()
                navigationController?.pushViewController(vc, animated: true)
                
            }else {
                
            }
        default:
            print("退出被点击了")
            let loginVC = SignInViewController()
            self.present(loginVC, animated: true)
        }
//        let url = VStar_URL.baseURL + VStar_URL.user.logout
//        Alamofire.request(url, method: .get,
//                          parameters: ["username": MyStorage.username, "password": MyStorage.password]).responseJSON { response in
//                switch response.result.isSuccess {
//                    case true:
//                        if let value = response.result.value {
//                            let json = JSON(value)
//
//                            }
//
//                    case false:
//                        print(response.result.error)
//                }
//        }
    }
}
