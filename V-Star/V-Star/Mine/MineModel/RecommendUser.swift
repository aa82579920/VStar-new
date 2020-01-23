//
//  RecommendUser.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/22.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
// MARK: - RecommendUser
struct RecommendUser: Codable {
    let errorCode: Int?
    let message: String?
    let data: [RUDatum]?
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: RecommendUser convenience initializers and mutators

extension RecommendUser {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RecommendUser.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        errorCode: Int?? = nil,
        message: String?? = nil,
        data: [RUDatum]?? = nil
        ) -> RecommendUser {
        return RecommendUser(
            errorCode: errorCode ?? self.errorCode,
            message: message ?? self.message,
            data: data ?? self.data
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Datum
struct RUDatum: Codable {
    let userID: Int?
    let username: String?
    let avatar: String?
    let fansNum: Int?
    let tags: String?
    let monthRank: Int?
    let signature: String?
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_ID"
        case username, avatar
        case fansNum = "fans_num"
        case tags
        case monthRank = "month_rank"
        case signature
    }
}

// MARK: Datum convenience initializers and mutators

extension RUDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RUDatum.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        userID: Int?? = nil,
        username: String?? = nil,
        avatar: String?? = nil,
        fansNum: Int?? = nil,
        tags: String?? = nil,
        monthRank: Int?? = nil,
        signature: String?? = nil
        ) -> RUDatum {
        return RUDatum(
            userID: userID ?? self.userID,
            username: username ?? self.username,
            avatar: avatar ?? self.avatar,
            fansNum: fansNum ?? self.fansNum,
            tags: tags ?? self.tags,
            monthRank: monthRank ?? self.monthRank,
            signature: signature ?? self.signature
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
