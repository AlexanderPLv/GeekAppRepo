//
//  NewsController.swift
//  GeekCourseApp
//
//  Created by MacMini on 03.08.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    let data = [ User(firstName: "Вася", image: "vasa" ),
                    User(firstName: "Вася", image: "vasa" ),
                    User(firstName: "Вася", image: "vasa" ),
                    User(firstName: "Миша", image: "misha"),
                    User(firstName: "Федя", image: "feda"),
                    User(firstName: "Кеша", image: "kesha"),
                    User(firstName: "Петя", image: "petr"),
                    User(firstName: "Рик", image: "rick"),
                    User(firstName: "Морти", image: "morty")
    ]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        tableView.backgroundColor = .green
    }
    
    func configTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.pin(to: view)
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.reuseIdentifier)
    }
    
    
    
}



extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseIdentifier, for: indexPath) as? NewsCell else { fatalError() }
        
        let news = data[indexPath.row]
        cell.data = news
        
        return cell
    }
    
    
    
    
}
    
