//
//  CommentIndex.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/21.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

// MARK: - CommentIndex
struct CommentIndex: Codable {
    let message: String
    let errorCode: Int
    let data: CIDataClass
    
    enum CodingKeys: String, CodingKey {
        case message
        case errorCode = "error_code"
        case data
    }
}

// MARK: CommentIndex convenience initializers and mutators

extension CommentIndex {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CommentIndex.self, from: data)
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
        data: CIDataClass? = nil
        ) -> CommentIndex {
        return CommentIndex(
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
struct CIDataClass: Codable {
    let data: [Datum]
    let currentPage, lastPage: Int
}

// MARK: DataClass convenience initializers and mutators

extension CIDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CIDataClass.self, from: data)
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
        data: [Datum]? = nil,
        currentPage: Int? = nil,
        lastPage: Int? = nil
        ) -> CIDataClass {
        return CIDataClass(
            data: data ?? self.data,
            currentPage: currentPage ?? self.currentPage,
            lastPage: lastPage ?? self.lastPage
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
struct Datum: Codable {
    let commentID: Int
    let username: String
    let avatar: String?
    let content, time: String
    
    enum CodingKeys: String, CodingKey {
        case commentID = "comment_ID"
        case username, avatar, content, time
    }
}

// MARK: Datum convenience initializers and mutators

extension Datum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Datum.self, from: data)
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
        commentID: Int? = nil,
        username: String? = nil,
        avatar: String?? = nil,
        content: String? = nil,
        time: String? = nil
        ) -> Datum {
        return Datum(
            commentID: commentID ?? self.commentID,
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

