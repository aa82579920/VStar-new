//
//  AttendActionView.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/26.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import JXSegmentedView
import SDWebImage
class AttendActionViewController: UITableViewController {
    var typeString: String = ""
    var dataSource = [String]()
    var isDataLoaded = false
    var fuva: FollowUserVideoAction!
    var videoID = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.allowsSelection = false
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "Loading...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    //图片下载
    func downloadImage(_ imageURL: String?, forIndexPath indexPath: IndexPath) {
        SDWebImageDownloader.shared.downloadImage(with: URL(string: imageURL!), options: SDWebImageDownloaderOptions.useNSURLCache, progress: { (receivedSize, expectedSize, url) in
        }) { (image, data, error, finished) in
            SDImageCache.shared.store(image, forKey: imageURL!, toDisk: true, completion: nil)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func configureCell(_ cell: AttendActionViewCell, at indexPath: IndexPath) {
        let imgURL = self.fuva.data!.data![indexPath.row].coverURL
        let cachedImage = SDImageCache.shared.imageFromDiskCache(forKey: imgURL)
        let avaURL = self.fuva.data!.data![indexPath.row].avatar
        let cachedAva = SDImageCache.shared.imageFromDiskCache(forKey: avaURL)
        if cachedImage == nil {
            downloadImage(imgURL!, forIndexPath: indexPath)
            cell.video.setBackgroundImage(UIImage(named: "人气视频"), for: .normal)
        } else {
            cell.video.tag = indexPath.row
            cell.video.addTarget(self, action: #selector(toVideo(_:)), for: .touchUpInside)
            cell.video.setBackgroundImage(cachedImage, for: .normal)
            cell.video.setBackgroundImage(cachedImage, for: .highlighted)
        }
        
        if cachedAva == nil {
            downloadImage(avaURL!, forIndexPath: indexPath)
            cell.avatar.setImage(UIImage(named: "diianZan_highlighting"), for: .normal)
        }else{
            cell.avatar.setImage(cachedAva, for: .normal)
            cell.avatar.setImage(cachedAva, for: .highlighted)
            cell.avatar.addTarget(self, action: #selector(toFollower(_:)), for: .touchUpInside)
        }
        cell.avatar.layer.cornerRadius = 18.5
        cell.avatar.layer.borderColor = UIColor.starRed.cgColor
        cell.avatar.layer.borderWidth = 1.5
        cell.avatar.layer.masksToBounds = true
    }
    @objc func loadData() {
        MyStorage.limit = 3
        MyStorage.page = 1
        MyStorage.userID = 17
        GetHelper.GetFUVA(success: { followUserVideoAction in
            self.fuva = followUserVideoAction
            self.tableView.reloadData()
        }, failure: { _ in
            print("hhh")
        })
    }
    
    @objc func refresh() {
        self.refreshControl?.beginRefreshing()
        MyStorage.limit = 3
        MyStorage.page = 1
        MyStorage.userID = 17
        GetHelper.GetFUVA(success: { followUserVideoAction in
            self.fuva = followUserVideoAction
            self.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        }, failure: { _ in
            print("hhh")
        })
    }
    
    func loadMore() {
        
    }
    
    @objc func toFollower(_ btn: UIButton) {
        
    }
    
    @objc func toVideo(_ btn: UIButton) {
        WorkStorage.videoId = self.fuva.data!.data![btn.tag].videoID ?? ""
        let playVC = PlayViewController()
        playVC.hidesBottomBarWhenPushed = true
        self.present(playVC, animated: true, completion: nil)
    }
    
    @objc func collectionOrNot(_ btn: UIButton) {
        let data = self.fuva.data!.data![btn.tag]
        if data.isCollected == true {
            WorkStorage.collectionNum = data.collectionNum!
            GetHelper.DeleteCollection(success: { _ in
                btn.isHighlighted = false
            }) { _ in
            }
        } else {
            WorkStorage.workId = "\(data.workID!)"
            GetHelper.AddCollection(success: { _ in
                btn.isHighlighted = true
            }) { _ in
            }
        }
    }
    
    //MARK: - UITableViewDataSource & UITableViewDelegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if fuva == nil {
            return 0
        }else{
            return fuva.data!.data!.count
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.fuva != nil {
            WorkStorage.videoId = fuva.data!.data![indexPath.row].videoID!
            navigationController?.pushViewController(PlayViewController(), animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if fuva == nil {
            return AttendActionViewCell()
        }else{
            let cell = AttendActionViewCell(byModel: fuva, withIndex: indexPath.row)
            WorkStorage.videoId = fuva.data!.data![indexPath.row].videoID!
            cell.video.addTarget(self, action: #selector(toPlay), for: .touchUpInside)
            cell.collect.addTarget(self, action: #selector(collectionOrNot(_:)), for: .touchUpInside)
            self.configureCell(cell, at: indexPath)
            return cell
        }
    }
    
    @objc func toPlay() {
        navigationController?.pushViewController(PlayViewController(), animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.fuva != nil {
            var image = SDImageCache.shared.imageFromDiskCache(forKey: self.fuva.data!.data![indexPath.row].coverURL)
            if image == nil {
                image = UIImage(named: "人气视频")
            }
        
            let width = Screen.width - 28
            let height = (width / (image?.size.width ?? 1)) * (image?.size.height ?? 1) + 220
        
            return height
        }else{return 0}
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


