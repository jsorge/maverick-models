//
//  BundleInfo.swift
//  MaverickModels
//
//  Created by Jared Sorge on 11/4/19.
//

import Foundation

public struct BundleInfo: Codable {
    public let version: Int
    public let type: String
    public let transient: Bool?
    public var frontMatter: FrontMatter?
    public var creatorURL: String?
    public var creatorIdentifier: String?

    private enum CodingKeys: String, CodingKey {
        case version
        case type
        case transient
        case frontMatter = "io.taphouse.maverick"
        case creatorURL
        case creatorIdentifier
    }
}

extension BundleInfo {
    public static var defaultTemplate: BundleInfo {
        return BundleInfo(version: 2, type: "net.daringfireball.markdown", transient: false,
                          frontMatter: nil, creatorURL: nil, creatorIdentifier: nil)
    }

    public static func defaultWithFrontMatter(_ frontMatter: FrontMatter) -> BundleInfo {
        var template = BundleInfo.defaultTemplate
        template.frontMatter = frontMatter
        return template
    }

    public init?(json data: Data) {
        guard let bundleInfo = try? JSONDecoder().decode(BundleInfo.self, from: data) else { return nil }
        self = bundleInfo
    }

    public func toData() -> Data {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        return try! encoder.encode(self)
    }
}
