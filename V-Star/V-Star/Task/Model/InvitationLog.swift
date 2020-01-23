//
//  InvitationLog.swift
//  V-Star
//
//  Created by 王申宇 on 29/11/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

// MARK: - InvitationLog
struct InvitationLog: Codable {
    let errorCode: Int?
    let message: String?
    let data: [ILDatum]?

    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: InvitationLog convenience initializers and mutators

extension InvitationLog {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(InvitationLog.self, from: data)
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
        data: [ILDatum]?? = nil
    ) -> InvitationLog {
        return InvitationLog(
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

// MARK: - Datum
struct ILDatum: Codable {
    let username, money, time: String?
}

// MARK: Datum convenience initializers and mutators

extension ILDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ILDatum.self, from: data)
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
        money: String?? = nil,
        time: String?? = nil
    ) -> ILDatum {
        return ILDatum(
            username: username ?? self.username,
            money: money ?? self.money,
            time: time ?? self.time
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
