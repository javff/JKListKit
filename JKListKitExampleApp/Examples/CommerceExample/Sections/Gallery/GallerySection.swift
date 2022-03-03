//
//  GallerySection.swift
//  JKListKitExampleApp
//
//  Created by Juan vasquez on 03-03-22.
//

import JKListKit
import UIKit

struct GallerySectionModel: DiffableModel {
    let images: [String]
}

class GallerySection: BaseSectionController<GallerySectionModel, GallerySectionView> {

    override func createSection(in listView: ListView, model: GallerySectionModel) -> GallerySectionView {
        return GallerySectionView()
    }

    override func updateSection(listView: ListView, in view: GallerySectionView, model: GallerySectionModel) {
        view.backgroundColor = .red
    }
}
