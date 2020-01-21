//
//  FansCircleContentController.swift
//  V-Star
//
//  Created by 王春杉 on 2019/10/21.
//  Copyright © 2019 mac. All rights reserved.
//
// 帖子正文
import UIKit
class FansCircleContentController: UIViewController {
    
    var tableView: UITableView!
    var topView: UITableViewCell!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigation()
        setTableView()
    }
    
    // MARK: -设置导航栏
    func setNavigation() {
        self.title = "帖子正文"
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(color: UIColor.starRed), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func setTableView() {
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        // 设置estimatedRowHeight属性默认值
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
    }
}
extension FansCircleContentController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = DongTaiTableViewCell()
            cell.dongTaiTextLable.numberOfLines = 0
            return cell
        }else {
            return FansCirclePingLunTableViewCell()
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 0 {
//            return 420
//        }else {
//            return 300
//        }
//    }
}
