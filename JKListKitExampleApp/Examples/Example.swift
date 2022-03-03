//
//  Cases.swift
//  JKListKitExampleApp
//
//  Created by Juan vasquez on 02-03-22.
//

import Foundation

enum Example: CaseIterable {
    case basicExample
    case commerceExample

    var name: String {
        switch self {
        case .basicExample: return "Basic Example"
        case .commerceExample: return "E-Commerce Example"
        }
    }
}
