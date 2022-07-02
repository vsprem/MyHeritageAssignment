//
//  DialogUtility.swift
//  Podcast
//
//  Created by Vlatko Šprem on 01.07.2022..
//

import Foundation
import UIKit

protocol DialogActionConvertible {
    func asUIAlertAction() -> UIAlertAction
}

protocol DialogControllerConvertible {
    func asUIAlertController() -> UIAlertController
}

public struct DialogUtility {
    public static func createDialog(title: String?, message: String?, actions: DialogAction?...) -> UIAlertController {
        let alertController = DialogController(title: title, message: message).asUIAlertController()
        
        for action in actions {
            if let action = action {
                alertController.addAction(action.asUIAlertAction())
            }
        }
        
        return alertController
    }
    
    public static func createDialog(title: String?, message: String?, actions: [DialogAction]?) -> UIAlertController {
        let alertController = DialogController(title: title, message: message).asUIAlertController()
        
        if let actions = actions {
            actions.forEach { alertController.addAction($0.asUIAlertAction()) }
        }
        return alertController
    }
}

public struct DialogAction: DialogActionConvertible {
    let title: String
    let style: UIAlertAction.Style
    let completion: ((UIAlertAction) -> Void)?
    
    public init(title: String, style: UIAlertAction.Style, completion: ((UIAlertAction) -> Void)?) {
        self.title = title
        self.style = style
        self.completion = completion
    }
    
    func asUIAlertAction() -> UIAlertAction {
        return UIAlertAction(title: self.title, style: style, handler: completion)
    }
}

struct DialogController: DialogControllerConvertible {
    let title: String?
    let message: String?
    
    func asUIAlertController() -> UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
}

extension UIAlertController {
    func addAction(action: DialogAction) {
        self.addAction(UIAlertAction(title: action.title, style: action.style, handler: action.completion))
    }
}

