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

struct MusclePreview: NameFilter {
    var group: MuscleGroup
    var name: String

    init(group: MuscleGroup) {
        self.group = group
        self.name = "\(group)"
    }
}

enum Muscles {
    static let arr: [MusclePreview] = [
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
}
