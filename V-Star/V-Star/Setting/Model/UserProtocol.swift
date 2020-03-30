//
//  UserProtocol.swift
//  V-Star
//
//  Created by 王申宇 on 10/03/2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

// MARK: - UserProtocol
struct UserProtocol: Codable {
    let errorCode: Int?
    let message: String?
    let data: UPDataClass?

    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: UserProtocol convenience initializers and mutators

extension UserProtocol {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(UserProtocol.self, from: data)
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
        data: UPDataClass?? = nil
    ) -> UserProtocol {
        return UserProtocol(
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
struct UPDataClass: Codable {
    let infoTitle, infoTime, infoContent: String?

    enum CodingKeys: String, CodingKey {
        case infoTitle = "info_title"
        case infoTime = "info_time"
        case infoContent = "info_content"
    }
}

// MARK: DataClass convenience initializers and mutators

extension UPDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(UPDataClass.self, from: data)
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
        infoTitle: String?? = nil,
        infoTime: String?? = nil,
        infoContent: String?? = nil
    ) -> UPDataClass {
        return UPDataClass(
            infoTitle: infoTitle ?? self.infoTitle,
            infoTime: infoTime ?? self.infoTime,
            infoContent: infoContent ?? self.infoContent
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
