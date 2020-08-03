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
        
        
        let newsViewController = NewsViewController()
        let navController = UINavigationController(rootViewController: newsViewController)
       
        viewControllers = [navController]
        
    }
    
    
}
