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
    var host: BaseURL { get }
    var method: Path { get }
    var fields: [URLQueryItem] { get }
}

extension ApiResource {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host.baseURL
        components.path = method.path
        components.queryItems = fields
        return components.url!
    }
    
}

enum BaseURL {
    case dataRequest
    case authorize
}
extension BaseURL {
    var baseURL: String {
        switch self {
        case .dataRequest:
            return "api.vk.com"
        case .authorize:
            return "oauth.vk.com"
        
        }
    }
}

enum Path {
    case getFriends
    case getGroups
}

extension Path {
    var path: String {
        switch self {
        case .getFriends:
            return "/method/friends.get"
        case .getGroups:
            return "/method/groups.get"
        }
    }
}
