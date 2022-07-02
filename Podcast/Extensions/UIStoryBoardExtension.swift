//
//  UIStoryBoardExtension.swift
//  Podcast
//
//  Created by Vlatko Šprem on 26.06.2022..
//

import UIKit

extension UIStoryboard {
    static func instantiateViewController(_ viewController: UIViewController.Type, storyboard: Storyboard = .main) -> UIViewController? {
        return UIStoryboard.instantiateViewControllerNamed(String(describing: viewController), storyboard: storyboard)
    }
    
     static func instantiateViewControllerNamed(_ viewControllerName: String, storyboard: Storyboard) -> UIViewController? {

        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: .none)
        return storyboard.instantiateViewController(withIdentifier: viewControllerName)
    }
}
