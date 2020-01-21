//
//  WorkRank.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/23.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

// MARK: - WorkRank
struct WorkRank: Codable {
    let message: String
    let errorCode: Int
    let data: [WRDatum]
    
    enum CodingKeys: String, CodingKey {
        case message
        case errorCode = "error_code"
        case data
    }
}

// MARK: WorkRank convenience initializers and mutators

extension WorkRank {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WorkRank.self, from: data)
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
        data: [WRDatum]? = nil
        ) -> WorkRank {
        return WorkRank(
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
struct WRDatum: Codable {
    let workID: Int
    let time, workName, username, weekHotValue: String
    let coverURL, videoID: String
    
    enum CodingKeys: String, CodingKey {
        case workID = "work_ID"
        case time
        case workName = "work_name"
        case username
        case weekHotValue = "week_hot_value"
        case coverURL = "cover_url"
        case videoID = "video_ID"
    }
}

// MARK: Datum convenience initializers and mutators

extension WRDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WRDatum.self, from: data)
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
        time: String? = nil,
        workName: String? = nil,
        username: String? = nil,
        weekHotValue: String? = nil,
        coverURL: String? = nil,
        videoID: String? = nil
        ) -> WRDatum {
        return WRDatum(
            workID: workID ?? self.workID,
            time: time ?? self.time,
            workName: workName ?? self.workName,
            username: username ?? self.username,
            weekHotValue: weekHotValue ?? self.weekHotValue,
            coverURL: coverURL ?? self.coverURL,
            videoID: videoID ?? self.videoID
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
