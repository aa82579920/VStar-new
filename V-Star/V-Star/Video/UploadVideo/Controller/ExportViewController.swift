//
//  UploadViewController.swift
//  V-Star
//
//  Created by 王申宇 on 2019/11/11.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import AliyunVideoSDKPro
import PhotosUI

class ExportViewController: UIViewController {
    
    var vodPM: AliyunVodPublishManager!
    var taskPath: String!
    var config: AliyunMediaConfig!
    var containerView: UIView!
    var canPopError: Bool!
    var finished: Bool!
    var failed: Bool!
    var errorReExportCount: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUpload()
    }
    
    func initUpload() {
        vodPM = AliyunVodPublishManager()
        vodPM.exportCallback = self

    }
    
    func exportVideo() {
        let result = vodPM.export(withTaskPath: taskPath, outputPath: config.outputPath)
        if result != 0 {
            self.showAlert(withTitle: "合成失败", message: "合成失败，请返回重试")
        }
    }
    
    func showAlert(withTitle title: String?, message: String?) {
        DispatchQueue.main.async(execute: {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "确定", style: .default, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: false)
        })
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
    
//    func addNotifications() {
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(WKExtensionDelegate.applicationWillResignActive), name: UIApplication.willResignActiveNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(WKExtensionDelegate.applicationDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
//    }
//
    func removeNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    func keyboardWillShow(_ note: Notification?) {
        let end = (note?.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue
        let duration = CGFloat((note?.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0.0)
        let containerHeight = CGFloat(PhoneFrame.statusBarHeight + 118 + Int(Screen.width))

        let offset = CGFloat(Screen.height - end!.height) - containerHeight
        if offset < 0 {
            UIView.animate(withDuration: TimeInterval(duration), animations: {
                self.containerView.frame = CGRect(x: 0, y: offset, width: CGFloat(Screen.width), height: CGFloat(Screen.height))
            })
        }
    }
    
    func keyboardWillHide(_ note: Notification?) {
        let duration = CGFloat((note?.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0.0)
        UIView.animate(withDuration: TimeInterval(duration), animations: {
            self.containerView.frame = CGRect(x: 0, y: 0, width: CGFloat(Screen.width), height: CGFloat(Screen.height))
        })
    }

    func applicationWillResignActive() {
        self.canPopError = false
        self.vodPM.pauseExport()
    }

    func applicationDidBecomeActive() {
        if !finished && !failed {
            self.resumeExportVideo()
        }
    }
    
    func resumeExportVideo() {
        let result = self.vodPM.resumeExport()
        if result != 0 {
            self.showAlert(withTitle: "合成失败", message: "合成失败，请返回重试")
        }
    }
    
    
}

extension ExportViewController: AliyunIExporterCallback {
    func exporterDidEnd(_ outputPath: String!) {
        self.finished = true
        let library = PHPhotoLibrary()
        library.performChanges({
            PHAssetChangeRequest.creationRequestForAssetFromImage(atFileURL: URL(string: self.config!.outputPath)!)
        }) { (bool, error) in
            debugPrint(error!)
        }
    }
    
    func exporterDidCancel() {
        
    }
    
    func exportProgress(_ progress: Float) {
        
    }
    
    func exportError(_ errorCode: Int32) {
        debugPrint("export error")
        if errorCode == 268447759 && canPopError == false {
            if errorReExportCount > 5 {
//                self.show
            }
        }
    }
    
    func showExportError(_ errorCode: Int32) {
        failed = true
//        self
        self.showAlert(withTitle: "合成失败", message: "Error code: \(errorCode)")
    }
    
    func exporterDidStart() {
        
    }
}
