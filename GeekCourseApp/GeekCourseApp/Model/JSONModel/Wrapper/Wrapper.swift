//
//  Wrapper.swift
//  GeekCourseApp
//
//  Created by MacMini on 08.09.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import Foundation

struct Wrapper<T: Decodable>: Decodable {
    let response: T
}
