//
//  ApiRequest.swift
//  GeekCourseApp
//
//  Created by MacMini on 20.08.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import Foundation

class ApiRequest<Resource: ApiResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}
 
extension ApiRequest: NetworkRequest {

    func decode(_ data: Data) -> Resource.ModelType? {
        let wrapper = try? JSONDecoder().decode(Wrapper<ModelType>.self, from: data)
        return wrapper?.response
    }
    
    func load(withCompletion completion: @escaping (Resource.ModelType?) -> Void) {
        load(resource.url, withCompletion: completion)
    }
}
