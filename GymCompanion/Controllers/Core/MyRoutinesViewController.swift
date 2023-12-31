//
//  MyRoutinesViewController.swift
//  GymCompanion
//
//  Created by Fernando Brito on 29/08/23.
//

import UIKit

class MyRoutinesViewController: UIViewController {
    private var viewModel = ListViewModel<Routine>(renderList: [
        Routine(name: "Balance", type: .balance, exercises: [
            RoutineExercise(
                name: "Bicep curl lonfert, louder sir that is a scen from the office between jim and dwight very funny",
                gifUrl: "https://api.exercisedb.io/image/tguZB-Omyct6gb",
                repetitions: 10,
                sets: 3,
                weight: 20),
            RoutineExercise(
                name: "Stetching",
                gifUrl: "https://api.exercisedb.io/image/tguZB-Omyct6gb",
                repetitions: 15,
                sets: 5,
                weight: 0),
        ]),
        Routine(name: "Core Training", type: .core, exercises: []),
        Routine(name: "Functional Training", type: .functional, exercises: []),
        Routine(name: "Mobility training", type: .mobility, exercises: []),
        Routine(name: "Strength", type: .strength, exercises: []),
        Routine(name: "Stretching", type: .stretching, exercises: []),
    ])
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.separatorStyle = .none
        tableView.register(RoutineTableViewCell.self, forCellReuseIdentifier: RoutineTableViewCell.id)
        tableView.estimatedRowHeight = 60.0
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupTableView()
    }

    private func setupView() {
        view.backgroundColor = .systemBackground
        
        navigationItem.title = K.MyRoutines.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: #selector(onAddRoutine))
        navigationItem.rightBarButtonItem?.tintColor = .label
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

extension MyRoutinesViewController: UITableViewDelegate, UITableViewDataSource {
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.contentInset = UIEdgeInsets.topInset(20)
      
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
        
        let routine = viewModel.getElement(by: indexPath)
        let vc = RoutineExerciseTableViewController(model: routine)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            
            viewModel.removeElement(by: indexPath)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension MyRoutinesViewController: TextInputViewControllerDelegate {
    @objc private func onAddRoutine() {
        let vc = TextInputViewController()
        vc.delegete = self
        let nav = UINavigationController(rootViewController: vc)

        present(nav, animated: true)
    }
    
    func textInputDidSubmit(_ viewModel: TextInputViewController, routine: Routine) {
        self.viewModel.addElements([routine])
        
        tableView.reloadData()
    }
}
