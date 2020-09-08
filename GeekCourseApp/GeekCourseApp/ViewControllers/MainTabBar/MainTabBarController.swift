//
//  MainTabBarController.swift
//  GeekCourseApp
//
//  Created by MacMini on 03.08.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if Session.shared.token == nil {
            DispatchQueue.main.async {
                let login = VKLoginController()
                let navController = UINavigationController(rootViewController: login)
                self.present(navController, animated: true, completion: nil)
            }
            return
        }
        
        setupViewControllers()
    }
    
    func setupViewControllers() {
        
        
        guard let selectedNewsImage = UIImage(systemName: "square.grid.2x2.fill"),
            let newsImage = UIImage(systemName: "square.grid.2x2") else { return }
        let newsViewController = templateNavController(unselectedImage: newsImage, selectedImage: selectedNewsImage, rootViewController: NewsViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        let searchViewController = templateNavController(unselectedImage: #imageLiteral(resourceName: "search_unselected"), selectedImage: #imageLiteral(resourceName: "search_selected"), rootViewController: SearchViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        guard let selectedFriendsImage = UIImage(systemName: "person.2.fill"),
        let unselectedFriendsImage = UIImage(systemName: "person.2") else { return }
        let friendsViewController = templateNavController(unselectedImage: unselectedFriendsImage, selectedImage: selectedFriendsImage, rootViewController: FriendsViewController())
        
        guard let selectedGroupsImage = UIImage(systemName: "person.3.fill"),
        let unselectedGroupsImage = UIImage(systemName: "person.3") else { return }
        let groupsViewController = templateNavController(unselectedImage: unselectedGroupsImage, selectedImage: selectedGroupsImage, rootViewController: GroupsViewController())
        
     
        viewControllers = [
            newsViewController,
            searchViewController,
            friendsViewController,
            groupsViewController
            ]
        
        guard let items = tabBar.items else { return }
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
    
    fileprivate func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
    
}
