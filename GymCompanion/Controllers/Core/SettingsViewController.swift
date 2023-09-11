//
//  SettingsViewController.swift
//  GymCompanion
//
//  Created by Fernando Brito on 29/08/23.
//

import UIKit

class SettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        let dropdown = DropDown(model: DropDownModel(
            data: ["Banana", "Apple", "Kiwi"],
            placeholder: "Select a Fruit"))
        view.addSubview(dropdown)
    }
}
