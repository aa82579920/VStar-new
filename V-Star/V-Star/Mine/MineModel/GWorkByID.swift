// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let workByID = try WorkByID(json)

import Foundation

struct HPHelper {
    static func GetWorkByID(success: @escaping (GWorkByID) -> Void, failure: @escaping (Error) -> Void) {
        var myParam = ["user_ID": WorkStorage.userID, "limit": MyStorage.limit, "page": MyStorage.page] as [String : Any]
        VStarHelper.dataStar(url: VStar_URL.work.getWorkByUserID, myMethod: .get, param: &myParam, success: { dic in
            if let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.init(rawValue: 0)), let aul = try? GWorkByID(data: data) {
                success(aul)
            }
        }, failure: { _ in
            
        })
    }
}

// MARK: - WorkByID
struct GWorkByID: Codable {
    let message: String?
    let errorCode: Int?
    let data: GWBIDataClass?

    enum CodingKeys: String, CodingKey {
        case message
        case errorCode = "error_code"
        case data
    }
}

// MARK: WorkByID convenience initializers and mutators

extension GWorkByID {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(GWorkByID.self, from: data)
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
        data: GWBIDataClass?? = nil
    ) -> GWorkByID {
        return GWorkByID(
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
struct GWBIDataClass: Codable {
    let currentPage: Int?
    let data: [GWBIDatum]?
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

extension GWBIDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(GWBIDataClass.self, from: data)
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
        data: [GWBIDatum]?? = nil,
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
    ) -> GWBIDataClass {
        return GWBIDataClass(
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
struct GWBIDatum: Codable {
    let workID: Int?
    let workName: String?
    let workTypeID, userID: Int?
    let username: String?
    let avatar: String?
    let introduction, videoID: String?
    let coverURL: String?
    let coverID: String?
    let videoLink: String?
    let hotValue: Int?
    let time, tags: String?
    let collectionNum, commentNum, shareNum: Int?
    let duration: Double?

    enum CodingKeys: String, CodingKey {
        case workID = "work_ID"
        case workName = "work_name"
        case workTypeID = "work_type_ID"
        case userID = "user_ID"
        case username, avatar
        case introduction = "Introduction"
        case videoID = "video_ID"
        case coverURL = "cover_url"
        case coverID = "cover_ID"
        case videoLink = "video_link"
        case hotValue = "hot_value"
        case time, tags
        case collectionNum = "collection_num"
        case commentNum = "comment_num"
        case shareNum = "share_num"
        case duration = "Duration"
    }
}

// MARK: Datum convenience initializers and mutators

extension GWBIDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(GWBIDatum.self, from: data)
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
        workName: String?? = nil,
        workTypeID: Int?? = nil,
        userID: Int?? = nil,
        username: String?? = nil,
        avatar: String?? = nil,
        introduction: String?? = nil,
        videoID: String?? = nil,
        coverURL: String?? = nil,
        coverID: String?? = nil,
        videoLink: String?? = nil,
        hotValue: Int?? = nil,
        time: String?? = nil,
        tags: String?? = nil,
        collectionNum: Int?? = nil,
        commentNum: Int?? = nil,
        shareNum: Int?? = nil,
        duration: Double?? = nil
    ) -> GWBIDatum {
        return GWBIDatum(
            workID: workID ?? self.workID,
            workName: workName ?? self.workName,
            workTypeID: workTypeID ?? self.workTypeID,
            userID: userID ?? self.userID,
            username: username ?? self.username,
            avatar: avatar ?? self.avatar,
            introduction: introduction ?? self.introduction,
            videoID: videoID ?? self.videoID,
            coverURL: coverURL ?? self.coverURL,
            coverID: coverID ?? self.coverID,
            videoLink: videoLink ?? self.videoLink,
            hotValue: hotValue ?? self.hotValue,
            time: time ?? self.time,
            tags: tags ?? self.tags,
            collectionNum: collectionNum ?? self.collectionNum,
            commentNum: commentNum ?? self.commentNum,
            shareNum: shareNum ?? self.shareNum,
            duration: duration ?? self.duration
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

