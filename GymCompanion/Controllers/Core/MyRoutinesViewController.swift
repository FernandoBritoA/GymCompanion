//
//  MyRoutinesViewController.swift
//  GymCompanion
//
//  Created by Fernando Brito on 29/08/23.
//

import UIKit

class MyRoutinesViewController: UIViewController {
    private var viewModel = ListViewModel<Routine>(renderList: [
        Routine(name: "Balance", type: .balance),
        Routine(name: "Core Training", type: .core),
        Routine(name: "Functional Training", type: .functional),
        Routine(name: "Mobility training", type: .mobility),
        Routine(name: "Strength", type: .strength),
        Routine(name: "Stretching", type: .stretching),
    ])

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupTableView()
    }

    private func setupView() {
        navigationItem.title = K.MyRoutines.title
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension MyRoutinesViewController: UITableViewDelegate, UITableViewDataSource {
    private func setupTableView() {
        let tableView = UITableView()

        tableView.separatorStyle = .none
        tableView.register(RoutineTableViewCell.self, forCellReuseIdentifier: RoutineTableViewCell.id)

        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RoutineTableViewCell.id) as? RoutineTableViewCell else {
            return UITableViewCell()
        }

        let routine = viewModel.getElement(by: indexPath)
        cell.configure(with: routine)
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
