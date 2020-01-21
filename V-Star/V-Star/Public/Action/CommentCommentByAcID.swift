//
//  GetCommentCommentByAcID.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/22.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
// MARK: - GetCommentCommentByACID
struct CommentCommentByACID: Codable {
    let errorCode: Int
    let message: String
    let data: GCCBDataClass
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: GetCommentCommentByACID convenience initializers and mutators

extension CommentCommentByACID {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CommentCommentByACID.self, from: data)
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
        errorCode: Int? = nil,
        message: String? = nil,
        data: GCCBDataClass? = nil
        ) -> CommentCommentByACID {
        return CommentCommentByACID(
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
struct GCCBDataClass: Codable {
    let currentPage: Int
    let data: [GCCBDatum]
    let firstPageURL: String
    let from, lastPage: Int
    let lastPageURL: String
    let nextPageURL: JSONNull?
    let path: String
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

extension GCCBDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(GCCBDataClass.self, from: data)
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
        data: [GCCBDatum]? = nil,
        firstPageURL: String? = nil,
        from: Int? = nil,
        lastPage: Int? = nil,
        lastPageURL: String? = nil,
        nextPageURL: JSONNull?? = nil,
        path: String? = nil,
        perPage: String? = nil,
        prevPageURL: JSONNull?? = nil,
        to: Int? = nil,
        total: Int? = nil
        ) -> GCCBDataClass {
        return GCCBDataClass(
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
struct GCCBDatum: Codable {
    let accID: Int?
    let userID: Int
    let username: String
    let avatar: String
    let time: String
    let accContent: String?
    let beAtUserID: String
    let acID: Int?
    let acContent: String?
    
    enum CodingKeys: String, CodingKey {
        case accID
        case userID = "user_ID"
        case username, avatar, time
        case accContent = "acc_content"
        case beAtUserID = "be_at_user_ID"
        case acID
        case acContent = "ac_content"
    }
}

// MARK: Datum convenience initializers and mutators

extension GCCBDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(GCCBDatum.self, from: data)
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
        accID: Int?? = nil,
        userID: Int? = nil,
        username: String? = nil,
        avatar: String? = nil,
        time: String? = nil,
        accContent: String?? = nil,
        beAtUserID: String? = nil,
        acID: Int?? = nil,
        acContent: String?? = nil
        ) -> GCCBDatum {
        return GCCBDatum(
            accID: accID ?? self.accID,
            userID: userID ?? self.userID,
            username: username ?? self.username,
            avatar: avatar ?? self.avatar,
            time: time ?? self.time,
            accContent: accContent ?? self.accContent,
            beAtUserID: beAtUserID ?? self.beAtUserID,
            acID: acID ?? self.acID,
            acContent: acContent ?? self.acContent
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
