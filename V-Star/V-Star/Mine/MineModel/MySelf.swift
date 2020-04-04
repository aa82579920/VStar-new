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
    let data: MSDataClass?

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
        data: MSDataClass?? = nil
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
struct MSDataClass: Codable {
    let userID: Int?
    let username, avatar, sex: String?
    let age: Int?
    let birthday: Birthday?
    let signature: String?
    let fansNum, followNum: Int?
    let token: String?
    let weekHotValue, monthHotValue, yearHotValue: Int?
    let city, tags: String?
    let monthRank: Int?

    enum CodingKeys: String, CodingKey {
        case userID = "user_ID"
        case username, avatar, sex, age, birthday, signature
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

extension MSDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MSDataClass.self, from: data)
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
        birthday: Birthday?? = nil,
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
    ) -> MSDataClass {
        return MSDataClass(
            userID: userID ?? self.userID,
            username: username ?? self.username,
            avatar: avatar ?? self.avatar,
            sex: sex ?? self.sex,
            age: age ?? self.age,
            birthday: birthday ?? self.birthday,
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

// MARK: - Birthday
struct Birthday: Codable {
    let year, month, day: Int?
}

// MARK: Birthday convenience initializers and mutators

extension Birthday {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Birthday.self, from: data)
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
        year: Int?? = nil,
        month: Int?? = nil,
        day: Int?? = nil
    ) -> Birthday {
        return Birthday(
            year: year ?? self.year,
            month: month ?? self.month,
            day: day ?? self.day
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
