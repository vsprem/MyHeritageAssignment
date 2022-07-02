//
//  PaddingLabel.swift
//  Podcast
//
//  Created by Vlatko Šprem on 01.07.2022..
//

import UIKit

class PaddingLabel: UILabel {

    public var padding: UIEdgeInsets = .zero

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: padding.top, left: padding.left, bottom: padding.bottom, right: padding.right)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + padding.left + padding.right, height: size.height + padding.top + padding.bottom)
    }
}
