//
//  AppDelegate.swift
//  CollectionViewDemo01
//
//  Created by Le Tuyen on 4/7/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.setWindow()
        return true
    }

    fileprivate func setWindow(){
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = MainViewController()
    }


}

