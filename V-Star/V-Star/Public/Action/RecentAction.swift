//
//  RecentAction.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/22.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
// MARK: - RecentAction
struct RecentAction: Codable {
    let errorCode: Int
    let message: String
    let data: RADataClass
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: RecentAction convenience initializers and mutators

extension RecentAction {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RecentAction.self, from: data)
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
        data: RADataClass? = nil
        ) -> RecentAction {
        return RecentAction(
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
struct RADataClass: Codable {
    let currentPage: Int
    let data: [RADatum]
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

extension RADataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RADataClass.self, from: data)
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
        data: [RADatum]? = nil,
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
        ) -> RADataClass {
        return RADataClass(
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
struct RADatum: Codable {
    let actionID: Int
    let time: String
    let userID: Int
    let username: String
    let avatar: String
    let content, imgIDs: String
    let imgUrls: [String]
    
    enum CodingKeys: String, CodingKey {
        case actionID = "action_ID"
        case time
        case userID = "user_ID"
        case username, avatar, content
        case imgIDs = "img_IDs"
        case imgUrls = "img_urls"
    }
}

// MARK: Datum convenience initializers and mutators

extension RADatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RADatum.self, from: data)
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
        actionID: Int? = nil,
        time: String? = nil,
        userID: Int? = nil,
        username: String? = nil,
        avatar: String? = nil,
        content: String? = nil,
        imgIDs: String? = nil,
        imgUrls: [String]? = nil
        ) -> RADatum {
        return RADatum(
            actionID: actionID ?? self.actionID,
            time: time ?? self.time,
            userID: userID ?? self.userID,
            username: username ?? self.username,
            avatar: avatar ?? self.avatar,
            content: content ?? self.content,
            imgIDs: imgIDs ?? self.imgIDs,
            imgUrls: imgUrls ?? self.imgUrls
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
