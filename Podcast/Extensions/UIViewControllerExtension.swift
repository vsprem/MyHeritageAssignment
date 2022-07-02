//
//  UIViewControllerExtension.swift
//  Podcast
//
//  Created by Vlatko Šprem on 26.06.2022..
//

import UIKit

extension UIViewController {
    public class func instantiate(fromStoryboard storyboard: Storyboard = .main) -> Self? {
        return instantiateHelper(fromStoryboard: storyboard)
    }
    
    private class func instantiateHelper<T: UIViewController>(fromStoryboard storyboard: Storyboard) -> T? {
        
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: .none)
        let viewControllerName = String(describing: T.self)
        return storyboard.instantiateViewController(withIdentifier: viewControllerName) as? T
    }
}
