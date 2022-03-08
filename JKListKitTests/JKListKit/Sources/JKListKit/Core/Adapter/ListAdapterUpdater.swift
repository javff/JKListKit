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

public final class ListAdapterUpdater: ListAdapterUpdaterProtocol {

    private var cacheSections:[String: BaseSectionControllerProtocol] = [:]

    public init() {}
    
    final public func find(section: BaseSectionIdentifierProtocol) -> BaseSectionControllerProtocol? {
        return cacheSections[section.id]
    }

    public func storageSection(sectionController: BaseSectionControllerProtocol) {
        cacheSections[sectionController.section.id] = sectionController
    }
    
}
