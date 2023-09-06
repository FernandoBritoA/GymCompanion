//
//  SquaredImageView.swift
//  GymCompanion
//
//  Created by Fernando Brito on 05/09/23.
//

import UIKit

class SquaredImageView: UIView {
    private let imageView: UIImageView = {
        let image = UIImageView()

        image.tintColor = .lightGray
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        setConstraints()
    }

    private func setupView() {
        backgroundColor = UIColor(named: Colors.Charcoal)
        addSubview(imageView)
    }

    private func setConstraints() {
        let padding = 15.0
        let imageViewConstraints = [
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
        ]

        NSLayoutConstraint.activate(imageViewConstraints)
    }

    public func setImage(_ image: UIImage) {
        imageView.image = image
    }
}
