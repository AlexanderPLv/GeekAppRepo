//
//  NewsFeed.swift
//  GeekCourseApp
//
//  Created by MacMini on 16.09.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import Foundation

struct NewsFeed: Codable {
    let items: [News]
    let groups: [JsonGroups]
    let profiles: [JsonUser]
}
