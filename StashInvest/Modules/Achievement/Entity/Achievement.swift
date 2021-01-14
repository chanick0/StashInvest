//
//  Achievement.swift
//  StashInvest
//
//  Created by Chanick Park on 1/13/21.
//

import Foundation

struct Achievement: Codable {
    let id: Int
    let level: String
    let progress: Int
    let total: Int
    let bgImageURL: URL?
    let accessible: Bool

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case level = "level"
        case progress = "progress"
        case total = "total"
        case bgImageURL = "bg_image_url"
        case accessible = "accessible"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? -1
        self.level = try container.decodeIfPresent(String.self, forKey: .level) ?? ""
        self.progress = try container.decodeIfPresent(Int.self, forKey: .progress) ?? 0
        self.total = try container.decodeIfPresent(Int.self, forKey: .total) ?? 0
        self.accessible = try container.decodeIfPresent(Bool.self, forKey: .accessible) ?? false

        let bgImgURL = try container.decodeIfPresent(String.self, forKey: .bgImageURL) ?? ""
        self.bgImageURL = URL(string: bgImgURL)
    }
}
