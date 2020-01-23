//
//  HomeCollectionViewController.swift
//  V-Star
//
//  Created by 王申宇 on 2019/10/2.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import JXSegmentedView
import Alamofire
import SDWebImage
import MJRefresh

struct RWork {
    static var recommendWork: RecommendWork!
}

class HomeCollectionView: UICollectionView {
    
    var recommendWork: RecommendWork!
    var cellHeight: CGFloat = 200
    var deHeight = [CGFloat]()
    var cellCount = 3
    var coverImage = [UIImageView]()
    var image = UIImageView()
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.register(HomeCell.self, forCellWithReuseIdentifier: "homecell")
        self.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(refresh))
        initView()
//        self.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
        self.backgroundColor = .white
        self.allowsSelection = true
        loadData()
    }
    
    func loadData() {
        MyStorage.limit = 5
        GetHelper.GetRecommendWork(success: {recommendWork in
            self.recommendWork = recommendWork
            RWork.recommendWork = recommendWork
            self.reloadData()
        }, failure: { _ in
            print("视频获取失败～")
        })
        
        
    }

}

extension HomeViewController: UICollectionViewDataSource {
    func downloadImage(_ imageURL: String?, forIndexPath indexPath: IndexPath) {
        SDWebImageDownloader.shared.downloadImage(with: URL(string: imageURL!), options: SDWebImageDownloaderOptions.useNSURLCache, progress: { (receivedSize, expectedSize, url) in
        }) { (image, data, error, finished) in
            SDImageCache.shared.store(image, forKey: imageURL!, toDisk: true, completion: nil)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func configureCell(_ cell: HomeCell, at indexPath: IndexPath) {
        let imgURL = self.collectionView.recommendWork.data[indexPath.row ?? 0].coverURL
//        let imgURL = imgArray[indexPath?.row ?? 0] as? String
        let cachedImage = SDImageCache.shared.imageFromDiskCache(forKey: imgURL)

        if cachedImage == nil {
            downloadImage(self.collectionView.recommendWork.data[indexPath.row].coverURL!, forIndexPath: indexPath)
            cell.cover.setBackgroundImage(UIImage(named: "人气视频"), for: .normal)
        } else {
            cell.cover.setBackgroundImage(cachedImage, for: .normal)
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homecell", for: indexPath as IndexPath) as! HomeCell
        let footer = cell.footerView
        let cellData = self.collectionView.recommendWork.data[indexPath.row]
        configureCell(cell, at: indexPath)
        footer.username.text = cellData.username
        footer.avatar.sd_setImage(with: URL(string: cellData.avatar!), completed: .none)
        footer.hotNum.text = String(cellData.hotValue!)
        footer.sign.text = cellData.introduction
        cell.footerView = footer
        return cell
    }
    //返回多少个cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.collectionView.recommendWork == nil {return 0}
        else{return self.collectionView.cellCount}
    }
}
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.collectionView.recommendWork != nil {
            WorkStorage.videoId = self.collectionView.recommendWork.data[indexPath.row].videoID!
            WorkStorage.userID = String(self.collectionView.recommendWork.data[indexPath.row].userID!)
//            WorkStorage.
            MyStorage.userID = self.collectionView.recommendWork.data[indexPath.row].userID!
            VideoNum.num = indexPath.row
            let playVC = PlayViewController()
            playVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(playVC, animated: true)
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var image = SDImageCache.shared.imageFromDiskCache(forKey: self.collectionView.recommendWork.data[indexPath.row].coverURL!)
        
        if image == nil {
            image = UIImage(named: "人气视频")
        }
        
        let width = (Screen.width - 10) / 2
        let height = (((Screen.width - 10)/2) / (image?.size.width ?? 1)) * (image?.size.height ?? 1) + HomeCell().footerView.frame.height
        return CGSize(width: width, height: height)
    }
}

extension HomeCollectionView: JXSegmentedListContainerViewListDelegate {
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

extension HomeCollectionView{
    @objc func refresh() {
        self.reloadData()
        self.mj_header.endRefreshing()
    }
    
    //图片
//    func getImageHeader(url: URL?)  -> Int {
//        let imageInfo = Alamofire.request(url!).response?.allHeaderFields
//        return imageInfo?["Content-Type"] as! Int
//    }
}
