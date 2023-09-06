//
//  Exercise.swift
//  GymCompanion
//
//  Created by Fernando Brito on 01/09/23.
//

import Foundation

protocol ExerciseDetail {
    var name: String { get }
    var gifUrl: String { get }
}

struct Exercise: Decodable, NameFilter, ExerciseDetail {
    let bodyPart: String
    let equipment: String
    let gifUrl: String
    let id: String
    let name: String
    let target: String
}
