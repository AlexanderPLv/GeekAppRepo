//
//  FriendsVC+TableView.swift
//  GeekCourseApp
//
//  Created by MacMini on 04.09.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit

extension FriendsViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableCell.reuseIdentifier, for: indexPath) as? UserTableCell else { fatalError() }
             let user = fetchedResultsController.object(at: indexPath)
        cell.set(user)
           return cell
          }
       
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 100
       }
       
    // MARK: Section Header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let headerView = HeaderSectionView()
        guard let sectionInfo = fetchedResultsController.sections?[section] else { return nil}
        headerView.headerTitle.text = sectionInfo.name

           return headerView
       }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
       }
       
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.sections![section].numberOfObjects
       }
    
}
