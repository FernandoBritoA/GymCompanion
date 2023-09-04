//
//  ExercisesTableViewController.swift
//  GymCompanion
//
//  Created by Fernando Brito on 01/09/23.
//

import UIKit

class ExerciseTableViewController: UITableViewController {
    private var viewModel = SearchListViewModel<Exercise>()

    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)

        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = K.ExerciseList.searchPlaceholder

        return searchController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        hidesBottomBarWhenPushed = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: K.ExerciseList.tvCellId)

        addSearchController()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.ExerciseList.tvCellId) else {
            return UITableViewCell()
        }

        let currentExercise = viewModel.getElement(by: indexPath)
        cell.textLabel?.text = currentExercise.name.capitalized
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let exercise = viewModel.getElement(by: indexPath)

        showBottomSheet(with: exercise)
    }

    private func showBottomSheet(with exercise: Exercise) {
        let vc = ExerciseDetailViewController()
        vc.configure(with: exercise)

        let nav = UINavigationController(rootViewController: vc)

        if let sheet = nav.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
        }

        present(nav, animated: true)
    }

    public func configure(with exerciseList: [Exercise], title: String) {
        navigationItem.title = title
        viewModel.addElements(exerciseList)

        tableView.reloadData()
    }
}

extension ExerciseTableViewController: UISearchResultsUpdating {
    private func addSearchController() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }

    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }

        viewModel.onChangeSearchText(searchText: text)

        tableView.reloadData()
    }
}
