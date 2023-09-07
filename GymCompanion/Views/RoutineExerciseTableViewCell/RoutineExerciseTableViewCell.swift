//
//  RoutineExerciseTableViewCell.swift
//  GymCompanion
//
//  Created by Fernando Brito on 06/09/23.
//

import UIKit

class RoutineExerciseTableViewCell: UITableViewCell {
    static let id: String = K.MyRoutines.RoutineExerciseList.tvCellId

    private let nameLabel: UILabel = {
        let label = UILabel()

        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let exerciseBreakDownStackView: RoutineExerciseBreakdownStackView = {
        let stackView = RoutineExerciseBreakdownStackView()

        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(exerciseBreakDownStackView)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.withHorizontalInsets()
        setupConstraints()
    }

    private func setupConstraints() {
        let nameLabelConstraints = [
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: exerciseBreakDownStackView.topAnchor, constant: -10),
        ]

        let stackHeight = contentView.frame.height * 0.40 // 50%

        let exerciseBreakDownStackViewConstraints = [
            exerciseBreakDownStackView.heightAnchor.constraint(equalToConstant: stackHeight),
            exerciseBreakDownStackView.widthAnchor.constraint(equalToConstant: contentView.frame.width),
        ]

        NSLayoutConstraint.activate(nameLabelConstraints + exerciseBreakDownStackViewConstraints)
    }

    public func configure(with model: RoutineExercise) {
        nameLabel.text = model.name
        exerciseBreakDownStackView.configure(with: model)
    }
}
