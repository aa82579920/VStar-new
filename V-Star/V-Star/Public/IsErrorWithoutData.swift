//
//  SendActionComment.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/22.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

// MARK: - SendActionComment
struct IsErrorWithoutData: Codable {
    let errorCode: Int
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message
    }
}

// MARK: SendActionComment convenience initializers and mutators

extension IsErrorWithoutData {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(IsErrorWithoutData.self, from: data)
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
        message: String? = nil
        ) -> IsErrorWithoutData {
        return IsErrorWithoutData(
            errorCode: errorCode ?? self.errorCode,
            message: message ?? self.message
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
