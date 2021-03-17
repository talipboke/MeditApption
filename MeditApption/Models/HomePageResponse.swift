//
//  HomePageResponse.swift
//  MeditApption
//
//  Created by Talip Böke on 12.03.2021.
//

import UIKit

internal class HomePageResponse: Decodable, Equatable {
    
    internal let isBannerEnabled: Bool
    internal let meditations: [Meditation]
    internal let stories: [Story]
    
    private enum CodingKeys: String, CodingKey {
        case isBannerEnabled, meditations, stories
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        isBannerEnabled = try container.decode(Bool.self, forKey: .isBannerEnabled)
        meditations = try container.decode([Meditation].self, forKey: .meditations)
        stories = try container.decode([Story].self, forKey: .stories)
    }
    
    static func == (lhs: HomePageResponse, rhs: HomePageResponse) -> Bool {
        return lhs.isBannerEnabled == rhs.isBannerEnabled
    }
}

internal class Meditation: BaseModel {
    
    private enum CodingKeys: String, CodingKey {
        case title, subtitle, releaseDate, content
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        subtitle = try container.decode(String.self, forKey: .subtitle)
        releaseDate = try container.decode(String.self, forKey: .releaseDate)
        content = try container.decode(String.self, forKey: .content)
    }
}

internal class Image: Codable {
    internal let small: String
    internal let large: String
    
    private enum CodingKeys: String, CodingKey {
        case small, large
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        small = try container.decode(String.self, forKey: .small)
        large = try container.decode(String.self, forKey: .large)
    }
    
    init(small: String, large: String) {
        self.small = small
        self.large = large
    }
}

internal class Story: BaseModel {
   
    private enum CodingKeys: String, CodingKey {
        case title = "name"
        case subtitle = "category"
        case releaseDate = "date"
        case content = "text"
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        subtitle = try container.decode(String.self, forKey: .subtitle)
        releaseDate = try container.decode(String.self, forKey: .releaseDate)
        content = try container.decode(String.self, forKey: .content)
    }
}

internal class BaseModel: Codable {
    internal var title,subtitle,releaseDate,content: String?
    internal var image: Image
    
    private enum CodingKeys: String, CodingKey {
        case image
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        image = try container.decode(Image.self, forKey: .image)
    }
    
    init(title: String,
         subtitle: String,
         releaseDate: String,
         content: String,
         image: Image) {
        self.title = title
        self.subtitle = subtitle
        self.releaseDate = releaseDate
        self.content = content
        self.image = image
    }
}

