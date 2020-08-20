//
//  User.swift
//  GeekCourseApp
//
//  Created by MacMini on 03.08.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import Foundation

struct User: Decodable {
    
    let firstName: String
    let lastName: String? = nil
    let image: String
    
}
