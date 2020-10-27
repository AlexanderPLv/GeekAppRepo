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
        view.backgroundColor = .white
        if Session.shared.token == nil {
            DispatchQueue.main.async {
                let login = VKLoginController()
                login.modalPresentationStyle = .fullScreen
                self.present(login, animated: true, completion: nil)
            }
            return
        }

        setupViewControllers()
    }
    
    func setupViewControllers() {
        viewControllers = [
            templateNavController(unselectedImage: #imageLiteral(resourceName: "news_unselected"), selectedImage: #imageLiteral(resourceName: "news_selected"), rootViewController: NewsVC()),
            templateNavController(unselectedImage: #imageLiteral(resourceName: "search_unselected"), selectedImage: #imageLiteral(resourceName: "search_selected"), rootViewController: SearchViewController()),
            templateNavController(unselectedImage: #imageLiteral(resourceName: "friends_unselected"), selectedImage: #imageLiteral(resourceName: "friends_selected"), rootViewController: FriendsViewController()),
            templateNavController(unselectedImage: #imageLiteral(resourceName: "groups_unselected"), selectedImage: #imageLiteral(resourceName: "groups_selected"), rootViewController: GroupsViewController())
        ]
        
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
    
    fileprivate func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> CustomNavigationController {
        let viewController = rootViewController
        let navController = CustomNavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
    
}
