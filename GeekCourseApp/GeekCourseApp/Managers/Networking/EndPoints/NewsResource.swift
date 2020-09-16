//
//  NewsResource.swift
//  GeekCourseApp
//
//  Created by MacMini on 16.09.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import Foundation

struct NewsResource: ApiResource {
    
    typealias ModelType = NewsFeed
    var host: BaseURL = .dataRequest
    var method: Path = .getNews
    var fields = [ URLQueryItem(name: "access_token", value: Session.shared.token),
                   URLQueryItem(name: "filters", value: "post"),
                   URLQueryItem(name: "return_banned", value: "0"),
//                   URLQueryItem(name: "max_photos", value: "0"),
//                   URLQueryItem(name: "extended", value: "1"),
                   URLQueryItem(name: "count", value: "20"),
                   URLQueryItem(name: "v", value: "5.122")
                 ]
}
