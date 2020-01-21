//
//  WorkByUserID.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/30.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
// MARK: - WorkByUserID
struct WorkByUserID: Codable {
    let message: String
    let errorCode: Int
    let data: WBUIDataClass
    
    enum CodingKeys: String, CodingKey {
        case message
        case errorCode = "error_code"
        case data
    }
}

// MARK: WorkByUserID convenience initializers and mutators

extension WorkByUserID {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WorkByUserID.self, from: data)
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
        data: WBUIDataClass? = nil
        ) -> WorkByUserID {
        return WorkByUserID(
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
struct WBUIDataClass: Codable {
    let currentPage: Int
    let data: [WBUIDatum]
    let firstPageURL: String
    let from, lastPage: Int
    let lastPageURL, nextPageURL, path: String
    let perPage: String
    let prevPageURL: String
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

extension WBUIDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WBUIDataClass.self, from: data)
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
        data: [WBUIDatum]? = nil,
        firstPageURL: String? = nil,
        from: Int? = nil,
        lastPage: Int? = nil,
        lastPageURL: String? = nil,
        nextPageURL: String? = nil,
        path: String? = nil,
        perPage: String? = nil,
        prevPageURL: String? = nil,
        to: Int? = nil,
        total: Int? = nil
        ) -> WBUIDataClass {
        return WBUIDataClass(
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
struct WBUIDatum: Codable {
    let workID: Int
    let workName: String
    let workTypeID, userID: Int
    let username: String
    let avatar: String
    let introduction: String
    let videoID: String
    let coverURL: String
    let hotValue: Int
    let time, tags: String
    
    enum CodingKeys: String, CodingKey {
        case workID = "work_ID"
        case workName = "work_name"
        case workTypeID = "work_type_ID"
        case userID = "user_ID"
        case username, avatar
        case introduction = "Introduction"
        case videoID = "video_ID"
        case coverURL = "cover_url"
        case hotValue = "hot_value"
        case time, tags
    }
}

// MARK: Datum convenience initializers and mutators

extension WBUIDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WBUIDatum.self, from: data)
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
        workID: Int? = nil,
        workName: String? = nil,
        workTypeID: Int? = nil,
        userID: Int? = nil,
        username: String? = nil,
        avatar: String? = nil,
        introduction: String? = nil,
        videoID: String? = nil,
        coverURL: String? = nil,
        hotValue: Int? = nil,
        time: String? = nil,
        tags: String? = nil
        ) -> WBUIDatum {
        return WBUIDatum(
            workID: workID ?? self.workID,
            workName: workName ?? self.workName,
            workTypeID: workTypeID ?? self.workTypeID,
            userID: userID ?? self.userID,
            username: username ?? self.username,
            avatar: avatar ?? self.avatar,
            introduction: introduction ?? self.introduction,
            videoID: videoID ?? self.videoID,
            coverURL: coverURL ?? self.coverURL,
            hotValue: hotValue ?? self.hotValue,
            time: time ?? self.time,
            tags: tags ?? self.tags
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
