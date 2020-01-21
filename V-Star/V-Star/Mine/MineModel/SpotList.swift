//
//  SpotList.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/21.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

// MARK: - SpotList
struct SpotList: Codable {
    let message: String
    let errorCode: Int
    let data: SLDataClass
    
    enum CodingKeys: String, CodingKey {
        case message
        case errorCode = "error_code"
        case data
    }
}

// MARK: SpotList convenience initializers and mutators

extension SpotList {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(SpotList.self, from: data)
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
        data: SLDataClass? = nil
        ) -> SpotList {
        return SpotList(
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

// MARK: - DataClass
struct SLDataClass: Codable {
    let currentPage, lastPage: Int
}

// MARK: DataClass convenience initializers and mutators

extension SLDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(SLDataClass.self, from: data)
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
        currentPage: Int? = nil,
        lastPage: Int? = nil
        ) -> SLDataClass {
        return SLDataClass(
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
