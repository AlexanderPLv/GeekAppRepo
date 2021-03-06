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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsFeedCell.reuseIdentifier, for: indexPath) as? NewsFeedCell else { fatalError() }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
}
