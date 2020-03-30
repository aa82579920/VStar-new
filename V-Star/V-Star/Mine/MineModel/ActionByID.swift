// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let actionByID = try ActionByID(json)

import Foundation

// MARK: - ActionByID
struct ActionByID: Codable {
    let errorCode: Int?
    let message: String?
    let data: ABIDataClass?

    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: ActionByID convenience initializers and mutators

extension ActionByID {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ActionByID.self, from: data)
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
        data: ABIDataClass?? = nil
    ) -> ActionByID {
        return ActionByID(
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
struct ABIDataClass: Codable {
    let currentPage: Int?
    let data: [ABIDatum]?
    let firstPageURL: String?
    let from, lastPage: Int?
    let lastPageURL, nextPageURL, path: String?
    let perPage: String?
    let prevPageURL: String?
    let to, total: Int?

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case firstPageURL = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageURL = "last_page_url"
        case nextPageURL = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageURL = "prev_page_url"
        case to, total
    }
}

// MARK: DataClass convenience initializers and mutators

extension ABIDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ABIDataClass.self, from: data)
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
        currentPage: Int?? = nil,
        data: [ABIDatum]?? = nil,
        firstPageURL: String?? = nil,
        from: Int?? = nil,
        lastPage: Int?? = nil,
        lastPageURL: String?? = nil,
        nextPageURL: String?? = nil,
        path: String?? = nil,
        perPage: String?? = nil,
        prevPageURL: String?? = nil,
        to: Int?? = nil,
        total: Int?? = nil
    ) -> ABIDataClass {
        return ABIDataClass(
            currentPage: currentPage ?? self.currentPage,
            data: data ?? self.data,
            firstPageURL: firstPageURL ?? self.firstPageURL,
            from: from ?? self.from,
            lastPage: lastPage ?? self.lastPage,
            lastPageURL: lastPageURL ?? self.lastPageURL,
            nextPageURL: nextPageURL ?? self.nextPageURL,
            path: path ?? self.path,
            perPage: perPage ?? self.perPage,
            prevPageURL: prevPageURL ?? self.prevPageURL,
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

// MARK: - Datum
struct ABIDatum: Codable {
    let fandomActionID: Int?
    let time: String?
    let userID: Int?
    let username: String?
    let avatar: String?
    let content, imgIDs: String?
    let imgUrls: [String]?

    enum CodingKeys: String, CodingKey {
        case fandomActionID = "fandom_action_ID"
        case time
        case userID = "user_ID"
        case username, avatar, content
        case imgIDs = "img_IDs"
        case imgUrls = "img_urls"
    }
}

// MARK: Datum convenience initializers and mutators

extension ABIDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ABIDatum.self, from: data)
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
        fandomActionID: Int?? = nil,
        time: String?? = nil,
        userID: Int?? = nil,
        username: String?? = nil,
        avatar: String?? = nil,
        content: String?? = nil,
        imgIDs: String?? = nil,
        imgUrls: [String]?? = nil
    ) -> ABIDatum {
        return ABIDatum(
            fandomActionID: fandomActionID ?? self.fandomActionID,
            time: time ?? self.time,
            userID: userID ?? self.userID,
            username: username ?? self.username,
            avatar: avatar ?? self.avatar,
            content: content ?? self.content,
            imgIDs: imgIDs ?? self.imgIDs,
            imgUrls: imgUrls ?? self.imgUrls
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
