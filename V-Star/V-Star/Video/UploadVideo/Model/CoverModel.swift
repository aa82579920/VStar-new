//
//  CoverModel.swift
//  V-Star
//
//  Created by 王申宇 on 18/11/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

struct Cover {
    static var ext = ""
}

// MARK: - CoverModel
struct CoverModel: Codable {
    let errorCode: Int?
    let message: String?
    let data: CMDataClass?

    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: CoverModel convenience initializers and mutators

extension CoverModel {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CoverModel.self, from: data)
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
        data: CMDataClass?? = nil
    ) -> CoverModel {
        return CoverModel(
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
struct CMDataClass: Codable {
    let imageID: String?
    let imageURL: String?
    let uploadAddress, requestID, uploadAuth: String?
    let fileURL: String?

    enum CodingKeys: String, CodingKey {
        case imageID = "ImageId"
        case imageURL = "ImageURL"
        case uploadAddress = "UploadAddress"
        case requestID = "RequestId"
        case uploadAuth = "UploadAuth"
        case fileURL = "FileURL"
    }
}

// MARK: DataClass convenience initializers and mutators

extension CMDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CMDataClass.self, from: data)
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
        imageID: String?? = nil,
        imageURL: String?? = nil,
        uploadAddress: String?? = nil,
        requestID: String?? = nil,
        uploadAuth: String?? = nil,
        fileURL: String?? = nil
    ) -> CMDataClass {
        return CMDataClass(
            imageID: imageID ?? self.imageID,
            imageURL: imageURL ?? self.imageURL,
            uploadAddress: uploadAddress ?? self.uploadAddress,
            requestID: requestID ?? self.requestID,
            uploadAuth: uploadAuth ?? self.uploadAuth,
            fileURL: fileURL ?? self.fileURL
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

