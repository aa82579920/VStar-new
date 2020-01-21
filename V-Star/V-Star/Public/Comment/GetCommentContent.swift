//
//  GetCommentContent.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/21.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
// MARK: - CommentGetCC
struct CommentGetCC: Codable {
    let message: String
    let errorCode: Int
    let data: CGDataClass
    
    enum CodingKeys: String, CodingKey {
        case message
        case errorCode = "error_code"
        case data
    }
}

// MARK: CommentGetCC convenience initializers and mutators

extension CommentGetCC {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CommentGetCC.self, from: data)
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
        data: CGDataClass? = nil
        ) -> CommentGetCC {
        return CommentGetCC(
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
struct CGDataClass: Codable {
    let data: [CGDatum]
    let currentPage, lastPage: Int
}

// MARK: DataClass convenience initializers and mutators

extension CGDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CGDataClass.self, from: data)
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
        data: [CGDatum]? = nil,
        currentPage: Int? = nil,
        lastPage: Int? = nil
        ) -> CGDataClass {
        return CGDataClass(
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
struct CGDatum: Codable {
    let ccID: Int
    let username: String
    let avatar: JSONNull?
    let content, time: String
}

// MARK: Datum convenience initializers and mutators

extension CGDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CGDatum.self, from: data)
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
        ccID: Int? = nil,
        username: String? = nil,
        avatar: JSONNull?? = nil,
        content: String? = nil,
        time: String? = nil
        ) -> CGDatum {
        return CGDatum(
            ccID: ccID ?? self.ccID,
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
