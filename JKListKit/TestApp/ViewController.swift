//
//  ViewController.swift
//  JKListKit
//
//  Created by Juan vasquez on 17-02-22.
//

import UIKit

protocol ExampleViewProtocol: AnyObject {
    func loadSections(_ sections: [BaseSectionDataProtocol])
    func updateSection(_ section: BaseSectionDataProtocol)
}

class ViewController: UIViewController {

    lazy var adapter: SectionAdapterProtocol = {
        let router = BaseRouter()
        router.controller = self
        let provider = SectionAdapter(router: router)
        provider.registeredSections = SectionConstants.registeredSections
        return provider
    }()

    lazy var exampleView: ListView = {
        let view = ListView(configuration: .init(spacing: 16))
        view.adapter = adapter
        return view
    }()

    private let presenter: ExamplePresenterProtocol

    init(presenter: ExamplePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.bindView(self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = exampleView
        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadSections()
    }
}

extension ViewController: ExampleViewProtocol {

    func loadSections(_ sections: [BaseSectionDataProtocol]) {
        exampleView.loadSections(sections)
    }

    func updateSection(_ section: BaseSectionDataProtocol) {
        exampleView.updateSection(section)
    }
}
