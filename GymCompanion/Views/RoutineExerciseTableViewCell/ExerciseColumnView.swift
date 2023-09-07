//
//  ExerciseColumnView.swift
//  GymCompanion
//
//  Created by Fernando Brito on 06/09/23.
//

import UIKit

class ExerciseColumnView: UIView {
    let titleLabel = UILabel()
    let contentLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        backgroundColor = .systemBackground
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        setupConstraints()
    }

    private func setupView() {
        addSubview(titleLabel)
        addSubview(contentLabel)
    }

    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.translatesAutoresizingMaskIntoConstraints = false

        let titleLabelConstraiints = [
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentLabel.topAnchor),
        ]

        let contentHeight = frame.height * 0.60 // 60%

        let contentLabelConstraiints = [
            contentLabel.heightAnchor.constraint(equalToConstant: contentHeight),
            contentLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ]

        NSLayoutConstraint.activate(titleLabelConstraiints + contentLabelConstraiints)
    }

    public func configure(title: String, content: String) {
        titleLabel.text = title
        titleLabel.textAlignment = .center

        contentLabel.text = content
        contentLabel.textAlignment = .center
    }
}
