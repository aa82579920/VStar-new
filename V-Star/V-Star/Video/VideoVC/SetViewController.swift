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

class SetViewController: UIViewController {
    
    var tempIndex = 0

    var recorder: AliyunIRecorder! //录制
//    var montionManager = //进度条
//    let navigationBar = AlivcRecordNavigationBar() 顶部导航栏设置
    
    let cachesPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
    var music: AliyunEffectMusic!
    let recordBtn = UIButton()
    let confirmBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRecorder()
    }
    
    func setRecorder() {
        recorder = AliyunIRecorder(delegate: self, videoSize: CGSize(width: view.width, height: view.height))
        recorder.preview = self.view //设置预览
        recorder.cameraRotate = 270  //摄像头角度？？之后测测看
        recorder.outputPath = cachesPath //视频输出路径
        recorder.outputType = AliyunIRecorderVideoOutputPixelFormatType.type420f //视频输出类型
//        recorder.taskPath =
        recorder.beautifyStatus = true //开启美颜
        recorder.beautifyValue = 0     //默认为0
        recorder.useFaceDetect = false
        recorder.backCaptureSessionPreset = AVCaptureSession.Preset.hd1280x720.rawValue
        recorder.frontCaptureSessionPreset = AVCaptureSession.Preset.hd1280x720.rawValue
        recorder.startPreview()
        recorder.clipManager.maxDuration = 30
        //MARK: - music url ??
//        music = AliyunEffectMusic(file: "/Users/myworld/Music/网易云音乐/暗杠 - 走歌人18.mp3")
        music.startTime = 0
        music.duration = 30
        recorder.apply(music)
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
}

extension SetViewController: AliyunIRecorderDelegate {
    func recorderDeviceAuthorization(_ status: AliyunIRecorderDeviceAuthor) {
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
}
