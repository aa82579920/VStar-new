//
//  Fans.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/22.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
// MARK: - Fans
struct Fans: Codable {
    let errorCode: Int
    let message: String
    let data: FansDataClass
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: Fans convenience initializers and mutators

extension Fans {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Fans.self, from: data)
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
        data: FansDataClass? = nil
        ) -> Fans {
        return Fans(
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
struct FansDataClass: Codable {
    let currentPage: Int
    let data: [FansDatum]
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

extension FansDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(FansDataClass.self, from: data)
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
        data: [FansDatum]? = nil,
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
        ) -> FansDataClass {
        return FansDataClass(
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
struct FansDatum: Codable {
    let userID: Int
    let username: String
    let avatar: String
    let monthRank: Int
    let signature: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_ID"
        case username, avatar
        case monthRank = "month_rank"
        case signature
    }
}

// MARK: Datum convenience initializers and mutators

extension FansDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(FansDatum.self, from: data)
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
        userID: Int? = nil,
        username: String? = nil,
        avatar: String? = nil,
        monthRank: Int? = nil,
        signature: JSONNull?? = nil
        ) -> FansDatum {
        return FansDatum(
            userID: userID ?? self.userID,
            username: username ?? self.username,
            avatar: avatar ?? self.avatar,
            monthRank: monthRank ?? self.monthRank,
            signature: signature ?? self.signature
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
