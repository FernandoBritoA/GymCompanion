//
//  Model.swift
//  GymCompanion
//
//  Created by Fernando Brito on 10/09/23.
//

import UIKit

struct ColorPalette {
    let primary: UIColor
    let secondary: UIColor
    let text: UIColor
}

struct DropDownModel {
    let data: [String]
    let placeholder: String
    let colorPalette: ColorPalette? = nil
}
