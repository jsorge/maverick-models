//
//  TextBundleReader.swift
//  MaverickModels
//
//  Created by Jared Sorge on 11/5/19.
//

import Foundation
import Pathos

public enum FileReaderError: Error {
    case unreadableFile
}

public struct TextBundleReader {
    public static func attemptToReadFile(at bundlePath: String) throws -> BasePost {
        let path = Path(bundlePath)
        let infoPath = path + Path("info.json")
        let textPath = path + Path("text.md")

        let markdown = textPath.readString()

        guard
            let bundleData = infoPath.readString().data(using: .utf8),
            let bundleInfo = BundleInfo(json: bundleData),
            let frontMatter = bundleInfo.frontMatter else
        {
            throw FileReaderError.unreadableFile
        }

        let post = BasePost(frontMatter: frontMatter, content: markdown)
        return post
    }
}
