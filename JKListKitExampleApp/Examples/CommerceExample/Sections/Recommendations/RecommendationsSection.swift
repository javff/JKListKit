//
//  RecommendationsSection.swift
//  JKListKitExampleApp
//
//  Created by Juan vasquez on 04-03-22.
//

import JKListKit
import UIKit

struct RecommendationItem {
    let image: String
    let title: String
    let description: String
    let price: Double
}

struct RecommendationsSectionModel: DiffableModel {
    let title: String
    let items: [RecommendationItem]
}

typealias RecomendationsSectionController = BaseSectionController<RecommendationsSectionModel, RecommendationsSectionView>

class RecommendationsSection: RecomendationsSectionController {

    var items: [RecommendationItem] = []

    override func createSection(in listView: ListView, model: RecommendationsSectionModel) -> RecommendationsSectionView {
        let view = RecommendationsSectionView()
        view.collectionView.delegate = self
        view.collectionView.dataSource = self
        return view
    }

    override func updateSection(listView: ListView, in view: RecommendationsSectionView, model: RecommendationsSectionModel) {
        items = model.items
        view.titleLabel.text = model.title.uppercased()
        view.collectionView.reloadData()
    }
}

extension RecommendationsSection: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendationCell", for: indexPath) as? RecommendationCell else {
            fatalError("verify cell identifier")
        }

        let item = items[indexPath.item]
        cell.imageProductView.image = UIImage(named: item.image)
        cell.titleLabel.text = item.title
        cell.descriptionLabel.text = item.description
        cell.priceLabel.text = item.price.formatCurrency()
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width / 2) + 48, height: collectionView.bounds.height)
    }
}
