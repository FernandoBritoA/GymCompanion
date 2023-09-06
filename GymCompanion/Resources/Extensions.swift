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
