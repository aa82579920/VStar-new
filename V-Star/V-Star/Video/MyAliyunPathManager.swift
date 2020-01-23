//
//  MyAliyunPathManager.swift
//  V-Star
//
//  Created by 王申宇 on 2019/10/20.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

class MyAliyunPathManager: NSObject {
    let rootPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as NSString
    let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first! as NSString
    var aliyunRootPath: NSString!
    
    lazy var quCachePath: NSString! = {
        return cachePath.appendingPathComponent("com.duanqu.demo") as NSString
    }()
    var compositionRootDir: NSString!
    var quRelativeRootPath: NSString!
    lazy var randomString: NSString! = {
        let puuid = CFUUIDCreate(nil)
        let uuidString = CFUUIDCreateString(nil, puuid)
        let result = CFBridgingRetain(CFStringCreateCopy(nil, uuidString!)) as! NSString
        return result
    }()
    var createRecrodDir: String!
    var createMagicRecordDir: String!
    var createResourceDir: String!
    var createPlayerDir: String!
    var resourceRelativeDir: String!
    
    override init() {
        super.init()
        aliyunRootPath = rootPath.appendingPathComponent("com.duanqu.demo") as NSString
        compositionRootDir = self.aliyunRootPath.appendingPathComponent("composition") as NSString
        quRelativeRootPath = "Documents/com.duanqu.demo" as NSString
        createRecrodDir = aliyunRootPath.appendingPathComponent("record")
        createMagicRecordDir = aliyunRootPath.appendingPathComponent("magicRecord")
        createResourceDir = aliyunRootPath.appendingPathComponent("QPRes")
        createPlayerDir = aliyunRootPath.appending("play")
        resourceRelativeDir = aliyunRootPath.appendingPathComponent("QPRes")
    }
    
    public func clearDir(dirPath: String) {
        do {
            try FileManager.default.removeItem(atPath: dirPath)
        } catch {
            print("path remove False")
        }
        do {
            try FileManager.default.createDirectory(atPath: dirPath, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print("path create False")
        }
    }
}
