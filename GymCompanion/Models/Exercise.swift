//
//  Exercise.swift
//  GymCompanion
//
//  Created by Fernando Brito on 01/09/23.
//

import Foundation

struct Exercise: Decodable {
    let bodyPart: String
    let equipment: String
    let gifUrl: String
    let id: String
    let name: String
    let target: String
}
