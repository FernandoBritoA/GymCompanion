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

        contentView.backgroundColor = .gray

        contentView.addSubview(muscleImageView)
        muscleImageView.frame = frame

        contentView.addSubview(muscleLabel)
        muscleLabel.frame = frame
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
        muscleImageView.image = UIImage(named: model.imageName)
        muscleLabel.text = model.title
    }
}
