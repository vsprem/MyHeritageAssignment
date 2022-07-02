//
//  UIWindowExtension.swift
//  Podcast
//
//  Created by Vlatko Šprem on 01.07.2022..
//

import UIKit

extension UIWindow {
    func topViewController() -> UIViewController? {
        var topController = UIApplication.shared.keyWindow?.rootViewController
        
        if let mainViewController = topController as? MainViewController,
            let childViewController = mainViewController.children.first {
            topController = childViewController
        }
        
        while topController?.presentedViewController != nil {
            topController = topController?.presentedViewController
        }
        
        return topController
    }
    
    func visibleViewController() -> UIViewController? {
        let topController = topViewController()
        if let navigationController = topController as? UINavigationController,
            let navigationTopController = navigationController.topViewController {
            return navigationTopController
        }
        return topController
    }
}

