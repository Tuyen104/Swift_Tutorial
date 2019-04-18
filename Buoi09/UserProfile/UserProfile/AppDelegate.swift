//
//  AppDelegate.swift
//  UserProfile
//
//  Created by Le Tuyen on 4/17/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let navigationController = UINavigationController(rootViewController: MainViewController())
        window?.rootViewController = navigationController
        return true
    }

    


}

