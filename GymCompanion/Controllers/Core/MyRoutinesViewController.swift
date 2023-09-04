//
//  MyRoutinesViewController.swift
//  GymCompanion
//
//  Created by Fernando Brito on 29/08/23.
//

import UIKit

class MyRoutinesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
    }

    private func setUpView() {
        navigationItem.title = K.MyRoutines.title
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
