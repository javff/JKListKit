//
//  VerticalGallerySection.swift
//  JKListKitExampleApp
//
//  Created by Juan vasquez on 07-03-22.
//

import JKListKit
import UIKit

class VerticalGallerySection: BaseSectionController<GallerySectionModel, VerticalGallerySectionView> {

    override var lateralSpacing: CGFloat? {
        .zero
    }

    override func createSection(in listView: ListView, model: GallerySectionModel) -> VerticalGallerySectionView {
        let view = VerticalGallerySectionView()
        model.images.forEach {
            view.addImage($0, height: 320)
        }
        return view
    }
}
