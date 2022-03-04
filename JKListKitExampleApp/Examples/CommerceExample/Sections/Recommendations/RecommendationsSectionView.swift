//
//  RecommendationsSectionView.swift
//  JKListKitExampleApp
//
//  Created by Juan vasquez on 04-03-22.
//

import UIKit

class RecommendationsSectionView: UIView {

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .fontTheme(size: 18)
        label.textColor = .grayScaleOn
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(titleLabel)
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }

    private func setupCell() {
        collectionView.register(RecommendationCell.self, forCellWithReuseIdentifier: "RecommendationCell")
    }
}
