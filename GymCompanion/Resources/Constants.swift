//
//  Constants.swift
//  GymCompanion
//
//  Created by Fernando Brito on 29/08/23.
//

import UIKit

struct K {
    enum Dimensions {
        static let spacing = 20.0
        static let screenWidth = UIScreen.main.bounds.width
        static let screenHeigth = UIScreen.main.bounds.height
    }

    enum Colors {
        static let Charcoal = "Charcoal"
    }

    enum MyRoutines {
        static let title = "My Routines"
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
