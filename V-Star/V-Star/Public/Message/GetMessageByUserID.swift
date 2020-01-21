//
//  GetMessageByUserID.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/22.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
// MARK: - MessageByUserID
struct MessageByUserID: Codable {
    let message: String
    let errorCode: Int
    let data: MBUIDataClass
    
    enum CodingKeys: String, CodingKey {
        case message
        case errorCode = "error_code"
        case data
    }
}

// MARK: MessageByUserID convenience initializers and mutators

extension MessageByUserID {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MessageByUserID.self, from: data)
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
        data: MBUIDataClass? = nil
        ) -> MessageByUserID {
        return MessageByUserID(
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
struct MBUIDataClass: Codable {
    let currentPage: Int
    let data: [MBUIDatum]
    let firstPageURL: String
    let from, lastPage: Int
    let lastPageURL, nextPageURL, path: String
    let perPage: String
    let prevPageURL: JSONNull?
    let to, total: Int
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case firstPageURL = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageURL = "last_page_url"
        case nextPageURL = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageURL = "prev_page_url"
        case to, total
    }
}

// MARK: DataClass convenience initializers and mutators

extension MBUIDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MBUIDataClass.self, from: data)
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
        currentPage: Int? = nil,
        data: [MBUIDatum]? = nil,
        firstPageURL: String? = nil,
        from: Int? = nil,
        lastPage: Int? = nil,
        lastPageURL: String? = nil,
        nextPageURL: String? = nil,
        path: String? = nil,
        perPage: String? = nil,
        prevPageURL: JSONNull?? = nil,
        to: Int? = nil,
        total: Int? = nil
        ) -> MBUIDataClass {
        return MBUIDataClass(
            currentPage: currentPage ?? self.currentPage,
            data: data ?? self.data,
            firstPageURL: firstPageURL ?? self.firstPageURL,
            from: from ?? self.from,
            lastPage: lastPage ?? self.lastPage,
            lastPageURL: lastPageURL ?? self.lastPageURL,
            nextPageURL: nextPageURL ?? self.nextPageURL,
            path: path ?? self.path,
            perPage: perPage ?? self.perPage,
            prevPageURL: prevPageURL ?? self.prevPageURL,
            to: to ?? self.to,
            total: total ?? self.total
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
struct MBUIDatum: Codable {
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

extension MBUIDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MBUIDatum.self, from: data)
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
        ) -> MBUIDatum {
        return MBUIDatum(
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
