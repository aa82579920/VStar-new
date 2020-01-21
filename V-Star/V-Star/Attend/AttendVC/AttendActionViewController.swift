//
//  AttendActionView.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/26.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import JXSegmentedView

class AttendActionViewController: UITableViewController {
    var typeString: String = ""
    var dataSource = [String]()
    var isDataLoaded = false
    var fuva: FollowUserVideoAction!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "Loading...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        refreshControl?.addTarget(self, action: #selector(headerRefresh), for: .valueChanged)
//        tableView.register(AttendActionViewCell.self, forCellReuseIdentifier: "attendActionTableView")
    }
    
    @objc func headerRefresh() {
        refreshControl?.beginRefreshing()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(1)) {
            self.refreshControl?.endRefreshing()
            self.dataSource.removeAll()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            let dateString = dateFormatter.string(from: Date())
            for index in 0..<20 {
                self.dataSource.append(String(format: "%@ 时间：%@ index:%d", self.typeString, dateString, index))
            }
            self.isDataLoaded = true
            self.loadData()
            self.tableView.reloadData()
        }
    }
    
    func loadData() {
        MyStorage.limit = 3
        MyStorage.page = 1
       // MyStorage.userID = "17"
        GetHelper.GetFUVA(success: { followUserVideoAction in
            self.fuva = followUserVideoAction
            self.tableView.reloadData()
        }, failure: { _ in
            print("hhh")
        })
    }
    
    //MARK: - UITableViewDataSource & UITableViewDelegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if fuva == nil {
            return 3
        }else{
            return fuva.data!.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if fuva == nil {
            return AttendActionViewCell()
        }else{
            return AttendActionViewCell(byModel: fuva, withIndex: indexPath.row)
        }
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = HomeDetailVeiwController()
//        vc.detailText = dataSource[indexPath.row]
//        naviController?.pushViewController(vc, animated: true)
//    }
//    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return tableView.fd_heightForCell(withIdentifier: "attendActionTableView", configuration: { cell in
//
//        })
        return view.height / 3
    }

}

extension AttendActionViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
    
    func listDidAppear() {
        print("listDidAppear")
    }
    
    func listDidDisappear() {
        print("listDidDisappear")
    }
}


