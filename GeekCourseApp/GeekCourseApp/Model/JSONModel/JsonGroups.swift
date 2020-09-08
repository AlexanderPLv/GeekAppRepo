//
//  Group.swift
//  GeekCourseApp
//
//  Created by MacMini on 03.08.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import Foundation

struct GroupItems: Decodable {
    let items: [jsonGroups]
}

struct jsonGroups {
    let id: Int
    let name: String
    let imageURL: String
}

extension jsonGroups: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageURL  = "photo_100"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        imageURL = try container.decode(String.self, forKey: .imageURL)
    }
}

