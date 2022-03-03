//
//  MainActionsSection.swift
//  JKListKitExampleApp
//
//  Created by Juan vasquez on 03-03-22.
//

import JKListKit
import UIKit

struct MainActionsSectionModel: DiffableModel {


}

class MainActionsSection: BaseSectionController<MainActionsSectionModel, MainActionsSectionView> {

    override var lateralSpacing: CGFloat? {
        .zero
    }

    override func createSection(in listView: ListView, model: MainActionsSectionModel) -> MainActionsSectionView {
        return MainActionsSectionView()
    }
}
