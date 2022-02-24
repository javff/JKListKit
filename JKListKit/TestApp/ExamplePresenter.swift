//
//  ExamplrePresenter.swift
//  JKListKit
//
//  Created by Juan vasquez on 22-02-22.
//

import Foundation

protocol ExamplePresenterProtocol: AnyObject {
    func loadSections()
    func bindView(_ view: ExampleViewProtocol)
}

class ExamplePresenter: ExamplePresenterProtocol {

    weak var view: ExampleViewProtocol?

    func loadSections() {
        let mockData: [BaseSectionData] = [
            .init(identifier: BaseSectionIdentifier(id: "exampleView", type: "example"), data: ExampleSectionModel(color: .red)),
            .init(identifier: BaseSectionIdentifier(id: "exampleView", type: "example"), data: ExampleSectionModel(color: .brown)),
            .init(identifier: BaseSectionIdentifier(id: "exampleView", type: "example"), data: ExampleSectionModel(color: .green)),
            .init(identifier: BaseSectionIdentifier(id: "exampleView", type: "example"), data: ExampleSectionModel(color: .blue))
        ]
        view?.loadSections(mockData)
    }

    func bindView(_ view: ExampleViewProtocol) {
        self.view = view
    }
}
