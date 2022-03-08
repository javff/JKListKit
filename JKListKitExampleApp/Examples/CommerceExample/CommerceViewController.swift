//
//  CommerceViewController.swift
//  JKListKitExampleApp
//
//  Created by Juan vasquez on 03-03-22.
//

import UIKit
import JKListKit

class CommerceViewController: UIViewController {

    let adapter: ListAdapter = {
        let factory = SectionTypeFactory(availableSectionTypes: SectionConstants.commerceSections)
        let adapter = ListAdapter(sectionTypeFactory: factory)
        return adapter
    }()

    let exampleView: ListView = {
        let view = ListView(configuration: .init(spacing: 35, lateralSpacing: 20))
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
        setupView()
        setupListView()
        setupNavigation()
        presenter.loadSections()
    }

    private func setupListView() {
        adapter.listView = exampleView
    }

    private func setupNavigation() {
        let view = UIView()
        let imageView = UIImageView(image: UIImage(named: "adidasLogo"))
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navigationItem.titleView = view
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

extension CommerceViewController: BasicExampleViewProtocol {

    func loadSections(_ sections: [BaseSectionDataProtocol]) {
        adapter.loadSections(sections)
    }

    func updateSection(_ section: BaseSectionDataProtocol) {
        adapter.updateSection(section)
    }
}
