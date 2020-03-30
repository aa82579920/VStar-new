//
//  SettingHelper.swift
//  V-Star
//
//  Created by 王申宇 on 10/03/2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

struct SettingHelper {
    static func GetUserProtocol(success: @escaping (UserProtocol) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = [:] as [String : Any]
        VStarHelper.dataStar(url: Protocols.user, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let aul = try? UserProtocol(data: data) {
                success(aul)
            }
        }, failure: { _ in
            
        })
    }
    
    static func GetPrivateProtocol(success: @escaping (UserProtocol) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = [:] as [String : Any]
        VStarHelper.dataStar(url: Protocols.privacy, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let aul = try? UserProtocol(data: data) {
                success(aul)
            }
        }, failure: { _ in
            
        })
    }
}
