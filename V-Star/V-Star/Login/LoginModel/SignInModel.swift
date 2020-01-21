//
//  SignInModel.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

// MARK: - Login
struct Login: Codable {
    let message: String
    let errorCode: Int
    let data: LoginDataClass
    
    enum CodingKeys: String, CodingKey {
        case message
        case errorCode = "error_code"
        case data
    }
}

// MARK: Login convenience initializers and mutators

extension Login {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Login.self, from: data)
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
        data: LoginDataClass? = nil
        ) -> Login {
        return Login(
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
struct LoginDataClass: Codable {
    let userID: Int
    let username: String
    let avatar, sex, age, signature: JSONNull?
    let fansNum: JSONNull?
    let followNum: Int
    let token: String
    let weekHotValue, monthHotValue, yearHotValue: Int
    let city, tags: JSONNull?
    let monthRank: Int
    
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

extension LoginDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(LoginDataClass.self, from: data)
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
        avatar: JSONNull?? = nil,
        sex: JSONNull?? = nil,
        age: JSONNull?? = nil,
        signature: JSONNull?? = nil,
        fansNum: JSONNull?? = nil,
        followNum: Int? = nil,
        token: String? = nil,
        weekHotValue: Int? = nil,
        monthHotValue: Int? = nil,
        yearHotValue: Int? = nil,
        city: JSONNull?? = nil,
        tags: JSONNull?? = nil,
        monthRank: Int? = nil
        ) -> LoginDataClass {
        return LoginDataClass(
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


// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

