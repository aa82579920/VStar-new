// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let workRank = try WorkRank(json)

import Foundation

// MARK: - WorkRank
struct WorkRank: Codable {
    let message: String?
    let errorCode: Int?
    let data: [WRDatum]?

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
        message: String?? = nil,
        errorCode: Int?? = nil,
        data: [WRDatum]?? = nil
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
    let workID: Int?
    let time, workName, username: String?
    let avatar: String?
    let monthHotValue: Int?
    let coverURL: String?
    let videoID: String?
    let videoLink: String?

    enum CodingKeys: String, CodingKey {
        case workID = "work_ID"
        case time
        case workName = "work_name"
        case username, avatar
        case monthHotValue = "month_hot_value"
        case coverURL = "cover_url"
        case videoID = "video_ID"
        case videoLink = "video_link"
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
        workID: Int?? = nil,
        time: String?? = nil,
        workName: String?? = nil,
        username: String?? = nil,
        avatar: String?? = nil,
        monthHotValue: Int?? = nil,
        coverURL: String?? = nil,
        videoID: String?? = nil,
        videoLink: String?? = nil
    ) -> WRDatum {
        return WRDatum(
            workID: workID ?? self.workID,
            time: time ?? self.time,
            workName: workName ?? self.workName,
            username: username ?? self.username,
            avatar: avatar ?? self.avatar,
            monthHotValue: monthHotValue ?? self.monthHotValue,
            coverURL: coverURL ?? self.coverURL,
            videoID: videoID ?? self.videoID,
            videoLink: videoLink ?? self.videoLink
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
