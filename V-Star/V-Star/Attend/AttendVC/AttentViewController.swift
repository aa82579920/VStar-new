//
//  ViewController.swift
//  V-Star
//
//  Created by 王申宇 on 2019/7/17.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import JXSegmentedView

class AttentViewController: UIViewController {
    
    let backView = UIView()
    let segmentedView = JXSegmentedView()
    let segmentedDataSource = JXSegmentedTitleDataSource()
    let indicator = JXSegmentedIndicatorLineView() //指示器
    var listContainerView: JXSegmentedListContainerView!
    let liveBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //补背景空缺
        backView.backgroundColor = UIColor.starRed
        backView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height / 12)
        view.addSubview(backView)
        
        //配置数据源
        segmentedDataSource.titles = ["关注","列表"]
        segmentedDataSource.titleNormalColor = .white
        segmentedDataSource.titleSelectedColor = .white
        segmentedDataSource.titleNormalFont = UIFont.systemFont(ofSize: 18)
        segmentedDataSource.titleSelectedFont = UIFont.systemFont(ofSize: 20)
        segmentedDataSource.isTitleColorGradientEnabled = true
        segmentedDataSource.reloadData(selectedIndex: 0)
        segmentedView.dataSource = segmentedDataSource
        
        //配置指示器
        indicator.indicatorHeight = 2
        indicator.indicatorWidth = 22
        indicator.lineStyle = .lengthen
        indicator.indicatorColor = .white
        indicator.isScrollEnabled = false
        segmentedView.indicators = [indicator]
        
        //配置JXSegmentedView的属性
        segmentedView.isContentScrollViewClickTransitionAnimationEnabled = false
        segmentedView.delegate = self
        segmentedView.backgroundColor = UIColor.starRed
//        segmentedView.contentEdgeInsetLeft = view.width * 2 / 5
//        segmentedView.contentEdgeInsetRight = view.width / 2
        view.addSubview(segmentedView)
        
        //列表封装
        listContainerView = JXSegmentedListContainerView(dataSource: self)
        listContainerView.didAppearPercent = 0.9
        view.addSubview(self.listContainerView)
        
        //将listContainerView.scrollView和segmentedView.contentScrollView进行关联
        segmentedView.contentScrollView = self.listContainerView.scrollView
        
        //set liveBtn
        liveBtn.setTitle("live", for: .normal)
        liveBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        liveBtn.layer.masksToBounds = true
        liveBtn.layer.cornerRadius = view.height / 70
        liveBtn.layer.borderColor = UIColor.white.cgColor
        liveBtn.layer.borderWidth = 1
        backView.addSubview(liveBtn)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        segmentedView.snp.makeConstraints { make in
            make.bottom.equalTo(backView)
            make.centerX.equalTo(view)
            make.height.equalTo(view.height / 19)
            make.width.equalTo(view.width / 3)
        }
        liveBtn.snp.makeConstraints { make in
            make.left.equalTo(view).offset(10)
            make.top.equalTo(segmentedView).offset(10)
            make.height.equalTo(view.height / 35)
            make.width.equalTo(view.width / 10)
        }
        listContainerView.snp.makeConstraints { make in
            make.top.equalTo(backView.snp.bottom)
            make.left.right.bottom.equalTo(view)
            make.height.equalTo(view.height / 35)
            make.width.equalTo(view.width / 10)
        }
    }
}

extension AttentViewController: JXSegmentedViewDelegate {
    func segmentedView(_ segmentedView: JXSegmentedView, didClickSelectedItemAt index: Int) {
        //传递didClickSelectedItemAt事件给listContainerView，必须调用！！！
        listContainerView.didClickSelectedItem(at: index)
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, scrollingFrom leftIndex: Int, to rightIndex: Int, percent: CGFloat) {
        //传递scrollingFrom事件给listContainerView，必须调用！！！
        listContainerView.segmentedViewScrolling(from: leftIndex, to: rightIndex, percent: percent, selectedIndex: segmentedView.selectedIndex)
    }
}

extension AttentViewController: JXSegmentedListContainerViewDataSource {
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        return self.segmentedDataSource.titles.count
    }
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        if index == 0{
            return AttendActionViewController()
        } else if index == 1 {
            return AttendListControler()
        } else {
            return RecommendView()
        }
    }
    
}

