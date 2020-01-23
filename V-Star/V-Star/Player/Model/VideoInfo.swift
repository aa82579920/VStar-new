//
//  VideoInfo.swift
//  V-Star
//
//  Created by 王申宇 on 2019/11/12.
//  Copyright © 2019 mac. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let videoInfo = try VideoInfo(json)

import Foundation

// MARK: - VideoInfo
struct VideoInfo: Codable {
    let errorCode: Int?
    let message: String?
    let data: VIDataClass?

    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: VideoInfo convenience initializers and mutators

extension VideoInfo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(VideoInfo.self, from: data)
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
        data: VIDataClass?? = nil
    ) -> VideoInfo {
        return VideoInfo(
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
struct VIDataClass: Codable {
    let requestID: String?
    let playInfoList: PlayInfoList?
    let videoBase: VideoBase?

    enum CodingKeys: String, CodingKey {
        case requestID = "RequestId"
        case playInfoList = "PlayInfoList"
        case videoBase = "VideoBase"
    }
}

// MARK: DataClass convenience initializers and mutators

extension VIDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(VIDataClass.self, from: data)
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
        requestID: String?? = nil,
        playInfoList: PlayInfoList?? = nil,
        videoBase: VideoBase?? = nil
    ) -> VIDataClass {
        return VIDataClass(
            requestID: requestID ?? self.requestID,
            playInfoList: playInfoList ?? self.playInfoList,
            videoBase: videoBase ?? self.videoBase
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - PlayInfoList
struct PlayInfoList: Codable {
    let playInfo: [PlayInfo]?

    enum CodingKeys: String, CodingKey {
        case playInfo = "PlayInfo"
    }
}

// MARK: PlayInfoList convenience initializers and mutators

extension PlayInfoList {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PlayInfoList.self, from: data)
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
        playInfo: [PlayInfo]?? = nil
    ) -> PlayInfoList {
        return PlayInfoList(
            playInfo: playInfo ?? self.playInfo
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - PlayInfo
struct PlayInfo: Codable {
    let format, streamType, preprocessStatus: String?
    let modificationTime: Date?
    let specification: String?
    let height: Int?
    let playURL: String?
    let narrowBandType: String?
    let creationTime: Date?
    let status, duration, jobID: String?
    let encrypt, width: Int?
    let fps, bitrate: String?
    let size: Int?
    let definition: String?

    enum CodingKeys: String, CodingKey {
        case format = "Format"
        case streamType = "StreamType"
        case preprocessStatus = "PreprocessStatus"
        case modificationTime = "ModificationTime"
        case specification = "Specification"
        case height = "Height"
        case playURL = "PlayURL"
        case narrowBandType = "NarrowBandType"
        case creationTime = "CreationTime"
        case status = "Status"
        case duration = "Duration"
        case jobID = "JobId"
        case encrypt = "Encrypt"
        case width = "Width"
        case fps = "Fps"
        case bitrate = "Bitrate"
        case size = "Size"
        case definition = "Definition"
    }
}

// MARK: PlayInfo convenience initializers and mutators

extension PlayInfo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PlayInfo.self, from: data)
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
        format: String?? = nil,
        streamType: String?? = nil,
        preprocessStatus: String?? = nil,
        modificationTime: Date?? = nil,
        specification: String?? = nil,
        height: Int?? = nil,
        playURL: String?? = nil,
        narrowBandType: String?? = nil,
        creationTime: Date?? = nil,
        status: String?? = nil,
        duration: String?? = nil,
        jobID: String?? = nil,
        encrypt: Int?? = nil,
        width: Int?? = nil,
        fps: String?? = nil,
        bitrate: String?? = nil,
        size: Int?? = nil,
        definition: String?? = nil
    ) -> PlayInfo {
        return PlayInfo(
            format: format ?? self.format,
            streamType: streamType ?? self.streamType,
            preprocessStatus: preprocessStatus ?? self.preprocessStatus,
            modificationTime: modificationTime ?? self.modificationTime,
            specification: specification ?? self.specification,
            height: height ?? self.height,
            playURL: playURL ?? self.playURL,
            narrowBandType: narrowBandType ?? self.narrowBandType,
            creationTime: creationTime ?? self.creationTime,
            status: status ?? self.status,
            duration: duration ?? self.duration,
            jobID: jobID ?? self.jobID,
            encrypt: encrypt ?? self.encrypt,
            width: width ?? self.width,
            fps: fps ?? self.fps,
            bitrate: bitrate ?? self.bitrate,
            size: size ?? self.size,
            definition: definition ?? self.definition
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - VideoBase
struct VideoBase: Codable {
    let coverURL: String?
    let creationTime: Date?
    let transcodeMode, status, mediaType, duration: String?
    let videoID, outputType, title: String?

    enum CodingKeys: String, CodingKey {
        case coverURL = "CoverURL"
        case creationTime = "CreationTime"
        case transcodeMode = "TranscodeMode"
        case status = "Status"
        case mediaType = "MediaType"
        case duration = "Duration"
        case videoID = "VideoId"
        case outputType = "OutputType"
        case title = "Title"
    }
}

// MARK: VideoBase convenience initializers and mutators

extension VideoBase {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(VideoBase.self, from: data)
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
        coverURL: String?? = nil,
        creationTime: Date?? = nil,
        transcodeMode: String?? = nil,
        status: String?? = nil,
        mediaType: String?? = nil,
        duration: String?? = nil,
        videoID: String?? = nil,
        outputType: String?? = nil,
        title: String?? = nil
    ) -> VideoBase {
        return VideoBase(
            coverURL: coverURL ?? self.coverURL,
            creationTime: creationTime ?? self.creationTime,
            transcodeMode: transcodeMode ?? self.transcodeMode,
            status: status ?? self.status,
            mediaType: mediaType ?? self.mediaType,
            duration: duration ?? self.duration,
            videoID: videoID ?? self.videoID,
            outputType: outputType ?? self.outputType,
            title: title ?? self.title
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
