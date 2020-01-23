//
//  EditViewController.swift
//  V-Star
//
//  Created by 王申宇 on 2019/11/9.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import AVKit
import AliyunVideoSDKPro

enum AliyunCropPlayerStatus: Int {
    case pause
    case player
    case playingBeforeSeek
}

class EditViewController: UIViewController {
    var timeObserver: Any? = nil
    var cutPanel: AliyunCrop!
    var playerStatus: AliyunCropPlayerStatus!
    var cutInfo: AliyunMediaConfig!
    var cutMode: AliyunMediaCutMode?
    var alertView: UIAlertView!
    //缩略图
    var thumbnailView: CropThumbnailView!
    //progress
    var destRatio: CGFloat!
    var orgVideoRatio: CGFloat!
    var progressView: UIView!
    var previewHeight: CGFloat!
    var previewWidth: CGFloat!
    var previewOffset: CGPoint!
    var avAsset: AVAsset!
    var playerItem: AVPlayerItem!
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
//    var timeObserver:
    var currentTime: CMTime!
    var previewScrollView: UIScrollView!
    var stillImageLayer: CALayer!
    var stillImage: UIImage!
    var bottomView: UIView!
    var originalMediaSize: CGSize!
    var shouldStartCut: Bool!
    var hasError: Bool!
    var isCencel: Bool!
    var fakeCrop: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cutMode = cutInfo.cutMode
        if cutInfo.phAsset == nil {
            addNotification()
        }
        self.setupSubViews()
    }
    
    func addNotification() {

        NotificationCenter.default.addObserver(self, selector: #selector(UIApplicationDelegate.applicationDidEnterBackground(_:)), name: UIApplication.willResignActiveNotification, object: UIApplication.shared)

        NotificationCenter.default.addObserver(self, selector: #selector(UIApplicationDelegate.applicationDidBecomeActive(_:)), name: UIApplication.willEnterForegroundNotification, object: nil)

        avPlayer.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd(_:)), name: .AVPlayerItemDidPlayToEndTime, object: avPlayer.currentItem)
    }
    
    func setupSubViews() {
        view.backgroundColor = UIColor.starGray
        automaticallyAdjustsScrollViewInsets = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(previewTapGesture))
        previewScrollView = UIScrollView()
        previewScrollView.bounces = false
        previewScrollView.backgroundColor = UIColor.starGray
        previewScrollView.delegate = self
        view.addSubview(previewScrollView)
        previewScrollView.snp.makeConstraints { make in
            make.width.equalTo(512 / 3)
            make.height.equalTo(303)
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(50)
            previewScrollView.addGestureRecognizer(tapGesture)
        }
        
        if cutInfo.phAsset == nil {
            thumbnailView = CropThumbnailView(frame: CGRect(x: 0, y: Screen.height - Screen.width / 8.0 - 52, width: Screen.width, height: Screen.width / 8 + 12), cutInfo: cutInfo)
            thumbnailView.delegate = self
            view.addSubview(thumbnailView)
        }
    }
    
    func setAVPlayer() {
        playerItem = AVPlayerItem(asset: avAsset)
        addObserver(self, forKeyPath: "playerItem.status", options: .new, context: nil)
        avPlayer = AVPlayer(playerItem: playerItem)
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        previewScrollView.layer.addSublayer(avPlayerLayer)
    }
    
    func setupStillImageLayer() {
        stillImageLayer = CALayer()
        previewScrollView.layer.addSublayer(stillImageLayer)
        if cutInfo.phImage != nil{
            stillImage = cutInfo.phImage
            stillImageLayer.contents = stillImage.cgImage
        }else{
            let requestOptions = PHImageRequestOptions()
            requestOptions.resizeMode = .exact
            requestOptions.deliveryMode = .highQualityFormat
            requestOptions.isSynchronous = true
            requestOptions.isNetworkAccessAllowed = true
            PHImageManager.default().requestImage(for: cutInfo.phAsset, targetSize: PHImageManagerMaximumSize, contentMode: .default, options: requestOptions) { (result, info) in
                if result?.imageOrientation == UIImage.Orientation.up {
                    self.stillImage = result
                    self.stillImageLayer.contents = result?.cgImage
                }else{
                    UIGraphicsBeginImageContextWithOptions(result!.size, false, result!.scale)
                    result?.draw(in: CGRect(x: 0, y: 0, width: result!.size.width, height: result!.size.width))
                    let normalizedImage = UIGraphicsGetImageFromCurrentImageContext()
                    UIGraphicsEndImageContext()
                    self.stillImage = normalizedImage
                    self.stillImageLayer.contents = normalizedImage?.cgImage
                }
            }
        }
    }
    
    func destoryAVPlayer() {
        if avPlayer != nil {
            self.avPlayer = nil
            self.avPlayerLayer = nil
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    func cropViewFitRect() {
        previewHeight = Screen.width / destRatio
        var frame = previewScrollView.frame
        frame.size.height = previewHeight
        if destRatio == 9.0 / 16.0 {
            frame.origin.y = CGFloat(PhoneFrame.safeTop)
        }
        previewScrollView.frame = frame
        previewScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        if cutInfo.cutMode == AliyunMediaCutMode.scaleAspectCut {
            
        }
    }
    
    func playVideo() {
        if playerStatus == AliyunCropPlayerStatus.playingBeforeSeek {
            avPlayer.seek(to: CMTime(value: Int64(cutInfo.startTime * 1000), timescale: 1000), toleranceBefore: .zero, toleranceAfter: .zero)
        }
        avPlayer.play()
        playerStatus = AliyunCropPlayerStatus.player
        
        if timeObserver != nil {
            return
        }
        weak var weakSelf = self
        timeObserver = avPlayer.addPeriodicTimeObserver(forInterval: CMTimeMake(value: 1,timescale: 10), queue: .main, using: { time in
            let strong = weakSelf
            let crt = CMTimeGetSeconds(time)
            if strong?.cutInfo.sourceDuration != nil {
                strong?.thumbnailView.updateProgressViewWithProgress(progress: (CGFloat(crt) / (strong?.cutInfo.sourceDuration)!))
            }
        })
    }
    
    func pauseVideo() {
        if playerStatus == AliyunCropPlayerStatus.player {
            playerStatus = AliyunCropPlayerStatus.pause
            avPlayer.pause()
            avPlayer.removeTimeObserver(timeObserver!)
            timeObserver = nil
        }
    }
    
    func didiStartClip() {
        self.pauseVideo()
        self.thumbnailView.isUserInteractionEnabled = false
        if previewScrollView.isDragging {
            shouldStartCut = true
            return
        }
        
        if cutPanel != nil {
            cutPanel.cancel()
        }
        cutPanel = AliyunCrop()
        cutPanel.delegate = self
        cutPanel.inputPath = cutInfo.sourcePath
        cutPanel.outputPath = cutInfo.outputPath
        
        cutPanel.outputSize = cutInfo.outputSize
        cutPanel.fps = Int32(cutInfo.fps!)
        cutPanel.gop = Int32(cutInfo.gop!)
        cutPanel.videoQuality = cutInfo.videoQuality as! AliyunVideoQuality
        if cutInfo.cutMode! == AliyunMediaCutMode.scaleAspectCut || !self.fakeCrop {
            if cutInfo.cutMode! == AliyunMediaCutMode.scaleAspectCut {
                cutPanel.rect = CGRect.evenRect(rect: configureReservationRect())
            }
            if __CGSizeEqualToSize(previewScrollView.bounds.size, previewScrollView.contentSize) || !self.fakeCrop {
                cutPanel.cropMode = cutInfo.cutMode as! AliyunCropCutMode
                cutPanel.startTime = Float(cutInfo.startTime!)
                cutPanel.endTime = Float(cutInfo.endTime)
                cutPanel.gop = Int32(cutInfo.gop!)
                cutPanel.fps = Int32(cutInfo.fps!)
                cutPanel.videoQuality = cutInfo.videoQuality as! AliyunVideoQuality
                if (cutInfo.encodeMode == AliyunEncodeMode.hardH264) {
                    cutPanel.encodeMode = 1
                }else if (cutInfo.encodeMode == AliyunEncodeMode.softFFmpeg) {
                    cutPanel.encodeMode = 0
                }
                print("裁剪编码方式：\(cutPanel.encodeMode)")
                cutPanel.fillBackgroundColor = cutInfo.backgroundColor
                cutPanel.useHW = cutInfo.gpuCrop ?? false
                NSLog("TestLog, %@:%@", "log_crop_start_time", NSDate.timeIntervalSinceReferenceDate)
                var res = cutPanel.start()
                if res == -20004001 {
                    
                }
            }
        }
        
    }
    
    func configureReservationRect() -> CGRect {
        var x: CGFloat = 0, y: CGFloat = 0, w: CGFloat = 0, h: CGFloat = 0
        y = self.previewOffset.y
        if orgVideoRatio > destRatio {
            if previewOffset.x == 0 || previewScrollView.contentSize.width == 0 || originalMediaSize.width == 0 {
                x = 0
            } else {
                x = previewOffset.x / previewScrollView.contentSize.width * originalMediaSize.width
            }
            h = originalMediaSize.height
            w = h * destRatio
        }else {
            if previewOffset.y == 0 || previewScrollView.contentSize.height == 0 || originalMediaSize.height == 0 {
                y = 0;
            } else {
                y = previewOffset.y / previewScrollView.contentSize.height * originalMediaSize.height;
            }
            w = originalMediaSize.width;
            h = originalMediaSize.width / destRatio;
        }
        if y == 0 {
            y = 0;
        }
        return CGRect(x: x, y: y, width: w, height: h)
    }
    
    @objc func playerItemDidReachEnd(_ notification: Notification?) {
        avPlayer.pause()
        let p = notification?.object as? AVPlayerItem
        p?.seek(to: CMTimeMake(value: Int64(cutInfo.startTime * 1000), timescale: 1000), toleranceBefore: .zero, toleranceAfter: .zero)
        avPlayer.play()
        playerStatus = AliyunCropPlayerStatus.player
    }
    
    @objc func previewTapGesture() {
        if playerStatus == AliyunCropPlayerStatus.player {
//            self.pa
        }
    }

}

extension EditViewController: AliyunCropDelegate {
    func crop(onError error: Int32) {
        debugPrint("error: crop")
    }
    
    func cropTask(onProgress progress: Float) {
        
    }
    
    func cropTaskOnComplete() {
        
    }
    
    func cropTaskOnCancel() {
        
    }
    
    
}

extension EditViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        previewOffset = scrollView.contentOffset
        if shouldStartCut {
//            self.d
        }
    }
    
}

extension EditViewController: AliyunCutThumbnailViewDelegate {
    func cutBarDidMoved(toTime time: CGFloat) {
        
    }
    
    func cutBarTouchesDidEnd() {
        
    }
    
    
}
