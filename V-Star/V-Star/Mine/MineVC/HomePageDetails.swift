//
//  HomePageDetails.swift
//  V-Star
//
//  Created by 王申宇 on 25/03/2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import JXSegmentedView

class HomePageDetailsVC: UIViewController {
    let segmentedView = JXSegmentedView()
    let segmentedDataSource = JXSegmentedTitleDataSource()
    let indicator = JXSegmentedIndicatorLineView() //指示器
    var listContainerView: JXSegmentedListContainerView!
    var myself: UserInfo!
    var headView: UIView!
    var backImage: UIImageView!
    var card: UserCardView!
    let tableview = AttendActionViewController()
    var collectionview: CollectionView!
    let layout = UICollectionViewFlowLayout()
    var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview = CollectionView(frame: CGRect(x: 0, y: 0, width: Screen.width - 24, height: Screen.height), collectionViewLayout: layout)
        collectionview.delegate = self
        collectionview.dataSource = self
        
        backBtn = UIButton()
        backBtn.setImage(UIImage(named: "back_white"), for: .normal)
        backBtn.addTarget(self, action: #selector(back), for: .touchUpInside)
        view.addSubview(backBtn)
        backBtn.snp.makeConstraints { make in
            make.left.equalTo(view).offset(30)
            make.top.equalTo(view).offset(50)
            make.width.equalTo(25)
            make.height.equalTo(30)
        }
        setHeaderView()
        //配置数据源
        segmentedDataSource.titles = ["动态","视频"]
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
        //        listContainerView.initListPercent = 0.9
        view.addSubview(self.listContainerView)
                
//将listContainerView.scrollView和segmentedView.contentScrollView进行关联
        segmentedView.contentScrollView = self.listContainerView.scrollView
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //- MARK: 修改
        card.snp.makeConstraints { make in
            make.bottom.equalTo(headView)
            make.left.equalTo(headView)
            make.right.equalTo(headView)
            make.height.equalTo(UIScreen.main.bounds.height * 6 / 20)
        }
        headView.snp.makeConstraints { make in
            make.left.right.top.equalTo(view)
            make.height.equalTo(UIScreen.main.bounds.height * 2 / 5)
        }
        segmentedView.snp.makeConstraints { make in
            make.top.equalTo(headView.snp.bottom)
            make.centerX.equalTo(view)
            make.height.equalTo(33)
            make.width.equalTo(view.width)
        }
        listContainerView.snp.makeConstraints { make in
            make.top.equalTo(segmentedView.snp.bottom).offset(6)
            make.left.equalTo(view).offset(15)
            make.right.equalTo(view).inset(15)
            make.bottom.equalTo(view)
        }
    }
    
    func setHeaderView() {
        headView = UIView()
        card = UserCardView()
        backImage = UIImageView()
        headView.addSubview(backImage)
        headView.addSubview(card)
        card.setView()
        card.layer.cornerRadius = 0
        card.addView()
        card.myPageBtn.removeFromSuperview()
        view.addSubview(headView)
    }
    
    func loadData() {
        UserInfoHelper.GetUserInfo(success: { userinfo in
            self.setHeaderView()
            self.setUserLabel(userinfo)
        }) { _ in
        }
    }
    
    func setUserLabel(_ userinfo: UserInfo) {
        card.userName.text = userinfo.data?.username
        if let temo = userinfo.data?.userID {
            card.id.text = "ID:" + String(temo)
        }else{
            card.id.text = "ID:"
        }
        
        if let temo = userinfo.data?.monthRank {
            card.rankNum.text = String(temo)
        }else{
            card.rankNum.text = ""
        }
        if let temo = userinfo.data?.followNum {
            card.attendContent.text = String(temo)
        }else{
            card.attendContent.text = ""
        }
        if let temo = userinfo.data?.avatar {
            card.photo.sd_setImage(with: URL(string: temo), completed: .none)
        }else{
            card.photo = UIImageView()
        }
        if let temo = userinfo.data?.fansNum {
            card.fansContent.text = String(temo)
        }else{
            card.fansContent.text = ""
        }
    }
}

extension HomePageDetailsVC: JXSegmentedViewDelegate {
    func segmentedView(_ segmentedView: JXSegmentedView, didClickSelectedItemAt index: Int) {
        //传递didClickSelectedItemAt事件给listContainerView，必须调用！！！
        listContainerView.didClickSelectedItem(at: index)
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, scrollingFrom leftIndex: Int, to rightIndex: Int, percent: CGFloat) {
        //传递scrollingFrom事件给listContainerView，必须调用！！！
        listContainerView.segmentedViewScrolling(from: leftIndex, to: rightIndex, percent: percent, selectedIndex: segmentedView.selectedIndex)
    }
}

extension HomePageDetailsVC: JXSegmentedListContainerViewDataSource {
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        return self.segmentedDataSource.titles.count
    }
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        if index == 0{
            return tableview
        } else if index == 1 {
            return collectionview
        } else {
            return RecommendView()
        }
    }
    
}
