//
//  CommercePresenter.swift
//  JKListKitExampleApp
//
//  Created by Juan vasquez on 03-03-22.
//

import JKListKit

class CommercePresenter: BasicExamplePresenterProtocol {

    weak var view: BasicExampleViewProtocol?

    let galleryData: BaseSectionData = {
        .init(
            identifier: BaseSectionIdentifier(id: "gallery", type: "gallery"),
            data: GallerySectionModel(images: [])
        )
    }()

    let shortDescriptionData: BaseSectionData = {
        .init(
            identifier: BaseSectionIdentifier(id: "shortDescription", type: "shortDescription"),
            data: ShortDescriptionSectionModel(title: "", description: "", price: "")
        )
    }()

    let mainAction: BaseSectionData = {
        .init(
            identifier: BaseSectionIdentifier(id: "mainAction", type: "mainAction"),
            data: MainActionsSectionModel()
        )
    }()

    let materialBullet: BaseSectionData = {
        .init(
            identifier: BaseSectionIdentifier(id: "id2", type: "descriptionBullet"),
            data: DescriptionBulletSectionModel(title: "MATERIALS", description: "We work with monitoring programmes to ensure compliance with safety, health and quality standards for our products.")
        )
    }()

    let careBullet: BaseSectionData = {
        .init(
            identifier: BaseSectionIdentifier(id: "id3", type: "descriptionBullet"),
            data: DescriptionBulletSectionModel(title: "CARE", description: "To keep your jackets and coats clean, you only need to freshen them up and go over them with a cloth or a clothes brush. If you need to dry clean a garment, look for a dry cleaner that uses technologies that are respectful of the environment.")
        )
    }()

    var mockData: [BaseSectionData] {
        [galleryData, shortDescriptionData, mainAction, materialBullet, careBullet]
    }

    func loadSections() {
        view?.loadSections(mockData)
    }

    func bindView(_ view: BasicExampleViewProtocol) {
        self.view = view
    }
}
