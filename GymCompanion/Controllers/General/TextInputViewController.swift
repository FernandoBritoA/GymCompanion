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

        textField.label.text = K.MyRoutines.nameYourRoutine
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()

    private let addButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()

        config.title = K.MyRoutines.addRoutine
        config.baseBackgroundColor = UIColor(named: Colors.Charcoal)

        config.contentInsets = NSDirectionalEdgeInsets(
            top: 10, leading: 10, bottom: 10, trailing: 10)

        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configueNavigationBar()
        view.backgroundColor = .systemBackground

        view.addSubview(textField)
        view.addSubview(addButton)
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
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Dimensions.horizontalSpacing),
        ]

        let buttonConstraints = [
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 50),
        ]

        NSLayoutConstraint.activate(textFieldConstraints + buttonConstraints)
    }
}

extension TextInputViewController {}
