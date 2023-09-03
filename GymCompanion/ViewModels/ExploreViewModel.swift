//
//  ExploreViewModel.swift
//  GymCompanion
//
//  Created by Fernando Brito on 30/08/23.
//

import Foundation

struct ExploreViewModel {
    private var searchText: String = ""

    private let muscleArr: [MusclePreview] = [
        MusclePreview(group: .abdominals),
        MusclePreview(group: .abductors),
        MusclePreview(group: .adductors),
        MusclePreview(group: .back),
        MusclePreview(group: .biceps),
        MusclePreview(group: .calves),
        MusclePreview(group: .cardio),
        MusclePreview(group: .chest),
        MusclePreview(group: .deltoids),
        MusclePreview(group: .forearms),
        MusclePreview(group: .glutes),
        MusclePreview(group: .hamstrings),
        MusclePreview(group: .lats),
        MusclePreview(group: .quadriceps),
        MusclePreview(group: .traps),
        MusclePreview(group: .triceps),
    ]

    public var results: [MusclePreview] {
        if searchText == "" {
            return muscleArr
        }

        return muscleArr.filter { muscle in
            muscle.title.contains(searchText)
        }
    }

    public mutating func onChangeText(newText: String) {
        searchText = newText
    }

    public func getMuscle(by indexPath: IndexPath) -> MusclePreview {
        return results[indexPath.row]
    }
}
