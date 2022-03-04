//
//  CommercePresenter.swift
//  JKListKitExampleApp
//
//  Created by Juan vasquez on 03-03-22.
//

import JKListKit

class CommercePresenter: BasicExamplePresenterProtocol {

    weak var view: BasicExampleViewProtocol?
    let repository: CommerceRepositoryProtocol

    init(repository: CommerceRepositoryProtocol) {
        self.repository = repository
    }

    func loadSections() {
        Task {
            async let mockData = repository.getLayoutSections()
            await view?.loadSections(mockData)
        }
    }

    func bindView(_ view: BasicExampleViewProtocol) {
        self.view = view
    }
}
