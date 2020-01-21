//
//  CommentByActionID.swift
//  V-Star
//
//  Created by 王申宇 on 2019/8/22.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

struct CommentByActionID: Codable {
    let errorCode: Int
    let message: String
    let data: CBAIDataClass
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, data
    }
}

extension CommentByActionID {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CommentByActionID.self, from: data)
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
        data: CBAIDataClass? = nil
        ) -> CommentByActionID {
        return CommentByActionID(
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

struct CBAIDataClass: Codable {
    let currentpage: Int
    let data: [CBAIDatum]
    let firstpageurl: String
    let from: Int
    let lastpage: Int
    let lastpageurl: String
    let nextpageurl: JSONNull?
    let path: String
    let perpage: String
    let prevpageurl: JSONNull?
    let to: Int
    let total: Int
    
    enum CodingKeys: String, CodingKey {
        case currentpage = "current_page"
        case data
        case firstpageurl = "first_page_url"
        case from
        case lastpage = "last_page"
        case lastpageurl = "last_page_url"
        case nextpageurl = "next_page_url"
        case path
        case perpage = "per_page"
        case prevpageurl = "prev_page_url"
        case to, total
    }
}

extension CBAIDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CBAIDataClass.self, from: data)
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
        currentpage: Int? = nil,
        data: [CBAIDatum]? = nil,
        firstpageurl: String? = nil,
        from: Int? = nil,
        lastpage: Int? = nil,
        lastpageurl: String? = nil,
        nextpageurl: JSONNull?? = nil,
        path: String? = nil,
        perpage: String? = nil,
        prevpageurl: JSONNull?? = nil,
        to: Int? = nil,
        total: Int? = nil
        ) -> CBAIDataClass {
        return CBAIDataClass(
            currentpage: currentpage ?? self.currentpage,
            data: data ?? self.data,
            firstpageurl: firstpageurl ?? self.firstpageurl,
            from: from ?? self.from,
            lastpage: lastpage ?? self.lastpage,
            lastpageurl: lastpageurl ?? self.lastpageurl,
            nextpageurl: nextpageurl ?? self.nextpageurl,
            path: path ?? self.path,
            perpage: perpage ?? self.perpage,
            prevpageurl: prevpageurl ?? self.prevpageurl,
            to: to ?? self.to,
            total: total ?? self.total
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

struct CBAIDatum: Codable {
    let acID: Int
    let userID: Int
    let username: String
    let avatar: String
    let time: String
    let accontent: String
    let beatuserID: String
    let secondLevelCommentNum: Int
    
    enum CodingKeys: String, CodingKey {
        case acID
        case userID = "user_ID"
        case username, avatar, time
        case accontent = "ac_content"
        case beatuserID = "be_at_user_ID"
        case secondLevelCommentNum = "second_level_comment_num"
    }
}

extension CBAIDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CBAIDatum.self, from: data)
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
        acID: Int? = nil,
        userID: Int? = nil,
        username: String? = nil,
        avatar: String? = nil,
        time: String? = nil,
        accontent: String? = nil,
        beatuserID: String? = nil,
        secondLevelCommentNum: Int? = nil
        ) -> CBAIDatum {
        return CBAIDatum(
            acID: acID ?? self.acID,
            userID: userID ?? self.userID,
            username: username ?? self.username,
            avatar: avatar ?? self.avatar,
            time: time ?? self.time,
            accontent: accontent ?? self.accontent,
            beatuserID: beatuserID ?? self.beatuserID,
            secondLevelCommentNum: secondLevelCommentNum ?? self.secondLevelCommentNum
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
