//
//  PageContext.swift
//  App
//
//  Created by Jared Sorge on 5/28/18.
//

import Foundation

/// Data about the whole site
public struct SiteConfig: Codable {
    /// Goes in the `meta name=description` tag.
    public let metaDescription: String
    /// The title that goes in the header on the page (i.e. "jsorge.net" or "Inessential").
    public let title: String
    /// The description that goes below the title in the header.
    /// (i.e. "Christian, husbend, dad, developer, batman afficianado")
    public let description: String
    /// The base URL of the site.
    public let url: URL
    /// The number of posts to include when listing posts
    public let batchSize: Int
    /// The number of posts included in the feeds
    public let feedSize: Int
    /// Upon adding a new post, ping these URLS so that the proper feeds are refreshed
    public var sitesToPing: [URL]?
    /// The year to go in the footer.
    public let year: String = {
        let calendar = Calendar.current
        let date = Date()
        return "\(calendar.component(.year, from: date))"
    }()
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(metaDescription, forKey: .metaDescription)
        try container.encode(title, forKey: .title)
        try container.encode(description, forKey: .description)
        try container.encode("\(url)", forKey: .url)
        try container.encode(batchSize, forKey: .batchSize)
        try container.encode(year, forKey: .year)
        try container.encode(feedSize, forKey: .feedSize)
        try container.encodeIfPresent(sitesToPing, forKey: .sitesToPing)
    }
    
    private enum CodingKeys: String, CodingKey {
        case metaDescription
        case title
        case description
        case url
        case batchSize
        case year
        case feedSize
        case sitesToPing
    }
}
