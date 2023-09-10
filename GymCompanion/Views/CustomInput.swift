//
//  CustomInput.swift
//  GymCompanion
//
//  Created by Fernando Brito on 09/09/23.
//

import UIKit

class CustomInput: UIStackView {
    let label: UILabel = {
        let lbl = UILabel()

        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 20)

        return lbl
    }()

    let textField: UITextField = {
        let textField = UITextField()

        textField.returnKeyType = .done
        textField.font = .systemFont(ofSize: 30)
        textField.tintColor = UIColor(named: Colors.Charcoal)

        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupStackView()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        setupContrastColor()
    }

    private func setupContrastColor() {
        var contrastColor: UIColor = .white

        if traitCollection.userInterfaceStyle == .light, let color = UIColor(named: Colors.Charcoal) {
            contrastColor = color
        }

        label.textColor = contrastColor
        textField.textColor = contrastColor
        textField.withBottomBorder(color: contrastColor.cgColor)
    }

    private func setupStackView() {
        spacing = 60
        axis = .vertical

        addArrangedSubview(label)
        addArrangedSubview(textField)
    }
}
