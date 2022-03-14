//
//  BaseSection.swift
//  JKListKit
//
//  Created by Juan vasquez on 21-02-22.
//

import Foundation

public protocol BaseSectionIdentifierProtocol {
    var id: String { get }
    var type: String { get }
}


/// The identifier of a SectionController
public struct BaseSectionIdentifier: BaseSectionIdentifierProtocol {

    /// String that represent id of the section
    public let id: String

    /// String that represent type of the section
    public let type: String


    /// Init of BaseSectionIdentifier
    /// - Parameters:
    ///   - id: String that represent id of the section
    ///   - type: String that represent type of the section
    public init(id: String, type: String) {
        self.id = id
        self.type = type
    }
}

public protocol BaseSectionDataProtocol {
    var identifier: BaseSectionIdentifierProtocol { get }
    var data: DiffableModel { get }
}


/// The model that represent a SectionController
public struct BaseSectionData: BaseSectionDataProtocol {
    public let identifier: BaseSectionIdentifierProtocol
    public let data: DiffableModel


    /// Init of BaseSectionData
    /// - Parameters:
    ///   - identifier: A identifier object
    ///   - data: A diffableModel object
    public init(identifier: BaseSectionIdentifierProtocol, data: DiffableModel) {
        self.identifier = identifier
        self.data = data
    }
}


