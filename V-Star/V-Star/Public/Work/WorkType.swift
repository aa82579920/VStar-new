//
//  WorkType.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/30.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

// MARK: - WorkType
struct WorkType: Codable {
    let errorCode: Int
    let message: String
    let data: [WTDatum]
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: WorkType convenience initializers and mutators

extension WorkType {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WorkType.self, from: data)
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
        data: [WTDatum]? = nil
        ) -> WorkType {
        return WorkType(
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
struct WTDatum: Codable {
    let workTypeID: Int
    let workTypeName: String
    
    enum CodingKeys: String, CodingKey {
        case workTypeID = "work_type_ID"
        case workTypeName = "work_type_name"
    }
}

// MARK: Datum convenience initializers and mutators

extension WTDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WTDatum.self, from: data)
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
        workTypeID: Int? = nil,
        workTypeName: String? = nil
        ) -> WTDatum {
        return WTDatum(
            workTypeID: workTypeID ?? self.workTypeID,
            workTypeName: workTypeName ?? self.workTypeName
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
