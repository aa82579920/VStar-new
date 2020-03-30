//
//  LoginStar.swift
//  V-Star
//
//  Created by 王申宇 on 13/03/2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

struct LSHelper {
    static func PostLS(success: @escaping (LoginStar) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["user_ID": MyStorage.userID, "work_ID": WorkStorage.workId] as [String: Any]
        VStarHelper.dataStar(url: "/star/loginStar", myMethod: .post, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let add = try? LoginStar(data: data) {
                success(add)
            }
        }, failure: { _ in
            
        })
    }
}

// MARK: - LoginStar
struct LoginStar: Codable {
    let message: String?
    let errorCode: Int?
    let data: LSDataClass?

    enum CodingKeys: String, CodingKey {
        case message
        case errorCode = "error_code"
        case data
    }
}

// MARK: LoginStar convenience initializers and mutators

extension LoginStar {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(LoginStar.self, from: data)
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
        data: LSDataClass?? = nil
    ) -> LoginStar {
        return LoginStar(
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
struct LSDataClass: Codable {
    let numberOfStar: Int?
    let name, introduction: String?
}

// MARK: DataClass convenience initializers and mutators

extension LSDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(LSDataClass.self, from: data)
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
        numberOfStar: Int?? = nil,
        name: String?? = nil,
        introduction: String?? = nil
    ) -> LSDataClass {
        return LSDataClass(
            numberOfStar: numberOfStar ?? self.numberOfStar,
            name: name ?? self.name,
            introduction: introduction ?? self.introduction
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
