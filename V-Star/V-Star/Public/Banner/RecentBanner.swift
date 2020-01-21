//
//  GetRecentBanner.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/22.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
// MARK: - GetRecentBanner
struct RecentBanner: Codable {
    let errorCode: Int
    let message: String
    let data: [GRBDatum]
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: GetRecentBanner convenience initializers and mutators

extension RecentBanner {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RecentBanner.self, from: data)
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
        data: [GRBDatum]? = nil
        ) -> RecentBanner {
        return RecentBanner(
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
struct GRBDatum: Codable {
    let bannerID, bannerType: Int
    let time, bannerImgID: String
    let bannerURL: String
    
    enum CodingKeys: String, CodingKey {
        case bannerID = "banner_ID"
        case bannerType = "banner_type"
        case time
        case bannerImgID = "banner_img_ID"
        case bannerURL = "banner_url"
    }
}

// MARK: Datum convenience initializers and mutators

extension GRBDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(GRBDatum.self, from: data)
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
        bannerID: Int? = nil,
        bannerType: Int? = nil,
        time: String? = nil,
        bannerImgID: String? = nil,
        bannerURL: String? = nil
        ) -> GRBDatum {
        return GRBDatum(
            bannerID: bannerID ?? self.bannerID,
            bannerType: bannerType ?? self.bannerType,
            time: time ?? self.time,
            bannerImgID: bannerImgID ?? self.bannerImgID,
            bannerURL: bannerURL ?? self.bannerURL
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
