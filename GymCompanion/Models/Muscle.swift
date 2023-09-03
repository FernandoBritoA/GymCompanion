//
//  Muscle.swift
//  GymCompanion
//
//  Created by Fernando Brito on 29/08/23.
//

import UIKit

enum MuscleGroup: String {
    case abdominals = "abs"
    case abductors
    case adductors
    case back = "upper%20back"
    case biceps
    case calves
    case cardio
    case chest = "pectorals"
    case deltoids = "delts"
    case forearms
    case glutes
    case hamstrings
    case lats
    case quadriceps = "quads"
    case traps
    case triceps
}

struct MusclePreview {
    var group: MuscleGroup
    var imageName: String
    var title: String

    init(group: MuscleGroup) {
        let groupText = "\(group)"

        self.group = group
        self.imageName = groupText
        self.title = groupText.capitalized
    }
}
