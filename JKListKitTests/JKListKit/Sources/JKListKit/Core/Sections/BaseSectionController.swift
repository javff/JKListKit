//
//  BaseSectionController.swift
//  JKListKit
//
//  Created by Juan vasquez on 21-02-22.
//

import Foundation
import UIKit

public protocol BaseSectionControllerProtocol: AnyObject {
    var section: BaseSectionIdentifierProtocol { get }
    var lateralSpacing: CGFloat? { get }
    func createSection(listView: ListView, with model: DiffableModel) -> UIView
    func updateSection(listView: ListView, sectionModel: DiffableModel)
    init(section: BaseSectionIdentifierProtocol)
}

open class BaseSectionController<T: DiffableModel, V: UIView>: NSObject, BaseSectionControllerProtocol {

    public let section: BaseSectionIdentifierProtocol

    open var lateralSpacing: CGFloat? {
        return nil
    }

    //Cache Property
    private var view: UIView?

    required public init(section: BaseSectionIdentifierProtocol) {
        self.section = section
        super.init()
    }

    open func createSection(in listView: ListView, model: T) -> V {
        fatalError("must be override")
    }

    open func updateSection(listView: ListView, in view: V, model: T) {
        //Override Only
    }

    public func createSection(listView: ListView, with model: DiffableModel) -> UIView {
        guard let model = model as? T else {
            fatalError("generic type not match. Verify your SectionController Class")
        }
        let view = createSection(in: listView, model: model)
        self.view = view
        updateSection(listView: listView, in: view, model: model)
        return view
    }

    public func updateSection(listView: ListView, sectionModel: DiffableModel) {
        guard let model = sectionModel as? T,
              let view = view as? V else {
            fatalError("generic type not match")
        }
        updateSection(listView: listView, in: view, model: model)
    }
}
