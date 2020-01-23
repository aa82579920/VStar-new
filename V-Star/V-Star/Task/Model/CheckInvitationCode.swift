//
//  CheckInvitationCode.swift
//  V-Star
//
//  Created by 王申宇 on 29/11/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

// MARK: - CheckInvitationCode
struct CheckInvitationCode: Codable {
    let errorCode: Int?
    let message: String?
    let data: CICDataClass?

    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: CheckInvitationCode convenience initializers and mutators

extension CheckInvitationCode {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CheckInvitationCode.self, from: data)
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
        data: CICDataClass?? = nil
    ) -> CheckInvitationCode {
        return CheckInvitationCode(
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
struct CICDataClass: Codable {
    let username: String?
    let userID: Int?

    enum CodingKeys: String, CodingKey {
        case username
        case userID = "user_ID"
    }
}

// MARK: DataClass convenience initializers and mutators

extension CICDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CICDataClass.self, from: data)
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
        username: String?? = nil,
        userID: Int?? = nil
    ) -> CICDataClass {
        return CICDataClass(
            username: username ?? self.username,
            userID: userID ?? self.userID
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
