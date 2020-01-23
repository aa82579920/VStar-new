//
//  TaskHelper.swift
//  V-Star
//
//  Created by 王申宇 on 29/11/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

struct TaskStorage {
    static var iCode = ""
}

struct TaskHelper {
    static func signDay(success: @escaping (SignDay) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["user_ID": MyStorage.userID] as [String: Any]
        VStarHelper.dataStar(url: Task.signDay, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let mySelf = try? SignDay(data: data) {
                success(mySelf)
            }
        }, failure: { _ in
            print("error: signDay")
        })
    }
    
    static func watchOneTime(success: @escaping (WatchOneTime) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["user_ID": MyStorage.userID] as [String: Any]
        VStarHelper.dataStar(url: Task.watchOneTime, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let mySelf = try? WatchOneTime(data: data) {
                success(mySelf)
            }
        }, failure: { _ in
            print("error: WatchOneTime")
        })
    }
    
    static func getWatchMoney(success: @escaping (WatchMoney) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["user_ID": MyStorage.userID] as [String: Any]
        VStarHelper.dataStar(url: Task.getWatchMoney, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let mySelf = try? WatchMoney(data: data) {
                success(mySelf)
            }
        }, failure: { _ in
            print("error: WatchMoney")
        })
    }
    
    static func uploadOneTime(success: @escaping (UploadOneTime) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["user_ID": MyStorage.userID] as [String: Any]
        VStarHelper.dataStar(url: Task.uploadOneTime, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let mySelf = try? UploadOneTime(data: data) {
                success(mySelf)
            }
        }, failure: { _ in
            print("error: UploadOneTime")
        })
    }
    
    static func getUploadMoney(success: @escaping (UploadMoney) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["user_ID": MyStorage.userID] as [String: Any]
        VStarHelper.dataStar(url: Task.getUploadMoney, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let mySelf = try? UploadMoney(data: data) {
                success(mySelf)
            }
        }, failure: { _ in
            print("error: UploadMoney")
        })
    }
    
    static func getInvitationLog(success: @escaping (InvitationLog) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["user_ID": MyStorage.userID] as [String: Any]
        VStarHelper.dataStar(url: Task.getInvitationLog, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let mySelf = try? InvitationLog(data: data) {
                success(mySelf)
            }
        }, failure: { _ in
            print("error: InvitationLog")
        })
    }
    
    static func getInvitationCode(success: @escaping (InvitationCode) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["user_ID": MyStorage.userID] as [String: Any]
        VStarHelper.dataStar(url: Task.getInvitationCode, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let mySelf = try? InvitationCode(data: data) {
                success(mySelf)
            }
        }, failure: { _ in
            print("error: InvitationLog")
        })
    }
    
    static func checkInvitationCode(success: @escaping (CheckInvitationCode) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["user_ID": MyStorage.userID] as [String: Any]
        VStarHelper.dataStar(url: Task.chechInvitationCode, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let mySelf = try? CheckInvitationCode(data: data) {
                success(mySelf)
            }
        }, failure: { _ in
            print("error: CheckInvitationCode")
        })
    }
    
    static func UseICode(success: @escaping (IsError) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["user_ID": MyStorage.userID, "code": TaskStorage.iCode] as [String: Any]
        VStarHelper.dataStar(url: Task.userInvitationCode, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let mySelf = try? IsError(data: data) {
                success(mySelf)
            }
        }, failure: { _ in
            
        })
    }
    
    static func getWeekInfo(success: @escaping (WeekInfo) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["user_ID": MyStorage.userID] as [String: Any]
        VStarHelper.dataStar(url: Task.getWeekInfo, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let mySelf = try? WeekInfo(data: data) {
                success(mySelf)
            }
        }, failure: { _ in
            
        })
    }
}
