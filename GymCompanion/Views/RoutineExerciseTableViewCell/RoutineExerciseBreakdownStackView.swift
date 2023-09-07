//
//  RoutineBreakdownStackView.swift
//  GymCompanion
//
//  Created by Fernando Brito on 06/09/23.
//

import UIKit

class RoutineExerciseBreakdownStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupStackView()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupStackView() {
        spacing = 1
        axis = .horizontal
        distribution = .fillEqually
        backgroundColor = .lightGray
    }

    public func configure(with model: RoutineExercise) {
        let measure = "Kg"

        let data = [
            ["Sets", "\(model.sets)"],
            ["Repetitions", "\(model.repetitions)"],
            ["Weight", "\(model.weight) \(measure)"],
        ]
        for element in data {
            let columnView = ExerciseColumnView()
            columnView.configure(title: element[0], content: element[1])
            addArrangedSubview(columnView)
        }
    }
}
