//
//  AppDelegate.swift
//  VideoStream
//
//  Created by Arthur BLANC on 15/12/2020.
//  Copyright © 2020 Arthur BLANC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
         let window = UIWindow(frame: UIScreen.main.bounds)
               window.rootViewController = UINavigationController(rootViewController: HomeViewController())
               window.makeKeyAndVisible()
               self.window = window
               
               return true
    }

    // MARK: UISceneSession Lifecycle

    

}

