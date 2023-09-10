//
//  TextInputViewController.swift
//  GymCompanion
//
//  Created by Fernando Brito on 09/09/23.
//

import UIKit

class TextInputViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    }

    private func configueNavigationBar() {
        // Remove bottom border from the navigation bar
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close, target: self, action: nil)
    }
}
