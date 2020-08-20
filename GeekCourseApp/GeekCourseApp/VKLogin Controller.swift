//
//  VKLogin Controller.swift
//  GeekCourseApp
//
//  Created by MacMini on 17.08.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit
import WebKit

class VKLoginController: UIViewController {
    
    var webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        webView.pin(to: view)
        webView.navigationDelegate = self
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "oauth.vk.com"
        components.path = "/authorize"
        components.queryItems = [
            URLQueryItem(name: "client_id", value: "7570721"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.122")
        ]
        
        let request = URLRequest(url: components.url!)
        webView.load(request)
        
    }
    
    private func changeRootViewController() {
        let mainTabBarController = MainTabBarController()
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }

}

extension VKLoginController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment else { decisionHandler(.allow); return }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        print(params)
        
        guard let token = params["access_token"],
            let userIdString = params["user_id"],
            let userId = Int(userIdString) else {
                decisionHandler(.allow)
                return
        }
        Session.shared.userId = userId
        Session.shared.token = token
        
        print("id =\(Session.shared.userId) \n token = \(Session.shared.token ?? " ")")

        guard let mainTabBarController = UIApplication.shared.windows.first(where: \.isKeyWindow)?.rootViewController as? MainTabBarController else { return }
        mainTabBarController.setupViewControllers()
        self.dismiss(animated: true, completion: nil)
        
        decisionHandler(.cancel)
    }
    
    
    
}

