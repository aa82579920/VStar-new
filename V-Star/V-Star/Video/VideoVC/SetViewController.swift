//
//  SetViewController.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/1.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import AliyunVideoSDKPro
import AliyunOSSiOS
import CoreMotion
import Photos

struct PhoneFrame {
    static let is_phoneX  = UIScreen.main.bounds.size.height < 812 ? false : true
    static let safeTop = UIScreen.main.bounds.size.height < 812 ? 20 : 44
    static let safeBottom = UIScreen.main.bounds.size.height < 812 ? 0 : 34
    static let safeBeautyBottom = UIScreen.main.bounds.size.height < 812 ? 0 : 12
    static let statusBarHeight = UIScreen.main.bounds.size.height < 812 ? 20 : 44
    static let noStatusBarSafeTop = PhoneFrame.is_phoneX ? 44 : 0
    static let kquTabBarHeight = PhoneFrame.is_phoneX ? 100 : 0
}

class SetViewController: UIViewController {
    
    var tempIndex = 0

    var recorder: AliyunIRecorder! //录制
    var motionManager: CMMotionManager?
//    var progressView: QUProgressView?
    var shouldStartPreviewWhenActive: Bool!
    var recorderDuration: CGFloat?
    var cameraRotate: NSInteger = 0
    var reachability: Reachability?
    let cachesPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
    var music: AliyunEffectMusic!
    let recordBtn = UIButton()
    let confirmBtn = UIButton()
    var quVideo = AliyunMediaConfig()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRecorder()
        setupSubviews()
        addNotification()
        //开始预览
        self.recorder.startPreview(withPositon: .front)
        //设置默认美颜 cut
        
