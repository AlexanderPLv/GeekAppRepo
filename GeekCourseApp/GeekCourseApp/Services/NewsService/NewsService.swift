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
    private var syncQueue = DispatchQueue(label: "NewsServiceQueue", qos: .userInitiated)
    
    func dataRequest(completion: @escaping ([News]) -> ()) {
            let request = ApiRequest(resource: NewsResource())
            self.request = request
            request.load { [weak self] (data: NewsFeed?) in
                guard let news = data?.items,
                      let groups = data?.groups,
                      let users = data?.profiles,
                    let self = self
                    else { return }
                self.createNewsFeed(news, groups, users)
                let newsFeed = self.getNews()
                completion(newsFeed)
            }
    }
    
    private func createNewsFeed(_ news: [News], _ groups: [JsonGroups], _ users: [JsonUser]) {
        for index in news.indices {
            let newsData = news[index]
            let newsImageUrl = getNewsImageUrl(newsData)
            
            if newsData.sourceId < 0 {
                let id = newsData.sourceId.magnitude
                guard let profileData = groups.filter({ $0.id == id }).first
                else { return }
                var news = News(newsData, profileData)
                news.newsImageUrl = newsImageUrl
                append(news)
            } else {
                let id = newsData.sourceId
                guard let profileData = users.filter({ $0.id == id }).first
                else  { return }
                var news = News(newsData, profileData)
                news.newsImageUrl = newsImageUrl
                append(news)
            } } }
    
    private func getNewsImageUrl(_ news: News) -> String? {
        guard let xSizeIndex = news.attachments?.first?.photo?.sizes.firstIndex(where: { $0.type == "x" })
        else { return nil }
        let imageUrl = news.attachments?.first?.photo?.sizes[xSizeIndex].url
        return imageUrl
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
