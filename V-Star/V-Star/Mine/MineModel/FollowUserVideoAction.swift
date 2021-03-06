//
//  FollowUserVideoAction.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/22.
//  Copyright © 2019 mac. All rights reserved.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weekInfo = try WeekInfo(json)

import Foundation

// MARK: - FollowUserVideoAction
struct FollowUserVideoAction: Codable {
    let errorCode: Int?
    let message: String?
    let data: FUVADataClass?

    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: FollowUserVideoAction convenience initializers and mutators

extension FollowUserVideoAction {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(FollowUserVideoAction.self, from: data)
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
        errorCode: Int?? = nil,
        message: String?? = nil,
        data: FUVADataClass?? = nil
    ) -> FollowUserVideoAction {
        return FollowUserVideoAction(
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
struct FUVADataClass: Codable {
    let data: [FUVADatum]?
    let lastPage: Int?

    enum CodingKeys: String, CodingKey {
        case data
        case lastPage = "last_page"
    }
}

// MARK: DataClass convenience initializers and mutators

extension FUVADataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(FUVADataClass.self, from: data)
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
        data: [FUVADatum]?? = nil,
        lastPage: Int?? = nil
    ) -> FUVADataClass {
        return FUVADataClass(
            data: data ?? self.data,
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
struct FUVADatum: Codable {
    let userID: Int?
    let username: String?
    let avatar: String?
    let workName: String?
    let hotValue: Int?
    let time: String?
    let workID: Int?
    let coverID, videoID, tags: String?
    let monthRank: Int?
    let signature: String?
    let collectionNum, commentNum, shareNum: Int?
    let coverURL: String?
    let duration: Double?
    let isCollected: Bool?

    enum CodingKeys: String, CodingKey {
        case userID = "user_ID"
        case username, avatar
        case workName = "work_name"
        case hotValue = "hot_value"
        case time
        case workID = "work_ID"
        case coverID = "cover_ID"
        case videoID = "video_ID"
        case tags
        case monthRank = "month_rank"
        case signature
        case collectionNum = "collection_num"
        case commentNum = "comment_num"
        case shareNum = "share_num"
        case coverURL = "cover_url"
        case duration = "Duration"
        case isCollected = "is_collected"
    }
}

// MARK: Datum convenience initializers and mutators

extension FUVADatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(FUVADatum.self, from: data)
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
        userID: Int?? = nil,
        username: String?? = nil,
        avatar: String?? = nil,
        workName: String?? = nil,
        hotValue: Int?? = nil,
        time: String?? = nil,
        workID: Int?? = nil,
        coverID: String?? = nil,
        videoID: String?? = nil,
        tags: String?? = nil,
        monthRank: Int?? = nil,
        signature: String?? = nil,
        collectionNum: Int?? = nil,
        commentNum: Int?? = nil,
        shareNum: Int?? = nil,
        coverURL: String?? = nil,
        duration: Double?? = nil,
        isCollected: Bool?? = nil
    ) -> FUVADatum {
        return FUVADatum(
            userID: userID ?? self.userID,
            username: username ?? self.username,
            avatar: avatar ?? self.avatar,
            workName: workName ?? self.workName,
            hotValue: hotValue ?? self.hotValue,
            time: time ?? self.time,
            workID: workID ?? self.workID,
            coverID: coverID ?? self.coverID,
            videoID: videoID ?? self.videoID,
            tags: tags ?? self.tags,
            monthRank: monthRank ?? self.monthRank,
            signature: signature ?? self.signature,
            collectionNum: collectionNum ?? self.collectionNum,
            commentNum: commentNum ?? self.commentNum,
            shareNum: shareNum ?? self.shareNum,
            coverURL: coverURL ?? self.coverURL,
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
