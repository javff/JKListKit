//
//  SectionConstants.swift
//  JKListKit
//
//  Created by Juan vasquez on 22-02-22.
//

import Foundation

enum SectionConstants {
    static let registeredSections: [String: BaseSectionControllerProtocol.Type] = [
        "example": ExampleSection.self
    ]
}
