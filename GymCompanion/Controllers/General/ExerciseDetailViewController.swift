//
//  ExerciseDetailViewController.swift
//  GymCompanion
//
//  Created by Fernando Brito on 02/09/23.
//

import SwiftyGif
import UIKit

class ExerciseDetailViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()

        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor(named: Colors.Charcoal)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let gifImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(titleLabel)
        view.addSubview(gifImageView)
        setConstraints()
    }

    private func setConstraints() {
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 35),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ]

        let imageDimension = Dimensions.screenWidth / 1.5

        let gifImageViewConstraints = [
            gifImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            gifImageView.widthAnchor.constraint(equalToConstant: imageDimension),
            gifImageView.heightAnchor.constraint(equalToConstant: imageDimension),
            gifImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]

        NSLayoutConstraint.activate(titleLabelConstraints + gifImageViewConstraints)
    }

    public func configure(with model: ExerciseDetail) {
        guard let url = URL(string: model.gifUrl) else {
            return
        }

        let loader = UIActivityIndicatorView(style: .medium)
        gifImageView.setGifFromURL(url, customLoader: loader)
        titleLabel.text = model.name.capitalized
    }
}