        self.shouldStartPreviewWhenActive = false;
        self.recorderDuration = 0;
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = .black
        self.startRetainCameraRotate() //开启陀螺仪获取手机旋转角度
        UIApplication.shared.isIdleTimerDisabled = true//录制模块禁止自动熄屏
        UIApplication.shared.isStatusBarHidden = true
        if self.shouldStartPreviewWhenActive {
            self.recorder.startPreview()
            self.shouldStartPreviewWhenActive = false
        }
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.motionManager?.stopDeviceMotionUpdates()
        UIApplication.shared.isIdleTimerDisabled = false
        UIApplication.shared.isStatusBarHidden = false
        self.recorder.switchTorch(with: .off)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func settingQuietModePlaying() {
        let avSession = AVAudioSession.sharedInstance()
        do {
            try avSession.setCategory(.playAndRecord)
            try avSession.setActive(true)
        }catch{
            
        }
    }
    //VC布局
    func setupSubviews() {
        let recordView = VideoRecoderConfig(frame: CGRect(x: 0, y: 0, width: Screen.width, height: Screen.height))
        recordView.flip_over.addTarget(self, action: #selector(flip), for: .touchUpInside)
        self.view.backgroundColor = .clear
        self.view.addSubview(recordView)
        self.view.addSubview(self.recorder.preview)
    }
    //添加通知
    func addNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(appWillResignActive), name: UIApplication.willResignActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appDidBecomeActice), name: UIApplication.didBecomeActiveNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(resourceDelete), name: AliyunEffectRe, object: <#T##Any?#>)
    }
    
    func setRecorder() {
        let manager = MyAliyunPathManager()
        if recorder == nil {
            let recordDir = manager.createRecrodDir
            manager.clearDir(dirPath: recordDir!)
            //生成这次的存储路径
            let tastPath = (recordDir! as NSString).appendingPathComponent(manager.randomString as String)
            //视频存储路径
            let videoSavePathStr = (tastPath as NSString).appendingPathComponent(manager.randomString as String)
            let videoSavePath = (videoSavePathStr as NSString).appendingPathComponent("mp4")
            //FIXME: - AliyunMediaConfig记得重写
            recorder = AliyunIRecorder(delegate: self, videoSize: /*quVideo.outputSize*/ CGSize(width: 320, height: 480))
            recorder.preview = UIView(frame: CGRect(x: 0, y: 40, width: Screen.width, height: Screen.height / 2))
            recorder.outputType = AliyunIRecorderVideoOutputPixelFormatType.type420f
            recorder.useFaceDetect = true
            recorder.faceDetectCount = 2
            recorder.faceDectectSync = false
            recorder.frontCaptureSessionPreset = AVCaptureSession.Preset.hd1280x720.rawValue
            recorder.encodeMode = /*(quVideo.encodeMode == AliyunEncodeMode.softFFmpeg) ? 0 : */1
            print("录制编码方式:\(recorder.encodeMode)")
            recorder.gop = 30//Int32(quVideo.gop!)
            recorder.videoQuality = AliyunVideoQuality(rawValue: 200000)! //quVideo.videoQuality as! AliyunVideoQuality
//            recorder.recordFps = Int32(quVideo.fps!)
            recorder.outputPath = videoSavePath //quVideo.outputPath ?? videoSavePath
            quVideo.outputPath = recorder.outputPath
            recorder.taskPath = tastPath
            recorder.beautifyStatus = true
            self.setMaxDuration(recorder, quVideo.maxDuration)
            self.setMinDuration(recorder, quVideo.minDuration)
        }
        
//        self.progressView = {
//            if progressView == nil {
//                progressView = QUProgressView(frame: CGRect(x: 8, y: CGFloat(PhoneFrame.noStatusBarSafeTop + 4), width: Screen.width - 16, height: 4))
//            }
//            return progressView
//        }()
    }
    
    func setMaxDuration(_ recorder: AliyunIRecorder, _ maxDuration: CGFloat) {
        recorder.clipManager.maxDuration = maxDuration
    }
    
    func setMinDuration(_ recorder: AliyunIRecorder, _ minDuration: CGFloat) {
        recorder.clipManager.minDuration = minDuration
    }
    
    
    func setView() {
        recordBtn.layer.masksToBounds = true
        recordBtn.layer.cornerRadius = recordBtn.width / 2
        recordBtn.layer.borderWidth = 5
        recordBtn.layer.borderColor = UIColor.clear.cgColor
        recordBtn.backgroundColor = UIColor.starRed
        recordBtn.contentRect(forBounds: CGRect(origin: CGPoint.init(x: recordBtn.x, y: recordBtn.y), size: CGSize(width: recordBtn.width - 10, height: recordBtn.width - 10)))
        recordBtn.addTarget(.none, action: #selector(startOrStopRecord), for: .touchUpInside)
    }
    
    func startRetainCameraRotate() {
        //初始化全局管理对象
        if motionManager == nil {
            motionManager = CMMotionManager()
        }
        if motionManager!.isDeviceMotionAvailable {
            motionManager!.deviceMotionUpdateInterval = 1
            motionManager!.startDeviceMotionUpdates(to: OperationQueue.main, withHandler: { motion, error in
                // Gravity 获取手机的重力值在各个方向上的分量，根据这个就可以获得手机的空间位置，倾斜角度等
                let gravityX = motion?.gravity.x ?? 0.0
                let gravityY = motion?.gravity.y ?? 0.0
                let xyTheta = atan2(gravityX, gravityY) / .pi * 180.0 //手机旋转角度。
                if xyTheta >= -45 && xyTheta <= 45 {
                    //down
                    self.cameraRotate = 180
                } else if xyTheta > 45 && xyTheta < 135 {
                    //left
                    self.cameraRotate = 90
                } else if (xyTheta >= 135 && xyTheta < 180) || (xyTheta >= -180 && xyTheta < -135) {
                    //up
                    self.cameraRotate = 0
                } else if xyTheta >= -135 && xyTheta < -45 {
                    //right
                    self.cameraRotate = 270
                }
                //            NSLog(@"手机旋转的角度为 --- %d", _cameraRotate);
            })
        }
    }

    
    //MARK: - 显示一个权限弹窗
    func showAVAuthorizationAlertWithMediaType(mediaType: AVMediaType) {
        var title = "打开相机失败"
        var message = "摄像头无权限"
        if mediaType == AVMediaType.audio {
            title = "获取麦克风权限失败"
            message = "麦克风无权限"
        }
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action1 = UIAlertAction(title: "取消", style: .destructive, handler: nil)
        let action2 = UIAlertAction(title: "设置", style: .default) { action in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        }
        alertController.addAction(action1)
        alertController.addAction(action2)
        self.present(alertController, animated: false, completion: nil)
    }
    
    func previewFrame() -> CGRect {
        quVideo = quVideo.defaultConfig()
        let ratio = quVideo.outputSize.width / quVideo.outputSize.height
        var finalFrame = CGRect(x: 0, y: CGFloat(PhoneFrame.noStatusBarSafeTop + 44 + 10), width: Screen.width, height: Screen.width / ratio)
        if quVideo.mediaRatio() == AliyunMediaRatio.AliyunMediaRatio9To16 {
            finalFrame = CGRect(x: (Screen.width - Screen.height * ratio) / 2, y: 0, width: Screen.height * ratio, height: Screen.height)
        }
        return finalFrame
    
    }
}
    

extension SetViewController: AliyunIRecorderDelegate {
    func recorderDeviceAuthorization(_ status: AliyunIRecorderDeviceAuthor) {
        DispatchQueue.main.async {
            if status == AliyunIRecorderDeviceAuthor.audioDenied {
                self.showAVAuthorizationAlertWithMediaType(mediaType: .audio)
            }else if status == AliyunIRecorderDeviceAuthor.videoDenied {
                self.showAVAuthorizationAlertWithMediaType(mediaType: .video)
            }
        }
    }
}
extension SetViewController {
    @objc func startOrStopRecord() {
        if tempIndex % 2 == 0 {
            self.recorder.startRecording()
        }else{
            self.recorder.stopRecording()
        }
    }
    
    @objc func finish() {
        self.recorder.finishRecording()
        
    }
    
    @objc func appWillResignActive() {
        self.recorder.switchTorch(with: .off)
        //MARK: - 有个计时器不知道要不要
//        sel.ti
        if self.recorder.isRecording {
            self.recorder.stopRecording()
        }
        //MARK: - 可能需要更新UI
//        self.up
    }
    @objc func appDidBecomeActice() {
        //刷新闪光灯
    }
    
    //翻转
    @objc func flip() {
        self.recorder.switchCameraPosition()
    }
}

