//
//  Exercise.swift
//  GymCompanion
//
//  Created by Fernando Brito on 01/09/23.
//

import Foundation

enum Difficulty: String, Decodable {
    case beginner
    case intermediate
    case expert
}

struct Exercise: Decodable {
    let name: String
    let muscle: String
    let equipment: String
    let difficulty: Difficulty
    let instructions: String
}
