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

extension String {
    func hasValue() -> Bool {
        let trimmedString = self.trimmingCharacters(in: .whitespaces)

        return !trimmedString.isEmpty
    }
}

extension UIViewController {
    func showToast(message: String, type: ToastType) {
        let padding = 5.0
        let verticalOffset = 50.0
        let horizontalOffset = 20.0
        let bgColor: UIColor = type == .success ? .black : .systemRed

        let containerView = UIView(frame: CGRect(
            x: horizontalOffset,
            y: verticalOffset,
            width: self.view.frame.width - horizontalOffset * 2,
            height: 40 + padding * 2))

        let toastLabel = UILabel(frame: CGRect(
            x: padding,
            y: padding,
            width: containerView.frame.width - padding * 2,
            height: containerView.frame.height - padding * 2))

        containerView.alpha = 1.0
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 8
        containerView.backgroundColor = bgColor.withAlphaComponent(0.9)

        toastLabel.text = message
        toastLabel.numberOfLines = 2
        toastLabel.textAlignment = .center
        toastLabel.textColor = UIColor.white
        toastLabel.font = .systemFont(ofSize: 12)

        containerView.addSubview(toastLabel)
        self.view.addSubview(containerView)

        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            containerView.alpha = 0.0
        }, completion: { _ in
            containerView.removeFromSuperview()
        })
    }
}
