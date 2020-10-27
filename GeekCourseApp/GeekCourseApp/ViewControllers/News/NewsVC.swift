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
    
    private var newsService = NewsService()
    var newsFeed = [News]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            } } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        newsService.dataRequest { (newsFeed) in
            self.newsFeed = newsFeed
        }
    }
    
    private func setupUI() {
        navigationItem.title = "News"
        tableView.register(NewsPhotoCell.self, forCellReuseIdentifier: NewsPhotoCell.reuseIdentifier)
        tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.reuseIdentifier)
    }
    
}

