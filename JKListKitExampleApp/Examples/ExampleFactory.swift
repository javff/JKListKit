//
//  CaseFactory.swift
//  JKListKitExampleApp
//
//  Created by Juan vasquez on 02-03-22.
//

import UIKit

class ExampleFactory {
    class func makeCaseViewController(example: Example) -> UIViewController {
        switch example {
        case .basicExample:
            return makeBasicExampleController()
        case .commerceExample:
            return makeCommerceExample()
        }
    }

    class func makeBasicExampleController() -> UIViewController {
        return BasicExampleViewController(presenter: BasicExamplePresenter())
    }

    class func makeCommerceExample() -> UIViewController {
        let repository = MockCommerceRepository()
        let presenter = CommercePresenter(repository: repository)
        return CommerceViewController(presenter: presenter)
    }
}

