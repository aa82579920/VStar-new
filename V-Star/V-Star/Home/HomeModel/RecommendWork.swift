//
//  RecommendWork.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/30.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

// MARK: - RecommendWork
struct RecommendWork: Codable {
    let errorCode: Int
    let message: String
    let data: [RWDatum]
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: RecommendWork convenience initializers and mutators

extension RecommendWork {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RecommendWork.self, from: data)
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
        data: [RWDatum]? = nil
        ) -> RecommendWork {
        return RecommendWork(
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
struct RWDatum: Codable {
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

extension RWDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RWDatum.self, from: data)
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
        ) -> RWDatum {
        return RWDatum(
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
