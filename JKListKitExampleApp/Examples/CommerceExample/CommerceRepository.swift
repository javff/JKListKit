//
//  CommerceRepository.swift
//  JKListKitExampleApp
//
//  Created by Juan vasquez on 04-03-22.
//

import JKListKit

protocol CommerceRepositoryProtocol: AnyObject {
    func getLayoutSections() async -> [BaseSectionData]
}

class MockCommerceRepository: CommerceRepositoryProtocol {

    let galleryData: BaseSectionData = {
        .init(
            identifier: BaseSectionIdentifier(id: "gallery", type: "gallery"),
            data: GallerySectionModel(images: ["jacketAdidas1"])
        )
    }()

    let verticalGalleryData: BaseSectionData = {
        .init(
            identifier: BaseSectionIdentifier(id: "verticalGallery", type: "verticalGallery"),
            data: GallerySectionModel(images: ["jacketAdidas2", "jacketAdidas3", "jacketAdidas4"])
        )
    }()

    let shortDescriptionData: BaseSectionData = {
        .init(
            identifier: BaseSectionIdentifier(id: "shortDescription", type: "shortDescription"),
            data: ShortDescriptionSectionModel(
                title: "REVERSIBLE JACKET UNIT (UNISEX)",
                description: "A REVERSIBLE JACKET MADE IN COLLABORATION WITH UNITY",
                price: "$59.99"
            )
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

    let recommendations: BaseSectionData = {
        .init(
            identifier: BaseSectionIdentifier(id: "id4", type: "recommendations"),
            data: RecommendationsSectionModel(
                title: "You make also like",
                items: [
                    .init(image: "shoes1", title: "Adidas Colours", description: "The better choice for you", price: 120.0),
                    .init(image: "shoes2", title: "Star wars edition", description: "The better choice for you", price: 70),
                    .init(image: "shoes3", title: "Adidas Classic Way", description: "The better choice for you", price: 40.0),
                    .init(image: "shoes4", title: "Soccer Predator", description: "The better choice for you", price: 60.0),
                    .init(image: "shoes5", title: "Classic", description: "The better choice for you", price: 29.99)
                ]
            )
        )
    }()


    func getLayoutSections() async -> [BaseSectionData] {
        return [
            galleryData,
            shortDescriptionData,
            mainAction,
            verticalGalleryData,
            materialBullet,
            careBullet,
            recommendations,
            galleryData,
            shortDescriptionData,
            mainAction,
            verticalGalleryData,
            materialBullet,
            careBullet,
            recommendations,
            galleryData,
            shortDescriptionData,
            mainAction,
            verticalGalleryData,
            materialBullet,
            careBullet,
            recommendations,
            galleryData,
            shortDescriptionData,
            mainAction,
            verticalGalleryData,
            materialBullet,
            careBullet,
            recommendations,
            galleryData,
            shortDescriptionData,
            mainAction,
            verticalGalleryData,
            materialBullet,
            careBullet,
            recommendations
        ]
    }
}
