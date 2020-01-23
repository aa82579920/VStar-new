//
//  CropThumbnailView.swift
//  V-Star
//
//  Created by 王申宇 on 2019/11/9.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

protocol AliyunCutThumbnailViewDelegate: NSObjectProtocol {
    func cutBarDidMoved(toTime time: CGFloat)
    func cutBarTouchesDidEnd()
}

class CropThumbnailView: UIView {
    weak var delegate: AliyunCutThumbnailViewDelegate?
    var avAsset: AVAsset?
    var cutInfo: AliyunMediaConfig!
    var imageGenerator: AVAssetImageGenerator!
    var imagesArray: NSMutableArray!
    var collectionView: UICollectionView!
    var progressView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImageGenerator()
    }
    
    convenience init(frame: CGRect, cutInfo: AliyunMediaConfig) {
        self.init(frame: frame)
        self.cutInfo = cutInfo
        imagesArray = NSMutableArray.init(capacity: 8)
        setupCollectionView()
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollectionView() {
        let followLayout = UICollectionViewFlowLayout()
        followLayout.itemSize = CGSize(width: Screen.width / 8.0, height: Screen.width / 8.0)
        followLayout.minimumLineSpacing = 0
        followLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 12, width: Screen.width, height: Screen.width / 8.0), collectionViewLayout: followLayout)
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CropCell")
        self.addSubview(collectionView)
    }
    
    func setupSubviews() {
        
    }
    
    func loadThumbnailData() {
        var startTime: CMTime = .zero
        var array: [AnyHashable] = []
        let d: CGFloat = cutInfo.sourceDuration / 7.0
        let intd = Int(d * 100)
        let fd: Float = Float(Double(intd) / 100.0)
        let addTime = CMTimeMakeWithSeconds(Float64(fd), preferredTimescale: 1000)
        let endTime = CMTimeMakeWithSeconds(Float64(cutInfo?.sourceDuration ?? 0), preferredTimescale: 1000)
        //CMTIME_COMPARE_INLINE(startTime, <=, endTime)
        while false {
            array.append(NSValue.init(time: startTime))
            startTime = CMTimeAdd(startTime, addTime)
        }
        
        array[0] = NSValue.init(time: CMTime(seconds: 0.1, preferredTimescale: 1000))
        
        var index = 0
        self.imageGenerator.generateCGImagesAsynchronously(forTimes: array as! [NSValue]) { (requsetTime, image, actualTime, result, error) in
            if result == AVAssetImageGenerator.Result.succeeded {
                let img = UIImage(cgImage: image!)
                DispatchQueue.main.sync {
                    self.imagesArray.add(img)
                    let indexPath = IndexPath(item: index, section: 0)
                    self.collectionView.insertItems(at: [indexPath])
                    index = index + 1
                }
            }
        }
    }
    
    func updateProgressViewWithProgress(progress: CGFloat) {
        var center = progressView.center
        var newX = progress * Screen.width
        if newX < center.x {
            center.x = newX
            progressView.center = center
        }else{
            center.x = newX
            UIView.animate(withDuration: 0.1, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
                self.progressView.center = center
            }, completion: nil)
        }
    }
    
    func setImageGenerator() {
        if imageGenerator == nil {
            imageGenerator = AVAssetImageGenerator(asset: avAsset!)
            imageGenerator.appliesPreferredTrackTransform = true
            imageGenerator.requestedTimeToleranceBefore = .zero
            imageGenerator.requestedTimeToleranceAfter = .zero
            imageGenerator.maximumSize = CGSize(width: 320, height: 320)
        }
    }
}

extension CropThumbnailView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CropCell", for: indexPath)
        let imageView = UIImageView(image: (imagesArray![indexPath.row] as! UIImage))
        imageView.frame = cell.contentView.bounds
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        cell.contentView.addSubview(imageView)
        return cell
    }
    
    
}
