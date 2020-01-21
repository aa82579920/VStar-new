//
//  MessageByID.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/23.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
// MARK: - MessageByID
struct MessageByID: Codable {
    let message: String
    let errorCode: Int
    let data: [MBIDatum]
    
    enum CodingKeys: String, CodingKey {
        case message
        case errorCode = "error_code"
        case data
    }
}

// MARK: MessageByID convenience initializers and mutators

extension MessageByID {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MessageByID.self, from: data)
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
        data: [MBIDatum]? = nil
        ) -> MessageByID {
        return MessageByID(
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

// MARK: - Datum
struct MBIDatum: Codable {
    let messageID: Int
    let from, username: String
    let avatar: JSONNull?
    let content, time: String
    
    enum CodingKeys: String, CodingKey {
        case messageID = "message_ID"
        case from, username, avatar, content, time
    }
}

// MARK: Datum convenience initializers and mutators

extension MBIDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MBIDatum.self, from: data)
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
        messageID: Int? = nil,
        from: String? = nil,
        username: String? = nil,
        avatar: JSONNull?? = nil,
        content: String? = nil,
        time: String? = nil
        ) -> MBIDatum {
        return MBIDatum(
            messageID: messageID ?? self.messageID,
            from: from ?? self.from,
            username: username ?? self.username,
            avatar: avatar ?? self.avatar,
            content: content ?? self.content,
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
