//
//  ApiResource.swift
//  GeekCourseApp
//
//  Created by MacMini on 20.08.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import Foundation

protocol ApiResource {
    associatedtype ModelType: Decodable
    var methodPath: String { get }
}
extension ApiResource {
    var url: URL {
        var components = URLComponents(string: "https://api.vk.com")!
        components.path = methodPath
        components.queryItems = [
        URLQueryItem(name: "user_ids", value: "id"),
        URLQueryItem(name: "fields", value: "field"),
        URLQueryItem(name: "name_case", value: "nom")
        ]
        return components.url!
    }
}
