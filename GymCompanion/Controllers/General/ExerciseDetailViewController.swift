//
//  ExerciseDetailViewController.swift
//  GymCompanion
//
//  Created by Fernando Brito on 02/09/23.
//

import UIKit

class ExerciseDetailViewController: UIViewController {
    private let gifImageView: UIImageView = {
        let imageView = UIImageView()

        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        gifImageView.frame = view.bounds
    }

    public func configure(with model: Exercise) {}
}
