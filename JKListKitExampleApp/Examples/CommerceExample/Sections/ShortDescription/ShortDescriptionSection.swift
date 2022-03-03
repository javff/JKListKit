//
//  ShortDescriptionSection.swift
//  JKListKitExampleApp
//
//  Created by Juan vasquez on 03-03-22.
//

import JKListKit

struct ShortDescriptionSectionModel: DiffableModel {
    let title: String
    let description: String
    let price: String
}

class ShortDescriptionSection: BaseSectionController<ShortDescriptionSectionModel, ShortDescriptionSectionView> {

    override func createSection(in listView: ListView, model: ShortDescriptionSectionModel) -> ShortDescriptionSectionView {
        return ShortDescriptionSectionView()
    }
}
