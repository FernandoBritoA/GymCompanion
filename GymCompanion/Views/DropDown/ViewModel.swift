//
//  ViewModel.swift
//  GymCompanion
//
//  Created by Fernando Brito on 10/09/23.
//

import UIKit

enum ButtonType: String {
    case primary
    case secondary
}

struct DropDownViewModel {
    private var data: [String] = []

    private var selectedElement: String = ""
    public var options: [String] {
        data.filter { element in
            element != selectedElement
        }
    }

    private var colorPalette = ColorPalette(
        primary: .black,
        secondary: .gray,
        text: .white
    )

    private func getColorBy(type: ButtonType) -> UIColor {
        switch type {
            case .primary:
                return colorPalette.primary

            case .secondary:
                return colorPalette.secondary
        }
    }

    public func getButtonConfiguration(title: String, type: ButtonType) -> UIButton.Configuration {
        let verticalPadding = 5.0
        let horizontalPadding = 10.0

        var configuration = UIButton.Configuration.filled()

        configuration.title = title
        configuration.baseBackgroundColor = getColorBy(type: type)
        configuration.contentInsets = NSDirectionalEdgeInsets(
            top: verticalPadding,
            leading: horizontalPadding,
            bottom: verticalPadding,
            trailing: horizontalPadding
        )

        return configuration
    }

    public mutating func configure(with model: DropDownModel) {
        data = model.data

        if let newPalette = model.colorPalette {
            colorPalette = newPalette
        }
    }
}
