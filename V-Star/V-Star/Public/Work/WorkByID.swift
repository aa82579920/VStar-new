//
//  WorkByID.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/30.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
// MARK: - WorkByID
struct WorkByID: Codable {
    let message: String
    let errorCode: Int
    let data: [WBIDatum]
    
    enum CodingKeys: String, CodingKey {
        case message
        case errorCode = "error_code"
        case data
    }
}

// MARK: WorkByID convenience initializers and mutators

extension WorkByID {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WorkByID.self, from: data)
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
        data: [WBIDatum]? = nil
        ) -> WorkByID {
        return WorkByID(
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
struct WBIDatum: Codable {
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
    let collectionNum, commentNum, shareNum: Int
    let duration: String
    let isCollected: Bool
    
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
        case shareNum = "share_num"
        case duration = "Duration"
        case isCollected = "is_collected"
    }
}

// MARK: Datum convenience initializers and mutators

extension WBIDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WBIDatum.self, from: data)
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
        shareNum: Int? = nil,
        duration: String? = nil,
        isCollected: Bool? = nil
        ) -> WBIDatum {
        return WBIDatum(
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
            shareNum: shareNum ?? self.shareNum,
            duration: duration ?? self.duration,
            isCollected: isCollected ?? self.isCollected
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
