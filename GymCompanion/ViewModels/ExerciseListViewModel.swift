//
//  ExerciseListViewModel.swift
//  GymCompanion
//
//  Created by Fernando Brito on 02/09/23.
//

import Foundation

struct ExerciseListViewModel {
    private var searchText: String = ""

    private var exercises: [Exercise] = []

    public var results: [Exercise] {
        if searchText == "" {
            return exercises
        }

        return exercises.filter { exercise in
            exercise.name.contains(searchText)
        }
    }

    public mutating func addExercises(exerciseList: [Exercise]) {
        exercises += exerciseList
    }

    public func getNumberOfRows() -> Int {
        return results.count
    }

    public mutating func onChangeText(newText: String) {
        searchText = newText
    }

    public func getExercise(by indexPath: IndexPath) -> Exercise {
        return results[indexPath.row]
    }
}
