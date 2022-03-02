//
//  ExampleSection.swift
//  JKListKit
//
//  Created by Juan vasquez on 17-02-22.
//

import UIKit
import JKListKit

struct ExampleSectionModel: DiffableModel {
    let color: UIColor
    let height: CGFloat
}

class ExampleSection: BaseSectionController<ExampleSectionModel, ExampleSectionView> {

    override func createSection(in listView: ListView, model: ExampleSectionModel) -> ExampleSectionView {
        return ExampleSectionView(height: model.height)
    }

    override func updateSection(listView: ListView, in view: ExampleSectionView, model: ExampleSectionModel) {
        view.backgroundColor = model.color
    }
}
