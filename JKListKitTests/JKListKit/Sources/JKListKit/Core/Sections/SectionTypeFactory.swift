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

/// The class that handles the section creation logic
final public class SectionTypeFactory: SectionTypeFactoryProtocol {

    private let availableSectionTypes:[String: BaseSectionControllerProtocol.Type]

    /// Init of SectionTypeFactory
    /// - Parameter availableSectionTypes: A dictionary that represents the ids of the SectionTypes availables to render
    public init(availableSectionTypes: [String: BaseSectionControllerProtocol.Type]) {
        self.availableSectionTypes = availableSectionTypes
    }

    /// Return a BaseSectionControllerProtocol given a BaseSectionIdentifierProtocol
    /// - Parameter section: The section model identifier instance
    /// - Returns: The baseSectionController instance that conform BaseSectionControllerProtocol and match with the identifier model
    public func create(section: BaseSectionIdentifierProtocol) -> BaseSectionControllerProtocol? {
        guard let SectionControllerType = availableSectionTypes[section.type] else {
            return nil
        }
        let sectionController = SectionControllerType.init(section: section)
        return sectionController
    }    
}
