//
//  SectionProvider.swift
//  JKListKit
//
//  Created by Juan vasquez on 21-02-22.
//

import Foundation

public protocol SectionAdapterProtocol: AnyObject {
    var  registeredSections:[String: BaseSectionControllerProtocol.Type]  { get set }
    var  router: RouterProtocol { get }
    func create(section: BaseSectionIdentifierProtocol) -> BaseSectionControllerProtocol?
    func find(section: BaseSectionIdentifierProtocol) -> BaseSectionControllerProtocol?
    func find(sectionIndex position: Int) -> BaseSectionControllerProtocol?
}

public final class SectionAdapter: NSObject, SectionAdapterProtocol {

    public var registeredSections:[String: BaseSectionControllerProtocol.Type] = [:]
    public let router: RouterProtocol
    private var cacheSections:[BaseSectionControllerProtocol] = []

    public init(router: RouterProtocol) {
        self.router = router
        super.init()
    }

    final public func create(section: BaseSectionIdentifierProtocol) -> BaseSectionControllerProtocol? {
        guard let SectionControllerType = registeredSections[section.type] else {
            return nil
        }
        let sectionController = SectionControllerType.init(section: section, router: router)
        cacheSections.append(sectionController)
        return sectionController
    }

    final public func find(section: BaseSectionIdentifierProtocol) -> BaseSectionControllerProtocol? {
        return cacheSections.first { section.id == $0.section.id }
    }

    final public func find(sectionIndex position: Int) -> BaseSectionControllerProtocol? {
        return cacheSections[position]
    }
}
