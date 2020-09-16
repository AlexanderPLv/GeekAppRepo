//
//  JsonNews.swift
//  GeekCourseApp
//
//  Created by MacMini on 16.09.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import Foundation

struct News: Decodable {
    let type: String
    let date: Date?
    let text: String?
    let comments: Comments?
    let likes: Likes?
    let reposts: Reposts?
}

