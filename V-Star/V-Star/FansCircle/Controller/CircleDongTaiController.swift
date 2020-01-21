//
//  CircleDongTaiController.swift
//  V-Star
//
//  Created by 王春杉 on 2019/10/10.
//  Copyright © 2019 mac. All rights reserved.
//
// 圈子动态
import UIKit
import Alamofire
import MJRefresh
import SwiftyJSON
import SDWebImage
class CircleDongTaiController: UIViewController {
    var dongTaiTableView: UITableView!
    var recentActions = RecentActions()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getInfo()
    }
    // 网络请求
    func getInfo() {
        let url = VStar_URL.baseURL + VStar_URL.fanCircle.getRecentActions
        let limitNum = 2
        Alamofire.request(url, parameters: ["limit": limitNum, "page": 1, "host_user_ID": 1]).responseJSON { response in
            switch response.result.isSuccess {
            case true:
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    self.recentActions.current_page = json["data"]["current_page"].int!
                    self.recentActions.last_page = json["data"]["last_page"].int!
                    
                    let acountNum = json["data"]["data"].count
                    for i in 0..<acountNum {
                        var newData = RecentActionsData()
                        print("\(i)++++++++")
                        newData.avatar = json["data"]["data"][i]["avatar"].string!
                        newData.content = json["data"]["data"][i]["content"].string!
                        newData.fandom_action_ID = json["data"]["data"][i]["fandom_action_ID"].int!
                        newData.img_IDs = json["data"]["data"][i]["img_IDs"].string!
                        newData.img_urls = json["data"]["data"][i]["img_urls"].arrayObject! as! [String]
                        newData.time = json["data"]["data"][i]["time"].string!
                        newData.user_ID = json["data"]["data"][i]["user_ID"].int!
                        newData.username = json["data"]["data"][i]["username"].string!
                        print("\(newData)==============")
                        self.recentActions.data.append(newData)
                    }
                    
                    self.setTableView()
                }
            case false:
                print(response.result.error)
            }
        }
    }
    // 设置tableView
    func setTableView() {
        dongTaiTableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), style: .plain)
        // examTableView.separatorStyle = .none // 去掉系统分割线
        self.view.addSubview(dongTaiTableView)
        dongTaiTableView.delegate = self
        dongTaiTableView.dataSource = self
        
        FansCircleMainControllerScrollView.firstTableView = dongTaiTableView
    }
    
}
extension CircleDongTaiController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentActions.data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = DongTaiTableViewCell()
        cell.headImageView.sd_setImage(with: URL(string: recentActions.data[indexPath.row].avatar))
        cell.nickNameLable.text = recentActions.data[indexPath.row].content
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 420
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dongTaiTableView.deselectRow(at: indexPath, animated: true)
        let vc = FansCircleContentController()
        UIViewController.current()!.navigationController?.pushViewController(vc, animated: true)
    }
}
