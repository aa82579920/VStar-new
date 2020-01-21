//
//  MySelf.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/21.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

// MARK: - MySelf
struct MySelf: Codable {
    let message: String?
    let errorCode: Int?
    let data: MySelfDataClass?
    
    enum CodingKeys: String, CodingKey {
        case message
        case errorCode = "error_code"
        case data
    }
}

// MARK: MySelf convenience initializers and mutators

extension MySelf {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MySelf.self, from: data)
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
        message: String?? = nil,
        errorCode: Int?? = nil,
        data: MySelfDataClass?? = nil
        ) -> MySelf {
        return MySelf(
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

// MARK: - DataClass
struct MySelfDataClass: Codable {
    let userID: Int?
    let username, avatar, sex: String?
    let age: Int?
    let signature: String?
    let fansNum, followNum: Int?
    let token: String?
    let weekHotValue, monthHotValue, yearHotValue: Int?
    let city, tags: String?
    let monthRank: Int?
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_ID"
        case username, avatar, sex, age, signature
        case fansNum = "fans_num"
        case followNum = "follow_num"
        case token
        case weekHotValue = "week_hot_value"
        case monthHotValue = "month_hot_value"
        case yearHotValue = "year_hot_value"
        case city, tags
        case monthRank = "month_rank"
    }
}

// MARK: DataClass convenience initializers and mutators

extension MySelfDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MySelfDataClass.self, from: data)
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
        sex: String?? = nil,
        age: Int?? = nil,
        signature: String?? = nil,
        fansNum: Int?? = nil,
        followNum: Int?? = nil,
        token: String?? = nil,
        weekHotValue: Int?? = nil,
        monthHotValue: Int?? = nil,
        yearHotValue: Int?? = nil,
        city: String?? = nil,
        tags: String?? = nil,
        monthRank: Int?? = nil
        ) -> MySelfDataClass {
        return MySelfDataClass(
            userID: userID ?? self.userID,
            username: username ?? self.username,
            avatar: avatar ?? self.avatar,
            sex: sex ?? self.sex,
            age: age ?? self.age,
            signature: signature ?? self.signature,
            fansNum: fansNum ?? self.fansNum,
            followNum: followNum ?? self.followNum,
            token: token ?? self.token,
            weekHotValue: weekHotValue ?? self.weekHotValue,
            monthHotValue: monthHotValue ?? self.monthHotValue,
            yearHotValue: yearHotValue ?? self.yearHotValue,
            city: city ?? self.city,
            tags: tags ?? self.tags,
            monthRank: monthRank ?? self.monthRank
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
