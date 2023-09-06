//
//  SquaredImageTableViewCell.swift
//  GymCompanion
//
//  Created by Fernando Brito on 05/09/23.
//

import UIKit

class RoutineTableViewCell: UITableViewCell {
    static let id = K.MyRoutines.RoutineList.tvCellId

    private let squaredImageView: SquaredImageView = {
        let imageView = SquaredImageView()

        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()

        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(squaredImageView)
        contentView.addSubview(nameLabel)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
        setConstraints()
    }

    func setConstraints() {
        let imageSize = contentView.frame.height
        let labelPadding = 10.0

        let imageViewConstraints = [
            squaredImageView.widthAnchor.constraint(equalToConstant: imageSize).withPriority(999),
            squaredImageView.heightAnchor.constraint(equalToConstant: imageSize).withPriority(999),
            squaredImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Dimensions.horizontalSpacing),
        ]

        let nameLabelConstraints = [
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: squaredImageView.trailingAnchor, constant: labelPadding),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -labelPadding),
        ]

        NSLayoutConstraint.activate(imageViewConstraints + nameLabelConstraints)
    }

    public func configure(with model: Routine) {
        if let image = UIImage(systemName: model.type.rawValue) {
            squaredImageView.setImage(image)
        }

        nameLabel.text = model.name
    }
}
