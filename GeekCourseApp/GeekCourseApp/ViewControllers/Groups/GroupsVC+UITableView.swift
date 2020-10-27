//
//  GroupsVC+UITableView.swift
//  GeekCourseApp
//
//  Created by MacMini on 07.09.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit

extension GroupsViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupsTableCell.reuseIdentifier, for: indexPath) as? GroupsTableCell else { fatalError() }
        let group = fetchedResultsController.object(at: indexPath)
        cell.set(group)
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionInfo = fetchedResultsController.sections?[section] else { fatalError("Unexpected Section") }
        return sectionInfo.numberOfObjects
    }
    
}
