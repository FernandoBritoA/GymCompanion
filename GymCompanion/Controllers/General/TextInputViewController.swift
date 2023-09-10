//
//  TextInputViewController.swift
//  GymCompanion
//
//  Created by Fernando Brito on 09/09/23.
//

import UIKit

class TextInputViewController: UIViewController {
    private let textField: CustomTextField = {
        let textField = CustomTextField()

        textField.label.text = "Name your routine"
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configueNavigationBar()
        view.backgroundColor = .systemBackground

        view.addSubview(textField)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        setupConstraints()
    }

    private func configueNavigationBar() {
        // Remove bottom border from the navigation bar
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close, target: self, action: #selector(onClose))
    }

    @objc private func onClose() {
        dismiss(animated: true)
    }

    private func setupConstraints() {
        let textFieldConstraints = [
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Dimensions.horizontalSpacing),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Dimensions.horizontalSpacing)
        ]

        NSLayoutConstraint.activate(textFieldConstraints)
    }
}
