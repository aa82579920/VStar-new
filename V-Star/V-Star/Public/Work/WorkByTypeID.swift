//
//  WorkByTypeID.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/30.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
// MARK: - WorkByTypeID
struct WorkByTypeID: Codable {
    let message: String
    let errorCode: Int
    let data: WBTIDataClass
    
    enum CodingKeys: String, CodingKey {
        case message
        case errorCode = "error_code"
        case data
    }
}

// MARK: WorkByTypeID convenience initializers and mutators

extension WorkByTypeID {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WorkByTypeID.self, from: data)
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
        data: WBTIDataClass? = nil
        ) -> WorkByTypeID {
        return WorkByTypeID(
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
struct WBTIDataClass: Codable {
    let currentPage: Int
    let data: [WBTIDatum]
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

extension WBTIDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WBTIDataClass.self, from: data)
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
        data: [WBTIDatum]? = nil,
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
        ) -> WBTIDataClass {
        return WBTIDataClass(
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
struct WBTIDatum: Codable {
    let workID: Int
    let workName: String
    let workTypeID, userID: Int
    let username: String
    let avatar: String
    let introduction, videoID: String
    let coverURL: String
    let videoLink: String
    let hotValue: Int
    let time, tags: String
    let collectionNum, commentNum: Int
    let duration: Double
    
    enum CodingKeys: String, CodingKey {
        case workID = "work_ID"
        case workName = "work_name"
        case workTypeID = "work_type_ID"
        case userID = "user_ID"
        case username, avatar
        case introduction = "Introduction"
        case videoID = "video_ID"
        case coverURL = "cover_url"
        case videoLink = "video_link"
        case hotValue = "hot_value"
        case time, tags
        case collectionNum = "collection_num"
        case commentNum = "comment_num"
        case duration = "Duration"
    }
}

// MARK: Datum convenience initializers and mutators

extension WBTIDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WBTIDatum.self, from: data)
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
        videoLink: String? = nil,
        hotValue: Int? = nil,
        time: String? = nil,
        tags: String? = nil,
        collectionNum: Int? = nil,
        commentNum: Int? = nil,
        duration: Double? = nil
        ) -> WBTIDatum {
        return WBTIDatum(
            workID: workID ?? self.workID,
            workName: workName ?? self.workName,
            workTypeID: workTypeID ?? self.workTypeID,
            userID: userID ?? self.userID,
            username: username ?? self.username,
            avatar: avatar ?? self.avatar,
            introduction: introduction ?? self.introduction,
            videoID: videoID ?? self.videoID,
            coverURL: coverURL ?? self.coverURL,
            videoLink: videoLink ?? self.videoLink,
            hotValue: hotValue ?? self.hotValue,
            time: time ?? self.time,
            tags: tags ?? self.tags,
            collectionNum: collectionNum ?? self.collectionNum,
            commentNum: commentNum ?? self.commentNum,
            duration: duration ?? self.duration
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
