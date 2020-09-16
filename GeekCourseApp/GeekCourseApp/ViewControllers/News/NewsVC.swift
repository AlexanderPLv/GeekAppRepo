//
//  NewsVC.swift
//  GeekCourseApp
//
//  Created by MacMini on 08.09.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit
import CoreData

class NewsVC: UITableViewController {
    
    private var request: AnyObject?
    
    var news: [News]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "News"
        tableView.register(NewsFeedCell.self, forCellReuseIdentifier: NewsFeedCell.reuseIdentifier)
       // getNews()
    }
    
    fileprivate func getNews() {
        let request = ApiRequest(resource: NewsResource())
        self.request = request
        
        request.load { (response: NewsFeed?) in
            guard let news = response?.items else { return }
            self.news = news
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

