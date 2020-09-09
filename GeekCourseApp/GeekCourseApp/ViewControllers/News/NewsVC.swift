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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "News"
        tableView.register(NewsFeedCell.self, forCellReuseIdentifier: NewsFeedCell.reuseIdentifier)
    }
    
    
    
    
}

