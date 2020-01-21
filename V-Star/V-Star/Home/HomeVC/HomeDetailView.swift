//
//  HomeDetailView.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/10.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import JXSegmentedView

class RecommendView: UITableViewController {
    var typeString: String = ""
    weak var naviController: UINavigationController?
    var dataSource = [String]()
    var isDataLoaded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "Loading...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        refreshControl?.addTarget(self, action: #selector(headerRefresh), for: .valueChanged)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
            self.tableView.reloadData()
        }
    }
    
    //MARK: - UITableViewDataSource & UITableViewDelegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = HomeDetailVeiwController()
        vc.detailText = dataSource[indexPath.row]
        naviController?.pushViewController(vc, animated: true)
    }
}

extension RecommendView: JXSegmentedListContainerViewListDelegate {
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

