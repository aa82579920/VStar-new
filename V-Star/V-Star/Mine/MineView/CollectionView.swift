//
//  CollectionView.swift
//  V-Star
//
//  Created by 王申宇 on 25/03/2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import MJRefresh
import SDWebImage
import JXSegmentedView

class CollectionView: UICollectionView {
    
    var gworkByID: GWorkByID!
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        initView()
        loadData()
    }
    
    private func initView() {
        backgroundColor = .white
        self.register(CollectionCell.self, forCellWithReuseIdentifier: "collectioncell")
        self.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(refresh))
    }
    
    private func loadData() {
        HPHelper.GetWorkByID(success: { data in
            self.gworkByID = data
            self.reloadData()
        }) { _ in
        }
    }
    
    @objc func refresh() {
        HPHelper.GetWorkByID(success: { data in
            self.gworkByID = data
            self.reloadData()
        }) { _ in
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomePageDetailsVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.collectionview.gworkByID == nil {return 0}
        return (self.collectionview.gworkByID.data?.data!.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath as IndexPath) as! CollectionCell
        let gwbi = self.collectionview.gworkByID.data!
        if let url = gwbi.data![indexPath.row].coverURL {
            cell.cover.sd_setImage(with: URL(string: url), completed: nil)
        }
        
        if let temp = gwbi.data![indexPath.row].hotValue {
            cell.num.text = "\(temp) w"
        }
        
        return cell
    }
    
    
}

extension HomePageDetailsVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let gwbi = self.collectionview.gworkByID.data!
        WorkStorage.videoId = (gwbi.data![indexPath.row].videoID)!
        let playVC = PlayViewController()
        playVC.hidesBottomBarWhenPushed = true
        playVC.modalPresentationStyle = .fullScreen
        playVC.modalTransitionStyle = .crossDissolve
        self.present(playVC, animated: true, completion: nil)
    }
}
extension CollectionView: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return self
    }
    
    func listDidAppear() {
        print("listDidAppear")
    }
    
    func listDidDisappear() {
        print("listDidDisappear")
    }
}

extension HomePageDetailsVC: UICollectionViewDelegateFlowLayout {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 156)
    }
}
