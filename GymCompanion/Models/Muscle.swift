//
//  Muscle.swift
//  GymCompanion
//
//  Created by Fernando Brito on 29/08/23.
//

import UIKit

enum MuscleGroup: String {
    case abdominals
    case abductors
    case adductors
    case biceps
    case calves
    case chest
    case forearms
    case glutes
    case hamstrings
    case lats
    case lowerBack = "lower_back"
    case middleBack = "middle_back"
    case neck
    case quadriceps
    case traps
    case triceps
}

struct MusclePreview {
    var group: MuscleGroup
    var imageName: String

    var title: String {
        var result = ""
        let wordsArr = group.rawValue.split(separator: Character("_"))

        for word in wordsArr {
            result += "\(word.capitalized) "
        }

        return result
    }

    init(group: MuscleGroup) {
        self.group = group
        self.imageName = group.rawValue
    }
}

let muscleArr: [MusclePreview] = [
    MusclePreview(group: .abdominals),
    MusclePreview(group: .abductors),
    MusclePreview(group: .adductors),
    MusclePreview(group: .biceps),
    MusclePreview(group: .calves),
    MusclePreview(group: .chest),
    MusclePreview(group: .forearms),
    MusclePreview(group: .glutes),
    MusclePreview(group: .hamstrings),
    MusclePreview(group: .lats),
    MusclePreview(group: .lowerBack),
    MusclePreview(group: .middleBack),
    MusclePreview(group: .neck),
    MusclePreview(group: .quadriceps),
    MusclePreview(group: .traps),
    MusclePreview(group: .triceps),
]
