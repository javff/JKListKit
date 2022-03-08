//
//  File.swift
//  
//
//  Created by Juan vasquez on 08-03-22.
//

import Foundation

public protocol SectionTypeFactoryProtocol: AnyObject {
    func create(section: BaseSectionIdentifierProtocol) -> BaseSectionControllerProtocol?
}

final public class SectionTypeFactory: SectionTypeFactoryProtocol {

    private let availableSectionTypes:[String: BaseSectionControllerProtocol.Type]

    public init(availableSectionTypes: [String: BaseSectionControllerProtocol.Type]) {
        self.availableSectionTypes = availableSectionTypes
    }

    public func create(section: BaseSectionIdentifierProtocol) -> BaseSectionControllerProtocol? {
        guard let SectionControllerType = availableSectionTypes[section.type] else {
            return nil
        }
        let sectionController = SectionControllerType.init(section: section)
        return sectionController
    }    
}
