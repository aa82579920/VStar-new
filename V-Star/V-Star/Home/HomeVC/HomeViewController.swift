//
//  ViewController.swift
//  V-Star
//
//  Created by 王申宇 on 2019/7/17.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import JXSegmentedView

class HomeViewController: UIViewController {
    
    let backView = UIView()
    let segmentedView = JXSegmentedView()
    let segmentedDataSource = JXSegmentedTitleDataSource()
    let indicator = JXSegmentedIndicatorLineView() //指示器
    var listContainerView: JXSegmentedListContainerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        backView.backgroundColor = UIColor.starRed
        view.addSubview(backView)
        
        //配置数据源
        segmentedDataSource.titles = ["推荐","直播","舞蹈","搞笑","颜值","小剧场"]
        segmentedDataSource.titleNormalColor = .white
        segmentedDataSource.titleNormalFont = UIFont.systemFont(ofSize: 18)
        segmentedDataSource.titleSelectedColor = .white
        segmentedDataSource.titleSelectedFont = UIFont.systemFont(ofSize: 20)
        segmentedDataSource.isTitleColorGradientEnabled = true
        segmentedDataSource.reloadData(selectedIndex: 0)
        segmentedView.dataSource = segmentedDataSource
        
        //配置指示器
        indicator.indicatorHeight = 5
        indicator.indicatorColor = .white
        indicator.indicatorWidth = 22
        indicator.lineStyle = .lengthen
        indicator.tintColor = UIColor.starRed
        segmentedView.indicators = [indicator]
        
        //配置JXSegmentedView的属性
        segmentedView.isContentScrollViewClickTransitionAnimationEnabled = false
        segmentedView.backgroundColor = UIColor.starRed
        segmentedView.delegate = self
        view.addSubview(segmentedView)
        
        //列表封装
        listContainerView = JXSegmentedListContainerView(dataSource: self)
        listContainerView.didAppearPercent = 0.9
        view.addSubview(self.listContainerView)
        
        //将listContainerView.scrollView和segmentedView.contentScrollView进行关联
        segmentedView.contentScrollView = self.listContainerView.scrollView
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backView.snp.makeConstraints { make in
            make.top.left.right.equalTo(view)
            make.height.equalTo(view.height / 12)
        }
        segmentedView.snp.makeConstraints { make in
            make.bottom.left.right.equalTo(backView)
            make.height.equalTo(view.height / 18)
        }
        listContainerView.snp.makeConstraints { make in
            make.top.equalTo(backView.snp.bottom)
            make.left.right.bottom.equalTo(view)
        }
    }

}

extension HomeViewController: JXSegmentedViewDelegate {
    func segmentedView(_ segmentedView: JXSegmentedView, didClickSelectedItemAt index: Int) {
        //传递didClickSelectedItemAt事件给listContainerView，必须调用！！！
        listContainerView.didClickSelectedItem(at: index)
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, scrollingFrom leftIndex: Int, to rightIndex: Int, percent: CGFloat) {
        //传递scrollingFrom事件给listContainerView，必须调用！！！
        listContainerView.segmentedViewScrolling(from: leftIndex, to: rightIndex, percent: percent, selectedIndex: segmentedView.selectedIndex)
    }
}

extension HomeViewController: JXSegmentedListContainerViewDataSource {
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        return self.segmentedDataSource.titles.count
    }
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        return RecommendView()
    }
    
}

