//
//  TextInputViewController.swift
//  GymCompanion
//
//  Created by Fernando Brito on 09/09/23.
//

import UIKit

protocol TextInputViewControllerDelegate: AnyObject {
    func textInputDidSubmit(_ viewModel: TextInputViewController, routine: Routine)
}

class TextInputViewController: UIViewController {
    public weak var delegete: TextInputViewControllerDelegate?

    private let input: CustomInput = {
        let input = CustomInput()

        input.label.text = K.MyRoutines.nameYourRoutine
        input.translatesAutoresizingMaskIntoConstraints = false

        return input
    }()

    private let addRoutineButton: UIButton = {
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
        input.textField.delegate = self
        input.textField.becomeFirstResponder()
        view.backgroundColor = .systemBackground

        addRoutineButton.addAction(UIAction(handler: { [weak self] _ in
            self?.onSubmit()
        }), for: .touchUpInside)

        view.addSubview(input)
        view.addSubview(addRoutineButton)
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
        let inputConstraints = [
            input.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            input.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Dimensions.horizontalSpacing),
            input.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Dimensions.horizontalSpacing),
        ]

        let buttonConstraints = [
            addRoutineButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addRoutineButton.topAnchor.constraint(equalTo: input.bottomAnchor, constant: 50),
        ]

        NSLayoutConstraint.activate(inputConstraints + buttonConstraints)
    }
}

extension TextInputViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        onSubmit()

        return true
    }

    private func onSubmit() {
        guard let routineName = input.textField.text, routineName.hasValue() else {
            showToast(message: "Invalid Text", type: .error)

            return
        }

        delegete?.textInputDidSubmit(self, routine: Routine(name: routineName, type: .strength, exercises: []))
        onClose()
    }
}
