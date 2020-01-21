//
//  FansCircleFirstViewController.swift
//  V-Star
//
//  Created by 王春杉 on 2019/10/10.
//  Copyright © 2019 mac. All rights reserved.
//
// 我的 - 粉丝圈
import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
class FansCircleFirstViewController: UIViewController {
    var tableView: UITableView!
    var searchController = UISearchController()
    // 搜索过滤后的结果集
    var searchArray: [String] = [String]() {
        didSet {self.tableView.reloadData()}
    }
    
    // 原始数据集
    var myCircleArray: [String]! = []  // 我的粉丝圈
    var joinedCircleArray:[String]! = [] // 加入的粉丝圈
    let sectionName: [String]! = ["我的粉丝圈", "加入的粉丝圈"]
    
    var fandomList = UserFandomList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "粉丝圈"
        self.view.backgroundColor = .white
        
        self.getUserFandomList()
        
    }
    // MARK: -获取用户加入的粉丝圈
    func getUserFandomList() {
        let url = VStar_URL.baseURL + VStar_URL.fanCircle.getUserFandomList
        Alamofire.request(url, parameters: ["user_ID": MyStorage.userID]).responseJSON { response in
            switch response.result.isSuccess {
            case true:
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    let myFandomNum = json["data"]["my"].count
                    for i in 0..<myFandomNum {
                        var myFandom = MyUserFandom()
                        myFandom.fans_num = json["data"]["my"][i]["fans_num"].int!
                        myFandom.host_avatar = json["data"]["my"][i]["host_avatar"].string!
                        myFandom.host_user_ID = json["data"]["my"][i]["host_user_ID"].int!
                        myFandom.host_username = json["data"]["my"][i]["host_username"].string!
                        self.myCircleArray.append(myFandom.host_username)
                        self.fandomList.myUserFandom.append(myFandom)
                    }
                    
                    let otherFandomNum = json["data"]["others"].count
                    for i in 0..<otherFandomNum {
                        var otherFandom = OtherUserFandom()
                        otherFandom.host_avatar = json["data"]["others"][i]["host_avatar"].string!
                        otherFandom.host_user_ID = json["data"]["others"][i]["host_user_ID"].int!
                        otherFandom.host_username = json["data"]["others"][i]["host_username"].string!
                        self.joinedCircleArray.append(otherFandom.host_username)
                        self.fandomList.otherUserFandom.append(otherFandom)
                    }
                    
                    self.setTableView()
                    self.setSearchController()
                    
                }
            case false:
                print(response.result.error)
            }
        }
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
    //MARK: -初始化tableView
    func setTableView() {
        let tableViewFrame = CGRect(x: 0, y: 20, width: self.view.width, height: self.view.height-20)
        self.tableView = UITableView(frame: tableViewFrame, style: .grouped)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // 创建一个重用单元格
        self.tableView!.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "FanCircleCell")
        self.view.addSubview(tableView)
    }
    //MARK: -配置搜索控制器
    func setSearchController() {
        self.searchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchBar.delegate = self
            controller.hidesNavigationBarDuringPresentation = false
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.searchBarStyle = .minimal
            controller.searchBar.sizeToFit()
            self.tableView.tableHeaderView = controller.searchBar
            self.tableView.tableHeaderView?.backgroundColor = .white
            return controller
        })()
    }
}

extension FansCircleFirstViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return myCircleArray.count
        }else {
            return joinedCircleArray.count
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = "FanCircleCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: id,
                                                 for: indexPath)
        cell.imageView?.image = UIImage(named: "摄像头")
        cell.imageView?.layer.masksToBounds = true
        cell.imageView?.layer.cornerRadius = 35
        
        if self.searchController.isActive {
            cell.textLabel?.text = self.searchArray[indexPath.row]
            return cell
        }else {
            if indexPath.section == 0 {
                cell.textLabel?.text = self.myCircleArray[indexPath.row]
                cell.imageView?.sd_setImage(with: URL(string: fandomList.myUserFandom[indexPath.row].host_avatar))
                return cell
            }else {
                cell.textLabel?.text = self.joinedCircleArray[indexPath.row]
                cell.imageView?.sd_setImage(with: URL(string: fandomList.otherUserFandom[indexPath.row].host_avatar))
                return cell
            }
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionName[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            HostUserID.id = fandomList.myUserFandom[indexPath.row].host_user_ID
            HostUserID.headImageUrl = fandomList.myUserFandom[indexPath.row].host_avatar
        }else {
            HostUserID.id = fandomList.otherUserFandom[indexPath.row].host_user_ID
            HostUserID.headImageUrl = fandomList.otherUserFandom[indexPath.row].host_avatar
        }
        let cicleController = FansCircleMainController()
        self.navigationController?.pushViewController(cicleController, animated: true)
    }
}
extension FansCircleFirstViewController: UISearchBarDelegate {
    
}
