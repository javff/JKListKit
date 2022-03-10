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

public struct BaseSectionIdentifier: BaseSectionIdentifierProtocol {
    public let id: String
    public let type: String

    public init(id: String, type: String) {
        self.id = id
        self.type = type
    }
}

public protocol BaseSectionDataProtocol {
    var identifier: BaseSectionIdentifierProtocol { get }
    var data: DiffableModel { get }
}

public struct BaseSectionData: BaseSectionDataProtocol {
    public let identifier: BaseSectionIdentifierProtocol
    public let data: DiffableModel

    public init(identifier: BaseSectionIdentifierProtocol, data: DiffableModel) {
        self.identifier = identifier
        self.data = data
    }
}


