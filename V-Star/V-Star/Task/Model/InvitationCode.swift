//
//  InvitationCode.swift
//  V-Star
//
//  Created by 王申宇 on 29/11/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

// MARK: - InvitationCode
struct InvitationCode: Codable {
    let errorCode: Int?
    let message: String?
    let data: ICDataClass?

    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: InvitationCode convenience initializers and mutators

extension InvitationCode {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(InvitationCode.self, from: data)
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
        data: ICDataClass?? = nil
    ) -> InvitationCode {
        return InvitationCode(
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
struct ICDataClass: Codable {
    let invitationCode: String?

    enum CodingKeys: String, CodingKey {
        case invitationCode = "invitation_code"
    }
}

// MARK: DataClass convenience initializers and mutators

extension ICDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ICDataClass.self, from: data)
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
        invitationCode: String?? = nil
    ) -> ICDataClass {
        return ICDataClass(
            invitationCode: invitationCode ?? self.invitationCode
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
