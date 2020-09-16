//
//  NetworkRequest.swift
//  GeekCourseApp
//
//  Created by MacMini on 20.08.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import Foundation

protocol NetworkRequest: AnyObject {
    associatedtype ModelType
    func decode(_ data: Data) -> ModelType?
    func load(withCompletion completion: @escaping (ModelType?) -> Void)
    }

extension NetworkRequest {
     func load(_ url: URL, withCompletion completion: @escaping (ModelType?) -> Void) {
        print("call load func")
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let task = session.dataTask(with: url, completionHandler: { [weak self] (data: Data?, response: URLResponse?, error: Error?) -> Void in
            
           
            guard let data = data else {
                completion(nil)
                return
            }
            let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
            print(json)
            completion(self?.decode(data))
        })
        task.resume()
    }
}
