//
//  UploadViewController.swift
//  V-Star
//
//  Created by TwTStudio on 2019/11/14.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import AVFoundation
import AFNetworking
import AliyunVideoSDKPro

class UploadViewController: UIViewController {
    var videoPath: String!
    var coverImagePath: String!
    var videoSize: CGSize!
    var videoTitle: String!
    var progressView: UIProgressView!
    var playView: UIView!
    var playScrollView: UIView!
    var uploadLabel: UIView!
    var player: AVPlayer!
    var playerItem: AVPlayerItem!
    var playerLayer: AVPlayerLayer!
    var finish = false
    var publish: AliyunVodPublishManager!
    var uploadModel: UploadModel!
    var coverModel: CoverModel!
    var coverID: String!
    var library: PHPhotoLibrary!
    var array: NSMutableArray!
    var asset: PHAsset!
//    var title: String!
//    var fileName: String!
//    var description: String!
//    var coverID: String!
//    var tags: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func settingQuietModePlaying() {
        //手机静音，播放有声音
        let avSession = AVAudioSession.sharedInstance()
        do {
            try avSession.setCategory(AVAudioSession.Category.playback)
        } catch {
        }
        do {
            try avSession.setActive(true)
        } catch {
        }
    }
    
    func setupPlayer() {
        playerItem = AVPlayerItem(url: URL(string: videoPath!)!)
        player = AVPlayer(playerItem: playerItem)
        playerLayer = AVPlayerLayer(player: player)
        
        playerLayer.frame = self.playView.bounds
        self.playView.layer.addSublayer(playerLayer)
        
        self.addObserver(self, forKeyPath: "playerItem.status", options: .old , context: nil)
        player.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
//        NotificationCenter.default.addObserver(self, selector: #selector(appWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(appDidEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerLayer.frame = self.playView.bounds
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        AFNetworkReachabilityManager.shared().stopMonitoring()
    }
    
    func dealloc() {
        self.removeObserver(self, forKeyPath: "playerItem.status")
        NotificationCenter.default.removeObserver(self)
        AFNetworkReachabilityManager.shared().stopMonitoring()
        AFNetworkReachabilityManager.shared().setReachabilityStatusChange(nil)
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        let p = notification.object! as! AVPlayerItem
        p.seek(to: .zero, completionHandler: .none)
    }
//    @objc func appWillEnterForeground() {
//        self.uploadManager.resumeUpload()
//        self.player.play()
//    }
//    @objc func appDidEnterBackground() {
//        self.uploadManager.pauseUpload()
//        self.player.pause()
//    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "playerItem.status" {
            let status = self.playerItem.status
            if status == AVPlayerItem.Status.readyToPlay {
                self.player.play()
            }
        }
    }
    
    func uploadCover() {
        Cover.ext = "jpeg"
        PostHelper.GetCoverUpload(success: { coverModel in
            Video.coverID = (coverModel.data?.imageID)!
            self.uploadVideo()
        }) { _ in
            print("封面上传地址获取失败")
        }
    }
    
    func isFollowToPhoto() {
        let authorizationStatus = PHPhotoLibrary.authorizationStatus()
        if authorizationStatus == PHAuthorizationStatus.restricted || authorizationStatus == PHAuthorizationStatus.denied {
            let mainInfoDictionary = Bundle.main.infoDictionary
            let appName = mainInfoDictionary?["BundleDisplayName"] as? String
            self.showAlert(withTitle: "小提示", message: "请在设备的\"设置-隐私-照片\"选项中，允许\(appName ?? "")访问你的手机相册")
        }
    }
    
    func showPhoto() {
        library = PHPhotoLibrary()
        array = NSMutableArray()
//        PHImageManager.default().
//        asset.
    }
    
    func uploadVideo() {
        Video.title = "测试一"
        Video.fileName = "file.mp4"
        Video.description = "这是介绍"
        Video.tags = "音乐，舞蹈"
        
        PostHelper.GetVideoUpload(success: { uploadModel in
            let uploadAddress = uploadModel.data?.uploadAddress
            let uploadAuth = uploadModel.data?.uploadAuth
            let result = self.publish.uploadVideo(withPath: self.videoPath, uploadAddress: uploadAddress!, uploadAuth: uploadAuth!)
            if result != 0 {
                self.showAlert(withTitle: "上传失败", message: "上传失败，请重新尝试")
            }
        }) { _ in
            print("上传地址获取失败")
        }
//        self.publish.u
        
    }
    
    func showAlert(withTitle title: String?, message: String?) {
        DispatchQueue.main.async(execute: {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "确定".localString(), style: .default, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: false)
        })
    }
}

extension UploadViewController: AliyunIVodUploadCallback {
    func publishManagerUploadSuccess(_ manager: AliyunVodPublishManager) {
        
    }
    
    func publishManager(_ manager: AliyunVodPublishManager, uploadFailedWithCode code: String, message: String) {
        
    }
    
    func publishManager(_ manager: AliyunVodPublishManager, uploadProgressWithUploadedSize uploadedSize: Int64, totalSize: Int64) {
        
    }
    
    func publishManagerUploadTokenExpired(_ manager: AliyunVodPublishManager) {
        
    }
    
    func publishManagerUploadRetry(_ manager: AliyunVodPublishManager) {
        
    }
    
    func publishManagerUploadRetryResume(_ manager: AliyunVodPublishManager) {
        
    }
    
    
}
