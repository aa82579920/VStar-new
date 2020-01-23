//
//  SignDay.swift
//  V-Star
//
//  Created by 王申宇 on 29/11/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

// MARK: - SignDay
struct SignDay: Codable {
    let errorCode: Int?
    let message: String?
    let data: SDDataClass?

    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: SignDay convenience initializers and mutators

extension SignDay {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(SignDay.self, from: data)
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
        data: SDDataClass?? = nil
    ) -> SignDay {
        return SignDay(
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

// MARK: - DataClass
struct SDDataClass: Codable {
    let userID: String?
    let week, time, currentTimeInWeek, thisTimeGetMoney: Int?

    enum CodingKeys: String, CodingKey {
        case userID = "user_ID"
        case week, time
        case currentTimeInWeek = "current_time_in_week"
        case thisTimeGetMoney = "this_time_get_money"
    }
}

// MARK: DataClass convenience initializers and mutators

extension SDDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(SDDataClass.self, from: data)
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
        userID: String?? = nil,
        week: Int?? = nil,
        time: Int?? = nil,
        currentTimeInWeek: Int?? = nil,
        thisTimeGetMoney: Int?? = nil
    ) -> SDDataClass {
        return SDDataClass(
            userID: userID ?? self.userID,
            week: week ?? self.week,
            time: time ?? self.time,
            currentTimeInWeek: currentTimeInWeek ?? self.currentTimeInWeek,
            thisTimeGetMoney: thisTimeGetMoney ?? self.thisTimeGetMoney
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
