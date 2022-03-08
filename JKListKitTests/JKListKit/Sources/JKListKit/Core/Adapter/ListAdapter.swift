//
//  File.swift
//  
//
//  Created by Juan vasquez on 08-03-22.
//

import Foundation


public final class ListAdapter {

    public weak var listView: ListView?

    let listAdapterUpdater: ListAdapterUpdaterProtocol
    let sectionTypeFactory: SectionTypeFactoryProtocol

    public init(listAdapterUpdater: ListAdapterUpdaterProtocol = ListAdapterUpdater(),
                sectionTypeFactory: SectionTypeFactoryProtocol) {
        self.listAdapterUpdater = listAdapterUpdater
        self.sectionTypeFactory = sectionTypeFactory
    }
}

extension ListAdapter: ListViewProtocol {
    public func loadSections(_ sections: [BaseSectionDataProtocol]) {
        listView?.containerView.cleanSubViews()
        sections.forEach {
            insertSectionInContainer($0)
        }
    }

    public func updateSection(_ section: BaseSectionDataProtocol) {
        guard let listView = listView,
              let sectionController = listAdapterUpdater.find(section: section.identifier) else { return }
        sectionController.updateSection(listView: listView, sectionModel: section.data)
    }

    public func appendSection(_ section: BaseSectionDataProtocol) {
        insertSectionInContainer(section)
    }

    public func insertSection(_ section: BaseSectionDataProtocol, at index: Int) {
        insertSectionInContainer(section, at: index)
    }

    private func insertSectionInContainer(_ section: BaseSectionDataProtocol, at index: Int? = nil) {
        guard let listView = listView,
              let sectionController = sectionTypeFactory.create(section: section.identifier) else { return }

        listAdapterUpdater.storageSection(sectionController: sectionController)
        let view = sectionController.createSection(listView: listView, with: section.data)
        let lateralSpacing = sectionController.lateralSpacing

        if let index = index {
            listView.containerView.insertArrangedSubview(view, at: index, with: lateralSpacing)
        } else {
            listView.containerView.addArrangedSubview(view, with: lateralSpacing)
        }
    }
}
