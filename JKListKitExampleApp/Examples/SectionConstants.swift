//
//  SectionConstants.swift
//  JKListKit
//
//  Created by Juan vasquez on 22-02-22.
//

import Foundation
import JKListKit

enum SectionConstants {
    static let basicExampleSections: [String: BaseSectionControllerProtocol.Type] = [
        "example": ExampleSection.self
    ]

    static let commerceSections: [String: BaseSectionControllerProtocol.Type] = [
        "gallery": GallerySection.self,
        "shortDescription": ShortDescriptionSection.self,
        "mainAction": MainActionsSection.self,
        "descriptionBullet": DescriptionBulletSection.self,
        "recommendations": RecommendationsSection.self,
        "verticalGallery": VerticalGallerySection.self
    ]
}
