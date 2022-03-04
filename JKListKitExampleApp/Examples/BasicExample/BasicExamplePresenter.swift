//
//  ExamplrePresenter.swift
//  JKListKit
//
//  Created by Juan vasquez on 22-02-22.
//

import JKListKit

protocol BasicExamplePresenterProtocol: AnyObject {
    func loadSections()
    func bindView(_ view: BasicExampleViewProtocol)
}

class BasicExamplePresenter: BasicExamplePresenterProtocol {

    weak var view: BasicExampleViewProtocol?

    func loadSections() {
        let mockData: [BaseSectionData] = [
            .init(identifier: BaseSectionIdentifier(id: "exampleView", type: "example"), data: ExampleSectionModel(color: .red, height: 300)),
            .init(identifier: BaseSectionIdentifier(id: "exampleView", type: "example"), data: ExampleSectionModel(color: .brown, height: 50)),
            .init(identifier: BaseSectionIdentifier(id: "exampleView", type: "example"), data: ExampleSectionModel(color: .green, height: 200)),
            .init(identifier: BaseSectionIdentifier(id: "exampleView", type: "example"), data: ExampleSectionModel(color: .blue, height: 20)),
            .init(identifier: BaseSectionIdentifier(id: "exampleView", type: "example"), data: ExampleSectionModel(color: .yellow, height: 600))
        ]

        Task {
            await view?.loadSections(mockData)
        }
    }

    func bindView(_ view: BasicExampleViewProtocol) {
        self.view = view
    }
}
