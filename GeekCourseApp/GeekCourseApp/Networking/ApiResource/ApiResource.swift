//
//  ApiResource.swift
//  GeekCourseApp
//
//  Created by MacMini on 20.08.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import Foundation

struct UserResource: ApiResource {
    typealias ModelType = User
    
    let methodPath = "/method/users.get"
}
