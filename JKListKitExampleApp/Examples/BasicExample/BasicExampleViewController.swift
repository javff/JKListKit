//
//  ViewController.swift
//  JKListKit
//
//  Created by Juan vasquez on 17-02-22.
//

import UIKit
import JKListKit

protocol BasicExampleViewProtocol: AnyObject {
    @MainActor func loadSections(_ sections: [BaseSectionDataProtocol])
    @MainActor func updateSection(_ section: BaseSectionDataProtocol)
}

class BasicExampleViewController: UIViewController {

    lazy var adapter: SectionAdapterProtocol = {
        let router = BaseRouter()
        router.controller = self
        let provider = SectionAdapter(router: router)
        provider.registeredSections = SectionConstants.basicExampleSections
        return provider
    }()

    lazy var exampleView: ListView = {
        let view = ListView(configuration: .init(spacing: 16, lateralSpacing: 30))
        view.adapter = adapter
        return view
    }()

    private let presenter: BasicExamplePresenterProtocol

    init(presenter: BasicExamplePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.bindView(self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Basic Example"
        setupView()
        presenter.loadSections()
    }

    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(exampleView)
        exampleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exampleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            exampleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            exampleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            exampleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension BasicExampleViewController: BasicExampleViewProtocol {

    func loadSections(_ sections: [BaseSectionDataProtocol]) {
        exampleView.loadSections(sections)
    }

    func updateSection(_ section: BaseSectionDataProtocol) {
        exampleView.updateSection(section)
    }
}
