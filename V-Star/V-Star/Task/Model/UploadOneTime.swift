//
//  UploadOneTime.swift
//  V-Star
//
//  Created by 王申宇 on 29/11/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

// MARK: - UploadOneTime
struct UploadOneTime: Codable {
    let errorCode: Int?
    let message: String?
    let data: UOTDataClass?

    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: UploadOneTime convenience initializers and mutators

extension UploadOneTime {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(UploadOneTime.self, from: data)
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
        data: UOTDataClass?? = nil
    ) -> UploadOneTime {
        return UploadOneTime(
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
struct UOTDataClass: Codable {
    let yMD, userID: String?
    let dayUploadCount, thisTimeGetMoney: Int?

    enum CodingKeys: String, CodingKey {
        case yMD = "y_m_d"
        case userID = "user_ID"
        case dayUploadCount = "day_upload_count"
        case thisTimeGetMoney = "this_time_get_money"
    }
}

// MARK: DataClass convenience initializers and mutators

extension UOTDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(UOTDataClass.self, from: data)
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
        dayUploadCount: Int?? = nil,
        thisTimeGetMoney: Int?? = nil
    ) -> UOTDataClass {
        return UOTDataClass(
            yMD: yMD ?? self.yMD,
            userID: userID ?? self.userID,
            dayUploadCount: dayUploadCount ?? self.dayUploadCount,
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
