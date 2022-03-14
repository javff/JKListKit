//
//  File.swift
//  
//
//  Created by Juan vasquez on 08-03-22.
//

import Foundation
import UIKit


/// The object that interact with listView
public final class ListAdapter {


    /// The ListView instance
    public weak var listView: ListView?
    var currentSections: [BaseSectionDataProtocol] = []
    var loadedSections: [BaseSectionDataProtocol] = []
    let listAdapterUpdater: ListAdapterUpdaterProtocol
    let sectionTypeFactory: SectionTypeFactoryProtocol


    /// Init of ListAdapter
    /// - Parameters:
    ///   - listAdapterUpdater: The object that handles the section update logic
    ///   - sectionTypeFactory: The object that handles the section creation logic
    public init(listAdapterUpdater: ListAdapterUpdaterProtocol = ListAdapterUpdater(),
                sectionTypeFactory: SectionTypeFactoryProtocol) {
        self.listAdapterUpdater = listAdapterUpdater
        self.sectionTypeFactory = sectionTypeFactory
    }
}

extension ListAdapter: ListViewProtocol {


    /// Method that load sections to the ListView instance
    /// - Parameter sections: sections to load
    public func loadSections(_ sections: [BaseSectionDataProtocol]) {
        executeFirstLoad(sections)
        setupOberveForLazyLoad()
    }


    /// Method that update section in the ListView instance
    /// - Parameter section: section to update
    public func updateSection(_ section: BaseSectionDataProtocol) {
        guard let listView = listView,
              let sectionController = listAdapterUpdater.find(section: section.identifier) else { return }
        sectionController.updateSection(listView: listView, sectionModel: section.data)
    }


    /// Method that append a new section in the ListView instance
    /// - Parameter section: section to append
    public func appendSection(_ section: BaseSectionDataProtocol) {
        insertSectionInContainer(section)
    }


    /// Method that inserts a new section into the ListView instance at a specific index
    /// - Parameters:
    ///   - section: section to insert
    ///   - index: position to insert
    public func insertSection(_ section: BaseSectionDataProtocol, at index: Int) {
        insertSectionInContainer(section, at: index)
    }

    func insertSectionInContainer(_ section: BaseSectionDataProtocol, at index: Int? = nil) {
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
