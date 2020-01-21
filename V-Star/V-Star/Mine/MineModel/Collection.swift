//
//  Collection.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/21.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

// MARK: - Collection
struct Collection: Codable {
    let data: CollectionDataClass
    let message: String
    let errorCode: Int
    
    enum CodingKeys: String, CodingKey {
        case data, message
        case errorCode = "error_code"
    }
}

// MARK: Collection convenience initializers and mutators

extension Collection {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Collection.self, from: data)
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
        data: CollectionDataClass? = nil,
        message: String? = nil,
        errorCode: Int? = nil
        ) -> Collection {
        return Collection(
            data: data ?? self.data,
            message: message ?? self.message,
            errorCode: errorCode ?? self.errorCode
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
struct CollectionDataClass: Codable {
    let the0: The0
    let currentPage, lastPage: Int
    
    enum CodingKeys: String, CodingKey {
        case the0 = "0"
        case currentPage, lastPage
    }
}

// MARK: DataClass convenience initializers and mutators

extension CollectionDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CollectionDataClass.self, from: data)
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
        the0: The0? = nil,
        currentPage: Int? = nil,
        lastPage: Int? = nil
        ) -> CollectionDataClass {
        return CollectionDataClass(
            the0: the0 ?? self.the0,
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

// MARK: - The0
struct The0: Codable {
    let collectionID: Int
    let workType, workName, tag: String
    let introduction: JSONNull?
    let videoLink: String
    let hotValue: Int
    let time, coverID: String
    let coverURL: String
    let videoID: String
    let commentNum, collectionNum, shareNum: Int
    
    enum CodingKeys: String, CodingKey {
        case collectionID = "collection_ID"
        case workType = "work_type"
        case workName = "work_name"
        case tag, introduction
        case videoLink = "video_link"
        case hotValue = "hot_value"
        case time
        case coverID = "cover_ID"
        case coverURL = "cover_url"
        case videoID = "video_ID"
        case commentNum = "comment_num"
        case collectionNum = "collection_num"
        case shareNum = "share_num"
    }
}

// MARK: The0 convenience initializers and mutators

extension The0 {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(The0.self, from: data)
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
        collectionID: Int? = nil,
        workType: String? = nil,
        workName: String? = nil,
        tag: String? = nil,
        introduction: JSONNull?? = nil,
        videoLink: String? = nil,
        hotValue: Int? = nil,
        time: String? = nil,
        coverID: String? = nil,
        coverURL: String? = nil,
        videoID: String? = nil,
        commentNum: Int? = nil,
        collectionNum: Int? = nil,
        shareNum: Int? = nil
        ) -> The0 {
        return The0(
            collectionID: collectionID ?? self.collectionID,
            workType: workType ?? self.workType,
            workName: workName ?? self.workName,
            tag: tag ?? self.tag,
            introduction: introduction ?? self.introduction,
            videoLink: videoLink ?? self.videoLink,
            hotValue: hotValue ?? self.hotValue,
            time: time ?? self.time,
            coverID: coverID ?? self.coverID,
            coverURL: coverURL ?? self.coverURL,
            videoID: videoID ?? self.videoID,
            commentNum: commentNum ?? self.commentNum,
            collectionNum: collectionNum ?? self.collectionNum,
            shareNum: shareNum ?? self.shareNum
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
