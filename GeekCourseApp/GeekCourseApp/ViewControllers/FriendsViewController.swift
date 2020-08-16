//
//  FriendsViewController.swift
//  GeekCourseApp
//
//  Created by MacMini on 04.08.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {
    
    let data = [ User(firstName: "Вася", image: "vasa" ),
                 User(firstName: "Вася", image: "vasa" ),
                 User(firstName: "Вася", image: "vasa" ),
                 User(firstName: "Миша", image: "misha"),
                 User(firstName: "Федя", image: "feda"),
                 User(firstName: "Кеша", image: "kesha"),
                 User(firstName: "Кеша", image: "kesha"),
                 User(firstName: "Петя", image: "petr"),
                 User(firstName: "Рик", image: "rick"),
                 User(firstName: "Морти", image: "morty")
    ]
    
    var groups = [[User]]()
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        attemptToAssembleGroupedArray()
    }
    
    func attemptToAssembleGroupedArray() {
        let groupedElements = Dictionary(grouping: data) { (element) -> String in
            return String(element.firstName.prefix(1))
        }
        let sortedKeys = groupedElements.keys.sorted()
        sortedKeys.forEach { (key) in
            let values = groupedElements[key]
            groups.append(values ?? [])
        }
    }
    
}

// MARK: Table View D&D
extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.pin(to: view)
        tableView.backgroundColor = .white
        tableView.register(TablesCell.self, forCellReuseIdentifier: TablesCell.reuseIdentifier)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TablesCell.reuseIdentifier, for: indexPath) as? TablesCell else { fatalError() }
        
        let friend = groups[indexPath.section][indexPath.row]
        cell.set(friend)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // MARK: Section Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = HeaderSectionView()
        if let name = groups[section].first?.firstName
        {
            let headerTitle = name.prefix(1)
            headerView.headerTitle.text = String("  " + headerTitle)
        }
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups[section].count
    }
    
}
