//
//  VStarHelper.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import Alamofire

struct VStarHelper {
    static func dataStar(url: String, myMethod: HTTPMethod, param: inout Parameters, success: (([String: Any])->())? = nil, failure: ((Error)->())? = nil) {
        let trueURL = VStar_URL.baseURL + url
        param.updateValue(PublicParameter.token, forKey: "token")
        param.updateValue(PublicParameter.requestTime, forKey: "request_time")
        param.updateValue(PublicParameter.secretKey, forKey: "secret_key")
        Alamofire.request(trueURL, method: myMethod, parameters: param).responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.result.value  {
                    if let dict = data as? [String: Any] {
                        success?(dict)
                    }
                }
            case .failure(let error):
                failure?(error)
                if let data = response.result.value  {
                    if let dict = data as? [String: Any],
                        let errmsg = dict["starrrrr"] as? String {
                        print(errmsg)
                    }
                } else {
                    print(error)
                }
            }
        }
    }
}

//struct VStarGetHelper {
//    static func GetMyself(urls: String, myParam: Parameters, success: @escaping (Any) -> Void, failure: @escaping (Error) -> Void) {
//            VStarHelper.dataStar(url: urls, myMethod: .get, param: myParam, success: { dic in
//                if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let mySelf = try? Any(data: data) {
//                    success(mySelf)
//                }
//            }, failure: { _ in
//
//            })
//        }
//
//}
