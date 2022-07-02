//
//  AppDelegate.swift
//  Podcast
//
//  Created by Vlatko Šprem on 24.06.2022..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    public var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let mainCoordinator = MainCoordinator(navigationController: UINavigationController())
        mainCoordinator.start()
        
        return true
    }
}

