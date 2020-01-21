////
////  HomeCollectionViewController.swift
////  V-Star
////
////  Created by 王申宇 on 2019/10/2.
////  Copyright © 2019 mac. All rights reserved.
////
//
//import UIKit
//
//class HomeCollectionViewController: UICollectionViewController {
//    
//    var recommendWork: RecommendWork!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//    }
//    
//    func loadData() {
//        GetHelper.GetRecommendWork(success: {recommendWork in
//            self.recommendWork = recommendWork
//        }, failure: { _ in
//            print("视频获取失败～")
//        })
//    }
//}
//
//extension HomeCollectionViewController: UICollectionViewDelegateFlowLayout {
//    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//    //返回多少个cell
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 2
//    }
//    //返回自定义的cell
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath as IndexPath) as! HomeCell
//        cell.titleLabel?.text = "wangjie"
//       
//        return cell
//    }
//}
