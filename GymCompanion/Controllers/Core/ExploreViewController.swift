//
//  ExploreViewController.swift
//  GymCompanion
//
//  Created by Fernando Brito on 29/08/23.
//

import UIKit

class ExploreViewController: UIViewController {
    private let muscleCollectionView: UICollectionView = {
        let spacing = K.Dimensions.spacing
        let squareDimension = (K.Dimensions.screenWidth - spacing * 3) / 2

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

        view.backgroundColor = .systemBackground

        addCollectionView()
    }

    private func addCollectionView() {
        view.addSubview(muscleCollectionView)

        muscleCollectionView.delegate = self
        muscleCollectionView.dataSource = self
        muscleCollectionView.frame = view.bounds
    }
}

extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return muscleArr.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = muscleCollectionView.dequeueReusableCell(withReuseIdentifier: MuscleCollectionViewCell.id, for: indexPath) as? MuscleCollectionViewCell else {
            return UICollectionViewCell()
        }

        let muscle = muscleArr[indexPath.row]
        cell.configure(with: muscle)

        return cell
    }
}
