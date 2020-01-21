//
//  VStarGetHelper.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/22.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

struct GetHelper {
    static func GetMyself(success: @escaping (MySelf) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["user_ID": MyStorage.userID] as [String: Any]
        VStarHelper.dataStar(url: VStar_URL.user.myself, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let mySelf = try? MySelf(data: data) {
                success(mySelf)
            }
        }, failure: { _ in
            
        })
    }
    
    static func GetLogout(success: @escaping (IsError) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["user_ID": MyStorage.userID] as [String: Any]
        VStarHelper.dataStar(url: VStar_URL.user.logout, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let logout = try? IsError(data: data) {
                success(logout)
            }
        }, failure: { _ in
            
        })
    }
    
    static func GetSpotList(success: @escaping (SpotList) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["limit": MyStorage.limit, "page": MyStorage.page, "user_ID": MyStorage.userID] as [String : Any]
        VStarHelper.dataStar(url: VStar_URL.user.spotlist, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let spotList = try? SpotList(data: data) {
                success(spotList)
            }
        }, failure: { _ in
            
        })
    }
    
    static func GetCollection(success: @escaping (Collection) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["limit": MyStorage.limit, "page": MyStorage.page, "user_ID": MyStorage.userID] as [String : Any]
        VStarHelper.dataStar(url: VStar_URL.user.spotlist, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let collection = try? Collection(data: data) {
                success(collection)
            }
        }, failure: { _ in
            
        })
    }
    
    static func GetFans(success: @escaping (Fans) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["limit": MyStorage.limit, "page": MyStorage.page, "user_ID": MyStorage.userID] as [String : Any]
        VStarHelper.dataStar(url: VStar_URL.user.fans, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let fans = try? Fans(data: data) {
                success(fans)
            }
        }, failure: { _ in
            
        })
    }
    
    static func GetFUVA(success: @escaping (FollowUserVideoAction) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["limit": MyStorage.limit, "page": MyStorage.page, "user_ID": MyStorage.userID] as [String : Any]
        VStarHelper.dataStar(url: VStar_URL.user.followUserVideoAction, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let fuva = try? FollowUserVideoAction(data: data) {
                success(fuva)
            }
        }, failure: { _ in
            
        })
    }
    
    static func GetRecommendUser(success: @escaping (RecommendUser) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["limit": MyStorage.limit, "page": MyStorage.page, "user_ID": MyStorage.userID] as [String : Any]
        VStarHelper.dataStar(url: VStar_URL.user.recommendUser, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let recommendUser = try? RecommendUser(data: data) {
                success(recommendUser)
            }
        }, failure: { _ in
            
        })
    }
    static func GetRecentBanner(success: @escaping (RecentBanner) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["limit": MyStorage.limit, "bannerType": 1] as [String : Any]
        VStarHelper.dataStar(url: VStar_URL.banner, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let banner = try? RecentBanner(data: data) {
                success(banner)
            }
        }, failure: { _ in
            
        })
    }
    
    static func GetRecentAction(success: @escaping (RecentAction) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["limit": MyStorage.limit, "page": MyStorage.page] as [String : Any]
        VStarHelper.dataStar(url: VStar_URL.action.recentAction, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let action = try? RecentAction(data: data) {
                success(action)
            }
        }, failure: { _ in
            
        })
    }
    
    static func GetCommentByActionID(success: @escaping (CommentByActionID) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["action_ID": WorkStorage.actionID ,"limit": MyStorage.limit, "page": MyStorage.page] as [String : Any]
        VStarHelper.dataStar(url: VStar_URL.action.commentByActionID, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let cbai = try? CommentByActionID(data: data) {
                success(cbai)
            }
        }, failure: { _ in
            
        })
    }
    
    static func GetCCBAcID(success: @escaping (CommentCommentByACID) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["acID": WorkStorage.acID ,"limit": MyStorage.limit, "page": MyStorage.page] as [String : Any]
        VStarHelper.dataStar(url: VStar_URL.action.getCommentCommentByAcID, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let ccba = try? CommentCommentByACID(data: data) {
                success(ccba)
            }
        }, failure: { _ in
            
        })
    }
    
    static func GetAtUserList(success: @escaping (AtUserList) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["limit": MyStorage.limit, "page": MyStorage.page, "key": WorkStorage.key] as [String : Any]
        VStarHelper.dataStar(url: VStar_URL.action.getAtUserList, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let aul = try? AtUserList(data: data) {
                success(aul)
            }
        }, failure: { _ in
            
        })
    }
    
    static func GetWorkRank(url: String, success: @escaping (WorkRank) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["num": WorkStorage.num] as [String : Any]
        VStarHelper.dataStar(url: url, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let aul = try? WorkRank(data: data) {
                success(aul)
            }
        }, failure: { _ in
            
        })
    }
    
    static func GetUserRank(url: String, success: @escaping (UserRank) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["num": WorkStorage.num] as [String : Any]
        VStarHelper.dataStar(url: url, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let aul = try? UserRank(data: data) {
                success(aul)
            }
        }, failure: { _ in
            
        })
    }
    
    static func GetRecommendWork(success: @escaping (RecommendWork) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["history": WorkStorage.history, "habit": WorkStorage.habit, "mode": WorkStorage.mode, "limit": MyStorage.limit] as [String : Any]
        VStarHelper.dataStar(url: VStar_URL.work.getRecommendWork, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let aul = try? RecommendWork(data: data) {
                success(aul)
            }
        }, failure: { _ in
            
        })
    }

}
