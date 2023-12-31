//
//  ExploreViewController.swift
//  GymCompanion
//
//  Created by Fernando Brito on 29/08/23.
//

import UIKit

class ExploreViewController: UIViewController {
    private var viewModel = SearchListViewModel<MusclePreview>(renderList: Muscles.arr)

    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)

        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = K.Explore.searchPlaceholder

        return searchController
    }()

    private let muscleCollectionView: UICollectionView = {
        let spacing = Dimensions.horizontalSpacing
        let squareDimension = (Dimensions.screenWidth - spacing * 3) / 2

        let layout = UICollectionViewFlowLayout()

        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.itemSize = CGSize(width: squareDimension, height: squareDimension)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear

        collectionView.contentInset = UIEdgeInsets(top: spacing, left: spacing, bottom: 0, right: spacing)
        collectionView.register(MuscleCollectionViewCell.self, forCellWithReuseIdentifier: MuscleCollectionViewCell.id)

        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = K.Explore.title
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true

        addCollectionView()
        addSearchController()
    }

    private func addCollectionView() {
        view.addSubview(muscleCollectionView)

        muscleCollectionView.delegate = self
        muscleCollectionView.dataSource = self
        muscleCollectionView.frame = view.bounds
    }

    private func addSearchController() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
}

extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = muscleCollectionView.dequeueReusableCell(withReuseIdentifier: MuscleCollectionViewCell.id, for: indexPath) as? MuscleCollectionViewCell else {
            return UICollectionViewCell()
        }

        let muscle = viewModel.getElement(by: indexPath)
        cell.configure(with: muscle)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let muscle = viewModel.getElement(by: indexPath)

        Task { [weak self] in
            let result = await ApiCaller.shared.getExercises(by: muscle.group)

            switch result {
                case .success(let exerciseList):
                    DispatchQueue.main.async {
                        let vc = ExerciseTableViewController()
                        vc.configure(with: exerciseList, title: muscle.name.capitalized)

                        self?.navigationController?.pushViewController(vc, animated: true)
                    }

                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}

extension ExploreViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }

        viewModel.onChangeSearchText(searchText: text)
        muscleCollectionView.reloadData()
    }
}
