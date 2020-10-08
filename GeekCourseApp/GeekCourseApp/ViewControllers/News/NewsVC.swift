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
    
    var newsFeed = [News]() {
        didSet {
            print("ccccCCCCCccccc")
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var newsService = NewsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reload", style: .plain, target: self, action: #selector(tapHandle))
        navigationItem.title = "News"
        tableView.register(NewsFeedCell.self, forCellReuseIdentifier: NewsFeedCell.reuseIdentifier)
        
        newsService.dataRequest { (newsFeed) in
            self.newsFeed = newsFeed
        }
        
////        let privateQueue = DispatchQueue(label: "com.private.queue")
////        privateQueue.async {
//
////            self.newsService.dataRequest()
////                        self.newsService.createPresentableNewsFeed()
//                        self.newsFeed = self.newsService.getNewsFeed()
//
//
////        }
        
       
    }
    
    @objc func tapHandle() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
   
}

