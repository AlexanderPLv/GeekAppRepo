//
//  SceneDelegate.swift
//  GeekCourseApp
//
//  Created by MacMini on 03.08.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        
        window?.rootViewController = MainTabBarController()
        window?.makeKeyAndVisible()
        
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = .vkBlue
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
    }
    
    func changeRootViewController(_ rootVC: UIViewController, animated: Bool = true ) {
           guard let window = self.window else { return }
           window.rootViewController = rootVC
       }
    
}

