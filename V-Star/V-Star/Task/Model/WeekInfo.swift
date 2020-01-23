//
//  WeekInfo.swift
//  V-Star
//
//  Created by 王申宇 on 16/01/2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

// MARK: - WeekInfo
struct WeekInfo: Codable {
    let errorCode: Int?
    let message: String?
    let data: WIDataClass?

    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: WeekInfo convenience initializers and mutators

extension WeekInfo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WeekInfo.self, from: data)
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
        data: WIDataClass?? = nil
    ) -> WeekInfo {
        return WeekInfo(
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
struct WIDataClass: Codable {
    let userID: Int?
    let totalMoney: String?
    let redBagCount: Int?
    let day1, day2, day3, day4: String?
    let day5, day6, day7, invitationCode: String?
    let invitationCount, todayTotalWatch, todayTotalUpload: Int?
    let isTodaySigned, isTodayTakeWatchMoney, isTodayTakeUploadMoney: Bool?

    enum CodingKeys: String, CodingKey {
        case userID = "user_ID"
        case totalMoney = "total_money"
        case redBagCount = "red_bag_count"
        case day1 = "day_1"
        case day2 = "day_2"
        case day3 = "day_3"
        case day4 = "day_4"
        case day5 = "day_5"
        case day6 = "day_6"
        case day7 = "day_7"
        case invitationCode = "Invitation_code"
        case invitationCount = "Invitation_count"
        case todayTotalWatch = "today_total_watch"
        case todayTotalUpload = "today_total_upload"
        case isTodaySigned = "is_today_signed"
        case isTodayTakeWatchMoney = "is_today_take_watch_money"
        case isTodayTakeUploadMoney = "is_today_take_upload_money"
    }
}

// MARK: DataClass convenience initializers and mutators

extension WIDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WIDataClass.self, from: data)
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
        userID: Int?? = nil,
        totalMoney: String?? = nil,
        redBagCount: Int?? = nil,
        day1: String?? = nil,
        day2: String?? = nil,
        day3: String?? = nil,
        day4: String?? = nil,
        day5: String?? = nil,
        day6: String?? = nil,
        day7: String?? = nil,
        invitationCode: String?? = nil,
        invitationCount: Int?? = nil,
        todayTotalWatch: Int?? = nil,
        todayTotalUpload: Int?? = nil,
        isTodaySigned: Bool?? = nil,
        isTodayTakeWatchMoney: Bool?? = nil,
        isTodayTakeUploadMoney: Bool?? = nil
    ) -> WIDataClass {
        return WIDataClass(
            userID: userID ?? self.userID,
            totalMoney: totalMoney ?? self.totalMoney,
            redBagCount: redBagCount ?? self.redBagCount,
            day1: day1 ?? self.day1,
            day2: day2 ?? self.day2,
            day3: day3 ?? self.day3,
            day4: day4 ?? self.day4,
            day5: day5 ?? self.day5,
            day6: day6 ?? self.day6,
            day7: day7 ?? self.day7,
            invitationCode: invitationCode ?? self.invitationCode,
            invitationCount: invitationCount ?? self.invitationCount,
            todayTotalWatch: todayTotalWatch ?? self.todayTotalWatch,
            todayTotalUpload: todayTotalUpload ?? self.todayTotalUpload,
            isTodaySigned: isTodaySigned ?? self.isTodaySigned,
            isTodayTakeWatchMoney: isTodayTakeWatchMoney ?? self.isTodayTakeWatchMoney,
            isTodayTakeUploadMoney: isTodayTakeUploadMoney ?? self.isTodayTakeUploadMoney
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
