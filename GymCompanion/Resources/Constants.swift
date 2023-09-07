//
//  Constants.swift
//  GymCompanion
//
//  Created by Fernando Brito on 29/08/23.
//

import UIKit

struct K {
    enum MyRoutines {
        static let title = "My Routines"

        enum RoutineList {
            static let tvCellId = "RoutineListTableViewCellId"
        }

        enum RoutineExerciseList {
            static let tvCellId = "RoutineExerciseListTableViewCellId"
        }
    }

    enum Explore {
        static let title = "Explore"
        static let searchPlaceholder = "Filter muscle groups"
        static let cvCellId = "ExploreCollectionViewCellId"
    }

    enum Settings {
        static let title = "Settings"
    }

    enum ExerciseList {
        static let tvCellId = "ExerciseListTableViewCellId"
        static let searchPlaceholder = "Filter exercises"
    }
}

enum Colors {
    static let Charcoal = "Charcoal"
}

enum Dimensions {
    static let horizontalSpacing = 20.0
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeigth = UIScreen.main.bounds.height
}
