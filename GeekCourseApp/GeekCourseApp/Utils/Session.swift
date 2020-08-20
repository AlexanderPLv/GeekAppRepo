//
//  AuthDataStorage.swift
//  GeekCourseApp
//
//  Created by MacMini on 16.08.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import Foundation

class Session {
    
    static let shared = Session()
    
    private init() {}
    
    var token: String? = nil 
    var userId = 0
    
}
