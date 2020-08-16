//
//  GroupsViewController.swift
//  GeekCourseApp
//
//  Created by MacMini on 06.08.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit

class GroupsViewController: UIViewController {
    
    let groups = [ User(firstName: "Коты", image: "vasa" ),
                 User(firstName: "За 35", image: "vasa" ),
                 User(firstName: "Фанаты Кота Бориса", image: "vasa" ),
                 User(firstName: "Михал Семеныч", image: "misha"),
                 User(firstName: "Радио Дача", image: "feda"),
                 User(firstName: "Евросеть", image: "kesha"),
                 User(firstName: "Связной", image: "kesha"),
                 User(firstName: "Птичий Рынок", image: "petr"),
                 User(firstName: "Просто Рик", image: "rick"),
                 User(firstName: "Тупо Морти", image: "morty")
    ]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
    }
    
}

// MARK: Table View D&D
extension GroupsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.pin(to: view)
        tableView.backgroundColor = .white
        tableView.register(TablesCell.self, forCellReuseIdentifier: TablesCell.reuseIdentifier)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TablesCell.reuseIdentifier, for: indexPath) as? TablesCell else { fatalError() }
        
        let group = groups[indexPath.row]
        cell.set(group)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
}
