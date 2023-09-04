//
//  MuscleCollectionViewCell.swift
//  GymCompanion
//
//  Created by Fernando Brito on 29/08/23.
//

import UIKit

class MuscleCollectionViewCell: UICollectionViewCell {
    static let id: String = K.Explore.cvCellId

    private let muscleImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    let muscleLabel: UILabel = {
        let label = UILabel()

        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 28)

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(muscleImageView)
        muscleImageView.frame = contentView.bounds
        muscleImageView.addColorLayer(with: CGColor(gray: 0.2, alpha: 0.5))

        contentView.addSubview(muscleLabel)
        muscleLabel.frame = contentView.bounds
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        muscleLabel.text = ""
        muscleImageView.image = nil
    }

    public func configure(with model: MusclePreview) {
        muscleImageView.image = UIImage(named: model.name)
        muscleLabel.text = model.name.capitalized
    }
}
