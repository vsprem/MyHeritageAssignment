//
//  UIAlertControllerExtension.swift
//  Podcast
//
//  Created by Vlatko Šprem on 01.07.2022..
//

import UIKit

public extension UIAlertController {
    
    func show(on controller: UIViewController? = nil, shouldRotate: Bool = false) {
        let visibleController = controller ?? UIApplication.shared.keyWindow?.visibleViewController()
        visibleController?.present(self, animated: true, completion: nil)
    }
}
