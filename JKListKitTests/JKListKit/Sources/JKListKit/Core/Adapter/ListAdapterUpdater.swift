//
//  File.swift
//  
//
//  Created by Juan vasquez on 08-03-22.
//

import Foundation

public protocol ListAdapterUpdaterProtocol: AnyObject {
    func find(section: BaseSectionIdentifierProtocol) -> BaseSectionControllerProtocol?
    func storageSection(sectionController: BaseSectionControllerProtocol)
}


/// The class that handles the section update logic
public final class ListAdapterUpdater: ListAdapterUpdaterProtocol {

    private var cacheSections:[String: BaseSectionControllerProtocol] = [:]


    /// Init ListAdapterUpdater
    public init() {}


    /// Find a SectionController using a Section data model
    /// - Parameter section: section to find
    /// - Returns: SectionController that correspond with the data model
    final public func find(section: BaseSectionIdentifierProtocol) -> BaseSectionControllerProtocol? {
        return cacheSections[section.id]
    }


    /// Method that implement the cache strategy for the sectionController
    /// - Parameter sectionController: a SectionController instance
    public func storageSection(sectionController: BaseSectionControllerProtocol) {
        cacheSections[sectionController.section.id] = sectionController
    }
    
}
