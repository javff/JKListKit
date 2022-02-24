//
//  ExampleSection.swift
//  JKListKit
//
//  Created by Juan vasquez on 17-02-22.
//

import Foundation
import UIKit

struct ExampleSectionModel: DiffableModel {
    let color: UIColor
}

class ExampleSection: BaseSectionController<ExampleSectionModel, ExampleSectionView> {

    override func createSection(in listView: ListView, model: ExampleSectionModel) -> ExampleSectionView {
        return ExampleSectionView(height: 300)
    }

    override func updateSection(listView: ListView, in view: ExampleSectionView, model: ExampleSectionModel) {
        view.backgroundColor = model.color
    }
}
