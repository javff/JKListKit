//
//  ListView.swift
//  JKListKit
//
//  Created by Juan vasquez on 17-02-22.
//

import Foundation
import UIKit

protocol ListViewProtocol: AnyObject {
    func loadSections(_ sections: [BaseSectionDataProtocol])
    func updateSection(_ section: BaseSectionDataProtocol)
    func appendSection(_ section: BaseSectionDataProtocol)
    func insertSection(_ section: BaseSectionDataProtocol, at index: Int)
}

class ListView: UIView {

    let containerView: ContainerView = {
        let view = ContainerView(configuration: .init(spacing: 16))
        return view
    }()

    weak var adapter: SectionAdapterProtocol?

    init(configuration: ContainerConfiguration) {
        super.init(frame: .zero)
        setupView()
        setupConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(containerView)
    }

    private func setupConstraint() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension ListView: ListViewProtocol {
    func loadSections(_ sections: [BaseSectionDataProtocol]) {
        containerView.cleanSubViews()
        sections.forEach {
            insertSectionInContainer($0)
        }
    }

    func updateSection(_ section: BaseSectionDataProtocol) {
        guard let adapter = adapter,
              let sectionController = adapter.find(section: section.identifier) else { return }
        sectionController.updateSection(listView: self, sectionModel: section.data)
    }

    func appendSection(_ section: BaseSectionDataProtocol) {
        insertSectionInContainer(section)
    }

    func insertSection(_ section: BaseSectionDataProtocol, at index: Int) {
        insertSectionInContainer(section, at: index)
    }

    private func insertSectionInContainer(_ section: BaseSectionDataProtocol, at index: Int? = nil) {
        guard let adapter = adapter else { return }
        let sectionController = adapter.create(section: section.identifier)
        let view = sectionController?.createSection(listView: self, with: section.data)
        guard let view = view else { return }

        if let index = index {
            containerView.insertArrangedSubview(view, at: index)
        } else {
            containerView.addArrangedSubview(view)
        }
    }
}
