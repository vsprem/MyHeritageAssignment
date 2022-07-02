//
//  UIImageViewExtension.swift
//  Podcast
//
//  Created by Vlatko Šprem on 29.06.2022..
//

import UIKit

extension UIImageView {
    func downloadImageFrom(link: String?, placeholder: String? = nil, contentMode: UIView.ContentMode) {
        if let placeholder = placeholder {
            self.contentMode =  contentMode
            self.image = UIImage(named: placeholder)
        }
        
        guard let link = link else { return }
        URLSession.shared.dataTask( with: NSURL(string:link)! as URL, completionHandler: {
                    (data, response, error) -> Void in
                    DispatchQueue.main.async {
                        self.contentMode =  contentMode
                        if let data = data {
                            self.image = UIImage(data: data)
                        }
                    }
            }).resume()
    }
}
