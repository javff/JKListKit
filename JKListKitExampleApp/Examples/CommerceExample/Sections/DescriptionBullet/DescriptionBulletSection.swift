//
//  DescriptionBulletSection.swift
//  JKListKitExampleApp
//
//  Created by Juan vasquez on 03-03-22.
//

import JKListKit
import UIKit

struct DescriptionBulletSectionModel: DiffableModel {
    let title: String
    let description: String
}

class DescriptionBulletSection: BaseSectionController<DescriptionBulletSectionModel, DescriptionBulletSectionView> {

    override func createSection(in listView: ListView, model: DescriptionBulletSectionModel) -> DescriptionBulletSectionView {
        let view = DescriptionBulletSectionView()
        view.titleLabel.text = model.title
        view.descriptionLabel.text = model.description
        return view
    }
}
