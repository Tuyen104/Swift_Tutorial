//
//  AppDelegate.swift
//  DemoTableView
//
//  Created by Toof on 4/3/19.
//  Copyright © 2019 Toof. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().isTranslucent = true
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.backgroundColor = UIColor.white
        
        let navigationController = UINavigationController(rootViewController: CommentsViewController())
        self.window?.rootViewController = navigationController
        
        return true
    }
    
}

