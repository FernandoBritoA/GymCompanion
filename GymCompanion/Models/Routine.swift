//
//  Routine.swift
//  GymCompanion
//
//  Created by Fernando Brito on 03/09/23.
//

import Foundation

enum RoutineType: String {
    case balance = "figure.barre"
    case core = "figure.core.training"
    case functional = "figure.rower"
    case mobility = "figure.step.training"
    case strength = "figure.strengthtraining.traditional"
    case stretching = "figure.cooldown"
}

struct Routine {
    let name: String
    let type: RoutineType
    let exercises: [RoutineExercise]
}

struct RoutineExercise: ExerciseDetail {
    let name: String
    let gifUrl: String
    let repetitions: Int
    let sets: Int
    let weight: Double
}
