//
//  Extensions.swift
//  GymCompanion
//
//  Created by Fernando Brito on 30/08/23.
//

import UIKit

extension UIImageView {
    func addColorLayer(with color: CGColor) {
        let layer = CALayer()

        layer.frame = bounds
        layer.backgroundColor = color

        self.layer.addSublayer(layer)
    }
}

extension NSLayoutConstraint {
    func withPriority(_ priority: Float) -> NSLayoutConstraint {
        self.priority = UILayoutPriority(priority)
        return self
    }
}

extension UIView {
    func withHorizontalInsets() {
        let insets = UIEdgeInsets(top: 0, left: Dimensions.horizontalSpacing, bottom: 0, right: Dimensions.horizontalSpacing)

        self.frame = self.frame.inset(by: insets)
    }
}

extension UITextField {
    func withBottomBorder(color: CGColor, height: CGFloat = 1.0) {
        let padding = 10.0
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height + padding, width: self.frame.size.width, height: height)
        bottomLine.backgroundColor = color
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}

extension UIEdgeInsets {
    static func topInset(_ value: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: value, left: 0, bottom: 0, right: 0)
    }
}
