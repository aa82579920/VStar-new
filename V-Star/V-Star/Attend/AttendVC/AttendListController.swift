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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //配置数据源
        segmentedDataSource.titles = ["推荐","关注","粉丝","附近的人"]
        segmentedDataSource.isTitleColorGradientEnabled = true
        segmentedDataSource.reloadData(selectedIndex: 0)
        segmentedView.dataSource = segmentedDataSource
        
        //配置指示器
        indicator.indicatorHeight = 5
        indicator.indicatorWidth = JXSegmentedViewAutomaticDimension
        indicator.lineStyle = .lengthen
        indicator.tintColor = .white
        indicator.indicatorColor = .white
        segmentedView.indicators = [indicator]
        
        //配置JXSegmentedView的属性
        segmentedView.isContentScrollViewClickTransitionAnimationEnabled = false
        segmentedView.delegate = self
        segmentedView.backgroundColor = UIColor.starRed
        view.addSubview(segmentedView)
        
        //列表封装
        listContainerView = JXSegmentedListContainerView(dataSource: self)
        listContainerView.didAppearPercent = 0.9
        view.addSubview(self.listContainerView)
        
        //将listContainerView.scrollView和segmentedView.contentScrollView进行关联
        segmentedView.contentScrollView = self.listContainerView.scrollView
        
        segmentedView.frame = CGRect(x: 7, y: 20, width: 25, height: 10)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        segmentedView.frame = CGRect(x: 0, y: 20, width: view.bounds.size.width, height: 50)
        listContainerView.frame = CGRect(x: 0, y: 70, width: view.bounds.size.width, height: view.bounds.size.height - 50)
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
