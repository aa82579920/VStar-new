//
//  UploadModel.swift
//  V-Star
//
//  Created by 王申宇 on 18/11/2019.
//  Copyright © 2019 mac. All rights reserved.
//
import Foundation

struct Video {
    static var title = ""
    static var fileName = ""
    static var description = ""
    static var coverID = ""
    static var tags = ""
}


// MARK: - UploadModel
struct UploadModel: Codable {
    let errorCode: Int?
    let message: String?
    let data: UMDataClass?

    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: UploadModel convenience initializers and mutators

extension UploadModel {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(UploadModel.self, from: data)
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
        data: UMDataClass?? = nil
    ) -> UploadModel {
        return UploadModel(
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
struct UMDataClass: Codable {
    let uploadAddress, videoID, requestID, uploadAuth: String?

    enum CodingKeys: String, CodingKey {
        case uploadAddress = "UploadAddress"
        case videoID = "VideoId"
        case requestID = "RequestId"
        case uploadAuth = "UploadAuth"
    }
}

// MARK: DataClass convenience initializers and mutators

extension UMDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(UMDataClass.self, from: data)
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
        uploadAddress: String?? = nil,
        videoID: String?? = nil,
        requestID: String?? = nil,
        uploadAuth: String?? = nil
    ) -> UMDataClass {
        return UMDataClass(
            uploadAddress: uploadAddress ?? self.uploadAddress,
            videoID: videoID ?? self.videoID,
            requestID: requestID ?? self.requestID,
            uploadAuth: uploadAuth ?? self.uploadAuth
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
