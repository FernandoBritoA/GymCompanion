//
//  RoutineExerciseTableViewController.swift
//  GymCompanion
//
//  Created by Fernando Brito on 06/09/23.
//

import UIKit

class RoutineExerciseTableViewController: UITableViewController {
    private var viewModel = ListViewModel<RoutineExercise>()

    init(model: Routine) {
        super.init(style: .plain)

        navigationItem.title = model.name
        viewModel.addElements(model.exercises)

        tableView.reloadData()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = editButtonItem
        hidesBottomBarWhenPushed = true
        tableView.register(RoutineExerciseTableViewCell.self, forCellReuseIdentifier: RoutineExerciseTableViewCell.id)

        let headerButton = AddNewButton(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 60), primaryAction: UIAction { _ in
            print("Add New")
        })

        tableView.tableHeaderView = headerButton
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RoutineExerciseTableViewCell.id) as? RoutineExerciseTableViewCell else {
            return UITableViewCell()
        }

        let currentExercise = viewModel.getElement(by: indexPath)
        cell.configure(with: currentExercise)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let exercise = viewModel.getElement(by: indexPath)

        showBottomSheet(with: exercise)
    }

    private func showBottomSheet(with exercise: ExerciseDetail) {
        let vc = ExerciseDetailViewController()
        vc.configure(with: exercise)

        let nav = UINavigationController(rootViewController: vc)

        if let sheet = nav.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
        }

        present(nav, animated: true)
    }
}
