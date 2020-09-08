//
//  User.swift
//  GeekCourseApp
//
//  Created by MacMini on 03.08.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import Foundation

struct UserItems: Decodable {
    let items: [JsonUser]
}

struct JsonUser {
    var id       : Int
    var firstName: String
    var lastName : String?
    var imageURL : String?
}

extension JsonUser: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName  = "last_name"
        case imageURL  = "photo_200_orig"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        imageURL = try container.decode(String.self, forKey: .imageURL)
    }
}
