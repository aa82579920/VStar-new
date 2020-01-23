//
//  AttendListController.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/26.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import JXSegmentedView
//import SnapKit

class AttendListControler: UIViewController {
    let searchView = UISearchController()
    let segmentedView = JXSegmentedView()
    let segmentedDataSource = JXSegmentedTitleDataSource()
    let indicator = JXSegmentedIndicatorLineView() //指示器
    var listContainerView: JXSegmentedListContainerView!
    var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSearchBar()
        //配置数据源
        initSegmentDataSource()
        
        //配置指示器
        initIndicator()
        
        //配置JXSegmentedView的属性
        initSegmentView()
        
        //列表封装
        initList()
        
        //将listContainerView.scrollView和segmentedView.contentScrollView进行关联
        segmentedView.contentScrollView = self.listContainerView.scrollView
        
        segmentedView.frame = CGRect(x: 7, y: 44, width: 25, height: 10)
    }
    
    //搜索栏
    func initSearchBar() {
        self.searchBar = {
            searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.width, height: 54))
//            searchBar.searchTextField.textAlignment = .center
//            searchBar.searchTextField.text = "用户名称"
//            searchBar.searchTextField.textColor = UIColor(hex6: 0xcccccc)
//            searchBar.searchTextField.layer.masksToBounds = true
//            searchBar.searchTextField.layer.cornerRadius = searchBar.searchTextField.frame.height / 2
            searchBar.setShowsCancelButton(false, animated: false)
            return searchBar
        }()
        view.addSubview(searchBar)
    }
    //配置数据源
    func initSegmentDataSource() {
        segmentedDataSource.titles = ["推荐","关注","粉丝","附近的人"]
        segmentedDataSource.titleNormalColor = UIColor(hex6: 0x999999)
        segmentedDataSource.titleSelectedColor = UIColor(hex6: 0xe55224)
        segmentedDataSource.titleNormalFont = UIFont.flexibleSystemFont(ofSize: 16)
        segmentedDataSource.titleSelectedFont = UIFont.flexibleSystemFont(ofSize: 16)
        segmentedDataSource.isTitleColorGradientEnabled = true
        segmentedDataSource.reloadData(selectedIndex: 0)
        segmentedView.dataSource = segmentedDataSource
    }
    //配置指示器
    func initIndicator() {
        indicator.indicatorHeight = 5
        indicator.indicatorWidth = JXSegmentedViewAutomaticDimension
        indicator.lineStyle = .lengthen
        indicator.tintColor = .white
        indicator.indicatorColor = .white
        segmentedView.indicators = [indicator]
    }
    //配置JXSegmentedView的属性
    func initSegmentView() {
        segmentedView.isContentScrollViewClickTransitionAnimationEnabled = false
        segmentedView.delegate = self
        segmentedView.backgroundColor = .white
        view.addSubview(segmentedView)
    }
    
    func initList() {
        //列表封装
        listContainerView = JXSegmentedListContainerView(dataSource: self)
        listContainerView.didAppearPercent = 0.9
        view.addSubview(self.listContainerView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        segmentedView.frame = CGRect(x: 0, y: 54, width: view.bounds.size.width, height: 50)
        listContainerView.frame = CGRect(x: 0, y: 104, width: view.bounds.size.width, height: view.bounds.size.height - 50)
    }
}
extension AttendListControler: JXSegmentedViewDelegate {
    func segmentedView(_ segmentedView: JXSegmentedView, didClickSelectedItemAt index: Int) {
        //传递didClickSelectedItemAt事件给listContainerView，必须调用！！！
        listContainerView.didClickSelectedItem(at: index)
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, scrollingFrom leftIndex: Int, to rightIndex: Int, percent: CGFloat) {
        //传递scrollingFrom事件给listContainerView，必须调用！！！
        listContainerView.segmentedViewScrolling(from: leftIndex, to: rightIndex, percent: percent, selectedIndex: segmentedView.selectedIndex)
    }
}

extension AttendListControler: JXSegmentedListContainerViewDataSource {
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        return self.segmentedDataSource.titles.count
    }
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        if index == 0{
            return AttendTableViewController()
        } else if index == 1 {
            return AttendAttendController()
        } else if index == 2 {
            return AttendFansController()
        }else {
            return UIView() as! JXSegmentedListContainerViewListDelegate
        }
    }
    
}

extension AttendListControler: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
