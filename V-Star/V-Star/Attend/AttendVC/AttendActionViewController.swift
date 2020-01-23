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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.allowsSelection = false
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "Loading...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
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
        let imgURL = self.fuva.data![indexPath.row].coverURL
        let cachedImage = SDImageCache.shared.imageFromDiskCache(forKey: imgURL)

        if cachedImage == nil {
            downloadImage(imgURL!, forIndexPath: indexPath)
            cell.video.setBackgroundImage(UIImage(named: "人气视频"), for: .normal)
        } else {
            cell.video.setBackgroundImage(cachedImage, for: .normal)
        }
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
    
    //MARK: - UITableViewDataSource & UITableViewDelegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if fuva == nil {
            return 3
        }else{
            return fuva.data!.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if fuva == nil {
            return AttendActionViewCell()
        }else{
            let cell = AttendActionViewCell(byModel: fuva, withIndex: indexPath.row)
            WorkStorage.videoId = fuva.data![indexPath.row].videoID!
            cell.video.addTarget(self, action: #selector(toPlay), for: .touchUpInside)
            self.configureCell(cell, at: indexPath)
            return cell
        }
    }
    
    @objc func toPlay() {
        navigationController?.pushViewController(PlayViewController(), animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.fuva != nil {
            var image = SDImageCache.shared.imageFromDiskCache(forKey: self.fuva.data![indexPath.row].coverURL)
            if image == nil {
                image = UIImage(named: "人气视频")
            }
        
            let width = Screen.width - 28
            let height = (width / (image?.size.width ?? 1)) * (image?.size.height ?? 1) + 133
        
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


