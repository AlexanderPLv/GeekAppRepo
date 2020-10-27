//
//  JsonNews.swift
//  GeekCourseApp
//
//  Created by MacMini on 16.09.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import Foundation

struct News: Codable {
    let sourceId: Int
    let type: String
    let date: Date?
    let text: String?
    let comments: Comments?
    let likes: Likes?
    let reposts: Reposts?
    let attachments: [Attachments]?
    var profileImageUrl: String? = nil
    var profileName: String? = nil
    var newsImageUrl: String? = nil
    
    private enum CodingKeys: String, CodingKey {
        case type, date, text, comments, likes, reposts, attachments
        case sourceId = "source_id"
    }
    
    init(_ news: News, _ profileData: ProfileDataPresentable) {
        self.sourceId = news.sourceId
        self.type = news.type
        self.date = news.date
        self.text = news.text
        self.comments = news.comments
        self.likes = news.likes
        self.reposts = news.reposts
        self.attachments = news.attachments
        self.profileImageUrl = profileData.profileImageUrl
        self.profileName = profileData.name
    }
    
}

