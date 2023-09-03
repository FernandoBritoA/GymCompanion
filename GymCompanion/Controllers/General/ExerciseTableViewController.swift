//
//  ExercisesTableViewController.swift
//  GymCompanion
//
//  Created by Fernando Brito on 01/09/23.
//

import UIKit

class ExerciseTableViewController: UITableViewController {
    private var exercises: [Exercise] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        hidesBottomBarWhenPushed = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: K.ExerciseList.tvCellId)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.ExerciseList.tvCellId) else {
            return UITableViewCell()
        }

        let currentExercise = exercises[indexPath.row]
        cell.textLabel?.text = currentExercise.name.capitalized
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    public func configure(with exerciseList: [Exercise], title: String) {
        exercises = exerciseList
        navigationItem.title = title
        tableView.reloadData()
    }
}
