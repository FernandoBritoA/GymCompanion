//
//  AddNewButton.swift
//  GymCompanion
//
//  Created by Fernando Brito on 09/09/23.
//

import UIKit

class AddNewButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)

        let horizontalSpacing = Dimensions.horizontalSpacing

        var config = UIButton.Configuration.plain()

        config.title = "Add New"

        config.imagePadding = 24.0
        config.image = UIImage(systemName: "plus")
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 16)

        config.contentInsets = NSDirectionalEdgeInsets(
            top: 0, leading: horizontalSpacing + 14, bottom: 0, trailing: horizontalSpacing)

        self.configuration = config
        tintColor = .label
        contentHorizontalAlignment = .leading
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override open var isHighlighted: Bool {
        didSet {
            super.isHighlighted = isHighlighted
            backgroundColor = isHighlighted ? .lightGray : .clear
        }
    }
}
