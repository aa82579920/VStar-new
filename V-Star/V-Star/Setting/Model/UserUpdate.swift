//
//  UserUpdate.swift
//  V-Star
//
//  Created by 王申宇 on 04/04/2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

struct UpdateHelper {
    static func UpdateUserInfo(success: @escaping (IsError) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = [:] as [String : Any]
        VStarHelper.dataStar(url: "/user/update", myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let aul = try? IsError(data: data) {
                success(aul)
            }
        }, failure: { _ in
            
        })
    }
}
