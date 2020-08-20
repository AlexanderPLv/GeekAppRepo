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
    
    func decode(_ data: Data) -> [Resource.ModelType]? {
        if let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) {
            print(json)
        }
        
        let arr = [Resource.ModelType]()
        return arr
    }
    
//    func decode(_ data: Data) -> [Resource.ModelType]? {
//
//
//        let wrapper = try? JSONDecoder().decode([Resource.ModelType].self, from: data)
//        return wrapper
//    }
    
    func load(withCompletion completion: @escaping ([Resource.ModelType]?) -> Void) {
        load(resource.url, withCompletion: completion)
    }
}
