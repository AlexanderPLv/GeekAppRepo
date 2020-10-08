//
//  NewsService.swift
//  GeekCourseApp
//
//  Created by MacMini on 23.09.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import Foundation

class NewsService {
    
    private var newsFeed = [News]()
    
    private var request: AnyObject?
    private var syncQueue = DispatchQueue(label: "NewsServiceQueue", qos: .default)
    
    func dataRequest(completion: @escaping ([News]) -> ()) {
            let request = ApiRequest(resource: NewsResource())
            self.request = request
            request.load { [weak self] (data: NewsFeed?) in
                guard let news = data?.items,
                      let groups = data?.groups,
                    let self = self
                    else { return }
                self.createPresentableNewsFeed(news, groups)
                let newsFeed = self.getNews()
                completion(newsFeed)
            }
    }
    
    private func createPresentableNewsFeed(_ news: [News], _ groups: [JsonGroups]) {
            for index in news.indices {
                let newsData = news[index]
                let id = newsData.sourceId.magnitude
                guard let profileData = groups.filter({ $0.id == id }).first
                else { return }
                let news = News(newsData, group: profileData)
                append(news)
            }
    }
    
    private func append(_ news: News) {
        syncQueue.async(flags: .barrier) {
            self.newsFeed.append(news)
        }
    }
    
    private func getNews() -> [News] {
        syncQueue.sync {
            return self.newsFeed
        }
    }
    
}
