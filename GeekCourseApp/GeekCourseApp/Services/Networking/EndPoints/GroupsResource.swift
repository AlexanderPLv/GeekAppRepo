//
//  GroupsResource.swift
//  GeekCourseApp
//
//  Created by MacMini on 07.09.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import Foundation

struct GroupsResource: ApiResource {
    typealias ModelType = GroupItems
    var host: BaseURL = .dataRequest
    var method: Path = .getGroups
    var fields = [ URLQueryItem(name: "access_token", value: Session.shared.token),
                   URLQueryItem(name: "extended", value: "1"),
                   URLQueryItem(name: "count", value: "1000"),
                   URLQueryItem(name: "v", value: "5.122")
    ]
    
}
