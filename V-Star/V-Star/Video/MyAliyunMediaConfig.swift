//
//  MyAliyunMediaConfig.swift
//  V-Star
//
//  Created by 王申宇 on 2019/10/23.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import UIKit
import Photos

enum AliyunMediaQuality: Int {
    case veryHight
    case hight
    case medium
    case low
    case poor
    case extraPoor
}

enum AliyunMediaCutMode: Int {
    case scaleAspectFill = 0
    case scaleAspectCut = 1
}

enum AliyunEncodeMode: Int {
    case hardH264
    case softFFmpeg
}

enum AliyunMediaRatio: Int {
    case AliyunMediaRatio9To16
    case AliyunMediaRatio3To4
    case AliyunMediaRatio1To1
    case AliyunMediaRatio4To3
    case AliyunMediaRatio16To9
}

enum kPhotoMediaType {
    case video
    case photo
}

class AliyunMediaConfig: NSObject, NSCopying, NSMutableCopying {
    var sourcePath: String!
    var sourceDuration: CGFloat!
    var outputPath: String!
    var outputSize: CGSize!
    var startTime: CGFloat!
    var endTime: CGFloat!
    lazy var minDuration: CGFloat! = {
        self.maxDuration = 15
        return self.maxDuration
    }()
    lazy var maxDuration: CGFloat! = {
        self.minDuration = 2
        return self.minDuration
    }()
    var cutMode: AliyunMediaCutMode?
    var videoQuality: AliyunMediaQuality?
    var encodeMode: AliyunEncodeMode?
    var fps: Int?
    var gop: Int?
    var avAsset: AVAsset!
    var phAsset: PHAsset!
    var phImage: UIImage!
    var videoOnly: Bool?
    var videoRotate: Int?
    var backgroundColor: UIColor?
    var gpuCrop: Bool?
    var hasEnd: Bool?
    
    //  Converted to Swift 5.1 by Swiftify v5.1.30744 - https://objectivec2swift.com/
    func copy(with zone: NSZone? = nil) -> Any {
        let config = AliyunMediaConfig()
        config.sourcePath = sourcePath
        config.sourceDuration = sourceDuration
        config.outputPath = outputPath
        config.outputSize = outputSize
        config.startTime = startTime
        config.endTime = endTime
        config.minDuration = minDuration
        config.maxDuration = maxDuration
        config.cutMode = cutMode
        config.videoQuality = videoQuality
        config.encodeMode = encodeMode
        config.fps = fps
        config.gop = gop
        config.avAsset = avAsset
        config.phAsset = phAsset
        config.phImage = phImage
        config.videoOnly = videoOnly
        config.videoRotate = videoRotate
        config.backgroundColor = backgroundColor
        config.gpuCrop = gpuCrop
        config.hasEnd = hasEnd
        return config
    }
    
    func mutableCopy(with zone: NSZone? = nil) -> Any{
        let config = AliyunMediaConfig()
        config.sourcePath = self.sourcePath;
        config.sourceDuration = self.sourceDuration;
        config.outputPath = self.outputPath;
        config.outputSize = self.outputSize;
        config.startTime = self.startTime;
        config.endTime = self.endTime;
        config.minDuration = self.minDuration;
        config.maxDuration = self.maxDuration;
        config.cutMode = self.cutMode;
        config.videoQuality = self.videoQuality;
        config.encodeMode = self.encodeMode;
        config.fps = self.fps;
        config.gop = self.gop;
        config.avAsset = self.avAsset;
        config.phAsset = self.phAsset;
        config.phImage = self.phImage;
        config.videoOnly = self.videoOnly;
        config.videoRotate = self.videoRotate;
        config.backgroundColor = self.backgroundColor;
        config.gpuCrop = self.gpuCrop;
        config.hasEnd = self.hasEnd;
        return config
    }


    
    class func cutConfig(withOutputPath outputPath: String?, outputSize: CGSize, minDuration: CGFloat, maxDuration: CGFloat, cutMode: AliyunMediaCutMode, videoQuality: AliyunMediaQuality, fps: Int, gop: Int) -> Any {
        let config = AliyunMediaConfig()
        config.outputPath = outputPath
        config.outputSize = outputSize
        config.minDuration = minDuration
        config.maxDuration = maxDuration
        config.cutMode = cutMode
        config.videoQuality = videoQuality
        config.fps = fps
        config.gop = gop
        return config
    }
    
    //  Converted to Swift 5.1 by Swiftify v5.1.30744 - https://objectivec2swift.com/
    class func recordConfig(withOutpusPath outputPath: String?, outputSize: CGSize, minDuration: CGFloat, maxDuration: CGFloat, videoQuality: AliyunMediaQuality, encode encodeMode: AliyunEncodeMode, fps: Int, gop: Int) -> AliyunMediaConfig {
        let config = AliyunMediaConfig()
        config.outputPath = outputPath
        config.outputSize = outputSize
        config.minDuration = minDuration
        config.maxDuration = maxDuration
        config.videoQuality = videoQuality
        config.fps = fps
        config.gop = gop
        config.encodeMode = encodeMode
        return config
    }
    
    func invertConfig() -> AliyunMediaConfig {
        let config = AliyunMediaConfig()
        return config
    }
    
    func defaultConfig() -> AliyunMediaConfig {
        let config = AliyunMediaConfig()
        config.outputSize = CGSize(width: 720, height: 1280)
        config.videoQuality = AliyunMediaQuality.hight
        config.gop = 250
        config.fps = 30
        return config
    }
    
    override init() {
        super.init()
        fps = 25
        gop = 5
        videoQuality = AliyunMediaQuality.hight
        backgroundColor = UIColor.black
    }

    
    func updateVideoSizeWithRatio(r: CGFloat) -> CGSize {
        let w = outputSize.width
        let h = ceilf(Float(w / r))
        outputSize = CGSize(width: w, height: CGFloat(h))
        self.evenOutputSize()
        return outputSize
    }
    
    func fixedSize() -> CGSize {
        self.evenOutputSize()
        if self.videoRotate == 90 || videoRotate == 270 {
            return CGSize(width: max(outputSize.height, outputSize.width), height: min(outputSize.height, outputSize.width))
        }
        return outputSize
    }
    
    func evenOutputSize() {
        let w = Int(outputSize.width)
        let h = ceil(outputSize.height)
        let fixedW = Int(w / 2 * 2)
        let fixedH = Int(h / 2 * 2)
        outputSize = CGSize(width: fixedW, height: fixedH)
    }
    
    func mediaRatio() -> AliyunMediaRatio {
        let aspects: [Float] = [9/16.0, 3/4.0, 1.0, 4/3.0, 16/9.0]
        let fixedSize = self.fixedSize()
        let videoAspect = Float(fixedSize.width / fixedSize.height)
        var index = 0
        for i in 0..<5 {
            index = i
            if videoAspect <= aspects[i] {
                break
            }
        }
        if index > 0 {
            if fabsf(videoAspect - aspects[index]) > fabsf(videoAspect-aspects[index-1]) {
                index = index - 1
            }
        }
        switch index {
        case 0: return AliyunMediaRatio.AliyunMediaRatio9To16
        case 1: return AliyunMediaRatio.AliyunMediaRatio3To4
        case 2: return AliyunMediaRatio.AliyunMediaRatio1To1
        case 3: return AliyunMediaRatio.AliyunMediaRatio4To3
        default: return AliyunMediaRatio.AliyunMediaRatio16To9
        }
    }
    
    
}
