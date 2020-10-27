//
//  User.swift
//  GeekCourseApp
//
//  Created by MacMini on 03.08.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import Foundation

struct UserItems: Codable {
    let items: [JsonUser]
}

struct JsonUser: ProfileDataPresentable {
    var name: String {
        guard let lastName = self.lastName else { return firstName }
        let name = String("\(firstName)" + " \(lastName)")
        return name
    }
    
    var id       : Int
    var firstName: String
    var lastName : String?
    var profileImageUrl : String
}

extension JsonUser: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName  = "last_name"
        case profileImageUrl  = "photo_100"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        profileImageUrl = try container.decode(String.self, forKey: .profileImageUrl)
    }
}
