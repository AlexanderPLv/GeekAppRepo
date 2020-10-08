//
//  JsonNews.swift
//  GeekCourseApp
//
//  Created by MacMini on 16.09.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import Foundation

struct News: Decodable {
    let sourceId: Int
    let type: String
    let date: Date?
    let text: String?
    let comments: Comments?
    let likes: Likes?
    let reposts: Reposts?
    var imageURL: URL? = nil
    var profileName: String? = nil
    
    
    private enum CodingKeys: String, CodingKey {
        case type, date, text, comments, likes, reposts
        case sourceId = "source_id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(String.self, forKey: .type)
        date = try container.decode(Date.self, forKey: .date)
        text = try container.decode(String.self, forKey: .text)
        comments = try container.decode(Comments.self, forKey: .comments)
        likes = try container.decode(Likes.self, forKey: .likes)
        reposts = try container.decode(Reposts.self, forKey: .reposts)
        sourceId = try container.decode(Int.self, forKey: .sourceId)
        }
    
    init(_ news: News, group: JsonGroups) {
        
        self.sourceId = news.sourceId
        self.type = news.type
        self.date = news.date
        self.text = news.text
        self.comments = news.comments
        self.likes = news.likes
        self.reposts = news.reposts
      //  self.imageURL = group.imageURL
        self.profileName = group.name
        
    }
    
}

