//
//  UserRank.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/23.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
// MARK: - UserRank
struct UserRank: Codable {
    let message: String
    let errorCode: Int
    let data: [URDatum]
    
    enum CodingKeys: String, CodingKey {
        case message
        case errorCode = "error_code"
        case data
    }
}

// MARK: UserRank convenience initializers and mutators

extension UserRank {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(UserRank.self, from: data)
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
        message: String? = nil,
        errorCode: Int? = nil,
        data: [URDatum]? = nil
        ) -> UserRank {
        return UserRank(
            message: message ?? self.message,
            errorCode: errorCode ?? self.errorCode,
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
struct URDatum: Codable {
    let userID: Int
    let username: String
    let avatar: String
    let weekHotValue: Int
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_ID"
        case username, avatar
        case weekHotValue = "week_hot_value"
    }
}

// MARK: Datum convenience initializers and mutators

extension URDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(URDatum.self, from: data)
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
        userID: Int? = nil,
        username: String? = nil,
        avatar: String? = nil,
        weekHotValue: Int? = nil
        ) -> URDatum {
        return URDatum(
            userID: userID ?? self.userID,
            username: username ?? self.username,
            avatar: avatar ?? self.avatar,
            weekHotValue: weekHotValue ?? self.weekHotValue
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
