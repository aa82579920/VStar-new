//
//  WatchOneTime.swift
//  V-Star
//
//  Created by 王申宇 on 29/11/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

// MARK: - WatchOneTime
struct WatchOneTime: Codable {
    let errorCode: Int?
    let message: String?
    let data: WOTDataClass?

    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: WatchOneTime convenience initializers and mutators

extension WatchOneTime {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WatchOneTime.self, from: data)
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
        data: WOTDataClass?? = nil
    ) -> WatchOneTime {
        return WatchOneTime(
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
struct WOTDataClass: Codable {
    let yMD, userID: String?
    let dayWatchCount: Int?

    enum CodingKeys: String, CodingKey {
        case yMD = "y_m_d"
        case userID = "user_ID"
        case dayWatchCount = "day_watch_count"
    }
}

// MARK: DataClass convenience initializers and mutators

extension WOTDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WOTDataClass.self, from: data)
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
        yMD: String?? = nil,
        userID: String?? = nil,
        dayWatchCount: Int?? = nil
    ) -> WOTDataClass {
        return WOTDataClass(
            yMD: yMD ?? self.yMD,
            userID: userID ?? self.userID,
            dayWatchCount: dayWatchCount ?? self.dayWatchCount
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
