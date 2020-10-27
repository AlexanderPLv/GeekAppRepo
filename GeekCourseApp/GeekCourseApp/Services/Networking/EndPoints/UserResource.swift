//
//  ApiResource.swift
//  GeekCourseApp
//
//  Created by MacMini on 20.08.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import Foundation

struct UserResource: ApiResource {
    typealias ModelType = UserItems
    var host: BaseURL = .dataRequest
    var method: Path = .getFriends
    var fields = [ URLQueryItem(name: "access_token", value: Session.shared.token),
                   URLQueryItem(name: "fields", value: "photo_100"),
                   URLQueryItem(name: "v", value: "5.122")
    ]
    
}

