//
//  DropDown.swift
//  GymCompanion
//
//  Created by Fernando Brito on 10/09/23.
//

import UIKit

class DropDown: UIStackView {
    private var viewModel = DropDownViewModel()

    private let mainButton = UIButton()

    init(model: DropDownModel) {
        super.init(frame: CGRect(x: 0, y: 200, width: 200, height: 500))

        setupStackView()
        viewModel.configure(with: model)

        mainButton.configuration = viewModel.getButtonConfiguration(
            title: model.placeholder,
            type: .primary
        )

        mainButton.addAction(UIAction(handler: { [weak self] _ in
            self?.onDropDownPress()
        }), for: .touchUpInside)

        addArrangedSubview(mainButton)
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupStackView() {
        spacing = 5
        axis = .vertical
        distribution = .fillEqually
    }
}

extension DropDown {
    private func onDropDownPress() {
        for option in viewModel.options {
            let button = UIButton()
            button.configuration = viewModel.getButtonConfiguration(
                title: option,
                type: .secondary
            )

            addArrangedSubview(button)
        }
    }
}
