//
//  BaseSection.swift
//  JKListKit
//
//  Created by Juan vasquez on 21-02-22.
//

import Foundation
import UIKit

protocol BaseSectionIdentifierProtocol {
    var id: String { get }
    var type: String { get }
}

struct BaseSectionIdentifier: BaseSectionIdentifierProtocol {
    let id: String
    let type: String
}

protocol BaseSectionDataProtocol {
    var identifier: BaseSectionIdentifierProtocol { get }
    var data: DiffableModel { get }
}

struct BaseSectionData: BaseSectionDataProtocol {
    let identifier: BaseSectionIdentifierProtocol
    let data: DiffableModel
}


