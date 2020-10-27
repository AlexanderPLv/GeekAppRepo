//
//  NewsFeedVC+UITableView.swift
//  GeekCourseApp
//
//  Created by MacMini on 09.09.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit

extension NewsVC {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let news = self.newsFeed[indexPath.row]
        if news.newsImageUrl != nil {
           guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsPhotoCell.reuseIdentifier, for: indexPath) as? NewsPhotoCell
           else { fatalError() }
            cell.set(news)
            return cell
        } else {
           guard let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.reuseIdentifier, for: indexPath) as? PostCell
           else { fatalError() }
            cell.set(news)
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsFeed.count
    }
    
}
